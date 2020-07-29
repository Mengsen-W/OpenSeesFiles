/*
 * @Author: Mengsen.Wang
 * @Date: 2020-07-20 16:36:25
 * @Last Modified by: Mengsen.Wang
 * @Last Modified time: 2020-07-20 16:43:07
 */

#include <cmath>
#include <iostream>

int main() {
  double PI =
      3.14159265358979323846999999999999999999999999999999999999999999999999999999;
  std::cout.precision(100);
  std::cout << "pi = " << PI << std::endl;
  double p = sqrt(PI * PI);
  std::cout << "pi = " << p << std::endl;
}