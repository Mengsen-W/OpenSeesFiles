"""
Date: 2021-05-10 11:12:53
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-07-13 10:22:24
"""

import random
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


test_disp = []
test_forces = []
simu_disp = []
simu_forces = []


def read_experiment():
    with open("TVBSE.txt") as f:
        for line in f:
            temp = line.split(",")
            simu_disp.append(float(temp[0]))
            simu_forces.append(float(temp[1]))


def read_experiment_2():
    with open("disp.csv") as f:
        for line in f:
            temp = line.split(",")
            test_disp.append(float(temp[0]))
            # temp[1] = float(temp[1]) * (1.3 ** 0.46)
            test_forces.append(float(temp[1]))


def read_simulation():
    with open("simu.txt") as f:
        for line in f:
            try:
                temp = line.split(" ")
                simu_disp.append(float(temp[0]))
                simu_forces.append(float(temp[1]))
            except ValueError as e:
                print("this site has a error")


# read_experiment()
read_experiment_2()
read_simulation()

plt.plot(test_disp, test_forces, label="simulation block")
plt.plot(simu_disp, simu_forces, label="simulation TVBSE")
plt.title("Hysteresis Curve")
plt.legend()
plt.show()
