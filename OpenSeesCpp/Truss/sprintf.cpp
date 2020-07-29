/*
 * @Author: Mengsen.Wang
 * @Date: 2020-07-22 10:18:52
 * @Last Modified by: Mengsen.Wang
 * @Last Modified time: 2020-07-22 10:20:34
 */

#include <cstdio>
#include <iostream>

int main() {
  int numDOF = 12;
  char outputData[5];
  int numDOFperNode = numDOF / 2;
  for (int i = 0; i < numDOFperNode; i++) {
    sprintf(outputData, "P1_%d", i + 1);
  }
  for (int j = 0; j < numDOFperNode; j++) {
    sprintf(outputData, "P2_%d", j + 1);
  }

  std::cout << outputData << std::endl;
  return 0;
}