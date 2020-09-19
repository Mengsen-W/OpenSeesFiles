/*
 * @Author: Mengsen.Wang
 * @Date: 2020-08-11 11:17:58
 * @Last Modified by: Mengsen.Wang
 * @Last Modified time: 2020-08-11 12:37:01
 */

#include <cmath>
#include <iostream>
#include <vector>

int main() {
  std::vector<int> x(3, 0);
  std::vector<int> y(3, 0);
  std::vector<int> z(3, 0);

  x = {1, 1, 1};
  y = {0, 1, 0};

  z[0] = x[1] * y[2] - x[2] * y[1];
  z[1] = x[2] * y[0] - x[0] * y[2];
  z[2] = x[0] * y[1] - x[1] * y[0];

  y[0] = z[1] * x[2] - z[2] * x[1];
  y[1] = z[2] * x[0] - z[0] * x[2];
  y[2] = z[0] * x[1] - z[1] * x[0];

  for (auto v : x) {
    std::cout << v << ", ";
  }
  std::cout << std::endl;

  for (auto v : y) {
    std::cout << v << ", ";
  }
  std::cout << std::endl;

  for (auto v : z) {
    std::cout << v << ", ";
  }
  std::cout << std::endl;

  long double xn = Norm(x);
  long double yn = Norm(x);
  long double zn = Norm(x);

  std::vector<std::vector<int>> trans(12, std::vector<int>(12, 0));
  for (int i = 0; i < 3; i++) {
    trans[0][i] = x[i] / xn;
    trans[1][i] = y[i] / yn;
    trans[2][i] = z[i] / zn;
  }

  return 0;
}

double Norm(std::vector<int> x) {
  long double ans = 0;
  for (int v : x) {
    ans += v * v;
  }

  sqrt(ans);
  return ans;
}