import os
import argparse
import tempfile
import traceback
import subprocess

from common.utils import Process, ANSI, CSVDictWriter


class KTestRunner:
    def __init__(self, args):
        self.kompile_bin = os.path.join(args.k_bin, "kompile") if args.k_bin is not None else "kompile"
        self.kast_bin = os.path.join(args.k_bin, "kast") if args.k_bin is not None else "kast"
        self.compile_only = args.compile_only
        self.eval_only = args.eval_only
        self.inline_eval = args.k_inline_eval
        self.combine_eval = args.k_combine_eval

    # return the --directory flag used in kompile
    # and the actual kompiled directory
    # (which should be one-level down the path used in the flag)
    def get_kompiled_dir(self, path):
        head, tail = os.path.split(path)
        assert tail.endswith(".k")
        file_name = tail[:-2]
        return os.path.join(head, f"{file_name}-kompiled"), os.path.join(head, f"{file_name}-kompiled", f"{file_name}-kompiled")

    def kompile(self, path):
        kompiled_dir, actual_kompiled_dir = self.get_kompiled_dir(path)

        # if the kompiled directory is up to date, no need to re-kompile
        timestamp = os.path.join(actual_kompiled_dir, "timestamp")
        if os.path.isfile(timestamp):
            ts_stat = os.stat(timestamp)
            module_stat = os.stat(path)
            if module_stat.st_mtime < ts_stat.st_mtime:
                print(ANSI.COLOR_GREY + "+ kompiled directory is up-to-date" + ANSI.RESET)
                return

        proc, get_stats = Process.popen_with_timing([
            self.kompile_bin,
            path,
            "-Wno", "unused-var",
            "-O3",
            "--directory", kompiled_dir,
        ])
        exitcode = proc.wait()
        assert exitcode == 0, f"kompile failed with exitcode {exitcode}"

        return get_stats()

    def eval_one_term(self, path, input_file_path):
        kompiled_dir, actual_kompiled_dir = self.get_kompiled_dir(path)

        with tempfile.NamedTemporaryFile() as output_kore_file:
            kast_proc, get_stats = Process.popen_with_timing([
                self.kast_bin,
                "--input", "program",
                "--output", "kore",
                "--directory", kompiled_dir,
                input_file_path,
            ], stdout=subprocess.PIPE)
            
            output_kore_file.write(kast_proc.stdout.read())
            output_kore_file.flush()

            exitcode = kast_proc.wait()
            assert exitcode == 0, f"kast failed with exitcode {exitcode}"

            kast_stats = get_stats()

            # run interpreter
            interpreter_proc, get_stats = Process.popen_with_timing([
                os.path.join(actual_kompiled_dir, "interpreter"),
                output_kore_file.name,
                "-1",
                "/dev/null",
            ])
            exitcode = interpreter_proc.wait()
            assert exitcode == 0, f"interpreter failed with exitcode {exitcode}"

            return {
                "kast_real_time": kast_stats["real_time"],
                "kast_max_mem": kast_stats["max_mem"],
                **get_stats(),
            }

    def eval_all_terms(self, path):
        eval_prefix = "// eval: "
        terms = []

        # get the terms to evalueted from the module definition
        with open(path) as module_file:
            while True:
                line = module_file.readline()
                if line == "":
                    break

                line = line.strip()
                if line.startswith(eval_prefix):
                    term = line[len(eval_prefix):]
                    terms.append(term)

        if self.combine_eval:
            # combine all terms to a program and run it
            with tempfile.NamedTemporaryFile() as input_program_file:
                with open(input_program_file.name, "w") as f:
                    for i, term in enumerate(terms):
                        if i < len(terms) - 1:
                            f.write("then(")
                            f.write(term)
                            f.write(",\n")
                        else:
                            f.write("")
                            f.write(term)
                            f.write("\n")
                    f.write(")" * (len(terms) - 1))

                return self.eval_one_term(path, input_program_file.name)
        else:
            # run each term separately
            assert False, "not supported"
            for i, term in enumerate(terms):
                print(f">>> evaluating term {i + 1}/{len(terms)}: {term[:32]}...")
                with tempfile.NamedTemporaryFile() as input_program_file:
                    with open(input_program_file.name, "w") as f:
                        f.write(term)
                    self.eval_one_term(path, input_program_file.name)

    def run(self, path):
        if not self.eval_only:
            kompile_stats = self.kompile(path)

        if self.compile_only:
            return kompile_stats

        if self.inline_eval:
            _, actual_kompiled_dir = self.get_kompiled_dir(path)
            empty_kore = "LblinitGeneratedTopCell{}()"
            
            with tempfile.NamedTemporaryFile() as input_kore_file:
                with open(input_kore_file.name, "w") as f:
                    f.write(empty_kore)

                interpreter_proc, get_stats = Process.popen_with_timing([
                    os.path.join(actual_kompiled_dir, "interpreter"),
                    input_kore_file.name,
                    "-1",
                    "/dev/null",
                ])

                exitcode = interpreter_proc.wait()
                assert exitcode == 0, f"interpreter failed with exitcode {exitcode}"

                return get_stats()
        else:
            return self.eval_all_terms(path)


class HaskellTestRunner:
    def __init__(self, args):
        self.ghc_bin = args.hs_ghc

    def run(self, path):
        fd, output_exec_path = tempfile.mkstemp(prefix="hs-exec")
        os.fdopen(fd).close()
        try:
            ghc_proc, get_stats = Process.popen_with_timing([
                self.ghc_bin,
                path,
                "-o", output_exec_path,
            ], stdout=subprocess.DEVNULL)
            exitcode = ghc_proc.wait()
            assert exitcode == 0, f"ghc failed with exitcode {exitcode}"
            compile_stats = get_stats()

            exec_proc, get_stats = Process.popen_with_timing([
                output_exec_path,
            ], stdout=subprocess.DEVNULL)
            exitcode = exec_proc.wait()
            assert exitcode == 0, f"ghc compiled binary failed with exitcode {exitcode}"
            
            return {
                "ghc_real_time": compile_stats["real_time"],
                "ghc_max_mem": compile_stats["max_mem"],
                **get_stats(),
            }
        finally:
            os.remove(output_exec_path)


class MaudeTestRunner:
    def __init__(self, args):
        self.maude_binary = args.maude_bin

    def run(self, path):
        maude_proc, get_stats = Process.popen_with_timing([
            self.maude_binary,
            path
        ], stdout=subprocess.DEVNULL)
        exitcode = maude_proc.wait()
        assert exitcode == 0, f"maude failed with exitcode {exitcode}"
        return get_stats()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("test", help="test file with appropriate suffix (e.g. .k, .maude) or directory containing tests")
    parser.add_argument("--compile-only", action="store_const", const=True, default=False, help="only compile the test without running")
    parser.add_argument("--eval-only", action="store_const", const=True, default=False, help="assume the spec has been compiled and only run the eval section")
    parser.add_argument("-o", "--output", help="output csv file")

    # K runner
    parser.add_argument("--k-bin", help="k bin path")
    parser.add_argument("--k-inline-eval", action="store_const", const=True, default=False, help="indicates whether the eval section has been inlined or not")
    parser.add_argument("--k-no-combine-eval", dest="k_combine_eval", action="store_const", const=False, default=True, help="combine all to-eval terms into one term")

    # Haskell runner
    parser.add_argument("--hs-ghc", default="ghc", help="path to ghc")

    # Maude runner
    parser.add_argument("--maude-bin", help="path to the maude binary")

    args = parser.parse_args()

    assert not (args.compile_only and args.eval_only)

    suffix_to_runner = {
        "k": KTestRunner(args),
        "hs": HaskellTestRunner(args),
        "maude": MaudeTestRunner(args),
    }

    if os.path.isfile(args.test):
        test_files = [ args.test ]
    elif os.path.isdir(args.test):
        test_files = []

        for file_name in os.listdir(args.test):
            complete_path = os.path.join(args.test, file_name)
            if os.path.isfile(complete_path):
                test_files.append(complete_path)
    else:
        raise Exception(f"no such file or directory {args.test}")

    try:
        if args.output is not None:
            csv_file = open(args.output, "w")
            dict_writer = CSVDictWriter(csv_file)

        for test_file in test_files:
            print(f"{ANSI.BOLD}> testing {test_file}{ANSI.RESET}")
            
            suffix = test_file.split(".")[-1]
            if suffix not in suffix_to_runner:
                print(f"unknown test suffix .{suffix} ({test_file})")
                continue

            runner = suffix_to_runner[suffix]

            try:
                result = runner.run(test_file)
                if args.output is not None:
                    dict_writer.write({
                        "test_name": os.path.basename(test_file),
                        **result
                    })
                    csv_file.flush()
            except KeyboardInterrupt:
                exit(1)
            except:
                traceback.print_exc()
    finally:
        if args.output is not None:
            csv_file.close()


if __name__ == "__main__":
    main()
