"""
@Author: Mengsen.Wang
@Date: 2020-09-19 22:33:57
@Last Modified by: Mengsen.Wang
@Last Modified time: 2020-09-19 22:33:57
@Description: set log
"""

import openseespy.opensees as ops
import logging


import os
import logging
import openseespy.opensees as ops

logger = logging.getLogger(__name__)


def log_init(filename="log.log", is_console=True, filedir="output"):
    '''
    Init logging\n
    Para: file name\n
    default: in output direction log.log
    '''
    path = os.getcwd()

    is_exists = os.path.exists(path+"\\"+filedir)
    if not is_exists:
        os.mkdir(path+"\\"+filedir)

    filepath = path+"\\"+filedir+"\\"+filename

    logger.setLevel(level=logging.INFO)
    handler = logging.FileHandler(filepath)
    handler.setLevel(logging.INFO)
    formatter = logging.Formatter(
        '%(asctime)s - %(filename)s - %(lineno)d - %(levelname)s : %(message)s',
        datefmt="%d-%m-%Y %H:%M:%S")

    handler.setFormatter(formatter)
    logger.addHandler(handler)

    if is_console:
        console = logging.StreamHandler()
        console.setLevel(logging.INFO)
        console.setFormatter(formatter)
        logger.addHandler(console)


def model_info(filename="Info.log", filedir="output"):
    '''
    Get model_info\n
    Para: file name\n
    default: in output folder Info.log
    '''
    path = os.getcwd()

    is_exists = os.path.exists(path+"\\"+filedir)
    if not is_exists:
        os.mkdir(path+"\\"+filedir)

    filepath = path+"\\"+filedir+"\\"+filename
    ops.logFile(filepath, '-append')
    ops.printModel("file", filepath)
