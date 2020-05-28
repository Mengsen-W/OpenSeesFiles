import openseespy.opensees as ops

from log import logger


def load_create():
    ''' create load
    '''
    ops.timeSeries('Linear', 1)
    ops.pattern('Plain', 1, 1)

    ops.load(13, 0.000E+000, 0.000E+000, -1.000E+005)
    ops.load(14, 0.000E+000, 0.000E+000, -1.000E+005)
    ops.load(15, 0.000E+000, 0.000E+000, -1.000E+005)
    ops.load(16, 0.000E+000, 0.000E+000, -1.000E+005)

    logger.info("load create")
