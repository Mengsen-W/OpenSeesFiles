'''
 * @Description: recorder
 * @Author: Mengsen.Wang
 * @Date: 2020-05-29 15:27:00
 * @Last Modified by:   Mengsen.Wang
 * @Last Modified time: 2020-05-29 15:27:00
'''

import os

import openseespy.opensees as ops

from log import logger


def recorder_create(filedir="output"):
    '''
      recorder create\n
      Para: filedir default ./output
    '''
    # there is no recorder in element with 'section'
    path = os.getcwd()
    filepath = path+"\\"+filedir+"\\"

    ops.recorder('Element', '-file', filepath+'ele0.out',
                 '-time', '-eleRange', 1, 47, 'localForce')
    ops.recorder('Node', '-file', filepath+'node0.out', '-time',
                 '-nodeRange', 1, 28, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Node', '-file', filepath+'node8.out',
                 '-time', '-node', 8, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Node', '-file', filepath+'node7.out',
                 '-time', '-node', 7, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Node', '-file', filepath+'node12.out',
                 '-time', '-node', 12, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Node', '-file', filepath+'node20.out',
                 '-time', '-node', 20, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Element', '-file', filepath+'ele0_sec1d.out',
                 '-time', '-eleRange', 1, 47, 'section', 1, 'deformation')
    ops.recorder('Element', '-file', filepath+'ele0_sec3d.out',
                 '-time', '-eleRange', 1, 47, 'section', 4, 'deformation')
    logger.info("recoder created")
