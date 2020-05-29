'''
 * @Description: analysis
 * @Author: Mengsen.Wang
 * @Date: 2020-05-29 15:30:20
 * @Last Modified by:   Mengsen.Wang
 * @Last Modified time: 2020-05-29 15:30:20
'''

import openseespy.opensees as ops
from log import logger


def analysis_plain_load(test_tol=1.0e-12, test_iter=1000, incr=0.1, num_incr=11):
    ''' @analysis create in load control
        @default parameter:
            test_tol=1.0e-6, test_iter=1000,
            incr=0.1, num_incr=101
    '''
    logger.info("test_tol = %f, test_iter = %f, incr = %f, num_incr = %f",
                test_tol, test_iter, incr, num_incr)
    ops.constraints('Plain')
    ops.numberer('Plain')
    ops.system('BandGeneral')
    ops.test('EnergyIncr', test_tol, test_iter,)
    ops.algorithm('KrylovNewton')
    ops.integrator('LoadControl', incr)
    ops.analysis('Static')
    ops.analyze(num_incr)
    logger.info("load control analysis created")


def analysis_plain_disp(test_tol=1.0e-3, test_iter=1000, nodeTag=0, dof=1, disp_incr=1, num_incr=10):
    ''' @analysis create in displacement control\n
        @default parameter:
            test_tol=1.0e-3, test_iter=1000,
            nodeTag=0, dof=1, disp_incr=1, num_incr=10
    '''
    logger.info("test_tol = %f, test_iter = %f, nodeTag = %d, dof = %d, disp_incr = %f, num_incr = %f",
                test_tol, test_iter, nodeTag, dof, disp_incr, num_incr)
    ops.constraints('Plain')
    ops.numberer('Plain')
    ops.system('BandGeneral')
    ops.test('EnergyIncr', test_tol, test_iter)
    ops.algorithm('KrylovNewton')
    ops.integrator('DisplacementControl', nodeTag, dof, disp_incr)
    ops.analysis('Static')
    ops.analyze(num_incr)
    logger.info("displacemen control analysis created")


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
