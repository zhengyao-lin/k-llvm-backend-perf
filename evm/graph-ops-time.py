import os
import csv
import argparse
import numpy as np
import matplotlib.pyplot as pt

parser = argparse.ArgumentParser()
parser.add_argument("opinfo", help="csv containing static info about each op")
parser.add_argument("csvs", nargs="+", help="csv files (the first one should contain the total_ops column)")
args = parser.parse_args()

# map from test name to properties
test_case_info = {}

with open(args.opinfo) as f:
    reader = csv.reader(f)
    headers = next(reader)
    
    column_test_name = None
    column_total_ops = None
    column_total_gas = None

    for i, header in enumerate(headers):
        if header == "total_ops":
            column_total_ops = i
        elif header == "total_gas":
            column_total_gas = i
        elif header == "test_name":
            column_test_name = i

    assert column_test_name is not None and column_total_ops is not None and column_total_gas is not None

    for row in reader:
        test_name = row[column_test_name]
        total_ops = row[column_total_ops]
        total_gas = row[column_total_gas]
        test_case_info[test_name] = {
            "total_ops": total_ops,
            "total_gas": total_gas,
        }

datasets = []
names = []

for csv_path in args.csvs:
    name = os.path.basename(csv_path).split("-")[0]
    names.append(name)

    with open(csv_path) as csv_file:
        reader = csv.reader(csv_file)
        headers = next(reader)

        dataset = []

        for row in reader:
            result = {}
            for i, col in enumerate(row):
                result[headers[i]] = col
            dataset.append(result)

        datasets.append(dataset)

# print(datasets)

for i, dataset in enumerate(datasets):
    pairs = [ (test_case_info[r["test_name"]]["total_ops"], r["real_time"])
        for r in dataset
        if r["test_name"] in test_case_info and \
           float(r["real_time"]) / max(0.001, float(test_case_info[r["test_name"]]["total_ops"])) < 0.1 and \
           float(r["real_time"]) < 60 and \
           int(test_case_info[r["test_name"]]["total_ops"]) > 10000
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
    # print(np.corrcoef(x, y))

# pt.xscale("log")
# pt.yscale("symlog")
pt.legend()
pt.xlabel("Number of opcodes executed")
pt.ylabel("Time of execution (sec)")
pt.show()
