'''
Date: 2021-04-07 22:23:00
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-09 16:53:35
'''
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

f = open("opt.csv", 'r')
x = []
y = []

for line in f:
    x.append(int(line.split(',')[0]))
    y.append(float(line.split(',')[1][0:-2]))

x = np.array(x)
print('x is :\n', x)
y = np.array(y)
print('y is :\n', y)
f1 = np.polyfit(x, y, 1)
print('f1 is :\n', f1)
p1 = np.poly1d(f1)
print('p1 is :\n', p1)

#也可使用yvals=np.polyval(f1, x)
yvals = p1(x)  # 拟合y值
print('yvals is :\n', yvals)
# 绘图
plot1 = plt.plot(x, y, 's', label='original values')
plot2 = plt.plot(x, yvals, 'r', label='polyfit values')
plt.xlabel('x')
plt.ylabel('y')
plt.legend(loc=4)  # 指定legend的位置右下角
plt.title('polyfitting')
plt.show()


f.close()
