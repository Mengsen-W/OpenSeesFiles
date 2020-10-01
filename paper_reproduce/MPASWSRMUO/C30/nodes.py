# Author: Mengsen.Wang
# Date: 2020-09-30 21:21:58
# Last Modified by: Mengsen.Wang
# Last Modified time: 2020-09-30 21:21:58

import openseespy.opensees as ops
from liblog import logger
import argument as argu

# set node


def set_node():
    '''
    @Brief set node
    '''
    for i in range(argu.sum_row_num):
        for j in range(argu.sum_col_num):
            ops.node((i + 1) * argu.node_index + j + 1,
                     argu.length_div[i], 0, argu.hight_div[j])
            logger.info("node %d coord = [%f, %f, %f]", (i + 1) * argu.node_index + j + 1,
                        argu.length_div[i], 0, argu.hight_div[j])

    # fix node
    full_fixed: int = [1, 1, 1, 1, 1, 1]
    for i in range(1, 8):
        ops.fix(i * argu.node_index + 1, *full_fixed)
        logger.info("fix node = %d", i * argu.node_index + 1)
        ops.fix(i * argu.node_index + 8, 0, 1, 1, 1, 1, 1)

    # rigid beam
    # logger.info("rigidness beam on the top")
    # for i in range(1, 7):
    #     ops.equalDOF(i * argu.node_index + 8,
    #                  (i + 1) * argu.node_index + 8, 2)
