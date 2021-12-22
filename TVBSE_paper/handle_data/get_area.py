'''
Date: 2021-05-10 11:18:59
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-05-10 11:20:49
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

test_data = np.column_stack([test_disp, test_forces])
simu_data = np.column_stack([simu_disp, simu_forces])

test_hys = hys.Hysteresis(test_data)
test_hys.plotCumArea()
simu_hys = hys.Hysteresis(simu_data)
simu_hys.plotCumArea()

plt.title("Hysteresis Area")
plt.legend(labels=['experiment', 'simulation'])

plt.show()
