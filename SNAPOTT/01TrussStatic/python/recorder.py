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
                 '-time', '-nodeRange', 1, 18, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Node', '-file', filepath+'node5.out', '-time',
                 '-node', 5, '-dof', 1, 2, 3, 'disp')
    ops.recorder('Element', '-file', filepath+'ele0.out',
                 '-time', '-eleRange', 1, 46, 'localForce')
    logger.info("recoder created")
