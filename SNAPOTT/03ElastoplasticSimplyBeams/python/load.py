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

    ops.eleLoad('-ele', 1, '-type', '-beamUniform', 0, -1.000E+001, 0)
    ops.eleLoad('-ele', 2, '-type', '-beamUniform', 0, -1.000E+001, 0)
    ops.eleLoad('-ele', 3, '-type', '-beamUniform', 0, -1.000E+001, 0)
    ops.eleLoad('-ele', 4, '-type', '-beamUniform', 0, -1.000E+001, 0)
    ops.eleLoad('-ele', 5, '-type', '-beamUniform', 0, -1.000E+001, 0)
    ops.eleLoad('-ele', 6, '-type', '-beamUniform', 0, -1.000E+001, 0)
    logger.info("load create")
