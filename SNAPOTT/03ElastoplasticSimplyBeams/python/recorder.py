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
    path = os.getcwd()
    filepath = path+"\\"+filedir+"\\"
    ops.recorder('Node', '-file', filepath+'node0.out',
                 '-time', '-nodeRange', 1, 7, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Node', '-file', filepath+'node5.out',
                 '-time', '-node', 5, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Element', '-file', filepath+'ele0.out',
                 '-time', '-eleRange', 1, 6, 'localForce')
    # there is no recorder in element with 'section'
    ops.recorder('Element', '-file', filepath+'ele0_sec1d.out',
                 '-time', '-eleRange', 1, 6, '-section', 1, 'deformation')
    ops.recorder('Element', '-file', filepath+'ele0_sec3d.out',
                 '-time', '-eleRange', 1, 6, '-section', 3, 'deformation')
    logger.info("recoder created")
