# @Author: Mengsen.Wang
# @Date: 2020-09-30 21:15:21
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-30 21:15:21

import openseespy.opensees as ops
from liblog import logger
import argument as argu


def set_uniaxial_metrial():
    '''
    @Brief set material
    '''
    ops.uniaxialMaterial('Steel02', 1, *(argu.longitudinal_steel))
    logger.info(
        "material tag 1 by [steel 02] and used on longitudinal steel")
    logger.info(argu.longitudinal_steel)

    ops.uniaxialMaterial('Steel02', 2, *(argu.transverse_steel))
    logger.info(
        "material tag 2 by [steel 02] and used on transverse steel")
    logger.info(argu.transverse_steel)

    # set nDMaterial
    ops.nDMaterial('PlaneStressUserMaterial', 3, *(argu.c30_con[0:-1]))
    logger.info(
        "material tag 30 by [PlaneStressUserMaterial] and used on C30 concrete")
    logger.info((argu.c30_con[0:-1]))
    ops.nDMaterial('PlateFromPlaneStress', 30, 3, argu.c30_con[-1])
    logger.info(
        "material tag 30 by [PlateFromPlaneStress] and used on C30 concrete OutofPlaneModulus %d", argu.c30_con[-1])

    # logger.info(
    #     "material tag 40 by [PlaneStressUserMaterial] and used on C40 concrete")
    # ops.nDMaterial('PlaneStressUserMaterial', 4, *(argu.c40_con[0:-1]))

    # logger.info(
    #     "material tag 40 by [PlateFromPlaneStress] and used on C40 concrete")
    # ops.nDMaterial('PlateFromPlaneStress', 40, 4, argu.c40_con[-1])

    logger.info(
        "material tag 5 by [PlateRebar] and used on angle 90 d = 10 longitudinal steel")
    ops.nDMaterial('PlateRebar', 5, 1, 90)

    logger.info(
        "material tag 6 by [PlateRebar] and used angle 90 d = 6 transverse steel")
    ops.nDMaterial('PlateRebar', 6, 2, 90)

    logger.info(
        "material tag 7 by [PlateRebar] and used angle 0 d = 6 transverse steel")
    ops.nDMaterial('PlateRebar', 7, 2, 0)


def set_section():
    '''
    @Brief set section
    '''
    confined_region_1: float = [30, 0.015, 7, 0.0001839, 7, 0.0003676, 30, 0.039743,
                                30, 0.039743, 30, 0.039743, 30, 0.039743, 7, 0.0003676, 7, 0.0001839, 30, 0.015]
    middle_region_1: float = [30, 0.015, 7, 0.0001839, 6, 0.0002356, 30,
                              0.08458, 30, 0.08458, 6,  0.0002356, 7, 0.0001839, 30, 0.015]

    ops.section('LayeredShell', 1, 10, *confined_region_1)
    logger.info("confined region with [1]")
    logger.info(confined_region_1)

    ops.section('LayeredShell', 2, 8, *middle_region_1)
    logger.info("middle region with [2]")
    logger.info(middle_region_1)

    # confined_region_2: float = [40, 15.0, 7, 0.2749, 7, 0.5886, 40, 42.059,
    #                             40, 42.059, 40, 42.059, 40, 42.059, 7, 0.5886, 7, 0.2949, 40, 15.0]
    # middle_region_2: float = [40, 15.0, 7, 0.2949, 6, 0.5886,
    #                           40, 84.117, 40, 84.117, 6, 0.5886, 7, 0.2949, 40, 15.0]

    # ops.section('LayeredShell', 21, 10, *confined_region_2)
    # logger.info("confined_region setted")

    # ops.section('LayeredShell', 22, 8, *middle_region_2)
    # logger.info("middle_region setted")


def set_element():
    '''
    @Brief set element
    '''
    for i in range(1, 3):
        for j in range(1, 8):
            ops.element('ShellMITC4', i * 1000 + j, i * 1000 + j,
                        (i + 1) * 1000 + j,  (i + 1)*1000 + (j + 1), i*1000 + (j + 1), 1)
            logger.info("Shell %d = [%d, %d, %d, %d] confined region", i * 1000 + j, i * 1000 + j,
                        (i + 1) * 1000 + j,  (i + 1)*1000 + (j + 1), i*1000 + (j + 1))
            ops.element('ShellMITC4', (i + 4) * 1000 + j, (i + 4) * 1000 + j,
                        (i + 5) * 1000 + j,  (i + 5)*1000 + (j + 1), (i + 4)*1000 + (j + 1), 1)
            logger.info("Shell %d = [%d, %d, %d, %d] confined region", (i + 4) * 1000 + j, (i + 4) * 1000 + j,
                        (i + 5) * 1000 + j,  (i + 5)*1000 + (j + 1), (i + 4)*1000 + (j + 1))

    for i in range(3, 5):
        for j in range(1, 8):
            ops.element('ShellMITC4', i * 1000 + j, i * 1000 + j,
                        (i+1) * 1000 + j,  (i+1)*1000 + (j+1), i*1000 + (j+1), 2)
            logger.info("Shell %d = [%d, %d, %d, %d] middle region", i * 1000 + j, i * 1000 + j,
                        (i + 1) * 1000 + j,  (i + 1)*1000 + (j + 1), i*1000 + (j + 1))
    for i in range(1, 3):
        for j in range(1, 8):
            ops.element('Truss', i * 100 + j, i * 1000 +
                        j, i * 1000 + (j + 1), 223.53e-6, 1)
            logger.info("Truss %d = [%d, %d] cross-sectional area = %f, confined region", i * 100 + j, i * 1000 +
                        j, i * 1000 + (j + 1), 223.53e-6)
            ops.element('Truss', (i + 5) * 100 + j, (i + 5) * 1000 +
                        j, (i + 5) * 1000 + (j + 1), 223.53e-6, 1)
            logger.info("Truss %d = [%d, %d] cross-sectional area = %f, confined region", (i + 5) * 100 + j, (i + 5) * 1000 +
                        j, (i + 5) * 1000 + (j + 1), 223.53e-6)
