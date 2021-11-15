import sys
import numpy as np


arr = np.array(sys.argv[1:])
arr = arr.astype(np.float64)
min = np.min(arr)
print("O tempo de execução estimado é:",mean,"s")
