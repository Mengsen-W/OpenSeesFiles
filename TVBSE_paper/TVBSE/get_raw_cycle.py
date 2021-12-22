"""
Date: 2021-09-22 19:54:27
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-10-26 16:33:35
FilePath: \OPS_Paper\TVBSE\get_raw_cycle.py
Description: file content
"""

import random
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt


simu_disp = []
simu_forces = []


def read_simulation(input_file):
    with open(input_file) as f:
        for line in f:
            try:
                temp = line.split(" ")
                simu_disp.append(float(temp[-1]))
                simu_forces.append(float(temp[-2]))
            except ValueError as e:
                print("this site has a error")


for i in range(0, 20):
    file_name = f"./output/out_4_{i}.txt"
    print(file_name)
    read_simulation(file_name)
    plt.plot(simu_disp, simu_forces)
    plt.show()

# read_simulation("./output/out.txt")
# plt.plot(simu_disp, simu_forces)
# plt.show()
