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
    ops.uniaxialMaterial('Steel01', 1, 335, 200000, 0.00001)
    ops.uniaxialMaterial('Concrete01', 2, -26.8, -0.002, -10, -0.0033)
    ops.uniaxialMaterial('Elastic', 3, 1.999E+005)
    ops.uniaxialMaterial('Elastic', 201, 1.489E+009)
    ops.uniaxialMaterial('Elastic', 301, 1.489E+009)
    ops.uniaxialMaterial('Elastic', 401, 4.026E+013)
    ops.uniaxialMaterial('Elastic', 202, 2.233E+009)
    ops.uniaxialMaterial('Elastic', 302, 2.233E+009)
    ops.uniaxialMaterial('Elastic', 402, 8.389E+013)
    ops.uniaxialMaterial('Elastic', 203, 1.675E+009)
    ops.uniaxialMaterial('Elastic', 303, 1.675E+009)
    ops.uniaxialMaterial('Elastic', 403, 4.140E+013)
    ops.uniaxialMaterial('Elastic', 204, 1.396E+009)
    ops.uniaxialMaterial('Elastic', 304, 1.396E+009)
    ops.uniaxialMaterial('Elastic', 404, 3.146E+013)
    logger.info("material_create")


def section_create():
    ''' section create
    '''
    # NC400*400
    ops.section('Fiber', 1, '-GJ', 1)
    ops.fiber(-1.667E+002, -1.667E+002, 4.444E+003, 2)
    ops.fiber(-1.000E+002, -1.667E+002, 4.444E+003, 2)
    ops.fiber(-3.333E+001, -1.667E+002, 4.444E+003, 2)
    ops.fiber(3.333E+001, -1.667E+002, 4.444E+003, 2)
    ops.fiber(1.000E+002, -1.667E+002, 4.444E+003, 2)
    ops.fiber(1.667E+002, -1.667E+002, 4.444E+003, 2)
    ops.fiber(-1.667E+002, -1.000E+002, 4.444E+003, 2)
    ops.fiber(-1.000E+002, -1.000E+002, 4.444E+003, 2)
    ops.fiber(-3.333E+001, -1.000E+002, 4.444E+003, 2)
    ops.fiber(3.333E+001, -1.000E+002, 4.444E+003, 2)
    ops.fiber(1.000E+002, -1.000E+002, 4.444E+003, 2)
    ops.fiber(1.667E+002, -1.000E+002, 4.444E+003, 2)
    ops.fiber(-1.667E+002, -3.333E+001, 4.444E+003, 2)
    ops.fiber(-1.000E+002, -3.333E+001, 4.444E+003, 2)
    ops.fiber(-3.333E+001, -3.333E+001, 4.444E+003, 2)
    ops.fiber(3.333E+001, -3.333E+001, 4.444E+003, 2)
    ops.fiber(1.000E+002, -3.333E+001, 4.444E+003, 2)
    ops.fiber(1.667E+002, -3.333E+001, 4.444E+003, 2)
    ops.fiber(-1.667E+002, 3.333E+001, 4.444E+003, 2)
    ops.fiber(-1.000E+002, 3.333E+001, 4.444E+003, 2)
    ops.fiber(-3.333E+001, 3.333E+001, 4.444E+003, 2)
    ops.fiber(3.333E+001, 3.333E+001, 4.444E+003, 2)
    ops.fiber(1.000E+002, 3.333E+001, 4.444E+003, 2)
    ops.fiber(1.667E+002, 3.333E+001, 4.444E+003, 2)
    ops.fiber(-1.667E+002, 1.000E+002, 4.444E+003, 2)
    ops.fiber(-1.000E+002, 1.000E+002, 4.444E+003, 2)
    ops.fiber(-3.333E+001, 1.000E+002, 4.444E+003, 2)
    ops.fiber(3.333E+001, 1.000E+002, 4.444E+003, 2)
    ops.fiber(1.000E+002, 1.000E+002, 4.444E+003, 2)
    ops.fiber(1.667E+002, 1.000E+002, 4.444E+003, 2)
    ops.fiber(-1.667E+002, 1.667E+002, 4.444E+003, 2)
    ops.fiber(-1.000E+002, 1.667E+002, 4.444E+003, 2)
    ops.fiber(-3.333E+001, 1.667E+002, 4.444E+003, 2)
    ops.fiber(3.333E+001, 1.667E+002, 4.444E+003, 2)
    ops.fiber(1.000E+002, 1.667E+002, 4.444E+003, 2)
    ops.fiber(1.667E+002, 1.667E+002, 4.444E+003, 2)
    ops.fiber(-1.650E+002, -1.650E+002, 4.900E+002, 1)
    ops.fiber(0.000E+000, -1.650E+002, 4.900E+002, 1)
    ops.fiber(1.650E+002, -1.650E+002, 4.900E+002, 1)
    ops.fiber(-1.650E+002, 1.650E+002, 4.900E+002, 1)
    ops.fiber(0.000E+000, 1.650E+002, 4.900E+002, 1)
    ops.fiber(1.650E+002, 1.650E+002, 4.900E+002, 1)
    ops.fiber(-1.650E+002, 0.000E+000, 4.900E+002, 1)
    ops.fiber(1.650E+002, 0.000E+000, 4.900E+002, 1)

    ops.section('Aggregator', 1001, 201, 'Vy',
                301, 'Vz', 401, 'T', '-section', 1)

    # NC400*600
    ops.section('Fiber', 2, '-GJ', 1)
    ops.fiber(-1.667E+002, -2.500E+002, 6.667E+003, 2)
    ops.fiber(-1.000E+002, -2.500E+002, 6.667E+003, 2)
    ops.fiber(-3.333E+001, -2.500E+002, 6.667E+003, 2)
    ops.fiber(3.333E+001, -2.500E+002, 6.667E+003, 2)
    ops.fiber(1.000E+002, -2.500E+002, 6.667E+003, 2)
    ops.fiber(1.667E+002, -2.500E+002, 6.667E+003, 2)
    ops.fiber(-1.667E+002, -1.500E+002, 6.667E+003, 2)
    ops.fiber(-1.000E+002, -1.500E+002, 6.667E+003, 2)
    ops.fiber(-3.333E+001, -1.500E+002, 6.667E+003, 2)
    ops.fiber(3.333E+001, -1.500E+002, 6.667E+003, 2)
    ops.fiber(1.000E+002, -1.500E+002, 6.667E+003, 2)
    ops.fiber(1.667E+002, -1.500E+002, 6.667E+003, 2)
    ops.fiber(-1.667E+002, -5.000E+001, 6.667E+003, 2)
    ops.fiber(-1.000E+002, -5.000E+001, 6.667E+003, 2)
    ops.fiber(-3.333E+001, -5.000E+001, 6.667E+003, 2)
    ops.fiber(3.333E+001, -5.000E+001, 6.667E+003, 2)
    ops.fiber(1.000E+002, -5.000E+001, 6.667E+003, 2)
    ops.fiber(1.667E+002, -5.000E+001, 6.667E+003, 2)
    ops.fiber(-1.667E+002, 5.000E+001, 6.667E+003, 2)
    ops.fiber(-1.000E+002, 5.000E+001, 6.667E+003, 2)
    ops.fiber(-3.333E+001, 5.000E+001, 6.667E+003, 2)
    ops.fiber(3.333E+001, 5.000E+001, 6.667E+003, 2)
    ops.fiber(1.000E+002, 5.000E+001, 6.667E+003, 2)
    ops.fiber(1.667E+002, 5.000E+001, 6.667E+003, 2)
    ops.fiber(-1.667E+002, 1.500E+002, 6.667E+003, 2)
    ops.fiber(-1.000E+002, 1.500E+002, 6.667E+003, 2)
    ops.fiber(-3.333E+001, 1.500E+002, 6.667E+003, 2)
    ops.fiber(3.333E+001, 1.500E+002, 6.667E+003, 2)
    ops.fiber(1.000E+002, 1.500E+002, 6.667E+003, 2)
    ops.fiber(1.667E+002, 1.500E+002, 6.667E+003, 2)
    ops.fiber(-1.667E+002, 2.500E+002, 6.667E+003, 2)
    ops.fiber(-1.000E+002, 2.500E+002, 6.667E+003, 2)
    ops.fiber(-3.333E+001, 2.500E+002, 6.667E+003, 2)
    ops.fiber(3.333E+001, 2.500E+002, 6.667E+003, 2)
    ops.fiber(1.000E+002, 2.500E+002, 6.667E+003, 2)
    ops.fiber(1.667E+002, 2.500E+002, 6.667E+003, 2)
    ops.fiber(-1.650E+002, -2.650E+002, 4.900E+002, 1)
    ops.fiber(0.000E+000, -2.650E+002, 4.900E+002, 1)
    ops.fiber(1.650E+002, -2.650E+002, 4.900E+002, 1)
    ops.fiber(-1.650E+002, 2.650E+002, 4.900E+002, 1)
    ops.fiber(0.000E+000, 2.650E+002, 4.900E+002, 1)
    ops.fiber(1.650E+002, 2.650E+002, 4.900E+002, 1)
    ops.fiber(-1.650E+002, -8.833E+001, 4.900E+002, 1)
    ops.fiber(-1.650E+002, 8.833E+001, 4.900E+002, 1)
    ops.fiber(1.650E+002, -8.833E+001, 4.900E+002, 1)
    ops.fiber(1.650E+002, 8.833E+001, 4.900E+002, 1)
    ops.section('Aggregator', 1002, 202, 'Vy',
                302, 'Vz', 402, 'T', '-section', 2)

    # NB300*600
    ops.section('Fiber', 3, '-GJ', 1)
    ops.fiber(-1.125E+002, -2.700E+002, 4.500E+003, 2)
    ops.fiber(-3.750E+001, -2.700E+002, 4.500E+003, 2)
    ops.fiber(3.750E+001, -2.700E+002, 4.500E+003, 2)
    ops.fiber(1.125E+002, -2.700E+002, 4.500E+003, 2)
    ops.fiber(-1.125E+002, -2.100E+002, 4.500E+003, 2)
    ops.fiber(-3.750E+001, -2.100E+002, 4.500E+003, 2)
    ops.fiber(3.750E+001, -2.100E+002, 4.500E+003, 2)
    ops.fiber(1.125E+002, -2.100E+002, 4.500E+003, 2)
    ops.fiber(-1.125E+002, -1.500E+002, 4.500E+003, 2)
    ops.fiber(-3.750E+001, -1.500E+002, 4.500E+003, 2)
    ops.fiber(3.750E+001, -1.500E+002, 4.500E+003, 2)
    ops.fiber(1.125E+002, -1.500E+002, 4.500E+003, 2)
    ops.fiber(-1.125E+002, -9.000E+001, 4.500E+003, 2)
    ops.fiber(-3.750E+001, -9.000E+001, 4.500E+003, 2)
    ops.fiber(3.750E+001, -9.000E+001, 4.500E+003, 2)
    ops.fiber(1.125E+002, -9.000E+001, 4.500E+003, 2)
    ops.fiber(-1.125E+002, -3.000E+001, 4.500E+003, 2)
    ops.fiber(-3.750E+001, -3.000E+001, 4.500E+003, 2)
    ops.fiber(3.750E+001, -3.000E+001, 4.500E+003, 2)
    ops.fiber(1.125E+002, -3.000E+001, 4.500E+003, 2)
    ops.fiber(-1.125E+002, 3.000E+001, 4.500E+003, 2)
    ops.fiber(-3.750E+001, 3.000E+001, 4.500E+003, 2)
    ops.fiber(3.750E+001, 3.000E+001, 4.500E+003, 2)
    ops.fiber(1.125E+002, 3.000E+001, 4.500E+003, 2)
    ops.fiber(-1.125E+002, 9.000E+001, 4.500E+003, 2)
    ops.fiber(-3.750E+001, 9.000E+001, 4.500E+003, 2)
    ops.fiber(3.750E+001, 9.000E+001, 4.500E+003, 2)
    ops.fiber(1.125E+002, 9.000E+001, 4.500E+003, 2)
    ops.fiber(-1.125E+002, 1.500E+002, 4.500E+003, 2)
    ops.fiber(-3.750E+001, 1.500E+002, 4.500E+003, 2)
    ops.fiber(3.750E+001, 1.500E+002, 4.500E+003, 2)
    ops.fiber(1.125E+002, 1.500E+002, 4.500E+003, 2)
    ops.fiber(-1.125E+002, 2.100E+002, 4.500E+003, 2)
    ops.fiber(-3.750E+001, 2.100E+002, 4.500E+003, 2)
    ops.fiber(3.750E+001, 2.100E+002, 4.500E+003, 2)
    ops.fiber(1.125E+002, 2.100E+002, 4.500E+003, 2)
    ops.fiber(-1.125E+002, 2.700E+002, 4.500E+003, 2)
    ops.fiber(-3.750E+001, 2.700E+002, 4.500E+003, 2)
    ops.fiber(3.750E+001, 2.700E+002, 4.500E+003, 2)
    ops.fiber(1.125E+002, 2.700E+002, 4.500E+003, 2)
    ops.fiber(-1.150E+002, 2.650E+002, 4.900E+002, 1)
    ops.fiber(0.000E+000, 2.650E+002, 4.900E+002, 1)
    ops.fiber(1.150E+002, 2.650E+002, 4.900E+002, 1)
    ops.fiber(-1.150E+002, -2.650E+002, 4.900E+002, 1)
    ops.fiber(-3.833E+001, -2.650E+002, 4.900E+002, 1)
    ops.fiber(3.833E+001, -2.650E+002, 4.900E+002, 1)
    ops.fiber(1.150E+002, -2.650E+002, 4.900E+002, 1)
    ops.section('Aggregator', 1003, 203, 'Vy',
                303, 'Vz', 403, 'T', '-section', 3)

    # NB300X500
    ops.section('Fiber', 4, '-GJ', 1)
    ops.fiber(-1.125E+002, -2.250E+002, 3.750E+003, 2)
    ops.fiber(-3.750E+001, -2.250E+002, 3.750E+003, 2)
    ops.fiber(3.750E+001, -2.250E+002, 3.750E+003, 2)
    ops.fiber(1.125E+002, -2.250E+002, 3.750E+003, 2)
    ops.fiber(-1.125E+002, -1.750E+002, 3.750E+003, 2)
    ops.fiber(-3.750E+001, -1.750E+002, 3.750E+003, 2)
    ops.fiber(3.750E+001, -1.750E+002, 3.750E+003, 2)
    ops.fiber(1.125E+002, -1.750E+002, 3.750E+003, 2)
    ops.fiber(-1.125E+002, -1.250E+002, 3.750E+003, 2)
    ops.fiber(-3.750E+001, -1.250E+002, 3.750E+003, 2)
    ops.fiber(3.750E+001, -1.250E+002, 3.750E+003, 2)
    ops.fiber(1.125E+002, -1.250E+002, 3.750E+003, 2)
    ops.fiber(-1.125E+002, -7.500E+001, 3.750E+003, 2)
    ops.fiber(-3.750E+001, -7.500E+001, 3.750E+003, 2)
    ops.fiber(3.750E+001, -7.500E+001, 3.750E+003, 2)
    ops.fiber(1.125E+002, -7.500E+001, 3.750E+003, 2)
    ops.fiber(-1.125E+002, -2.500E+001, 3.750E+003, 2)
    ops.fiber(-3.750E+001, -2.500E+001, 3.750E+003, 2)
    ops.fiber(3.750E+001, -2.500E+001, 3.750E+003, 2)
    ops.fiber(1.125E+002, -2.500E+001, 3.750E+003, 2)
    ops.fiber(-1.125E+002, 2.500E+001, 3.750E+003, 2)
    ops.fiber(-3.750E+001, 2.500E+001, 3.750E+003, 2)
    ops.fiber(3.750E+001, 2.500E+001, 3.750E+003, 2)
    ops.fiber(1.125E+002, 2.500E+001, 3.750E+003, 2)
    ops.fiber(-1.125E+002, 7.500E+001, 3.750E+003, 2)
    ops.fiber(-3.750E+001, 7.500E+001, 3.750E+003, 2)
    ops.fiber(3.750E+001, 7.500E+001, 3.750E+003, 2)
    ops.fiber(1.125E+002, 7.500E+001, 3.750E+003, 2)
    ops.fiber(-1.125E+002, 1.250E+002, 3.750E+003, 2)
    ops.fiber(-3.750E+001, 1.250E+002, 3.750E+003, 2)
    ops.fiber(3.750E+001, 1.250E+002, 3.750E+003, 2)
    ops.fiber(1.125E+002, 1.250E+002, 3.750E+003, 2)
    ops.fiber(-1.125E+002, 1.750E+002, 3.750E+003, 2)
    ops.fiber(-3.750E+001, 1.750E+002, 3.750E+003, 2)
    ops.fiber(3.750E+001, 1.750E+002, 3.750E+003, 2)
    ops.fiber(1.125E+002, 1.750E+002, 3.750E+003, 2)
    ops.fiber(-1.125E+002, 2.250E+002, 3.750E+003, 2)
    ops.fiber(-3.750E+001, 2.250E+002, 3.750E+003, 2)
    ops.fiber(3.750E+001, 2.250E+002, 3.750E+003, 2)
    ops.fiber(1.125E+002, 2.250E+002, 3.750E+003, 2)
    ops.fiber(-1.150E+002, 2.150E+002, 4.900E+002, 1)
    ops.fiber(1.150E+002, 2.150E+002, 4.900E+002, 1)
    ops.fiber(-1.150E+002, -2.150E+002, 4.900E+002, 1)
    ops.fiber(0.000E+000, -2.150E+002, 4.900E+002, 1)
    ops.fiber(1.150E+002, -2.150E+002, 4.900E+002, 1)
    ops.section('Aggregator', 1004, 204, 'Vy',
                304, 'Vz', 404, 'T', '-section', 4)

    logger.info("section created")


def geometric_Transf_create():
    ''' create geometric Transform
    '''
    ops.geomTransf('PDelta', 1, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 2, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 3, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 4, 1.000, 0.000, 0.000)
    ops.geomTransf('Linear', 5, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 6, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 7, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 8, 0.000, 0.000, 1.000)
    ops.geomTransf('PDelta', 9, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 10, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 11, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 12, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 13, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 14, 1.000, 0.000, 0.000)
    ops.geomTransf('Linear', 15, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 16, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 17, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 18, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 19, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 20, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 21, 0.000, 0.000, 1.000)
    ops.geomTransf('PDelta', 22, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 23, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 24, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 25, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 26, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 27, 1.000, 0.000, 0.000)
    ops.geomTransf('Linear', 28, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 29, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 30, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 31, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 32, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 33, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 34, 0.000, 0.000, 1.000)
    ops.geomTransf('PDelta', 35, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 36, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 37, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 38, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 39, 1.000, 0.000, 0.000)
    ops.geomTransf('PDelta', 40, 1.000, 0.000, 0.000)
    ops.geomTransf('Linear', 41, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 42, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 43, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 44, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 45, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 46, 0.000, 0.000, 1.000)
    ops.geomTransf('Linear', 47, 0.000, 0.000, 1.000)
    logger.info("geometric transform created")


def element_create():
    ''' create element
    '''

    ops.element('nonlinearBeamColumn', 1, 1, 2, 4,
                1001, 1, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 2, 3, 4, 4,
                1001, 2, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 3, 5, 6, 4,
                1001, 3, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 4, 7, 8, 4,
                1001, 4, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 5, 6, 8, 4,
                1003, 5, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 6, 4, 2, 4,
                1003, 6, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 7, 8, 2, 4,
                1004, 7, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 8, 6, 4, 4,
                1004, 8, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 9, 9, 3, 4,
                1001, 9, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 10, 10, 1, 4,
                1001, 10, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 11, 11, 5, 4,
                1002, 11, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 12, 12, 7, 4,
                1002, 12, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 13, 13, 14, 4,
                1002, 13, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 14, 15, 16, 4,
                1002, 14, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 15, 7, 1, 4,
                1004, 15, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 16, 1, 16, 4,
                1004, 16, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 17, 3, 14, 4,
                1004, 17, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 18, 5, 3, 4,
                1004, 18, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 19, 3, 1, 4,
                1003, 19, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 20, 14, 16, 4,
                1003, 20, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 21, 5, 7, 4,
                1003, 21, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 22, 17, 9, 4,
                1001, 22, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 23, 18, 10, 4,
                1001, 23, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 24, 19, 11, 4,
                1002, 24, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 25, 20, 12, 4,
                1002, 25, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 26, 21, 13, 4,
                1002, 26, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 27, 22, 15, 4,
                1002, 27, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 28, 12, 10, 4,
                1004, 28, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 29, 10, 15, 4,
                1004, 29, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 30, 9, 13, 4,
                1004, 30, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 31, 11, 9, 4,
                1004, 31, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 32, 9, 10, 4,
                1003, 32, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 33, 13, 15, 4,
                1003, 33, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 34, 11, 12, 4,
                1003, 34, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 35, 23, 17, 4,
                1001, 35, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 36, 24, 18, 4,
                1001, 36, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 37, 25, 19, 4,
                1002, 37, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 38, 26, 20, 4,
                1002, 38, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 39, 27, 21, 4,
                1002, 39, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 40, 28, 22, 4,
                1002, 40, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 41, 20, 18, 4,
                1004, 41, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 42, 18, 22, 4,
                1004, 42, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 43, 17, 21, 4,
                1004, 43, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 44, 19, 17, 4,
                1004, 44, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 45, 17, 18, 4,
                1003, 45, "-integration", 'Legendre')
    ops.element('nonlinearBeamColumn', 46, 21, 22, 4,
                1003, 46, "-integration", 'Legendre')

    ops.beamIntegration('Legendre', 1, 1003, 10)
    ops.element('dispBeamColumn', 47, 19, 20, 47, 1)
    logger.info("element created")
