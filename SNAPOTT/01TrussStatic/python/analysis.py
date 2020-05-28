import openseespy.opensees as ops
from log import logger


def analysis_create():
    ''' analysis create
    '''
    ops.constraints('Plain')
    ops.numberer('Plain')
    ops.system('BandGeneral')
    ops.test('EnergyIncr', 1.0e-6, 200)
    ops.algorithm('Newton')
    ops.integrator('LoadControl', 1e-2)
    ops.analysis('Static')
    ops.analyze(100)
    logger.info("analysis created")
