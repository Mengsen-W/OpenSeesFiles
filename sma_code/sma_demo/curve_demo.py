'''
Date: 2021-03-17 14:40:12
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-07 14:56:01
'''

import numpy as np
import matplotlib.pyplot as plt
import math

# σ = E * (ε - ε0)+ φ * (T - T0) - (Ω * (1 - 58.8(ε0 - εb) ** 2) + σ0) * (sin(π/2) * ((T - As) / (Af - As))) + σ0

E: float = 22.0e9
ε0: float = 1.0
εb: float = 0.1
T0: float = 30.0
Ω: float = -698e6
φ: float = 0.35
Af: float = 79.9
As: float = 53.46
σ0: float = 1.0


def curve_demo(T: float):
    x = np.arange(-100, 100, 0.1)
    y = E * (x - ε0) + φ * (T - T0) - (Ω * (1 - 58.8 * (ε0 - εb) ** 2) +
                                       σ0) * (np.sin(math.pi/2) * ((T - As) / (Af - As))) + σ0
    print(y)
    plt.figure()
    plt.plot(x, y)
    plt.xlabel("x")
    plt.ylabel("y")


curve_demo(40.0)

plt.show()
