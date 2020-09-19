"""
@Author: Mengsen.Wang
@Date: 2020-09-19 10:53:01
@Last Modified by:   Mengsen.Wang
@Last Modified time: 2020-09-19 10:53:01
@Description: perprocessing
"""

import openseespy.opensees as ops
import argument as argu
import log

# set model
ops.model('basic', '-ndm', argu.ndm, '-ndf', argu.ndf)

# set node
for i in range(argu.sum_row_num):
    for j in range(argu.sum_col_num):
        ops.node((i + 1) * argu.node_index + j + 1,
                 argu.length_div[i], 0, argu.hight_div[j])

# fix node
full_fixed: int = [1, 1, 1, 1, 1, 1]
for i in range(1, 8):
    ops.fix(i * argu.node_index + 1, *full_fixed)

# rigid beam
for i in range(1, 7):
    ops.rigidLink('beam', i * argu.node_index + 11,
                  (i + 1) * argu.node_index + 11)

if __name__ == "__main__":
    # pass
    ops.printModel()
