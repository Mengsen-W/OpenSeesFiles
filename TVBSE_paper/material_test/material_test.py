'''
Date: 2021-04-19 15:05:18
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-23 09:46:01
'''

import matplotlib.pyplot as plt
import numpy as np


def steel_02(x):
    fy0 = 257.5e6
    e0 = 0.196e-2
    fy1 = 873.2e6
    e1 = 1.658e-2
    E0 = fy0 / e0
    b = ((fy1 - fy0) / (e1 - e0)) / E0
    print(f'E0 = {E0}')
    print(f'b = {b}')

    def steel_02(x, fy, E0, b):
        if x <= fy / E0:
            return x * E0
        else:
            return fy + (x - fy / E0) * E0 * b
    return steel_02(x, fy0, E0, b)


x = np.linspace(0, 1.658e-2*1.2, 50)
y = np.array([steel_02(t) for t in x])

plt.plot(x, y)
# plt.plot(x, y2)
# print(E0, b)
plt.show()
