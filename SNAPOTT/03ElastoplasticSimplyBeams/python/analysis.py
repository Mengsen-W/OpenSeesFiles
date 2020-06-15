'''
 * @Description: analysis
 * @Author: Mengsen.Wang
 * @Date: 2020-05-29 15:30:20
 * @Last Modified by:   Mengsen.Wang
 * @Last Modified time: 2020-05-29 15:30:20
'''

import openseespy.opensees as ops
from log import logger


def analysis_plain():
    ''' analysis create
    '''
    ops.constraints('Plain')
    ops.numberer('Plain')
    ops.system('BandGeneral')
    ops.test('EnergyIncr', 1.0e-6, 200)
    ops.algorithm('KrylovNewton')
    ops.integrator('DisplacementControl', 5, 3, -0.1)
    ops.analysis('Static')
    ops.analyze(100)
    logger.info("analysis created")


def analysis_rigid():
    ''' for rigid
    '''
    ops.constraints('Lagrange')
    ops.numberer('Plain')
    ops.system('BandGeneral')
    ops.test('EnergyIncr', 1.0e-6, 200)
    ops.algorithm('Newton')
    ops.integrator('LoadControl', 1e-2)
    ops.analysis('Static')
    ops.analyze(100)
    logger.info("analysis created")
