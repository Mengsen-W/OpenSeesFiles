"""
@Author: Mengsen.Wang
@Date: 2020-09-19 10:53:01
@Last Modified by:   Mengsen.Wang
@Last Modified time: 2020-09-19 10:53:01
@Description: perprocessing
"""

import openseespy.opensees as ops
import shearwall_argu as argu

ops.logFile('.\paper_reproduce\MPASWSRMUO\log.log', )

ops.model('basic', '-ndm', argu.ndm, '-ndf', argu.ndf)

# set node
for i in range(argu.sum_row_num):
    for j in range(argu.sum_col_num):
        ops.node((i + 1) * argu.node_index + j + 1,
                 argu.length_div[i], 0, argu.hight_div[j])


if __name__ == "__main__":
    ops.printModel()
