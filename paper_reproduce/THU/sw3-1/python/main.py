# Author: Mengsen.Wang
# Date: 2020-10-02 19:42:02
# Last Modified by: Mengsen.Wang
# Last Modified time: 2020-10-02 19:42:02

import time
from liblog import logger, log_init

import openseespy.opensees as ops
from data import data

time = time.strftime("%Y-%m-%d-%H-%M-%S", time.localtime())
log_init(True, "output\\",
         time, '')

ops.reset()
ops.wipe()

ops.start()
logger.info("opensees begin")

ndm: int = 3
ndf: int = ndm * (ndm - 1) / 2
ops.model('basic', '-ndm', 3, '-ndf', 6)

# set concrete
ops.nDMaterial('PlaneStressUserMaterial', 1, 40, 7, 30.8e6,
               3.08e6, -6.16e6, -0.002, -0.005, 0.001, 0.05)
ops.nDMaterial('PlateFromPlaneStress', 4, 1, 1.283e10)

# set steel
ops.uniaxialMaterial('Steel02', 7, 379e6, 202.7e9, 0.01, 18.5, 0.925, 0.15)
ops.uniaxialMaterial('Steel02', 8, 392e6, 200.6e9, 0.01, 18.5, 0.925, 0.15)
ops.nDMaterial('PlateRebar', 9, 7, 90)
ops.nDMaterial('PlateRebar', 10, 8, 90)
ops.nDMaterial('PlateRebar', 11, 8, 0)

# set section
ops.section('LayeredShell', 1, 10, 4, 0.0125, 11, 0.0003023, 11, 0.0004367, 4, 0.0246305,
            4, 0.0246305, 4, 0.0246305, 4, 0.0246305, 11, 0.0004367, 11, 0.0003023, 4, 0.0125)
ops.section('LayeredShell', 2, 8, 4, 0.0125, 11, 0.0003023, 10, 0.0002356,
            4, 0.0494621, 4, 0.0494621, 10, 0.0002356, 11, 0.0003023, 4, 0.0125)

# set node
ops.node(1, 0.0, 0, 0)
ops.node(2, 0.2, 0, 0)
ops.node(3, 0.5, 0, 0)
ops.node(4, 0.8, 0, 0)
ops.node(5, 1.0, 0, 0)
ops.node(6, 0.0, 0.2, 0)
ops.node(7, 0.2, 0.2, 0)
ops.node(8, 0.5, 0.2, 0)
ops.node(9, 0.8, 0.2, 0)
ops.node(10, 1.0, 0.2, 0)
ops.node(11, 0.0, 0.4, 0)
ops.node(12, 0.2, 0.4, 0)
ops.node(13, 0.5, 0.4, 0)
ops.node(14, 0.8, 0.4, 0)
ops.node(15, 1.0, 0.4, 0)
ops.node(16, 0.0, 0.6, 0)
ops.node(17, 0.2, 0.6, 0)
ops.node(18, 0.5, 0.6, 0)
ops.node(19, 0.8, 0.6, 0)
ops.node(20, 1.0, 0.6, 0)
ops.node(21, 0.0, 0.8, 0)
ops.node(22, 0.2, 0.8, 0)
ops.node(23, 0.5, 0.8, 0)
ops.node(24, 0.8, 0.8, 0)
ops.node(25, 1.0, 0.8, 0)
ops.node(26, 0.0, 1.0, 0)
ops.node(27, 0.2, 1.0, 0)
ops.node(28, 0.5, 1.0, 0)
ops.node(29, 0.8, 1.0, 0)
ops.node(30, 1.0, 1.0, 0)
ops.node(31, 0.0, 1.2, 0)
ops.node(32, 0.2, 1.2, 0)
ops.node(33, 0.5, 1.2, 0)
ops.node(34, 0.8, 1.2, 0)
ops.node(35, 1.0, 1.2, 0)
ops.node(36, 0.0, 1.4, 0)
ops.node(37, 0.2, 1.4, 0)
ops.node(38, 0.5, 1.4, 0)
ops.node(39, 0.8, 1.4, 0)
ops.node(40, 1.0, 1.4, 0)
ops.node(41, 0.0, 1.6, 0)
ops.node(42, 0.2, 1.6, 0)
ops.node(43, 0.5, 1.6, 0)
ops.node(44, 0.8, 1.6, 0)
ops.node(45, 1.0, 1.6, 0)
ops.node(46, 0.0, 1.8, 0)
ops.node(47, 0.2, 1.8, 0)
ops.node(48, 0.5, 1.8, 0)
ops.node(49, 0.8, 1.8, 0)
ops.node(50, 1.0, 1.8, 0)
ops.node(51, 0.0, 2.0, 0)
ops.node(52, 0.2, 2.0, 0)
ops.node(53, 0.5, 2.0, 0)
ops.node(54, 0.8, 2.0, 0)
ops.node(55, 1.0, 2.0, 0)

# set element
ops.element('ShellMITC4', 1, 1, 2, 7, 6, 1)
ops.element('ShellMITC4', 2, 2, 3, 8, 7, 2)
ops.element('ShellMITC4', 3, 3, 4, 9, 8, 2)
ops.element('ShellMITC4', 4, 4, 5, 10, 9, 1)

ops.element('ShellMITC4', 5, 6, 7, 12, 11, 1)
ops.element('ShellMITC4', 6, 7, 8, 13, 12, 2)
ops.element('ShellMITC4', 7, 8, 9, 14, 13, 2)
ops.element('ShellMITC4', 8, 9, 10, 15, 14, 1)

ops.element('ShellMITC4', 9	, 11, 12, 17, 16, 1)
ops.element('ShellMITC4', 10, 12, 13, 18, 17, 2)
ops.element('ShellMITC4', 11, 13, 14, 19, 18, 2)
ops.element('ShellMITC4', 12, 14, 15, 20, 19, 1)

ops.element('ShellMITC4', 13, 16, 17, 22, 21, 1)
ops.element('ShellMITC4', 14, 17, 18, 23, 22, 2)
ops.element('ShellMITC4', 15, 18, 19, 24, 23, 2)
ops.element('ShellMITC4', 16, 19, 20, 25, 24, 1)

ops.element('ShellMITC4', 17, 21, 22, 27, 26, 1)
ops.element('ShellMITC4', 18, 22, 23, 28, 27, 2)
ops.element('ShellMITC4', 19, 23, 24, 29, 28, 2)
ops.element('ShellMITC4', 20, 24, 25, 30, 29, 1)

ops.element('ShellMITC4', 21, 26, 27, 32, 31, 1)
ops.element('ShellMITC4', 22, 27, 28, 33, 32, 2)
ops.element('ShellMITC4', 23, 28, 29, 34, 33, 2)
ops.element('ShellMITC4', 24, 29, 30, 35, 34, 1)

ops.element('ShellMITC4', 25, 31, 32, 37, 36, 1)
ops.element('ShellMITC4', 26, 32, 33, 38, 37, 2)
ops.element('ShellMITC4', 27, 33, 34, 39, 38, 2)
ops.element('ShellMITC4', 28, 34, 35, 40, 39, 1)

ops.element('ShellMITC4', 29, 36, 37, 42, 41, 1)
ops.element('ShellMITC4', 30, 37, 38, 43, 42, 2)
ops.element('ShellMITC4', 31, 38, 39, 44, 43, 2)
ops.element('ShellMITC4', 32, 39, 40, 45, 44, 1)

ops.element('ShellMITC4', 33, 41, 42, 47, 46, 1)
ops.element('ShellMITC4', 34, 42, 43, 48, 47, 2)
ops.element('ShellMITC4', 35, 43, 44, 49, 48, 2)
ops.element('ShellMITC4', 36, 44, 45, 50, 49, 1)

ops.element('ShellMITC4', 37, 46, 47, 52, 51, 1)
ops.element('ShellMITC4', 38, 47, 48, 53, 52, 2)
ops.element('ShellMITC4', 39, 48, 49, 54, 53, 2)
ops.element('ShellMITC4', 40, 49, 50, 55, 54, 1)

ops.element('Truss', 41, 1, 16, 223.53e-6, 7)
ops.element('Truss', 42, 6, 11, 223.53e-6, 7)
ops.element('Truss', 43, 11, 16, 223.53e-6, 7)
ops.element('Truss', 44, 16, 21, 223.53e-6, 7)
ops.element('Truss', 45, 21, 26, 223.53e-6, 7)
ops.element('Truss', 46, 26, 31, 223.53e-6, 7)
ops.element('Truss', 47, 31, 36, 223.53e-6, 7)
ops.element('Truss', 48, 36, 41, 223.53e-6, 7)
ops.element('Truss', 49, 41, 46, 223.53e-6, 7)
ops.element('Truss', 50, 46, 51, 223.53e-6, 7)

ops.element('Truss', 51, 2, 7, 223.53e-6, 7)
ops.element('Truss', 52, 7, 12, 223.53e-6, 7)
ops.element('Truss', 53, 12, 17, 223.53e-6, 7)
ops.element('Truss', 54, 17, 22, 223.53e-6, 7)
ops.element('Truss', 55, 22, 27, 223.53e-6, 7)
ops.element('Truss', 56, 27, 32, 223.53e-6, 7)
ops.element('Truss', 57, 32, 37, 223.53e-6, 7)
ops.element('Truss', 58, 37, 42, 223.53e-6, 7)
ops.element('Truss', 59, 42, 47, 223.53e-6, 7)
ops.element('Truss', 60, 47, 52, 223.53e-6, 7)

ops.element('Truss', 61, 4, 9, 223.53e-6, 7)
ops.element('Truss', 62, 9, 14, 223.53e-6, 7)
ops.element('Truss', 63, 14, 19, 223.53e-6, 7)
ops.element('Truss', 64, 19, 24, 223.53e-6, 7)
ops.element('Truss', 65, 24, 29, 223.53e-6, 7)
ops.element('Truss', 66, 29, 34, 223.53e-6, 7)
ops.element('Truss', 67, 34, 39, 223.53e-6, 7)
ops.element('Truss', 68, 39, 44, 223.53e-6, 7)
ops.element('Truss', 69, 44, 49, 223.53e-6, 7)
ops.element('Truss', 70, 49, 54, 223.53e-6, 7)

ops.element('Truss', 71, 5, 10, 223.53e-6, 7)
ops.element('Truss', 72, 10, 15, 223.53e-6, 7)
ops.element('Truss', 73, 15, 20, 223.53e-6, 7)
ops.element('Truss', 74, 20, 25, 223.53e-6, 7)
ops.element('Truss', 75, 25, 30, 223.53e-6, 7)
ops.element('Truss', 76, 30, 35, 223.53e-6, 7)
ops.element('Truss', 77, 35, 40, 223.53e-6, 7)
ops.element('Truss', 78, 40, 45, 223.53e-6, 7)
ops.element('Truss', 79, 45, 50, 223.53e-6, 7)
ops.element('Truss', 80, 50, 55, 223.53e-6, 7)

ops.fixY(0.0, 1, 1, 1, 1, 1, 1)

ops.recorder('Node', '-file', 'output\\gravity.out', '-time',
             '-node', 1, 2, 3, 4, 5, '-dof', 2, 'reaction')

ops.timeSeries('Linear', 1)
ops.pattern('Plain', 1, 1)
ops.load(52, 0, -493000, 0, 0, 0, 0)
ops.load(54, 0, -493000, 0, 0, 0, 0)
ops.constraints('Plain')
ops.numberer('RCM')
ops.system('BandGeneral')
ops.test('NormDispIncr', 1.0e-6, 20000)
ops.algorithm('KrylovNewton')
ops.integrator('LoadControl', 0.1)
ops.analysis('Static')
ops.analyze(10)

logger.info("gravity analyze ok...")

ops.wipeAnalysis()
ops.loadConst('-time', 0.0)
ops.remove('recorders')

ops.recorder('Node', '-file', 'output\\reaction.out', '-time',
             '-node', 1, 2, 3, 4, 5, '-dof', 1, 'reaction')
ops.recorder('Node', '-file', 'output\\disp.out',
             '-time', '-node', 53, '-dof', 1, 'disp')
sp = False

if sp:
    ops.timeSeries('Path', 2, '-dt', 0.1, '-values', *data)
    ops.pattern('Plain', 2, 2)
    ops.sp(53, 1, 1)
    ops.constraints('Penalty', 1e20, 1e20)
    ops.numberer('RCM')
    ops.system('BandGeneral')
    ops.test('NormDispIncr', 1.0e-5, 100000, 2)
    ops.algorithm('KrylovNewton')
    ops.integrator('LoadControl', 0.1)
    ops.analysis('Static')
    ops.analyze(500)
else:
    ops.timeSeries('Linear', 2)
    ops.pattern('Plain', 2, 2)
    ops.load(53, 1, 0, 0, 0, 0, 0)
    ops.constraints('Penalty', 1e20, 1e20)
    ops.numberer('RCM')
    ops.system('BandGeneral')
    ops.test('NormDispIncr', 1.0e-2, 1000)
    ops.integrator('DisplacementControl', 53, 1, 1e-3)
    ops.algorithm('KrylovNewton')
    ops.analysis('Static')
    ops.analyze(5)
    ops.integrator('DisplacementControl', 53, 1, -1e-3)
    ops.algorithm('KrylovNewton')
    ops.analysis('Static')
    ops.analyze(10)
    # ops.integrator('DisplacementControl', 53, 1, 1e-3)
    # ops.algorithm('KrylovNewton')
    # ops.analysis('Static')
    # ops.analyze(5)
    # ops.integrator('DisplacementControl', 53, 1, 1e-3)
    # ops.algorithm('KrylovNewton')
    # ops.analysis('Static')
    # ops.analyze(10)
    # ops.integrator('DisplacementControl', 53, 1, -1e-3)
    # ops.algorithm('KrylovNewton')
    # ops.analysis('Static')
    # ops.analyze(20)
    # ops.integrator('DisplacementControl', 53, 1, 1e-3)
    # ops.algorithm('KrylovNewton')
    # ops.analysis('Static')
    # ops.analyze(10)

ops.printModel()
ops.stop()
