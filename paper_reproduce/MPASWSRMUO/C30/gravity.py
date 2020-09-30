# @Author: Mengsen.Wang
# @Date: 2020-09-30 22:39:59
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-30 22:39:59

import openseespy.opensees as ops
from liblog import logger


def gravity():
    ops.recorder('Node', '-file', 'output\\disp.out', '-node', 1011, 2011, 3011, 4011, 5011, 6011, 7011, 8011, '-time',
                 '-dof',  3, 'disp')
   # set timeSeries
    ops.timeSeries('Linear', 1)
    logger.info("[Linear] timeSeries tag 1 created")

    # set load pattern
    ops.pattern('Plain', 1, 1)
    load: float = [0, 0, -225000, 0, 0, 0]
    for i in range(1, 9):
        ops.load(i * 1000 + 11, *load)
        logger.info(
            "load node = %d and load = [%f, %f, %f, %f, %f, %f]", i * 1000 + 11, *load)

    # opsplt.createODB("ShearWall", 'LoadCaseName')
    # load analyze
    ops.constraints('Plain')
    ops.numberer('Plain')
    ops.system('BandGen')
    ops.test('NormDispIncr', 1.0e-6, 200)
    ops.algorithm('Newton')
    ops.integrator('LoadControl', 1)
    ops.analysis('Static')
    ok = ops.analyze(1)
    logger.info("gravity analyze result is %s", ok == 0)

    ops.remove('recorders')
    ops.wipeAnalysis()
    ops.loadConst('-time', 0)
