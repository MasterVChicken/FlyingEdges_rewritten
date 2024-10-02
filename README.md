# FlyingEdges_rewritten

Platform: JetStream2 RockyLinux9
CUDA Driver: 535.183.01
CUDA Toolkit: 12.2  
For debugging, we can use the code below to compile:
```shell
nvcc -g -G your_program.cu -o your_program
```
Then we can run:
```shell
compute-sanitizer ./your_program

# For memory access
compute-sanitizer --tool memcheck ./your_program
# For threads synchronization
compute-sanitizer --tool racecheck ./your_program
# For initialization
compute-sanitizer --tool initcheck ./your_program
# For memory leak
compute-sanitizer --tool memcheck --leak-check full ./your_program
```

How to enable debug on vGPU?
```shell
# Example on Ubuntu 22.04

1. nvidia-smi -L
2. Get UUID of vGPU: GPU-c140d6fa-8034-11ef-ba7d-3b939bc7f0f1
3. All failed. Not working on JetStream2.
```