'''
Date: 2021-04-22 10:31:00
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-22 15:58:18
'''

import os
import itertools
import matplotlib.pyplot as plt
import numpy as np

file_dict = {}


def data_handle(file):
    x, y = [], []
    disp = file_dict[file][0]
    reaction = file_dict[file][1]
    for line in disp.readlines():
        x.append(float(line.split(' ')[1][0:-1]))
    for line in reaction.readlines():
        y.append(np.mean(list(map(float, line.split(' ')[1:])))/-1000)
    x = np.asarray(x)
    y = np.asarray(y)
    plt.plot(x, y)


def find_file(dir):
    for root, dirs, files in os.walk(f'./{dir}'):
        for file in files:
            if(file.split('.')[-1] != "out"):
                continue
            file_dict.setdefault(file.split('.')[1], []
                                 ).append(open(f'{dir}/{file}'))


find_file('output')
print(file_dict)
data_handle('out')
plt.show()
