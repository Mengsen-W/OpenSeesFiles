'''
 * @Description: node and fixed
 * @Author: Mengsen.Wang
 * @Date: 2020-05-22 16:49:45
 * @Last Modified by:   Mengsen.Wang
 * @Last Modified time: 2020-05-28 17:09:45
'''

import openseespy.opensees as ops
from log import logger


def node_create():
    ''' create nodes
    '''
    ops.node(1, 0.000E+000, 0.000E+000, 0.000E+000)
    ops.node(2, 0.000E+000, 3.000E+003, 0.000E+000)
    ops.node(3, 6.000E+003, 0.000E+000, 0.000E+000)
    ops.node(4, 6.000E+003, 3.000E+003, 0.000E+000)
    ops.node(5, 1.200E+004, 0.000E+000, 0.000E+000)
    ops.node(6, 1.200E+004, 3.000E+003, 0.000E+000)
    ops.node(7, 1.800E+004, 0.000E+000, 0.000E+000)
    ops.node(8, 1.800E+004, 3.000E+003, 0.000E+000)
    ops.node(9, 2.400E+004, 0.000E+000, 0.000E+000)
    ops.node(10, 2.400E+004, 3.000E+003, 0.000E+000)
    ops.node(11, 3.000E+003, 0.000E+000, 4.500E+003)
    ops.node(12, 3.000E+003, 3.000E+003, 4.500E+003)
    ops.node(13, 9.000E+003, 0.000E+000, 4.500E+003)
    ops.node(14, 9.000E+003, 3.000E+003, 4.500E+003)
    ops.node(15, 1.500E+004, 0.000E+000, 4.500E+003)
    ops.node(16, 1.500E+004, 3.000E+003, 4.500E+003)
    ops.node(17, 2.100E+004, 0.000E+000, 4.500E+003)
    ops.node(18, 2.100E+004, 3.000E+003, 4.500E+003)
    logger.info("node created")


def node_fix():
    val = [1, 1, 1]
    ops.fix(1, *val)
    ops.fix(2, *val)
    ops.fix(9, *val)
    ops.fix(10, *val)
