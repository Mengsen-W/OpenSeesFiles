'''
Date: 2021-03-24 15:43:41
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-03-24 17:28:54
'''

import os
import numpy as np
import matplotlib.pyplot as plt
from concurrent.futures import ThreadPoolExecutor
import openseespy.opensees as ops


def run(arg_1, arg_2, arg_3, arg_4):
    ops.reset()
    ops.wipe()

    ops.model('basic', '-ndm', 3, '-ndf', 6)

    ops.node(1, 0.0, 0.0, 0.0)
    ops.node(2, 0.0, 3.2, 0.0)
    ops.fix(1, 1, 1, 1, 1, 1, 1)

    ops.uniaxialMaterial('Concrete01', 1, -80.0e6, -0.002, 0.0, -0.005)

    ops.section('Fiber', 1, '-GJ', 1)
    ops.patch('rect', 1, 10, 10, -0.8, -0.1, 0.8, 0.1)

    ops.geomTransf('Linear', 1, 0, 0, 1)
    ops.beamIntegration('Legendre', 1, 1, 10)
    ops.element('dispBeamColumn', 1, 1, 2, 1, 1)

    ops.timeSeries('Linear', 1)
    ops.pattern('Plain', 1, 1)
    ops.load(2, 0, -24586.24, 0, 0, 0, 0)

    ops.constraints('Plain')
    ops.numberer('RCM')
    ops.system('UmfPack')
    ops.test('NormDispIncr', 1.0e-6, 2000)
    ops.algorithm('Newton')
    ops.integrator('LoadControl', 0.01)
    ops.analysis('Static')
    ops.analyze(100)

    ops.wipeAnalysis()
    ops.loadConst('-time', 0.0)

    ops.recorder('Node', '-file', 'disp.out', ' -time',
                 '-node',  2, '-dof', 1, 'disp')
    ops.recorder('Node', '-file', 'react.out', '-time ',
                 '-node', 2, '-dof', 1, 'reaction')

    ops.timeSeries('Linear', 2)
    ops.pattern('Plain', 2, 2)
    ops.load(2, 11500, 0, 0, 0, 0, 0)
    ops.constraints('Plain')
    ops.numberer('RCM')
    ops.system('UmfPack')
    ops.test('NormDispIncr', 1.0, 2000)
    ops.algorithm('Newton')
    ops.integrator('LoadControl',  0.01)
    ops.analysis('Static')
    # ops.analyze(100)

    step = 100
    data = np.zeros((step, 2))
    for i in range(step):
        ops.analyze(1)
        data[i, 0] = ops.nodeDisp(2, 1)
        data[i, 1] = ops.getLoadFactor(2) * 11500
    return data
    # plt.plot(data[:, 0], data[:, 1])
    # plt.xlabel('Horizontal Displacement')
    # plt.ylabel('Horizontal Load')
    # plt.show()
