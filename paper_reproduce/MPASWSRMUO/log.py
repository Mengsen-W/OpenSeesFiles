"""
Author: Mengsen.Wang
Date: 2020-09-19 22:33:57
Last Modified by: Mengsen.Wang
Last Modified time: 2020-09-19 22:33:57
Description: set log
"""

import os
import shutil
import logging
import openseespy.opensees as ops

logger = logging.getLogger(__name__)


def check_path(filedir: str):
    '''
    @Brief: check output dirpath is exists, maybe in debug period will used\n
    @Param: filedir
    '''
    path = os.getcwd()

    is_exists = os.path.exists(path+"\\"+filedir)

    if is_exists:
        shutil.rmtree(path+"\\"+filedir)


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
    check_path(filedir)

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

    log_path = filedir + "\\" + "model_log"
    model_log(is_console, log_path)


def model_log(is_console: bool, filepath: str):
    '''
    Brief: init model info output\n
    Param: is_console = true whether or not print to console\n
    Param: filepath  out put log file path
    '''

    if not is_console:
        ops.logFile(filepath, '-noEcho')
    else:
        ops.logFile(filepath)
    # ops.printModel()
