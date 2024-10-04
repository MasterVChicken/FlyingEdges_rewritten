# Error Check History
This file is created to perform fine-grained error check.

### PASS 1
1. calculateEdgeCases: Tried to print all (edgeCase, left, right, isovalue) tuples. No errors found here.
2. calculateTrimPositions: **Errors found!** For every trim pos, (right - left) always equals to 1. That's impossible. After debugging, we remove the break which has caused early end for intersection search. Let's test more.
### PASS 2
1. getCubeCases: Tried to print left and trim position for each cell row and its triangular numbers. No errors found here.
### PASS 3
1. getCubeCases: Tried to print left and trim position for each cell row and its triangular numbers. Synchronization between blocks seems to go wrong. Fixed it.
### PASS 4
1. Pass4Kernel: Found few valid output for vertices and triangular.
2. Find that triOffsets do not change with cubeCases change. Quite weird.


Check in total, triCount use in pass3 and pass4 has gone wrong.