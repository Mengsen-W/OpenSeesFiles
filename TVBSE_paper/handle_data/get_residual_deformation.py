'''
Date: 2021-05-09 21:51:53
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-05-10 14:55:15
FilePath: \OPS_Paper\bone\get_residual_deformation.py
Description: file content
'''

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import hysteresis as hys

test_disp = []
test_forces = []
simu_disp = []
simu_forces = []
with open('disp.csv') as f:
    for line in f:
        temp = (line.split(','))
        test_disp.append(float(temp[0]))
        test_forces.append(float(temp[1]))
        try:
            simu_disp.append(float(temp[-1]))
            simu_forces.append(float(temp[-2]))
        except ValueError as e:
            pass

test_data = np.column_stack([test_disp, test_forces])
simu_data = np.column_stack([simu_disp, simu_forces])


def list_split(items, n):
    return [items[i:i+n] for i in range(0, len(items), n)]


def get_res(res):
    output = []
    for data in res:
        if -50 <= data[1] <= 50 and data[0] > 0:
            output.append(data[0])
    return output


test_res = get_res(test_data)
test_res_1 = list_split(test_res, 35)
test_res_2 = [np.mean(_data)for _data in test_res_1]
simu_res = get_res(simu_data)
plt.scatter(test_res_2, [0] * len(test_res_2), label='experiment')
plt.scatter(simu_res, [0]*len(simu_res), label='simulation')
plt.title("Residual Deformation")
plt.legend()

plt.show()
