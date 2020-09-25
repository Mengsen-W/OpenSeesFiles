"""
Author: Mengsen.Wang
Date: 2020-09-19 10:53:01
Last Modified by: Mengsen.Wang
Last Modified time: 2020-09-19 10:53:01
Description: perprocess part
"""

import argument as argu
import openseespy.opensees as ops
from log import logger
from libCycliAnalysis import CyclicDisplace

ops.reset()
ops.wipe()

# set model
ops.model('basic', '-ndm', argu.ndm, '-ndf', argu.ndf)
logger.info("begin")

# set node
for i in range(argu.sum_row_num):
    for j in range(argu.sum_col_num):
        ops.node((i + 1) * argu.node_index + j + 1,
                 argu.length_div[i], 0, argu.hight_div[j])
logger.info("setted node")

# fix node
full_fixed: int = [1, 1, 1, 1, 1, 1]
for i in range(1, 8):
    ops.fix(i * argu.node_index + 1, *full_fixed)
logger.info("fixed node")

# rigid beam
logger.info("rigidness beam on the top")
for i in range(1, 7):
    ops.rigidLink('beam', i * argu.node_index + 11,
                  (i + 1) * argu.node_index + 11)

# set uniaxial metrial
logger.info("material tag 1 by [steel 02] and used on longitudinal steel")
ops.uniaxialMaterial('Steel02', 1, *(argu.longitudinal_steel))

logger.info("material tag 2 by [steel 02] and used on transverse steel")
ops.uniaxialMaterial('Steel02', 2, *(argu.transverse_steel))

# set nDMaterial
logger.info(
    "material tag 30 by [PlaneStressUserMaterial] and used on C30 concrete")
ops.nDMaterial('PlaneStressUserMaterial', 3, *(argu.c30_con[0:-1]))
logger.info(
    "material tag 30 by [PlateFromPlaneStress] and used on C30 concrete")
ops.nDMaterial('PlateFromPlaneStress', 30, 3, argu.c30_con[-1])

logger.info(
    "material tag 40 by [PlaneStressUserMaterial] and used on C40 concrete")
ops.nDMaterial('PlaneStressUserMaterial', 4, *(argu.c40_con[0:-1]))

logger.info(
    "material tag 40 by [PlateFromPlaneStress] and used on C40 concrete")
ops.nDMaterial('PlateFromPlaneStress', 40, 4, argu.c40_con[-1])

logger.info(
    "material tag 5 by [PlateRebar] and used on angle 90 d = 10 longitudinal steel")
ops.nDMaterial('PlateRebar', 5, 1, 90)

logger.info(
    "material tag 6 by [PlateRebar] and used angle 90 d = 6 transverse steel")
ops.nDMaterial('PlateRebar', 6, 2, 90)

logger.info(
    "material tag 7 by [PlateRebar] and used angle 0 d = 6 transverse steel")
ops.nDMaterial('PlateRebar', 7, 2, 0)

logger.info("material setted")
# logger.info(ops.p)

# set section
confined_region_1: float = [30, 15.0, 7, 0.2749, 7, 0.5886, 30, 42.059,
                            30, 42.059, 30, 42.059, 30, 42.059, 7, 0.5886, 7, 0.2949, 30, 15.0]
middle_region_1: float = [30, 15.0, 7, 0.2949, 6, 0.5886,
                          30, 84.117, 30, 84.117, 6, 0.5886, 7, 0.2949, 30, 15.0]

ops.section('LayeredShell', 11, 10, *confined_region_1)
logger.info("confined_region setted")

ops.section('LayeredShell', 12, 8, *middle_region_1)
logger.info("middle_region setted")

confined_region_2: float = [40, 15.0, 7, 0.2749, 7, 0.5886, 40, 42.059,
                            40, 42.059, 40, 42.059, 40, 42.059, 7, 0.5886, 7, 0.2949, 40, 15.0]
middle_region_2: float = [40, 15.0, 7, 0.2949, 6, 0.5886,
                          40, 84.117, 40, 84.117, 6, 0.5886, 7, 0.2949, 40, 15.0]

ops.section('LayeredShell', 21, 10, *confined_region_2)
logger.info("confined_region setted")

ops.section('LayeredShell', 22, 8, *middle_region_2)
logger.info("middle_region setted")

# set element
for i in range(1, 3):
    for j in range(1, 11):
        ops.element('ShellMITC4', i * 1000 + j, i * 1000 + j,
                    (i + 1) * 1000 + j,  (i + 1)*1000 + (j + 1), i*1000 + (j + 1), 11)
        ops.element('ShellMITC4', (i + 5) * 1000 + j, (i + 5) * 1000 + j,
                    (i + 6) * 1000 + j,  (i + 6)*1000 + (j + 1), (i + 5)*1000 + (j + 1), 11)


for i in range(3, 6):
    for j in range(1, 11):
        ops.element('ShellMITC4', i * 1000 + j, i * 1000 + j,
                    (i+1) * 1000 + j,  (i+1)*1000 + (j+1), i*1000 + (j+1), 12)
        ops.element('Truss', (i - 2) * 100 + j, (i - 2) * 1000 +
                    j, (i - 2) * 1000 + (j + 1), 223.53e-6, 1)
        ops.element('Truss', (i + 3) * 100 + j, (i + 3) * 1000 +
                    j, (i + 3) * 1000 + (j + 1), 223.53e-6, 1)

logger.info("element created")

# set timeSeries
ops.timeSeries('Linear', 1)
logger.info("[Linear] timeSeries tag 1 created")


# set load pattern
ops.pattern('Plain', 1, 1)
load: float = 164333.34
for i in range(2, 8):
    ops.load(i * 1000 + 11, 0, load, 0, 0, 0, 0)

logger.info("Node Load created")

# load analyze
ops.constraints('Plain')
ops.system('BandGen')
ops.test('NormDispIncr', 1.0e-6, 200)
ops.algorithm('BFGS', secant=False, initial=False, count=100)
ops.integrator('LoadControl', 0.1)
ops.analysis('Static')
ops.analyze(10)

# set recorder
ops.recorder('Node', '-file', 'output\\1011_load.out', '-precision', '-timeSeries', 1, '-time', '-node', 1011,
             '-dof', 1, 2, 3, 'disp', 'vel', 'accel', 'incrDisp', 'reaction')

logger.info("load analyze completed")

ops.loadConst('-time', 0)

# set hysteresis
ops.pattern('Plain', 2, 1)
ops.load(1011, 0, 1, 0, 0, 0, 0)
ops.recorder('Node', '-file', 'output\\1011_cyc.out', '-precision', '-node', 1011,
             '-dof', 1, 2, 3, 'disp', 'vel', 'accel', 'incrDisp', 'reaction')
CyclicDisplace(1, 80, 0.5, 1011, 1, 1E-2, 1000)


if __name__ == "__main__":
    # for debug
    ops.printModel()
    # pass
