"""
Author: Mengsen.Wang
Date: 2020-09-19 22:33:57
Last Modified by: Mengsen.Wang
Last Modified time: 2020-09-19 22:33:57
Description: set log
"""

import os
import logging
import openseespy.opensees as ops

global logger = logging.getLogger(__name__)


def file_create():
    # for get whole routine output
    pass


def write():
    # for some write
    pass


def log_init(is_console=True, filedir="output", filename="default.log"):
    '''
    Brief: init logger\n
    Param: is_console = true whether or not print to console\n
    Param: filedir = "output" output dir for this pwd\n
    Param: filename = "default.log" out put log file name\n
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


def model_info(is_console=True, filename="Info.log", filedir="output"):
    '''
    Brief: init model info output\n
    Param: is_console = true whether or not print to console\n
    Param: filename = "Info.log" out put log file name\n
    Param: filedir = "output" output dir for this pwd\n
    '''
    path = os.getcwd()

    is_exists = os.path.exists(path+"\\"+filedir)
    if not is_exists:
        os.mkdir(path+"\\"+filedir)

    filepath = path+"\\"+filedir+"\\"+filename
    if not is_console:
        ops.logFile(filepath, '-append', '-noEcho')
    else:
        ops.logFile(filepath, '-append', '-noEcho')
    # ops.printModel()
