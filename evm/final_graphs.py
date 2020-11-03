import numpy as np
from common.utils import CSVDictReader

kevm_label = "KEVM"
geth_label = "Go Ethereum"
oeth_label = "OpenEthereum"

csv_paths = [
    (kevm_label, "evm/results/nov-2/state-tests/kevm-O3-d2de458-state-tests.csv"),
    (geth_label, "evm/results/nov-2/state-tests/geth-1.9.15-state-tests.csv"),
    (oeth_label, "evm/results/nov-2/state-tests/openethereum-11e40fa-state-tests.csv"),
]

categories = [ "stTimeConsuming", "stStaticCall", "stQuadraticComplexityTest", "stZeroKnowledge", "stZeroKnowledge2", "stPreCompiledContracts", "stRandom", "stSpecialTest", "stStackTests", "stSStoreTest" ]

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

# only use those supported by all implementations
test_name_to_results = { test_name: results for test_name, results in test_name_to_results.items() if len(results) == len(csv_paths) }

print(len(test_name_to_results))

# sum of time
sums = {}

for test_name, results in test_name_to_results.items():
    for label, data in results.items():
        if label not in sums:
            sums[label] = 0
        sums[label] += np.average(data["real_time"])

print("total time", sums)

# categorize by folder
# folder_sum = {}

# for test_name, results in test_name_to_results.items():
#     folder = test_name.split("/")[0]
#     if folder not in folder_sum:
#         folder_sum[folder] = 0, 0

#     total_time, num_tests = folder_sum[folder]

#     folder_sum[folder] = total_time + np.average(results[kevm_label]["real_time"]), num_tests + 1

# folder_sum = list(folder_sum.items())
# folder_sum.sort(key=lambda t: t[1][0], reverse=True)

# for k, v in folder_sum:
#     print(k, v)

# test_name_results_pairs = list(test_name_to_results.items())
# test_name_results_pairs.sort(key=lambda t: np.average(t[1][kevm_label]["real_time"]), reverse=True)

# for test_name, results in test_name_results_pairs[:30]:
#     print(test_name, np.average(results[kevm_label]["real_time"]))

# category name -> { label -> averaged total time }
categories_sum = {}

for test_name, results in test_name_to_results.items():
    category = test_name.split("/")[0]
    if category in categories:
        if category not in categories_sum:
            categories_sum[category] = {}

        for label, data in results.items():
            if label not in categories_sum[category]:
                categories_sum[category][label] = 0

            categories_sum[category][label] += np.average(data["real_time"])

print(categories_sum)

header = f"""\\hline
Category & {' & '.join(map(lambda t: t[0], csv_paths))} \\\\
\\hline"""
print(header)

for cat in categories:
    row = [ "{:.2f}".format(float(categories_sum[cat][label])) for label, _ in csv_paths ]
    print(f"{cat} & {' & '.join(row)} \\\\")

print("\\hline")
