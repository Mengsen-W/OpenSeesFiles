"""
Author: Mengsen.Wang
Date: 2020-09-19 10:53:01
Last Modified by: Mengsen.Wang
Last Modified time: 2020-09-19 10:53:01
"""

# import openseespy.postprocessing.Get_Rendering as opsplt
import openseespy.opensees as ops

import argument as argu
from liblog import logger
from libCycliAnalysis import CyclicDisplace

import perprocess
import nodes
import gravity

ops.reset()
ops.wipe()

# set model
ops.start()
logger.info("begin")

ops.model('basic', '-ndm', argu.ndm, '-ndf', argu.ndf)

nodes.set_node()
perprocess.set_uniaxial_metrial()
perprocess.set_section()
perprocess.set_element()
gravity.gravity()


# set hysteresis
ops.pattern('Plain', 2, 1)
ops.load(1011, 0, 1, 0, 0, 0, 0)
ops.recorder('Node', '-file', 'output\\1011_disp_cy.out', '-node', 1011, '-time', '-closeOnWrite',
             '-dof', 2, 'disp')
ops.recorder('Node', '-file', 'output\\1011_react_cy.out', '-node', 1011, '-time', '-closeOnWrite',
             '-dof', 2, 'reaction')
CyclicDisplace(1, 80, 0.5, 1011, 2, 1E-2, 1000)


if __name__ == "__main__":
    # for debug
    ops.stop()
    ops.printModel()
    # opsplt.plot_model('nodes', Model='ShearWall')
    # pass
