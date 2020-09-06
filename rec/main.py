import os
import sys

from parser import RECSpecParser
from rec2k import RECToKTranspiler

sys.setrecursionlimit(4096)

parser = RECSpecParser(include_path=["/media/rodlin/ext4/llvm-backend/REC/REC4/2015-CONVECS/REC-LIB"])
rec_dir = "/media/rodlin/ext4/llvm-backend/REC/REC4/2015-CONVECS/REC"

# for file_name in os.listdir(rec_dir):
#     if file_name.endswith(".rec"):
#         path = os.path.join(rec_dir, file_name)
#         print(f"loaing {path}")
#         print(parser.load(path))

# print(parser.load("/media/rodlin/ext4/llvm-backend/REC/REC4/2015-CONVECS/REC/omul8.rec"))

spec = parser.load("test-2.rec")
transpiler = RECToKTranspiler()

with open(spec.name + ".k", "w") as f:
    transpiler.transpile(f, spec)

