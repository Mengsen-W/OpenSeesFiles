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

# set section
confined_region: float = [30, 15.0, 7, 0.2749, 7, 0.5886, 30, 42.059,
                          30, 42.059, 30, 42.059, 30, 42.059, 7, 0.5886, 7, 0.2949, 30, 15.0]
middle_region: float = [30, 15.0, 7, 0.2949, 6, 0.5886,
                        30, 84.117, 30, 84.117, 6, 0.5886, 7, 0.2949, 30, 15.0]

ops.section('LayeredShell', 1, 10, *confined_region)
logger.info("confined_region setted")

ops.section('LayeredShell', 2, 8, *middle_region)
logger.info("middle_region setted")

# set element

if __name__ == "__main__":
    # pass
    # for debug
    ops.printModel()
