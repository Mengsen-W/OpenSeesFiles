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
for i in range(1, 7):
    ops.rigidLink('beam', i * argu.node_index + 11,
                  (i + 1) * argu.node_index + 11)
logger.info("rigidness beam on the top")

# set metrial
logger.info(
    "material tag = 1 by [concrete 01] and used on protective concrete")
ops.uniaxialMaterial('Concrete01', 1, argu.mat1.fpc,
                     argu.mat1.epsc0, argu.mat1.fpcu, argu.mat1.epsU)
logger.info("material tag = 2 by [concreteCM] and used on constraint concrete")
ops.uniaxialMaterial('ConcreteCM', 2, -argu.mat2.fpcc, argu.mat2.epcc, argu.mat2.Ec,
                     argu.mat2.rc, argu.mat2.xcrn, argu.mat2.ft, argu.mat2.et, argu.mat2.rt, argu.mat2.Gap)
logger.info(
    "material tag = 3 by [concrete 02] and used on non-constraint concrete")
ops.uniaxialMaterial('Concrete02', 3, argu.mat3.fpcu, argu.mat3.epsc0,
                     argu.mat3.fpcc, argu.mat3.epsU, argu.mat3.lam, argu.mat3.ft, argu.mat3.Ets)
logger.info("material tag 4 by [steel 02] and used on center shell")
ops.uniaxialMaterial('Steel02', 4, argu.mat4.Fy,
                     argu.mat4.E0, argu.mat4.b, *(argu.mat4.params))

logger.info("material setted")

# set nDMaterial
logger.info(
    "material tag 5 by [PlaneStressUserMaterial] and used on center shell protective")
ops.nDMaterial('PlaneStressUserMaterial', 5, 40, 7, *(argu.cen_pro_con))
ops.nDMaterial('PlaneStressUserMaterial', 6, 40, 7, *(argu.cen_int_con))

if __name__ == "__main__":
    # pass
    # for debug
    ops.printModel()
