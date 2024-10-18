#pragma once

#include <cuda_runtime.h>
#include <vector>
#include <string>

struct Vertex {
    float x, y, z;
};

struct Triangle {
    int v1, v2, v3;
};

class FlyingEdges {
public:
    FlyingEdges();
    ~FlyingEdges();

    void setData(const std::vector<float>& data, dim3 dataShape, float isovalue);
    void execute();
    void saveToOBJ(const std::string& filename);

private:
    void allocateMemory();
    void freeMemory();
    void pass1();
    void pass2();
    void pass3();
    void pass4();
    void pass4Mem();

    // Device pointers
    float* d_scalars;
    int* d_edgeCases;
    int* d_cubeCases;
    int* d_leftTrim;
    int* d_rightTrim;
    int* d_leftTrim_c;
    int* d_rightTrim_c;
    int* d_triCount;
    int* d_triOffsets;
    Vertex* d_vertices;
    Triangle* d_triangles;

    // Host data
    std::vector<float> h_scalars;
    dim3 dataShape;
    float isovalue;
    int totalVoxels;
    int totalTriangles;
    int totalVertices;

    bool isMemoryAllocated;

    // Static auxiliary constant tables
    static __constant__ unsigned char numTris[256];
    static __constant__ bool isCut[256][12];
    static __constant__ char caseTriangles[256][16];
    static __constant__ unsigned int edgeVertices[12][2];
};