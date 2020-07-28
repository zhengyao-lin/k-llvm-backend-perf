import os
import csv
import time
import json
import shlex
import tempfile
import argparse
import resource
import subprocess
import multiprocessing


class Utils:
    @staticmethod
    def quote_command(args):
        return " ".join([ shlex.quote(arg) for arg in args ])

    @staticmethod
    def popen_with_log(cmd, *args, **kwargs):
        print("\033[90m+ " + Utils.quote_command(cmd) + "\033[0m")
        return subprocess.Popen(cmd, *args, **kwargs)

    @staticmethod
    def popen_with_timing(cmd, *args, **kwargs):
        fd, path = tempfile.mkstemp()
        os.close(fd)

        def get_stats():
            with open(path) as stats_file:
                real_time, sys_time, user_time, max_mem, avg_mem = [ float(item) for item in stats_file.read().split() ]
                return {
                    "user_time": user_time,
                    "sys_time": sys_time,
                    "real_time": real_time,
                    "max_mem": max_mem,
                    "avg_mem": avg_mem,
                }

        timer = [
            "/usr/bin/time",
            # see https://linux.die.net/man/1/time
            "-f", "%e %S %U %M %t",
            "-o", path,
        ]

        return Utils.popen_with_log(timer + cmd, *args, **kwargs), get_stats


class KEVMWrapper:
    def __init__(self, repo, schedule="DEFAULT", chain_id=1):
        self.repo = repo
        self.schedule = schedule
        self.chain_id = chain_id

        self.llvm_k_directory = os.path.join(repo, ".build", "defn", "llvm")
        self.llvm_k_interpreter = os.path.join(self.llvm_k_directory, "driver-kompiled", "interpreter")
        self.json_to_kore_script = os.path.join(repo, "kore-json.py")

        assert os.path.isdir(self.llvm_k_directory), "could not find kompiled directory"
        assert os.path.isfile(self.llvm_k_interpreter), "could not find kompiled directory"
        assert os.path.isfile(self.json_to_kore_script), "could not find json-to-kore script"

    def get_schedule_kast(self):
        return f"`{self.schedule}_EVM`(.KList)"

    def get_mode_kast(self, mode):
        return f"`{mode}`(.KList)"

    def run_vmtest(self, json_path):
        # run json to kore script
        proc = Utils.popen_with_log([
            "python3",
            self.json_to_kore_script,
            json_path,
            self.get_schedule_kast(),
            self.get_mode_kast("VMTESTS"),
            str(self.chain_id),
        ], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

        input_kore_source = proc.stdout.read()
        stderr = proc.stderr.read().decode()
        exitcode = proc.wait()
        if exitcode != 0:
            raise Exception(f"json-to-kore script {self.json_to_kore_script} returned non-zero exitcode {exitcode} and stderr:\n{stderr}")

        # run interpreter in the llvm_k_directory to get output state
        with tempfile.NamedTemporaryFile() as input_kore_file:
            with tempfile.NamedTemporaryFile() as output_kore_file:
                input_kore_file.write(input_kore_source)
                input_kore_file.flush()

                proc, get_stats = Utils.popen_with_timing([
                    self.llvm_k_interpreter,
                    input_kore_file.name,
                    "-1",
                    output_kore_file.name,
                ])

                exitcode = proc.wait()
                if exitcode != 0:
                    raise Exception(f"interpreter {self.llvm_k_interpreter} returned non-zero exitcode {exitcode}")

                return get_stats()


class GethWrapper:
    def __init__(self, repo):
        self.repo = repo
        self.evm_binary = os.path.join(repo, "build", "bin", "evm")
        assert os.path.isfile(self.evm_binary), f"could not find compiled evm binary {self.evm_binary}"

    def run_vmtest(self, json_path):
        # geth evm doesn't natively support the vmtest format
        # (https://ethdocs.org/en/latest/contracts-and-transactions/ethereum-tests/vm_tests/)
        # so we are manually setting up the account info and transaction info etc.

        with open(json_path) as json_file:
            vmtest_config = json.load(json_file)

        # a VERY coarse approximation right now
        # only set the code and input data

        assert len(vmtest_config) == 1
        (_, test_config), = vmtest_config.items()

        with tempfile.NamedTemporaryFile() as code_file:
            with tempfile.NamedTemporaryFile() as data_file:
                code_file.write(test_config["exec"]["code"].encode())
                code_file.flush()

                data_file.write(test_config["exec"]["data"].encode())
                data_file.flush()

                proc, get_stats = Utils.popen_with_timing([
                    self.evm_binary,
                    "--codefile", code_file.name,
                    "--inputfile", data_file.name,
                    "run",
                ])
                exitcode = proc.wait()
                if exitcode != 0:
                    raise Exception(f"geth evm {self.evm_binary} returned non-zero exitcode {exitcode}")

                return get_stats()


def main():
    parser = argparse.ArgumentParser(description="compare the performance of kevm with other evm implementations")
    parser.add_argument("impl", help="implementation to test, choose from: kevm, geth")
    parser.add_argument("repo", help="path to the evm-semantics repo")
    parser.add_argument("test", help="path to the test file or test directory")
    parser.add_argument("-o", help="output csv file")
    args = parser.parse_args()

    implementations = {
        "kevm": KEVMWrapper,
        "geth": GethWrapper,
    }

    assert args.impl in implementations, f"implementation {args.impl} not supported"

    wrapper = implementations[args.impl](args.repo)
    results = []

    if os.path.isdir(args.test):
        for file_name in os.listdir(args.test):
            if file_name.endswith(".json"):
                full_path = os.path.join(args.test, file_name)
                print(f">>> testing {file_name}")
                results.append((file_name, wrapper.run_vmtest(full_path)))
    else:
        print(f">>> testing {args.test}")
        results.append((args.test, wrapper.run_vmtest(args.test)))

    if args.o is not None:
        with open(args.o, "w") as output:
            writer = csv.DictWriter(output, fieldnames=["test_name", "real_time", "max_mem"])
            writer.writeheader()

            for test_name, result in results:
                writer.writerow({
                    "test_name": test_name,
                    "real_time": result["real_time"],
                    "max_mem": result["max_mem"],
                })


if __name__ == "__main__":
    main()
