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
    ops.node(1, 4.500E+003, 5.000E+003, 1.050E+004)
    ops.node(2, 4.500E+003, 5.000E+003, 1.350E+004)
    ops.node(3, 4.500E+003, 0.000E+000, 1.050E+004)
    ops.node(4, 4.500E+003, 0.000E+000, 1.350E+004)
    ops.node(5, 0.000E+000, 0.000E+000, 1.050E+004)
    ops.node(6, 0.000E+000, 0.000E+000, 1.350E+004)
    ops.node(7, 0.000E+000, 5.000E+003, 1.050E+004)
    ops.node(8, 0.000E+000, 5.000E+003, 1.350E+004)
    ops.node(9, 4.500E+003, 0.000E+000, 7.500E+003)
    ops.node(10, 4.500E+003, 5.000E+003, 7.500E+003)
    ops.node(11, 0.000E+000, 0.000E+000, 7.500E+003)
    ops.node(12, 0.000E+000, 5.000E+003, 7.500E+003)
    ops.node(13, 9.000E+003, 0.000E+000, 7.500E+003)
    ops.node(14, 9.000E+003, 0.000E+000, 1.050E+004)
    ops.node(15, 9.000E+003, 5.000E+003, 7.500E+003)
    ops.node(16, 9.000E+003, 5.000E+003, 1.050E+004)
    ops.node(17, 4.500E+003, 0.000E+000, 4.500E+003)
    ops.node(18, 4.500E+003, 5.000E+003, 4.500E+003)
    ops.node(19, 0.000E+000, 0.000E+000, 4.500E+003)
    ops.node(20, 0.000E+000, 5.000E+003, 4.500E+003)
    ops.node(21, 9.000E+003, 0.000E+000, 4.500E+003)
    ops.node(22, 9.000E+003, 5.000E+003, 4.500E+003)
    ops.node(23, 4.500E+003, 0.000E+000, 0.000E+000)
    ops.node(24, 4.500E+003, 5.000E+003, 0.000E+000)
    ops.node(25, 0.000E+000, 0.000E+000, 0.000E+000)
    ops.node(26, 0.000E+000, 5.000E+003, 0.000E+000)
    ops.node(27, 9.000E+003, 0.000E+000, 0.000E+000)
    ops.node(28, 9.000E+003, 5.000E+003, 0.000E+000)
    logger.info("node created")


def fixed_create():
    ''' create fixed
    '''
    ops.fix(23, 1, 1, 1, 1, 1, 1)
    ops.fix(24, 1, 1, 1, 1, 1, 1)
    ops.fix(25, 1, 1, 1, 1, 1, 1)
    ops.fix(26, 1, 1, 1, 1, 1, 1)
    ops.fix(27, 1, 1, 1, 1, 1, 1)
    ops.fix(28, 1, 1, 1, 1, 1, 1)


def rigid_create():
    ''' create rigid
    '''
    ops.rigidDiaphragm(3, 35, 2)
    ops.rigidDiaphragm(3, 35, 4)
    ops.rigidDiaphragm(3, 35, 6)
    ops.rigidDiaphragm(3, 35, 8)
    ops.rigidDiaphragm(3, 35, 10)
    ops.rigidDiaphragm(3, 35, 12)
    ops.rigidDiaphragm(3, 35, 31)
    ops.rigidDiaphragm(3, 36, 1)
    ops.rigidDiaphragm(3, 36, 3)
    ops.rigidDiaphragm(3, 36, 5)
    ops.rigidDiaphragm(3, 36, 7)
    ops.rigidDiaphragm(3, 36, 9)
    ops.rigidDiaphragm(3, 36, 11)
    ops.rigidDiaphragm(3, 36, 32)
    ops.rigidDiaphragm(3, 37, 13)
    ops.rigidDiaphragm(3, 37, 14)
    ops.rigidDiaphragm(3, 37, 15)
    ops.rigidDiaphragm(3, 37, 16)
    ops.rigidDiaphragm(3, 37, 17)
    ops.rigidDiaphragm(3, 37, 18)
    ops.rigidDiaphragm(3, 37, 33)
    ops.rigidDiaphragm(3, 38, 19)
    ops.rigidDiaphragm(3, 38, 20)
    ops.rigidDiaphragm(3, 38, 21)
    ops.rigidDiaphragm(3, 38, 22)
    ops.rigidDiaphragm(3, 38, 23)
    ops.rigidDiaphragm(3, 38, 24)
    ops.rigidDiaphragm(3, 38, 34)
    logger.info("rigid created")
