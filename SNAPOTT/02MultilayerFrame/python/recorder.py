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
                 '-time', '-nodeRange', 1, 38, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Node', '-file', filepath+'stroy_disp.out',
                 '-time', '-nodeRange', 35, 38, '-dof', 2, 'disp')
    ops.recorder('Element', '-file', filepath+'ele10.out',
                 '-time', '-eleRange', 1, 52, 'localForce')
    logger.info("recoder created")
