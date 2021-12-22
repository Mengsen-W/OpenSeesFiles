'''
Date: 2021-04-29 10:53:40
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-05-09 20:26:48
'''
# mm N Mpa


import openseespy.opensees as ops
import openseespy.postprocessing.Get_Rendering as opsplt
from liblog import log_init, logger
from libCycliAnalysis import CyclicDisplace


nodes = [_i * 200 for _i in range(0, 11)]
print(nodes)


def ops_model():
    ops.reset()
    ops.wipe()
    ops.start()
    ops.model('basic', '-ndm', 2, '-ndf', 3)


def ops_node():
    i = 1
    for _i in nodes:
        ops.node(i, 0, _i)
        i = i + 1
    ops.fix(1, 1, 1, 1)


def ops_material():
    # 混凝土
    # 抗压强度 抗压应变 初始弹模
    # 压缩方程形状参数
    # 抗压临界应变
    # 抗拉强度 抗拉应变
    # 拉伸方程形状参数
    # 抗拉临界应变
    ops.uniaxialMaterial('ConcreteCM', 1, -31.7, -0.00234,
                         3.25e4, 7, 0.03, 6.34, 0.001, 1.2, 10000, 1)
    # GFRP 拉筋
    ops.uniaxialMaterial('Steel02', 2, 1255.5, 64.9e3, 1e-20)
    # SFCB 纵筋
    ops.uniaxialMaterial('Steel02', 3, 348.7, 170.931e3, 0.2210)
    # 箍筋和中部纵筋
    ops.uniaxialMaterial('Steel02', 4, 257.5, 131.378e3, 0.320)

    # 约束区FSAM
    ops.nDMaterial('FSAM', 5, 2360e-3, 4, 3, 1,
                   0.02179008664529880590197689450643, 0.04712388980384689857693965074919, 0.1, 0.01)
    # 中部区域FSAM
    ops.nDMaterial('FSAM', 6, 2360e-3, 4, 4, 1,
                   0.00827704944465790858560291110048, 0.00654498469497873591346384038183, 0.1, 0.01)


def ops_element():
    i = 1
    for _i in range(1, 11):
        print(f'element = {i}, node = {_i},{_i + 1}')
        ops.element('SFI_MVLEM', i, _i, _i + 1, 5, 0.4,
                    '-thick', 200, 200, 200, 200, 200,
                    '-width', 200, 200, 200, 200, 200,
                    '-mat', 5, 6, 6, 6, 5)
        i = i + 1


def main():
    log_init(flag="Author: Mengsen Wang\n",
             filename='test.log')
    ops_model()
    ops_node()
    ops_material()
    ops_element()
    ops.printModel()
    opsplt.plot_model('elements')
    # ops.stop()
    # ops.wipe()
    # ops.reset()


main()
