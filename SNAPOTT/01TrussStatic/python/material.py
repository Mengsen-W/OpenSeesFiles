import openseespy.opensees as ops
from log import logger


def material_create():
    ops.uniaxialMaterial("Elastic", 1, 1.999E+005)
    ops.uniaxialMaterial("Elastic", 2, 2.482E+004)
    ops.uniaxialMaterial("Elastic", 3, 1.999E+005)
    logger.info("material_create")
