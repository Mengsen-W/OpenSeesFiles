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
    ops.uniaxialMaterial("Elastic", 1, 1.999E+005)
    ops.uniaxialMaterial("Elastic", 2, 2.482E+004)
    ops.uniaxialMaterial("Elastic", 3, 1.999E+005)
    logger.info("material_create")


def geomTransf_create():
    ''' create grometric Transform
    '''
    ops.geomTransf("Linear", 1, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 2, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 3, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 4, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 5, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 6, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 7, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 8, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 9, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 10, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 11, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 12, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 13, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 14, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 15, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 16, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 17, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 18, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 19, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 20, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 21, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 22, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 23, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 24, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 25, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 26, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 27, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 28, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 29, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 30, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 31, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 32, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 33, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 34, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 35, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 36, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 37, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 38, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 39, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 40, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 41, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 42, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 43, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 44, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 45, 1.000, 0.000, 0.000)
    ops.geomTransf("Linear", 46, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 47, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 48, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 49, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 50, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 51, 0.000, 0.000, 1.000)
    ops.geomTransf("Linear", 52, 0.000, 0.000, 1.000)
    logger.info("geometric transform created")


def element_create():
    ''' create element
    '''
    ops.element("elasticBeamColumn", 1, 1, 2, 1.600E+005, 3.250E+004,
                1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 1)
    ops.element("elasticBeamColumn", 2, 3, 4, 1.600E+005, 3.250E+004,
                1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 2)
    ops.element("elasticBeamColumn", 3, 5, 6, 1.600E+005, 3.250E+004,
                1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 3)
    ops.element("elasticBeamColumn", 4, 7, 8, 1.600E+005, 3.250E+004,
                1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 4)
    ops.element("elasticBeamColumn", 5, 9, 10, 1.600E+005, 3.250E+004,
                1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 5)
    ops.element("elasticBeamColumn", 6, 11, 12, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 6)
    ops.element("elasticBeamColumn", 7, 2, 6, 2.400E+005, 3.250E+004,
                1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 7)
    ops.element("elasticBeamColumn", 8, 6, 10, 2.400E+005, 3.250E+004,
                1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 8)
    ops.element("elasticBeamColumn", 9, 4, 8, 2.400E+005, 3.250E+004,
                1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 9)
    ops.element("elasticBeamColumn", 10, 8, 12, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 10)
    ops.element("elasticBeamColumn", 11, 2, 4, 1.200E+005, 3.250E+004,
                1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 11)
    ops.element("elasticBeamColumn", 12, 6, 8, 1.200E+005, 3.250E+004,
                1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 12)
    ops.element("elasticBeamColumn", 13, 10, 12, 1.200E+005,
                3.250E+004, 1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 13)
    ops.element("elasticBeamColumn", 14, 13, 1, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 14)
    ops.element("elasticBeamColumn", 15, 14, 3, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 15)
    ops.element("elasticBeamColumn", 16, 15, 5, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 16)
    ops.element("elasticBeamColumn", 17, 16, 7, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 17)
    ops.element("elasticBeamColumn", 18, 17, 9, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 18)
    ops.element("elasticBeamColumn", 19, 18, 11, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 19)
    ops.element("elasticBeamColumn", 20, 1, 5, 2.400E+005, 3.250E+004,
                1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 20)
    ops.element("elasticBeamColumn", 21, 5, 9, 2.400E+005, 3.250E+004,
                1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 21)
    ops.element("elasticBeamColumn", 22, 3, 7, 2.400E+005, 3.250E+004,
                1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 22)
    ops.element("elasticBeamColumn", 23, 7, 11, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 23)
    ops.element("elasticBeamColumn", 24, 1, 3, 1.200E+005, 3.250E+004,
                1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 24)
    ops.element("elasticBeamColumn", 25, 5, 7, 1.200E+005, 3.250E+004,
                1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 25)
    ops.element("elasticBeamColumn", 26, 9, 11, 1.200E+005,
                3.250E+004, 1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 26)
    ops.element("elasticBeamColumn", 27, 19, 13, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 27)
    ops.element("elasticBeamColumn", 28, 20, 14, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 28)
    ops.element("elasticBeamColumn", 29, 21, 15, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 29)
    ops.element("elasticBeamColumn", 30, 22, 16, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 30)
    ops.element("elasticBeamColumn", 31, 23, 17, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 31)
    ops.element("elasticBeamColumn", 32, 24, 18, 1.600E+005,
                3.250E+004, 1.354E+004, 3.605E+009, 2.133E+009, 2.133E+009, 32)
    ops.element("elasticBeamColumn", 33, 13, 15, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 33)
    ops.element("elasticBeamColumn", 34, 15, 17, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 34)
    ops.element("elasticBeamColumn", 35, 14, 16, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 35)
    ops.element("elasticBeamColumn", 36, 16, 18, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 36)
    ops.element("elasticBeamColumn", 37, 13, 14, 1.200E+005,
                3.250E+004, 1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 37)
    ops.element("elasticBeamColumn", 38, 15, 16, 1.200E+005,
                3.250E+004, 1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 38)
    ops.element("elasticBeamColumn", 39, 17, 18, 1.200E+005,
                3.250E+004, 1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 39)
    ops.element("elasticBeamColumn", 40, 25, 19, 3.600E+005,
                3.250E+004, 1.354E+004, 1.825E+010, 1.080E+010, 1.080E+010, 40)
    ops.element("elasticBeamColumn", 41, 26, 20, 3.600E+005,
                3.250E+004, 1.354E+004, 1.825E+010, 1.080E+010, 1.080E+010, 41)
    ops.element("elasticBeamColumn", 42, 27, 21, 3.600E+005,
                3.250E+004, 1.354E+004, 1.825E+010, 1.080E+010, 1.080E+010, 42)
    ops.element("elasticBeamColumn", 43, 28, 22, 3.600E+005,
                3.250E+004, 1.354E+004, 1.825E+010, 1.080E+010, 1.080E+010, 43)
    ops.element("elasticBeamColumn", 44, 29, 23, 3.600E+005,
                3.250E+004, 1.354E+004, 1.825E+010, 1.080E+010, 1.080E+010, 44)
    ops.element("elasticBeamColumn", 45, 30, 24, 3.600E+005,
                3.250E+004, 1.354E+004, 1.825E+010, 1.080E+010, 1.080E+010, 45)
    ops.element("elasticBeamColumn", 46, 19, 21, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 46)
    ops.element("elasticBeamColumn", 47, 21, 23, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 47)
    ops.element("elasticBeamColumn", 48, 20, 22, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 48)
    ops.element("elasticBeamColumn", 49, 22, 24, 2.400E+005,
                3.250E+004, 1.354E+004, 7.512E+009, 7.200E+009, 3.200E+009, 49)
    ops.element("elasticBeamColumn", 50, 19, 20, 1.200E+005,
                3.250E+004, 1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 50)
    ops.element("elasticBeamColumn", 51, 21, 22, 1.200E+005,
                3.250E+004, 1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 51)
    ops.element("elasticBeamColumn", 52, 23, 24, 1.200E+005,
                3.250E+004, 1.354E+004, 1.264E+009, 3.600E+009, 4.000E+008, 52)
    logger.info("element created")
