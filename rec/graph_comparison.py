import os
import argparse
import numpy as np
import matplotlib.pyplot as pt

from common.utils import CSVDictReader


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("results", nargs="+", help="csv files containing the results")
    parser.add_argument("--top-n-tests", type=int, default=5, help="number of top time-consuming tests to compare")
    args = parser.parse_args()

    all_results = []

    for result_file_path in args.results:
        with open(result_file_path) as result_file:
            reader = CSVDictReader(result_file)
            results = list(reader)
            label = os.path.basename(result_file_path)[:-4]
            all_results.append((label, results))

    all_results[0][1].sort(key=lambda d: float(d["real_time"]), reverse=True)

    assert len(all_results[0][1]) >= args.top_n_tests

    # [ ( test_name, list of real_time from different results ), ... ]
    top_n_results = []

    for i in range(args.top_n_tests):
        test_name = all_results[0][1][i]["test_name"].lower()
        test_name = ".".join(test_name.split(".")[:-1]) # removes suffix
        print(test_name)

        results_for_current_test = []

        for label, results in all_results:
            for row in results:
                if row["test_name"].lower().startswith(test_name + "."):
                    results_for_current_test.append(float(row["real_time"]))
                    break
            else:
                results_for_current_test.append(-1)
                print(f"test {test_name} not found in {label}")

        top_n_results.append((test_name, results_for_current_test))

    print(top_n_results)

    # draw a bar chart
    # modified from https://matplotlib.org/examples/api/barchart_demo.html
    fig, ax = pt.subplots()
    ind = np.arange(len(top_n_results))
    width = 0.3

    for i in range(len(all_results)):
        bar_y = []
        for test_name, results in top_n_results:
            bar_y.append(results[i])

        ax.bar(ind + i * width, bar_y, width, label=all_results[i][0])

    pt.xticks([ i + width for i in range(len(top_n_results)) ], [ test_name for test_name, _ in top_n_results ])

    pt.legend()
    pt.xlabel("Test case")
    pt.ylabel("Time (sec)")
    pt.show()


if __name__ == "__main__":
    main()
