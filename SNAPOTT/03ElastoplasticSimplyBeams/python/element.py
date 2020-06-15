'''
 * @Description: element Pre Process
 * @Author: Mengsen.Wang
 * @Date: 2020-05-29 15:10:38
 * @Last Modified by:   Mengsen.Wang
 * @Last Modified time: 2020-05-29 15:10:38
'''
import openseespy.opensees as ops
from log import logger


def material_create():
    ''' create material
    '''
    ops.uniaxialMaterial("Steel01", 1, 335, 200000, 0.00001)
    ops.uniaxialMaterial("Concrete01", 2, -26.8, -0.002, -10, -0.0033)
    logger.info("material_create")


def section_create():
    ''' section create
    '''
    ops.section('Fiber', 1, '-GJ', 1)
    ops.fiber(-1.250E+002, -2.500E+002, 5.000E+003, 2)
    ops.fiber(-7.500E+001, -2.500E+002, 5.000E+003, 2)
    ops.fiber(-2.500E+001, -2.500E+002, 5.000E+003, 2)
    ops.fiber(2.500E+001, -2.500E+002, 5.000E+003, 2)
    ops.fiber(7.500E+001, -2.500E+002, 5.000E+003, 2)
    ops.fiber(1.250E+002, -2.500E+002, 5.000E+003, 2)
    ops.fiber(-1.250E+002, -1.500E+002, 5.000E+003, 2)
    ops.fiber(-7.500E+001, -1.500E+002, 5.000E+003, 2)
    ops.fiber(-2.500E+001, -1.500E+002, 5.000E+003, 2)
    ops.fiber(2.500E+001, -1.500E+002, 5.000E+003, 2)
    ops.fiber(7.500E+001, -1.500E+002, 5.000E+003, 2)
    ops.fiber(1.250E+002, -1.500E+002, 5.000E+003, 2)
    ops.fiber(-1.250E+002, -5.000E+001, 5.000E+003, 2)
    ops.fiber(-7.500E+001, -5.000E+001, 5.000E+003, 2)
    ops.fiber(-2.500E+001, -5.000E+001, 5.000E+003, 2)
    ops.fiber(2.500E+001, -5.000E+001, 5.000E+003, 2)
    ops.fiber(7.500E+001, -5.000E+001, 5.000E+003, 2)
    ops.fiber(1.250E+002, -5.000E+001, 5.000E+003, 2)
    ops.fiber(-1.250E+002, 5.000E+001, 5.000E+003, 2)
    ops.fiber(-7.500E+001, 5.000E+001, 5.000E+003, 2)
    ops.fiber(-2.500E+001, 5.000E+001, 5.000E+003, 2)
    ops.fiber(2.500E+001, 5.000E+001, 5.000E+003, 2)
    ops.fiber(7.500E+001, 5.000E+001, 5.000E+003, 2)
    ops.fiber(1.250E+002, 5.000E+001, 5.000E+003, 2)
    ops.fiber(-1.250E+002, 1.500E+002, 5.000E+003, 2)
    ops.fiber(-7.500E+001, 1.500E+002, 5.000E+003, 2)
    ops.fiber(-2.500E+001, 1.500E+002, 5.000E+003, 2)
    ops.fiber(2.500E+001, 1.500E+002, 5.000E+003, 2)
    ops.fiber(7.500E+001, 1.500E+002, 5.000E+003, 2)
    ops.fiber(1.250E+002, 1.500E+002, 5.000E+003, 2)
    ops.fiber(-1.250E+002, 2.500E+002, 5.000E+003, 2)
    ops.fiber(-7.500E+001, 2.500E+002, 5.000E+003, 2)
    ops.fiber(-2.500E+001, 2.500E+002, 5.000E+003, 2)
    ops.fiber(2.500E+001, 2.500E+002, 5.000E+003, 2)
    ops.fiber(7.500E+001, 2.500E+002, 5.000E+003, 2)
    ops.fiber(1.250E+002, 2.500E+002, 5.000E+003, 2)
    ops.fiber(-1.150E+002, 2.650E+002, 3.900E+002, 1)
    ops.fiber(1.150E+002, 2.650E+002, 3.900E+002, 1)
    ops.fiber(-1.150E+002, -2.650E+002, 4.900E+002, 1)
    ops.fiber(0.000E+000, -2.650E+002, 4.900E+002, 1)
    ops.fiber(1.150E+002, -2.650E+002, 4.900E+002, 1)

    ops.beamIntegration('Legendre', 1, 1, 10)
    logger.info("section created")


def geometric_Transf_create():
    ''' create geometric Transform
    '''
    ops.geomTransf("Linear", 1, 0.000, 0.000, 1.000)
    logger.info("geometric transform created")


def element_create():
    ''' create element
    '''
    ops.element('dispBeamColumn', 1, 1, 3, 1, 1)
    ops.element('dispBeamColumn', 2, 3, 4, 1, 1)
    ops.element('dispBeamColumn', 3, 4, 5, 1, 1)
    ops.element('dispBeamColumn', 4, 5, 6, 1, 1)
    ops.element('dispBeamColumn', 5, 6, 7, 1, 1)
    ops.element('dispBeamColumn', 6, 7, 2, 1, 1)
    logger.info("element created")
