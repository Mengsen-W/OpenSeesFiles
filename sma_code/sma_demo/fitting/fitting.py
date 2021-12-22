'''
Date: 2021-04-27 10:28:20
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-27 12:22:06
'''
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
import math
from scipy.optimize import leastsq

e0 = 0.1
eb = 0.1

data = pd.read_excel(r'fit.xlsx').values

temp = [_i[0] for _i in data]
stress = [_i[1] for _i in data]
x = [(_i[1] - 1.136e8 - (3e4 * (_i[0] - 10))) / (472e6 * math.sin((math.pi / 2) * ((_i[0] - 90) / 85)))
     for _i in data]
temp = np.array(temp)
stress = np.array(stress)


# def fun(p, x):
#     a, b, c = p
#     return a * np.exp(-b * x) + c


# def error(p, x, y):
#     return (fun(p, x) - y) ** 2


# p0 = [40, 100, 100]
# para = leastsq(error, p0, args=(temp, stress))
# y_fitted = fun(para[0], x)


f1 = np.polyfit(temp, stress, 300)
print('f1 is :\n', f1)
p1 = np.poly1d(f1)
print('p1 is :\n', p1)

#也可使用yvals=np.polyval(f1, x)
yvals = p1(x)
print('yvals is :\n', yvals)

# # print(stress)
# print(para[0])
plt.plot(temp, stress, label='Origin')
plt.plot(temp, yvals, label='Fitted')
plt.legend()
plt.show()
