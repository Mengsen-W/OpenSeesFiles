'''
Date: 2021-04-29 17:54:32
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-29 18:02:18
'''
import matplotlib.pyplot as plt

disp = []
force = []

with open('out.txt') as f:
    for line in f:
        f, d = list(map(float, line.split(" ")))
        disp.append(d)
        force.append(f)
plt.plot(disp, force)
plt.show()
