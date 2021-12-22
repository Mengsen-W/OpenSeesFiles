'''
Date: 2021-04-17 15:53:24
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-23 10:06:28
'''

# m, N, Pa
# 墙高 2000 ，墙厚 200 ，墙宽 1000 ，高宽比 2.0
# 边缘约束区长度 180 + 20
# 保护层厚度 20
# 箍筋间距 40 共26根
# 0 40 80 120 160 200 240 280 320 360
# 400 440 480 520 560 600 640 680 720 760
# 800 840 880 920 960 1000
# 纵筋为 0 20 110 200 300 400 500 600 700 800 890 980 1000

import time
import openseespy.opensees as ops
import openseespy.postprocessing.Get_Rendering as opsplt
from liblog import log_init, logger
from libCycliAnalysis import CyclicDisplace


def ops_main(*argv):
    time.sleep(1)
    log_init(flag="Author: Mengsen Wang\n", filename=f'test_{argv[0]}.log')

    hoopping = list(map(lambda x: x / 1000, list(range(0, 2200, 200))))
    rebar = list(
        map(lambda x: x / 1000, [0, 100, 200, 400, 600, 800, 900, 1000]))
    # logger.info("hooping = {}".format(hoopping))
    # logger.info("rebar =  {}".format(rebar))

    dead_load = 2*1*0.2*2430*10
    gravity_load = 746e3

    def ops_init():
        '''opensees init'''
        ops.reset()
        ops.wipe()
        ops.start()
        ops.model('basic', '-ndm', 3, '-ndf', 6)

    def ops_node():
        ''' define opensees node '''
        i = 0
        for z in hoopping:
            for x in rebar:
                i = i + 1
                ops.node(i, x, 0, z)

        # for z in hoopping:
        #     i = i + 1
        #     ops.node(i, 0.02, 0, z)
        # for z in hoopping:
        #     i = i + 1
        #     ops.node(i, 0.98, 0, z)
        for i in range(1, 9):
            ops.fix(i, 1, 1, 1, 1, 1, 1)

    def ops_material():
        ''' define material '''
        # concrete
        # 抗压强度 抗压强度/10 残余强度 最大应变 残余应变 拉伸应变 剪切保留因子
        ops.nDMaterial('PlaneStressUserMaterial', 1, 40, 7, 31.7e6,
                       3.17e6, -6.16e6, -0.002, -0.005, 0.001, 0.1)

        # 平面外剪切模量
        ops.nDMaterial('PlateFromPlaneStress', 2, 1, 1.23E15)

        # 屈服强度 初始弹模 硬化率

        # 端部GFRP 20
        # 强度 1255.5 MPa 屈服应变 1.98% 弹性模量 63.5GPa
        ops.uniaxialMaterial('Steel02', 3, 1255.5e6, 63.5e9,
                             float(argv[0]), 20, 0.925, 0.15)

        # 端部纵筋 S16G2
        # 屈服强度 348.7MPa 屈服应变 0.204%
        # 极限强度 718.4MPa 极限应变 1.823%
        # 弹性模量 170.931GPa
        ops.uniaxialMaterial('Steel02', 4, 348.7e6,
                             170.931e9, 0.2210, 15, 0.925, 0.15)

        # 中部纵筋 10mm 和 箍筋 8mm S6G2
        # 屈服强度 257.5MPa 屈服应变 0.196%
        # 极限强度 837.2MPa 极限应变 1.658%
        # 弹性模量 131.378GPa
        ops.uniaxialMaterial('Steel02', 5, 257.5e6,
                             131.378e9, 0.320, 15, 0.925, 0.15)

        # 钢筋层
        # 箍筋
        ops.nDMaterial('PlateRebar', 6, 5, 0)
        # 纵筋
        ops.nDMaterial('PlateRebar', 7, 5, 90)

    def ops_section():
        ''' define section '''
        # 加强区壳
        ops.section('LayeredShell', 1, 10,
                    2, 20/1000,          # 保护层
                    6, 1.28177/1000,     # 箍筋层
                    2, 26.239/1000,      # 核心区混凝土
                    2, 26.239/1000,      # 核心区混凝土
                    2, 26.239/1000,      # 核心区混凝土
                    2, 26.239/1000,      # 核心区混凝土
                    2, 26.239/1000,      # 核心区混凝土
                    2, 26.239/1000,      # 核心区混凝土
                    6, 1.28177/1000,     # 箍筋层
                    2, 20/1000           # 保护层
                    )
        # 中部壳
        ops.section('LayeredShell', 2, 12,
                    2, 20/1000,              # 保护层
                    6, 0.65345127/1000,      # 箍筋层
                    7, 0.6544985/1000,       # 纵筋层
                    2, 26.2274/1000,         # 核心区混凝土
                    2, 26.2274/1000,         # 核心区混凝土
                    2, 26.2274/1000,         # 核心区混凝土
                    2, 26.2274/1000,         # 核心区混凝土
                    2, 26.2274/1000,         # 核心区混凝土
                    2, 26.2274/1000,         # 核心区混凝土
                    7, 0.6544985/1000,       # 纵筋层
                    6, 0.65345127/1000,      # 箍筋层
                    2, 20/1000               # 保护层
                    )

        ops.section('Fiber', 3, '-GJ', 1)
        # 端部 GFRP 拉锁
        ops.patch('circ', 3, 10, 10, 0, 0, 0, 0.01414, 0, 360)
        ops.beamIntegration('Legendre', 1, 3, 9)
        # 0 1 0

        # 端部 SFCB 拉锁
        ops.section('Fiber', 4, '-GJ', 1)
        ops.patch('circ', 4, 10, 10, 0, 0, 0, 0.01414, 0, 360)
        ops.beamIntegration('Legendre', 2, 4, 9)

        ops.geomTransf('Linear', 1, 0, 1, 0)

    def ops_element():
        ''' define element '''
        # 壳区域
        # 边缘约束区
        i = 1
        for _i in [1, 2, 6, 7]:
            for n in range(_i, 80+_i, 8):
                ops.element('ShellMITC4', i, n, n+1, n+9, n+8, 1)
                i = i + 1
        # 中部区域
        for _i in [3, 4, 5]:
            for n in range(_i, 80+_i, 8):
                ops.element('ShellMITC4', i, n, n+1, n+9, n+8, 2)
                i = i + 1

        # 杆区域
        for _i in [1, 8]:
            for n in range(_i, 80+_i, 8):
                ops.element('dispBeamColumn', i, n, n + 8, 1, 1)
                i = i + 1
        for _i in [1, 2, 3, 5, 6, 8]:
            for n in range(_i, 80+_i, 8):
                ops.element('dispBeamColumn', i, n, n + 8, 1, 2)
                i = i + 1

    def ops_gravity():
        ops.recorder('Node', '-file', f'output\\gravity_disp_{argv[0]}.out',
                     '-nodeRange', 81, 88,  '-time', '-dof',  3, 'disp')
        ops.recorder('Node', '-file', f'output\\gravity_reaction_{argv[0]}.out',
                     '-nodeRange', 81, 88,  '-time', '-dof',  3, 'reaction')
        ops.timeSeries('Linear', 1)
        ops.pattern('Plain', 1, 1)
        load: float = [0, 0, (gravity_load + dead_load) / 8, 0, 0, 0]
        for i in range(81, 89):
            ops.load(i, *load)
        ops.constraints('Plain')
        ops.numberer('Plain')
        ops.system('BandGen')
        ops.test('NormDispIncr', 1.0, 1000)
        ops.algorithm('Newton')
        ops.integrator('LoadControl', 0.01)
        ops.analysis('Static')
        ok = ops.analyze(100)
        logger.info("gravity analyze result is %s", ok == 0)

    def ops_cyclic():
        ops.remove('recorders')
        ops.wipeAnalysis()
        ops.loadConst('-time', 0.0)

        # set hysteresis
        ops.recorder('Node', '-file', f'output\\cyclic_81_disp_{argv[0]}.out',
                     '-time', '-node', 81, '-dof', 1, 'disp')
        ops.recorder('Node', '-file', f'output\\cyclic_81_rea_{argv[0]}.out',
                     '-time', '-nodeRange', 1, 8, '-dof', 1, 'reaction')
        # ops.timeSeries("Path", 2, '-dt', 0.1, '-filePath', 'disp.txt')
        ops.timeSeries('Linear', 2)
        ops.pattern('Plain', 2, 2)
        # ops.sp(81, 1, 1)
        ops.load(81, 1, 0, 0, 0, 0, 0)
        # ops.constraints('Penalty', 1e20, 1e20)
        # ops.numberer('RCM')
        # ops.system('BandGeneral')
        # ops.test('NormDispIncr', 1e-4, 1e6, 2)
        # ops.algorithm('KrylovNewton')
        # ops.integrator('LoadControl', 0.1)
        # ops.analysis('Static')
        # # ops.analyze(12961)
        # with open('disp.txt', 'r') as f:
        #     i = 1
        #     lines = f.readlines()
        #     count = len(lines)
        #     for line in lines:
        #         logger.info(
        #             'position = {} line = {} and {:3%}'.format(line[:-1], i, i/count))
        #         ops.analyze(1)
        #         i = i + 1
        CyclicDisplace(1e-3, 80, 1e-3, 81, 1, 1e-6, 1e6)

    ops_init()
    ops_node()
    ops_material()
    ops_section()
    ops_element()
    ops_gravity()
    ops_cyclic()
    ops.printModel()
    # opsplt.plot_model('element')
    ops.stop()
    ops.wipe()
    ops.reset()
    time.sleep(1)


if __name__ == '__main__':
    ops_main(0)
