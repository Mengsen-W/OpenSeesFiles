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




if __name__ == "__main__":
    # pass
    # for debug
    ops.printModel()
