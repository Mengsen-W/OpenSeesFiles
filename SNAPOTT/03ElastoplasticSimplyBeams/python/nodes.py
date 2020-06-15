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
    ops.node(2, 3.000E+003, 0.000E+000, 0.000E+000)
    ops.node(3, 5.000E+002, 0.000E+000, 0.000E+000)
    ops.node(4, 1.000E+003, 0.000E+000, 0.000E+000)
    ops.node(5, 1.500E+003, 0.000E+000, 0.000E+000)
    ops.node(6, 2.000E+003, 0.000E+000, 0.000E+000)
    ops.node(7, 2.500E+003, 0.000E+000, 0.000E+000)
    logger.info("node created")


def fixed_create():
    ''' create fixed
    '''
    ops.fix(1, 1, 1, 1, 1, 0, 1)
    ops.fix(2, 0, 1, 1, 1, 0, 1)
    ops.fix(3, 0, 1, 0, 1, 0, 1)
    ops.fix(4, 0, 1, 0, 1, 0, 1)
    ops.fix(5, 0, 1, 0, 1, 0, 1)
    ops.fix(6, 0, 1, 0, 1, 0, 1)
    ops.fix(7, 0, 1, 0, 1, 0, 1)


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
