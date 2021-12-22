"""
Author: Mengsen.Wang
Date: 2020-09-20 10:16:22
Last Modified by: Mengsen.Wang
Last Modified time: 2020-09-20 10:16:22
Description： management all of process
"""

import openseespy.opensees as ops
from liblog import logger


def push(begin: float, end: float, incr: float):
    _data: float = []
    num = abs(int((end - begin) / incr))
    _data.append(begin)
    for _ in range(num):
        _data.append(incr + data[-1])
    return _data


def half(begin: float, end: float, incr: float):
    _data: float = []
    num = abs(int((end - begin) / incr)) + 1
    _data.append(begin)
    for i in range(num):
        for _ in range(i):
            _data.append(incr + data[-1])
        for _ in range(i):
            _data.append(data[-1] - incr)
    return data


def full(begin: float, end: float, incr: float):
    num = int((end - begin) / incr) + 1
    _data: float = []
    _data.append(begin)
    for i in range(num):
        for _ in range(i):
            _data.append(incr + _data[-1])
        for _ in range(2*i):
            _data.append(_data[-1] - incr)
        for _ in range(i):
            _data.append(incr + _data[-1])
    return _data


def CyclicDisplace(Ddelta: float,
                   Dnum: int,
                   Dincr: float,
                   Node: int,
                   dof: int,
                   tol: float,
                   ite: float):
    '''
      Ddelta: Displacement increment of each cyclic loading\n
      每一个循环圈的位移增量\n
      Dnum: Number of cyclic loading times\n
      循环的总圈数\n
      Dincr: Displacement increment in each analyze step\n
      每一圈循环的增量步\n
      Node: Node which applied displacment\n
      dof: Direction of cyclic loading\n
      tol: the tolerance criteria used to check for convergence\n
      iter: the max number of iterations to check before returning failure condition\n
      u:Maxmini of cyclic displacment\n
      每一圈循环的最大位移\n
      negdel: reverse of Dincr of cyclic increment step\n
      每圈的反向增量步\n
      u/Dincr: number of direction cyclic step\n
      一个方向的最大增量步步数\n
      2 * u/Dincr: reverse direction cyclic step\n
      反向加载的步数 因为要先回到远点再向负方向加载
    '''
    ops.constraints("Transformation")
    ops.numberer("RCM")
    ops.system("FullGeneral")
    ops.test('NormDispIncr', tol, ite, 0)
    ops.algorithm("Linear")
    for ii in range(1, Dnum + 1):

        u = Ddelta * ii
        negdel = -Dincr
        logger.info("%d Cyclic of Displacement, node = %d, dof = %d , Dincr = %f Plus of Displacement...",
                    ii, Node, dof, Dincr)
        Analysis_Proc(int(u / Dincr), Node, dof, Dincr)

        logger.info("%d Cyclic of Displacement, node = %d, dof = %d, Dincr = %f Minus of Displacement...",
                    ii, Node, dof, negdel)
        Analysis_Proc(int(2 * u / Dincr), Node, dof, negdel)

        logger.info("%d Cyclic of Displacement, node = %d, dof = %d, Dincr = %f Back to Zero...",
                    ii, Node, dof, Dincr)
        Analysis_Proc(int(u / Dincr), Node, dof, Dincr)


def Analysis_Proc(Num: int, Node: int, dof: int, Dincr: float):
    '''
      brief KrylovNewton → Newton -SecantNewton → ModifiedNewton → NewtonWithLineSearch → BGFS → Broyden\n
      pararm Num the number of analyze step\n
      return analyze if successful return 0
      if NOT successful return < 0\n
    '''
    for step in range(1, Num + 1):
        logger.info("No. %d of Cyclic. Anaylsis KrylovNewton..", step)
        ops.algorithm('KrylovNewton')
        ops.integrator("DisplacementControl",
                       Node, dof, Dincr)
        ops.analysis("Static")
        ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "No. %d of Cyclic. Anaylsis Trying SecantNewton ..", step)
            ops.algorithm('SecantNewton')
            ops.integrator("DisplacementControl",
                           Node, dof, Dincr)
            ops.analysis("Static")
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "NO. %d of Cyclic. Anaylsis Trying NewtonLineSearch ..", step)
            ops.algorithm('NewtonLineSearch', True,  False, True,
                          False, 0.8, 1000, 0.1, 10.0)
            ops.integrator("DisplacementControl",
                           Node, dof, Dincr)
            ops.analysis("Static")
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "No. %d of Cyclic. Anaylsis Trying PeriodicNewton ..", step)
            ops.algorithm('PeriodicNewton')
            ops.integrator("DisplacementControl",
                           Node, dof, Dincr)
            ops.analysis("Static")
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "NO. %d of Cyclic. Anaylsis Trying NewtonWithLineSearch ..", step)
            ops.algorithm('NewtonLineSearch')
            ops.integrator("DisplacementControl",
                           Node, dof, Dincr)
            ops.analysis("Static")
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic. Anaylsis Trying BFGS ..", step)
            ops.algorithm('BFGS', True, False, 10000000)
            ops.integrator("DisplacementControl",
                           Node, dof, Dincr)
            ops.analysis("Static")
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic. Anaylsis Trying Broyden ..", step)
            ops.algorithm('Broyden')
            ops.integrator("DisplacementControl",
                           Node, dof, Dincr)
            ops.analysis("Static")
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. $step of Cyclic. Analysis Convergence Failure!")


if __name__ == "__main__":
    # data = push(0, 3, 0.5)
    # print(data)
    # data = half(0, 3, 0.5)
    # print(data)
    data = full(0, 80/1000, 1/1000)
    with open("disp.txt", 'w') as f:
        for i in data:
            f.write('{}\n'.format(round(i, 3)))
