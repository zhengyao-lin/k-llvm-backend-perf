import os
import csv
import shlex
import tempfile
import subprocess


class ANSI:
    COLOR_GREY = "\033[90m"
    RESET = "\033[0m"
    BOLD = "\033[1m"


class Process:
    @staticmethod
    def quote_command(args):
        return " ".join([ shlex.quote(arg) for arg in args ])

    @staticmethod
    def trim_long_string(s, max_len, trimmed_symbol="..."):
        if len(s) > max_len:
            return s[:max_len] + trimmed_symbol
        return s

    @staticmethod
    def popen_with_log(cmd, *args, **kwargs):
        print(ANSI.COLOR_GREY + "+ " + Process.trim_long_string(Process.quote_command(cmd), 256) + ANSI.RESET)
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

        proc = Process.popen_with_log(timer + cmd, *args, **kwargs)
        old_wait = proc.wait

        def proxy_wait():
            exitcode = old_wait()
            if exitcode == 0:
                stats = get_stats()
                print(ANSI.COLOR_GREY + f"- real time {stats['real_time']}s, max mem {stats['max_mem']}Kbytes" + ANSI.RESET)
            return exitcode

        proc.wait = proxy_wait

        return proc, get_stats


class CSVDictWriter:
    def __init__(self, csv_file):
        self.csv_file = csv_file
        self.headers = None
        self.dict_writer = None

    # assume the keys in the objects are consistent
    def write(self, obj):
        if self.headers is None:
            self.headers = list(obj.keys())
            self.dict_writer = csv.DictWriter(self.csv_file, fieldnames=self.headers)
            self.dict_writer.writeheader()
        
        assert set(obj.keys()) == set(self.headers), f"unmatched headers: {list(obj.keys())} vs {self.headers}"

        self.dict_writer.writerow(obj)


# assumes the csv file has headers
class CSVDictReader:
    class Iter:
        def __init__(self, reader):
            self.reader = reader
            self.idx = 0

        def __next__(self):
            row = self.reader.get_row(self.idx)
            self.idx += 1
            return row

    def __init__(self, csv_file):
        self.csv_file = csv_file
        self.read_rows = []
        self.idx_to_headers = None
        self.reader = None

    def get_row(self, i):
        assert i < len(self.read_rows) + 1
        if i < len(self.read_rows):
            return self.read_rows[i]
        else:
            # read a new row
            if self.idx_to_headers is None:
                # read the headers
                self.reader = csv.reader(self.csv_file)
                first_row = next(self.reader)
                self.idx_to_headers = list(first_row)

            # may throw StopIteration
            next_row = next(self.reader)
            obj = {}
            for i, column in enumerate(next_row):
                assert i < len(self.idx_to_headers), "row longer than headers"
                obj[self.idx_to_headers[i]] = column

            self.read_rows.append(obj)

            return obj

    def __iter__(self):
        return CSVDictReader.Iter(self)
