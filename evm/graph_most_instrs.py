"""
Graph a performance comparison for
test cases that require the most
number of instructions
"""

import os
import csv
import argparse
import numpy as np
import matplotlib
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
            "total_ops": int(row["total_ops"]),
            "total_gas": int(row["total_gas"]),
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


# only include one for each of these prefixes
most_instructions = list(map(lambda r: (r[0], int(r[1]["total_ops"])), test_case_info.items()))
most_instructions.sort(key=lambda r: r[1], reverse=True)
most_instructions = list(map(lambda t: t[0], most_instructions))

print(most_instructions[:50])

most_instructions = [
    "stStaticCall/static_Call50000bytesContract50_2.json",
    "stQuadraticComplexityTest/Return50000_2.json",
    "stStaticCall/static_LoopCallsThenRevert.json",
    "stQuadraticComplexityTest/QuadraticComplexitySolidity_CallDataCopy.json",
    "stAttackTest/ContractCreationSpam.json",
    "stSolidityTest/CallInfiniteLoop.json",
]

fig, ax = pt.subplots()
ind = np.arange(len(most_instructions))
width = 0.1

for i, dataset in enumerate(datasets):
    bar_y = []
    for test_name in most_instructions:
        # find the corresponding time for the test case
        for row in dataset:
            if row["test_name"] == test_name:
                print(names[i], row)
                real_time = float(row["real_time"])
                break
        else:
            raise Exception("test case {} not found in data set {}".format(test_name, names[i]))

        bar_y.append(real_time)

    ax.bar(ind + i * width, bar_y, width, label=names[i])

pt.rcParams.update({ "font.size": 1 })
# matplotlib.rc("xtick", labelsize=5)

pt.xticks(
    [ i + (len(most_instructions) - 1) / 2 * width for i in range(len(most_instructions)) ],
    [ test_name for test_name in most_instructions ], fontsize=6, rotation=0)

pt.legend(fontsize=8)

# for tick in ax.xaxis.get_major_ticks():
#     tick.label.set_fontsize(8)
    # tick.label.set_rotation('vertical')

pt.xlabel("Test case")
pt.ylabel("Time (sec)")
pt.show()
