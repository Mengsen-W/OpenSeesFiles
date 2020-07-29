/*
 * @Author: Mengsen.Wang
 * @Date: 2020-07-17 09:49:15
 * @Last Modified by: Mengsen.Wang
 * @Last Modified time: 2020-07-17 10:47:16
 */

#include <ctime>
#include <eigen3/Eigen/Core>
#include <eigen3/Eigen/Dense>
#include <iostream>

#define MATRIX_SIZE 1000

int main() {
  Eigen::MatrixXd A;
  Eigen::MatrixXd B;
  Eigen::MatrixXd X;

  A = Eigen::MatrixXd::Random(MATRIX_SIZE, MATRIX_SIZE);
  B = Eigen::MatrixXd::Random(MATRIX_SIZE, 1);
  X = Eigen::MatrixXd::Random(MATRIX_SIZE, MATRIX_SIZE);

  clock_t time_stt = clock();

  std::cout << "----- QR decomposition colPivHouseholder -----" << std::endl;
  X = A.colPivHouseholderQr().solve(B);
  std::cout << "time use in QR colPivHouseholderQr decomposition is "
            << (1000) * (clock() - time_stt) /
                   static_cast<double>(CLOCKS_PER_SEC)
            << "ms" << std::endl;

  time_stt = clock();
  std::cout << "----- QR decomposition fullPivHouseholder -----" << std::endl;
  X = A.fullPivHouseholderQr().solve(B);
  std::cout << "time use in QR fullPivHouseholder decomposition is "
            << (1000) * (clock() - time_stt) /
                   static_cast<double>(CLOCKS_PER_SEC)
            << "ms" << std::endl;

  time_stt = clock();
  std::cout << "----- llt decomposition -----" << std::endl;
  X = A.llt().solve(B);
  std::cout << "time use in llt decomposition is "
            << (1000) * (clock() - time_stt) /
                   static_cast<double>(CLOCKS_PER_SEC)
            << "ms" << std::endl;

  time_stt = clock();
  std::cout << "----- ldlt decomposition -----" << std::endl;
  X = A.ldlt().solve(B);
  std::cout << "time use in ldlt decomposition is "
            << (1000) * (clock() - time_stt) /
                   static_cast<double>(CLOCKS_PER_SEC)
            << "ms" << std::endl;

  time_stt = clock();
  std::cout << "----- partialPivLu decomposition -----" << std::endl;
  X = A.partialPivLu().solve(B);
  std::cout << "time use in partialPivLu decomposition is "
            << (1000) * (clock() - time_stt) /
                   static_cast<double>(CLOCKS_PER_SEC)
            << "ms" << std::endl;

  time_stt = clock();
  std::cout << "----- fullPivLu decomposition -----" << std::endl;
  X = A.fullPivLu().solve(B);
  std::cout << "time use in fullPivLu decomposition is "
            << (1000) * (clock() - time_stt) /
                   static_cast<double>(CLOCKS_PER_SEC)
            << "ms" << std::endl;

  return 0;
}
