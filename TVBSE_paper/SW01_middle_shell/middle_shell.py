'''
Date: 2021-05-30 15:42:25
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-05-30 18:25:08
'''

import openseespy.opensees as ops
import openseespy.postprocessing.Get_Rendering as opsplt
from openseespy.preprocessing.liblog import log_init, logger

nodes_high = [_i * 200 for _i in range(0, 11)]
nodes_width = [_i * 200 for _i in range(0, 6)]
# print(nodes_high)
# print(nodes_width)


def ops_model():
    ops.reset()
    ops.wipe()
    ops.start()
    ops.model('basic', '-ndm', 3, '-ndf', 6)


def ops_node():
    i = 1
    for _i in nodes_high:
        for _j in nodes_width:
            ops.node(i, _j, 0, _i)
            i = i + 1
    for _i in range(1, 7):
        ops.fix(_i, 1, 1, 1, 1, 1, 1)
    for _i in range(1, 67, 6):
        ops.equalDOF(_i, _i+1, 1, 2, 3, 4, 5, 6)
    for _i in range(5, 71, 6):
        ops.equalDOF(_i, _i+1, 1, 2, 3, 4, 5, 6)


def ops_material():
    # 中部混凝土
    ops.nDMaterial('PlaneStressUserMaterial', 1, 40, 7, 31.7,
                   3.17, -6.34, -0.00234, -0.03, 0.001, 0.05)
    ops.nDMaterial('PlateFromPlaneStress', 2, 1, 1.23e9)

    # 端部拉锁
    ops.uniaxialMaterial('Steel02', 3, 156.9375, 7937500, 1e-15)
    # 端部纵筋
    ops.uniaxialMaterial('Steel02', 4, 348.7, 170.931e6, 0.2210)
    # 中部纵筋和箍筋
    ops.uniaxialMaterial("Steel02", 5, 257.5, 131.378e6, 0.320)

    # 中部箍筋层
    ops.nDMaterial("PlateRebar", 6, 5, 0)
    # 中部纵筋层
    ops.nDMaterial("PlateRebar", 7, 5, 90)
    # 边缘区混凝土
    ops.uniaxialMaterial('Concrete01', 6, -31.7, -0.00234, 0.0, -0.005)

    # 中部壳
    ops.section('LayeredShell', 1, 12,
                2, 20,
                6, 0.65345127,
                7, 0.6544985,
                2, 26.2274,
                2, 26.2274,
                2, 26.2274,
                2, 26.2274,
                2, 26.2274,
                2, 26.2274,
                7, 0.6544985,
                6, 0.65345127,
                2, 20)
    # 边缘约束区
    ops.section('Fiber', 2, '-GJ', 0)
    # 混凝土
    ops.fiber(100, 0, 40000, 6)
    # 端部SFCB纵筋
    ops.fiber(0, 100, 314, 4)
    ops.fiber(0, -100, 314, 4)
    ops.fiber(100, 100, 314, 4)
    ops.fiber(100, -100, 314, 4)
    ops.fiber(200, 100, 314, 4)
    ops.fiber(200, -100, 314, 4)
    # 端部GFRP拉锁
    ops.fiber(200, 70, 314, 3)
    ops.fiber(200, -70, 314, 3)


def ops_element():
    ops.beamIntegration('Legendre', 1, 2, 9)
    ops.geomTransf('Linear', 1, 0, -1, 0)
    i = 1
    for _i in range(0, 56, 6):
        for _j in range(_i + 2, _i + 5):
            # print(f'element = {i}, node = {_j},{_j + 1},{_j + 7},{_j + 6 }')
            ops.element("ShellNLDKGQ", i, _j, _j + 1, _j + 7, _j+6, 1)
            i = i + 1
    for _k in range(1, 61, 6):
        # print(f'element = {i}, node = {_k},{_k + 6}')
        ops.element('dispBeamColumn', i, _k, _k+6, 1, 1)
        i = i + 1
    for _l in range(6, 66, 6):
        # print(f'element = {i}, node = {_l},{_l + 6}')
        ops.element('dispBeamColumn', i, _l, _l+6, 1, 1)
        i = i + 1


def main():
    log_init(flag="Author: Mengsen Wang\n",
             filename='test.log')
    logger.info("dispBeamColumn + shell")
    ops_model()
    ops_node()
    ops_material()
    ops_element()
    # ops.printModel()
    opsplt.plot_model('element')
    # ops.stop()
    # ops.wipe()
    # ops.reset()


main()
