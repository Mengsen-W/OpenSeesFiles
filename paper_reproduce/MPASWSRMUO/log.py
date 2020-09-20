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

logger = logging.getLogger(__name__)


def _file_create(filedir: str, filename: str):
    '''
    Brief: create file name\n
    Param: filedir = "output" output dir for this pwd\n
    Param: filename = "default.log" out put log file name\n
    return: whole filepath
    '''

    path = os.getcwd()

    is_exists = os.path.exists(path+"\\"+filedir)
    if not is_exists:
        os.mkdir(path+"\\"+filedir)

    filepath = path+"\\"+filedir+"\\"+filename

    return filepath


def write_flag(filepath: str, flag: str):
    '''
    Brief: write some str before the log\n
    Param: filepath out put log file name\n
    Param: flag = "" before the log write
    '''
    fd = os.open(filepath, os.O_RDWR | os.O_CREAT)
    os.write(fd, flag.encode())
    os.close(fd)
    pass


def log_init(is_console: bool = True, filedir: str = "output", filename: str = "default.log", flag: str = ""):
    '''
    Brief: init logger\n
    Param: is_console = true whether or not print to console\n
    Param: filedir = "output" output dir for this pwd\n
    Param: filename = "default.log" out put log file name\n
    Param: flag = "" before the log write
    '''

    filepath = _file_create(filedir, filename)

    if len(flag) != 0:
        write_flag(filepath, flag)

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

    filepath = _file_create(filedir, filename)

    print(filepath)

    if not is_console:
        ops.logFile(filepath, '-noEcho')
    else:
        ops.logFile(filepath)
    # ops.printModel()
