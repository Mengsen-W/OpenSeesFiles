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
    ops.node(1, 0.000E+000, 0.000E+000, 1.050E+004)
    ops.node(2, 0.000E+000, 0.000E+000, 1.350E+004)
    ops.node(3, 0.000E+000, 5.000E+003, 1.050E+004)
    ops.node(4, 0.000E+000, 5.000E+003, 1.350E+004)
    ops.node(5, 6.000E+003, 0.000E+000, 1.050E+004)
    ops.node(6, 6.000E+003, 0.000E+000, 1.350E+004)
    ops.node(7, 6.000E+003, 5.000E+003, 1.050E+004)
    ops.node(8, 6.000E+003, 5.000E+003, 1.350E+004)
    ops.node(9, 1.200E+004, 0.000E+000, 1.050E+004)
    ops.node(10, 1.200E+004, 0.000E+000, 1.350E+004)
    ops.node(11, 1.200E+004, 5.000E+003, 1.050E+004)
    ops.node(12, 1.200E+004, 5.000E+003, 1.350E+004)
    ops.node(13, 0.000E+000, 0.000E+000, 7.500E+003)
    ops.node(14, 0.000E+000, 5.000E+003, 7.500E+003)
    ops.node(15, 6.000E+003, 0.000E+000, 7.500E+003)
    ops.node(16, 6.000E+003, 5.000E+003, 7.500E+003)
    ops.node(17, 1.200E+004, 0.000E+000, 7.500E+003)
    ops.node(18, 1.200E+004, 5.000E+003, 7.500E+003)
    ops.node(19, 0.000E+000, 0.000E+000, 4.500E+003)
    ops.node(20, 0.000E+000, 5.000E+003, 4.500E+003)
    ops.node(21, 6.000E+003, 0.000E+000, 4.500E+003)
    ops.node(22, 6.000E+003, 5.000E+003, 4.500E+003)
    ops.node(23, 1.200E+004, 0.000E+000, 4.500E+003)
    ops.node(24, 1.200E+004, 5.000E+003, 4.500E+003)
    ops.node(25, 0.000E+000, 0.000E+000, 0.000E+000)
    ops.node(26, 0.000E+000, 5.000E+003, 0.000E+000)
    ops.node(27, 6.000E+003, 0.000E+000, 0.000E+000)
    ops.node(28, 6.000E+003, 5.000E+003, 0.000E+000)
    ops.node(29, 1.200E+004, 0.000E+000, 0.000E+000)
    ops.node(30, 1.200E+004, 5.000E+003, 0.000E+000)
    ops.node(31, 6.000E+003, 2.500E+003, 1.350E+004)
    ops.node(32, 6.000E+003, 2.500E+003, 1.050E+004)
    ops.node(33, 6.000E+003, 2.500E+003, 7.500E+003)
    ops.node(34, 6.000E+003, 2.500E+003, 4.500E+003)
    ops.node(35, 6.000E+003, 2.500E+003, 1.350E+004)
    ops.node(36, 6.000E+003, 2.500E+003, 1.050E+004)
    ops.node(37, 6.000E+003, 2.500E+003, 7.500E+003)
    ops.node(38, 6.000E+003, 2.500E+003, 4.500E+003)
    logger.info("node created")


def fixed_create():
    ''' create fixed
    '''
    ops.fix(31, 0, 0, 1, 1, 1, 0)
    ops.fix(32, 0, 0, 1, 1, 1, 0)
    ops.fix(33, 0, 0, 1, 1, 1, 0)
    ops.fix(34, 0, 0, 1, 1, 1, 0)
    ops.fix(35, 0, 0, 1, 1, 1, 0)
    ops.fix(36, 0, 0, 1, 1, 1, 0)
    ops.fix(37, 0, 0, 1, 1, 1, 0)
    ops.fix(38, 0, 0, 1, 1, 1, 0)
    ops.fix(25, 1, 1, 1, 1, 1, 1)
    ops.fix(26, 1, 1, 1, 1, 1, 1)
    ops.fix(27, 1, 1, 1, 1, 1, 1)
    ops.fix(28, 1, 1, 1, 1, 1, 1)
    ops.fix(29, 1, 1, 1, 1, 1, 1)
    ops.fix(30, 1, 1, 1, 1, 1, 1)


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
