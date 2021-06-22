#pragma once

#include "kernel.cuh"
#include <thrust/complex.h>

namespace cusp
{
    template <typename T>
    class add_const : public kernel
    {
    private:
        T _k;
    public:
        add_const(T k) : _k(k) {};
        cudaError_t launch(const T *in, T *out, T k, int grid_size, int block_size,
            int N, cudaStream_t stream = 0);
        virtual cudaError_t launch(const std::vector<const void *> inputs,
            const std::vector<void *> outputs, size_t nitems) override;
        virtual cudaError_t occupancy(int *minBlock, int *minGrid);
    };

}