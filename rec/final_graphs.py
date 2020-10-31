from typing import Mapping, List, Tuple

import os
import argparse
import numpy as np
import matplotlib.pyplot as pt

from common.utils import CSVDictReader


# top n results to plot
top_n = 20

k_function_label = "K (function)"
k_strict_label = "K (strict)"
haskell_label = "Haskell (GHC 8.6.5)"

sort_label = k_function_label
normalizing_label = sort_label

csv_paths = [
    (k_function_label, "rec/results/oct-30/REC4-k-bbc70cb.csv"),
    (k_strict_label, "rec/results/oct-30/REC4-k-strict-bbc70cb.csv"),
    (haskell_label, "rec/results/oct-30/REC4-ghc-8.6.5.csv"),
]

order_of_label = list(map(lambda t: t[0], csv_paths))

# test name (lower case without extension)
# -> { label: { real_time, max_mem } }
test_name_to_results = {}

for label, csv_path in csv_paths:
    with open(csv_path) as csv_file:
        reader = CSVDictReader(csv_file)
        for item in reader:
            test_name = item["test_name"].split(".")[0]
            real_time = float(item["real_time"])
            max_mem = float(item["max_mem"])

            if test_name not in test_name_to_results:
                test_name_to_results[test_name] = {}

            if label not in test_name_to_results[test_name]:
                test_name_to_results[test_name][label] = {
                    "real_time": [],
                    "max_mem": [],
                }

            test_name_to_results[test_name][label]["real_time"].append(real_time)
            test_name_to_results[test_name][label]["max_mem"].append(max_mem)

# plot the top n time-consuming results that all of all of the tools successfully evaluated
def bar_chart_with_error(data: List[Tuple[str, List[Tuple[str, List[float]]]]], width=1, gap=0.5, err_capsize=2, xlabel=None, ylabel=None):
    bars: List[Tuple[str, List[float], List[float], List[float]]] = []
    #               label     x            y           err

    test_names = []

    for i, (label, results) in enumerate(data):
        num_groups = len(results)
        test_names = [ name for name, _ in results ]

        x = []
        y = []
        err = []
        for j, (test_name, points) in enumerate(results):
            # position of the bar
            x.append(i * width + j * (len(data) * width + gap))

            # height of the bar
            y.append(np.average(points))

            err.append(np.std(points))

        bars.append((label, x, y, err))

    fig, ax = pt.subplots()
    fig.subplots_adjust(bottom=0.25)

    for label, x, y, err in bars:
        print(x, y)
        ax.bar(x, y, yerr=err, label=label, width=width, align="edge", capsize=err_capsize)

    pt.xticks([ width * len(data) / 2 + i * (len(data) * width + gap) for i in range(num_groups) ], test_names, rotation=45)
    pt.legend()
    pt.xlabel(xlabel)
    pt.ylabel(ylabel)
    pt.show()

non_failure = []

for test_name, results in test_name_to_results.items():
    # print(test_name)
    # print(len(results), len(csv_paths))
    if len(results) == len(csv_paths):
        non_failure.append((test_name, results))

non_failure.sort(key=lambda t: np.average(t[1][sort_label]["real_time"]), reverse=True)
non_failure = non_failure[:top_n]

# normalize relative to a label
for test_name, results in non_failure:
    unit = np.average(results[normalizing_label]["real_time"])
    for label, data in results.items():
        data["real_time"] = [ d / float(unit) for d in data["real_time"] ]

transposed = []

for label in order_of_label:
    row = [ (test_name, results[label]["real_time"]) for test_name, results in non_failure ]
    transposed.append((label, row))

bar_chart_with_error(transposed, xlabel="Test cases", ylabel="Relative time spent")
