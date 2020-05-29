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

    ops.eleLoad('-ele', 5, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 5, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 5, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 8, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 8, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 6, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 6, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 6, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 7, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 7, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 15, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 15, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 21, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 21, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 21, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 18, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 18, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 19, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 19, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 19, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 16, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 16, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 19, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 19, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 19, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 17, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 17, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 20, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 20, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 20, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 28, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 28, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 34, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 34, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 34, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 31, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 31, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 32, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 32, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 32, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 29, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 29, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 32, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 32, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 32, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 30, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 30, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 33, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 33, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 33, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 41, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 41, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 47, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 47, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 47, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 44, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 44, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 45, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 45, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 45, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 42, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 42, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 45, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 45, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 45, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 43, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 43, '-type', '-beamUniform', 0, -4.219E+000, 0)
    ops.eleLoad('-ele', 46, '-type', '-beamUniform', 0, -3.797E+000, 0)
    ops.eleLoad('-ele', 46, '-type', '-beamUniform', 0, -1.688E+000, 0)
    ops.eleLoad('-ele', 46, '-type', '-beamUniform', 0, -3.797E+000, 0)

    logger.info("load create")


def push_load():
    ''' push load
    '''
    ops.timeSeries('Linear', 2)
    ops.pattern('Plain', 2, 2)

    ops.load(6, 1.350E+004, 0.000E+000, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(8, 1.350E+004, 0.000E+000, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(5, 1.050E+004, 0.000E+000, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(7, 1.050E+004, 0.000E+000, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(11, 7.500E+003, 0.000E+000, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(12, 7.500E+003, 0.000E+000, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(19, 4.500E+003, 0.000E+000, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    ops.load(20, 4.500E+003, 0.000E+000, 0.000E+000,
             0.000E+000, 0.000E+000, 0.000E+000)
    logger.info("push load create")
