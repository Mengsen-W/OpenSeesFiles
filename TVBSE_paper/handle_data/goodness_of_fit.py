"""
Date: 2021-11-28 13:22:48
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-11-28 13:24:22
"""


def goodness_of_fit(y_fit, y):
    """
    计算拟合优度R^2
    :param y_fitting: List[int] or array[int] 拟合好的y值
    :param y_no_fitting: List[int] or array[int] 待拟合y值
    :return: 拟合优度R^2
    """
    # residual sum of squares
    ss_res = np.sum((y - y_fit) ** 2)
    # total sum of squares
    ss_tot = np.sum((y - np.mean(y)) ** 2)
    # r-squared
    r2 = 1 - (ss_res / ss_tot)
    return r2


import numpy as np
import matplotlib.pyplot as plt

y = np.array(
    [
        0,
        0.06073,
        0.38143,
        0.76968,
        1.22039,
        1.82947,
        2.4955,
        3.28941,
        4.4876,
        6.2744,
        8.27536,
        10.32422,
        12.41365,
        14.44052,
        16.27308,
        18.6521,
        21.255,
        22.85391,
        23.74563,
    ]
)

y_fit = np.array(
    [
        0,
        0.05019,
        0.89954,
        2.61515,
        3.92246,
        5.29335,
        6.75421,
        8.34915,
        9.87176,
        11.51671,
        13.13475,
        14.83207,
        16.49629,
        18.19704,
        19.9311,
        21.67078,
        23.48662,
        25.15452,
        26.36949,
    ]
)

print(goodness_of_fit(y_fit, y))
