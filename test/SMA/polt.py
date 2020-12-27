import numpy as np
import matplotlib.pyplot as plt
import math

x = np.linspace(-2, 2, 50)
y = np.array([])


def sgn(value):
    if value < 0:
        return 0.25*((math.e**value) - 1 + value)
    else:
        return value


plt.figure(figsize=(6, 4))

for v in x:
    y = np.append(y, np.linspace(sgn(v), sgn(v), 1))
plt.plot(x, y, 'b', label='activate function')

plt.legend()
plt.yticks([-0.5, 0, 0.5, 1.0, 1.5, 2.0], [-0.5, "", 0.5, 1.0, 1.5, 2.0])
plt.text(2.3, -0.2, 'x', rotation=0, size=15)
plt.text(-0.2, 2.3, 'y', rotation=0, size=15)

ax = plt.gca()
ax.spines['top'].set_color('none')
ax.spines['right'].set_color('none')
ax.xaxis.set_ticks_position('bottom')
ax.yaxis.set_ticks_position('left')
ax.spines['left'].set_position(('data', 0))
ax.spines['bottom'].set_position(('data', 0))

# plt.savefig("tu.svg")
plt.show()
