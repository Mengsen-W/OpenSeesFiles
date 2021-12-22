'''
Date: 2021-05-10 17:36:50
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-05-10 18:15:18
'''

import matplotlib.pyplot as plt
import numpy as np


_200 = []
_400 = []
_600 = []
_800 = []
_1000 = []
_1200 = []
_1400 = []
_1600 = []
_1800 = []
_2000 = []


def read_file(filename):
    with open(filename) as f:
        for line in f:
            line_list = line.split()
            _200.append(line_list[1])
            _400.append(line_list[2])
            _600.append(line_list[3])
            _800.append(line_list[4])
            _1000.append(line_list[5])
            _1200.append(line_list[6])
            _1400.append(line_list[7])
            _1600.append(line_list[8])
            _1800.append(line_list[9])
            _2000.append(line_list[10])


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
read_file('cur.txt')
# plt.plot(simu_disp, _600)
plt.plot(simu_disp, _800)
plt.show()

# print(_200)
