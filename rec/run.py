import os
import argparse
import tempfile
import traceback
import subprocess

from common.utils import Process, ANSI, CSVDictWriter


class KTestRunner:
    PGM_PREFIX = r"""LblinitGeneratedTopCell{}(Lbl'Unds'Map'Unds'{}(Lbl'Stop'Map{}(),Lbl'UndsPipe'-'-GT-Unds'{}(inj{SortKConfigVar{}, SortKItem{}}(\dv{SortKConfigVar{}}("$PGM")),"""
    PGM_SUFFIX = ")))"

    def __init__(self, args):
        self.java_lib = os.path.realpath(os.path.join(args.k_repo, "k-distribution", "lib", "kframework", "java"))
        self.java_options = args.k_java_options
        self.k_bin = os.path.realpath(os.path.join(args.k_repo, "k-distribution", "bin"))
        # self.compile_only = args.compile_only
        # self.eval_only = args.eval_only
        # self.inline_eval = args.k_inline_eval
        # self.combine_eval = args.k_combine_eval
        self.timeout = args.timeout

        self.k_env = os.environ.copy()
        self.k_env["PATH"] = self.k_bin + ":" + self.k_env["PATH"]

    def gen_k_command(self, tool):
        return [
            "java",
            "-Dfile.encoding=UTF-8",
            "-Djava.awt.headless=true",
            "-XX:+UseParallelGC",
            *self.java_options.split(),
            "-ea", "-cp", os.path.join(self.java_lib, "*"),
            "org.kframework.main.Main",
            "-" + tool,
        ]

    # return the --directory flag used in kompile
    # and the actual kompiled directory
    # (which should be one-level down the path used in the flag)
    def get_kompiled_dir(self, path):
        head, tail = os.path.split(path)
        assert tail.endswith(".k")
        file_name = tail[:-2]
        return os.path.join(head, f"{file_name}-kompiled"), os.path.join(head, f"{file_name}-kompiled", f"{file_name}-kompiled")

    def is_newer_than(self, path1, path2):
        assert os.path.isfile(path1) and os.path.isfile(path2)
        stat1 = os.stat(path1)
        stat2 = os.stat(path2)
        return stat1.st_mtime > stat2.st_mtime

    # kompile the theory definition
    def kompile_definition(self, path):
        kompiled_dir, actual_kompiled_dir = self.get_kompiled_dir(path)

        # if the kompiled directory is up to date, no need to re-kompile
        timestamp = os.path.join(actual_kompiled_dir, "timestamp")
        if os.path.isfile(timestamp) and not self.is_newer_than(path, timestamp):
            print(ANSI.COLOR_GREY + "+ kompiled directory is up-to-date" + ANSI.RESET)
            return

        proc, _ = Process.popen_with_timing([
            *self.gen_k_command("kompile"),
            path,
            "-Wno", "unused-var",
            "-O3",
            "--directory", kompiled_dir,
        ], env=self.k_env)
        exitcode = proc.wait(timeout=self.timeout)
        assert exitcode == 0, f"kompile failed with exitcode {exitcode}"

    # convert the program to kore
    def kast_pgm(self, path, input_file_path):
        kompiled_dir, _ = self.get_kompiled_dir(path)

        pgm_kore_path = os.path.join(kompiled_dir, "pgm.kore")
        if os.path.isfile(pgm_kore_path) and not self.is_newer_than(path, pgm_kore_path):
            print(ANSI.COLOR_GREY + "+ kore program is up-to-date" + ANSI.RESET)
            return pgm_kore_path

        try:
            with open(pgm_kore_path, "wb") as output_kore_file:
                kast_proc, _ = Process.popen_with_timing([
                    *self.gen_k_command("kast"),
                    "--input", "program",
                    "--output", "kore",
                    "--directory", kompiled_dir,
                    input_file_path,
                ], stdout=subprocess.PIPE, env=self.k_env)
                
                output_kore_file.write(KTestRunner.PGM_PREFIX.encode())
                output_kore_file.write(kast_proc.stdout.read())
                output_kore_file.write(KTestRunner.PGM_SUFFIX.encode())
                output_kore_file.flush()

                exitcode = kast_proc.wait(timeout=self.timeout)
                assert exitcode == 0, f"kast failed with exitcode {exitcode}"
        except KeyboardInterrupt as e:
            os.remove(pgm_kore_path)
            raise e
        except Exception as e:
            os.remove(pgm_kore_path)
            raise e

        return pgm_kore_path

    def eval_one_term(self, path, input_file_path):
        _, actual_kompiled_dir = self.get_kompiled_dir(path)

        pgm_kore_path = self.kast_pgm(path, input_file_path)

        # run interpreter
        interpreter_proc, get_stats = Process.popen_with_timing([
            os.path.join(actual_kompiled_dir, "interpreter"),
            pgm_kore_path,
            "-1",
            "/dev/null",
        ])
        exitcode = interpreter_proc.wait(timeout=self.timeout)
        assert exitcode == 0, f"interpreter failed with exitcode {exitcode}"

        # return {
        #     "kast_real_time": kast_stats["real_time"],
        #     "kast_max_mem": kast_stats["max_mem"],
        #     **get_stats(),
        # }
        return get_stats()

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

    def run(self, path):
        self.kompile_definition(path)

        # if not self.eval_only:
        #     self.kompile_definition(path)

        # if self.compile_only:
        #     return kompile_stats

        # if self.inline_eval:
        #     _, actual_kompiled_dir = self.get_kompiled_dir(path)
        #     empty_kore = "LblinitGeneratedTopCell{}()"
            
        #     with tempfile.NamedTemporaryFile() as input_kore_file:
        #         with open(input_kore_file.name, "w") as f:
        #             f.write(empty_kore)

        #         interpreter_proc, get_stats = Process.popen_with_timing([
        #             os.path.join(actual_kompiled_dir, "interpreter"),
        #             input_kore_file.name,
        #             "-1",
        #             "/dev/null",
        #         ])

        #         exitcode = interpreter_proc.wait()
        #         assert exitcode == 0, f"interpreter failed with exitcode {exitcode}"

        #         return get_stats()
        # else:
        
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
                "-O3",
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
    parser.add_argument("-eo", "--exception-output", help="output csv file for exceptions")
    parser.add_argument("-n", type=int, default=1, help="number of trials for each test")
    parser.add_argument("--timeout", type=int, help="timeout in seconds")

    # K runner
    parser.add_argument("--k-repo", default="deps/k", help="k repo path")
    parser.add_argument("--k-java-options", default="-Xms64m -Xmx4096m -Xss32m", help="extra options to java when running k")
    # parser.add_argument("--k-inline-eval", action="store_const", const=True, default=False, help="indicates whether the eval section has been inlined or not")
    # parser.add_argument("--k-no-combine-eval", dest="k_combine_eval", action="store_const", const=False, default=True, help="combine all to-eval terms into one term")

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

        if args.exception_output is not None:
            exception_csv_file = open(args.exception_output, "w")
            exception_dict_writer = CSVDictWriter(exception_csv_file)

        for i, test_file in enumerate(test_files):
            print(f"{ANSI.BOLD}> [{i + 1}/{len(test_files)}] testing {test_file}{ANSI.RESET}")
            
            suffix = test_file.split(".")[-1]
            if suffix not in suffix_to_runner:
                print(f"unknown test suffix .{suffix} ({test_file})")
                continue

            runner = suffix_to_runner[suffix]

            try:
                trial_results = []
                for trial in range(args.n):
                    print(f"{ANSI.BOLD}- trial {trial}{ANSI.RESET}")
                    trial_results.append(runner.run(test_file))
                
                if args.output is not None:
                    for trial, result in enumerate(trial_results):
                        dict_writer.write({
                            "test_name": os.path.basename(test_file),
                            "trial": str(trial),
                            **result
                        })
                    csv_file.flush()
            except KeyboardInterrupt:
                exit(1)
            except subprocess.TimeoutExpired as exc:
                if args.exception_output is not None:
                    exception_dict_writer.write({
                        "test_name": os.path.basename(test_file),
                        "exception": "timeout",
                        "message": str(exc),
                    })
            except Exception as exc:
                traceback.print_exc()
                if args.exception_output is not None:
                    exception_dict_writer.write({
                        "test_name": os.path.basename(test_file),
                        "exception": "crash",
                        "message": str(exc),
                    })
    finally:
        if args.output is not None:
            csv_file.close()

        if args.exception_output is not None:
            exception_csv_file.close()


if __name__ == "__main__":
    main()
