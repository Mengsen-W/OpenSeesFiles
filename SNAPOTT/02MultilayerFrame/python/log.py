'''
 * @Description: init logging and infolog
 * @Author: Mengsen.Wang
 * @Date: 2020-05-20 12:29:14
 * @Last Modified by:   Mengsen.Wang
 * @Last Modified time: 2020-05-28 16:21:12
'''

import os
import logging
import openseespy.opensees as ops

logger = logging.getLogger(__name__)
logger.setLevel(level=logging.INFO)


def log_init(filename="log.log", is_console=1, filedir="output"):
    ''' Init logging\n
        Para: file name\n
        default: in output direction log.log
    '''
    path = os.getcwd()

    is_exists = os.path.exists(path+"\\"+filedir)
    if not is_exists:
        os.mkdir(path+"\\"+filedir)

    filepath = path+"\\"+filedir+"\\"+filename

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
    ''' Get model_info\n
        Para: file name\n
        default: in output folder Info.log
    '''
    path = os.getcwd()

    is_exists = os.path.exists(path+"\\"+filedir)
    if not is_exists:
        os.mkdir(path+"\\"+filedir)

    filepath = path+"\\"+filedir+"\\"+filename

    ops.printModel("file", filepath)
