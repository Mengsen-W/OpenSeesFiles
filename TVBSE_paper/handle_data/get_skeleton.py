'''
Date: 2021-04-27 17:16:57
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-05-10 11:21:00
FilePath: \OPS_Paper\bone\get_skeleton.py
Description: file content
'''

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import hysteresis as hys
import scipy.interpolate
from scipy.interpolate import interp1d


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


def read_csv_bone():
    test_bone = np.loadtxt("bone_test.csv", dtype=np.int, delimiter=',')
    return test_bone


test_data = np.column_stack([test_disp, test_forces])
simu_data = np.column_stack([simu_disp, simu_forces])
test_hys = hys.Hysteresis(test_data)
test_bone = read_csv_bone()
plt.plot(np.hsplit(test_bone, 2)[0], np.hsplit(test_bone, 2)[1])
simu_hys = hys.Hysteresis(simu_data)
simu_bone = hys.getBackboneCurve(simu_hys)
simu_bone.plot()

plt.title("Skeleton Curve")
plt.legend(labels=['experiment', 'simulation'])
plt.show()
