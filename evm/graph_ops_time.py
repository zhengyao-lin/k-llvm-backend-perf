import os
import csv
import argparse
import numpy as np
import matplotlib.pyplot as pt

from common.utils import CSVDictReader

parser = argparse.ArgumentParser()
parser.add_argument("opinfo", help="csv containing static info about each op")
parser.add_argument("csvs", nargs="+", help="csv files (the first one should contain the total_ops column)")
args = parser.parse_args()

# map from test name to properties
test_case_info = {}

with open(args.opinfo) as f:
    reader = CSVDictReader(f)
    for row in reader:
        test_case_info[row["test_name"]] = {
            "total_ops": row["total_ops"],
            "total_gas": row["total_gas"],
        }

datasets = []
names = []

for csv_path in args.csvs:
    name = os.path.basename(csv_path).split("-")[0]
    names.append(name)

    with open(csv_path) as csv_file:
        reader = CSVDictReader(csv_file)
        dataset = list(reader)
        datasets.append(dataset)

# print(datasets)

for i, dataset in enumerate(datasets):
    pairs = [ (test_case_info[r["test_name"]]["total_ops"], r["real_time"])
        for r in dataset
        if r["test_name"] in test_case_info # and \
        #    float(r["real_time"]) / max(0.001, float(test_case_info[r["test_name"]]["total_ops"])) < 0.1 and \
        and float(r["real_time"]) < 60
        # and int(test_case_info[r["test_name"]]["total_ops"]) > 1000000
    ]

    x = [ int(x) for x, _ in pairs ]
    y = [ float(y) for _, y in pairs ]

    min_y = min(y)
    y = [ y - min_y for y in y ]

    pt.scatter(x, y, marker=".", label=names[i])

    a1, a0 = np.polyfit(y, x, deg=1)
    print(f"{round(a1, 2)} ops/sec")

    a1, a0 = np.polyfit(x, y, deg=1)
    x0 = np.linspace(min(x), max(x), 10)
    pt.plot(x0, a0 + a1 * x0, label=names[i])
    print(np.corrcoef(x, y))

pt.tight_layout()

# pt.xscale("log")
# pt.yscale("symlog")
pt.legend()
pt.xlabel("Number of opcodes executed")
pt.ylabel("Time of execution (sec)")
pt.show()
