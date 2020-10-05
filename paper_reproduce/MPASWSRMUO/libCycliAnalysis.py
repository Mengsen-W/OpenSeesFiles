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
    data: float = []
    num = abs(int((end - begin) / incr))
    data.append(begin)
    for _ in range(num):
        data.append(incr + data[-1])
    return data


def half(begin: float, end: float, incr: float):
    data: float = []
    num = abs(int((end - begin) / incr)) + 1
    data.append(begin)
    for i in range(num):
        for _ in range(i):
            data.append(incr + data[-1])
        for _ in range(i):
            data.append(data[-1] - incr)
    return data


def full(begin: float, end: float, incr: float):
    num = int((end - begin) / incr) + 1
    data: float = []
    data.append(begin)
    for i in range(num):
        for _ in range(i):
            data.append(incr + data[-1])
        for _ in range(2*i):
            data.append(data[-1] - incr)
        for _ in range(i):
            data.append(incr + data[-1])
    return data


def CyclicDisplace(Ddelta: float, Dnum: int, Dincr: float, Node: int, dof: int, tol: float, iter: float):
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
    for ii in range(1, Dnum + 1):
        print(ii)

        u = Ddelta * ii
        negdel = -Dincr
        logger.info("%d Cyclic of Displacement, node = %d, dof = %d , Dincr = %f Plus of Displacement...",
                    ii, Node, dof, Dincr)
        ops.wipeAnalysis()
        ops.constraints('Plain')
        ops.numberer('Plain')
        ops.system('BandGen')
        ops.test('NormDispIncr', tol, iter, 0)
        ops.analysis('Static')
        ops.integrator('DisplacementControl', Node, dof, Dincr)
        Analysis_Proc(int(u / Dincr))

        logger.info("%d Cyclic of Displacement, node = %d, dof = %d, Dincr = %f Minus of Displacement...",
                    ii, Node, dof, negdel)
        ops.wipeAnalysis()
        ops.constraints('Plain')
        ops.numberer('Plain')
        ops.system('BandGen')
        ops.test('NormDispIncr', tol, iter, 0)
        ops.analysis('Static')
        ops.integrator('DisplacementControl', Node, dof, negdel)
        Analysis_Proc(int(2 * u / Dincr))

        logger.info("%d Cyclic of Displacement, node = %d, dof = %d, Dincr = %f Back to Zero...",
                    ii, Node, dof, Dincr)
        ops.wipeAnalysis()
        ops.constraints('Plain')
        ops.numberer('Plain')
        ops.system('BandGen')
        ops.test('NormDispIncr', tol, iter, 0)
        ops.analysis('Static')
        ops.integrator('DisplacementControl', Node, dof, Dincr)
        Analysis_Proc(int(u / Dincr))


def Analysis_Proc(Num: int):
    '''
      brief KrylovNewton → Newton -SecantNewton → ModifiedNewton → NewtonWithLineSearch → BGFS → Broyden\n
      pararm Num the number of analyze step\n
      return analyze if successful return 0
      if NOT successful return < 0\n
    '''
    for step in range(1, Num + 1):
        logger.info("No. %d of Cyclic. Anaylsis KrylovNewton..", step)
        ops.algorithm('KrylovNewton')
        ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic. Anaylsis Trying Newton ..", step)
            ops.algorithm('Newton')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "NO. %d of Cyclic. Anaylsis Trying SecantNewton ..", step)
            ops.algorithm('SecantNewton')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "No. %d of Cyclic. Anaylsis Trying ModifiedNewton ..", step)
            ops.algorithm('ModifiedNewton')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "NO. %d of Cyclic. Anaylsis Trying NewtonWithLineSearch ..", step)
            ops.algorithm('NewtonLineSearch')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic. Anaylsis Trying Newton ..", step)
            ops.algorithm('Newton')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic. Anaylsis Trying BFGS ..", step)
            ops.algorithm('BFGS')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic. Anaylsis Trying Broyden ..", step)
            ops.algorithm('Broyden')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. $step of Cyclic. Analysis Convergence Failure!")


if __name__ == "__main__":
    data = push(0, 3, 0.5)
    print(data)
    data = half(0, 3, 0.5)
    print(data)
    data = full(0, 3, 0.5)
    print(data)
