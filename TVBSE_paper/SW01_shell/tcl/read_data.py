'''
Date: 2021-04-23 16:13:19
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-23 20:42:49
'''

import numpy as np
import matplotlib.pyplot as plt
import pylab


x = []
y = []

x = [float(_l.split(' ')[-1]) for _l in open('out.txt')]
y = [float(_l.split(' ')[0]) for _l in open('out.txt')]
x = np.asarray(x)
y = np.asarray(y)
plt.plot(x, y)
plt.show()
