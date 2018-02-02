#include <iostream>
#include <stdio.h>

// Uncomment the pragma below to break things 
#define EIGEN_DISABLE_HD_WARNING // #pragma hd_warning_disable
#include <Eigen/Eigen>

namespace e = Eigen;

__global__ void Transform(e::Affine3f pose, e::Vector3f v) {
  e::Vector3f res = pose * v;

  printf("Result: (%f, %f, %f)\n", v.x(), v.y(), v.z());
}

int main() {
  e::Affine3f pose = e::Affine3f::Identity();

  Transform<<<1, 1>>>(pose, e::Vector3f(1, 0, 0));
  cudaDeviceSynchronize();

  return 0;
}
