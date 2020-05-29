'''
 * @Description: load
 * @Author: Mengsen.Wang
 * @Date: 2020-05-29 15:33:13
 * @Last Modified by:   Mengsen.Wang
 * @Last Modified time: 2020-05-29 15:33:13
'''

import openseespy.opensees as ops

from log import logger


def dead_load():
    ''' dead load
    '''
    ops.timeSeries('Linear', 1)
    ops.pattern('Plain', 1, 1)

    ops.load(31, 1.197E-012, 1.955E+004, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(32, 2.237E-012, 3.653E+004, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(33, 1.991E-012, 3.252E+004, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(34, 2.107E-012, 3.442E+004, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)

    logger.info("load create")
