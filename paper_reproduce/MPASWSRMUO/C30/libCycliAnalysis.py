"""
Author: Mengsen.Wang
Date: 2020-09-20 10:16:22
Last Modified by: Mengsen.Wang
Last Modified time: 2020-09-20 10:16:22
Description： management all of process
"""

import openseespy.opensees as ops
from liblog import logger


def CyclicDisplace(Ddelta: float, Dnum: int, Dincr: float, Node: float, dof: float, tol: float, iter: float):
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
    ops.constraints('Transformation')
    ops.numberer('RCM')
    ops.system('UmfPack')
    ops.test('NormDispIncr', tol, iter, 0, 2)
    for ii in range(1, Dnum + 1):
        u = Ddelta * ii
        negdel = Dincr * -1
        logger.info("%d Cyclic of Displacement, Plus of Displacement...", ii)
        ops.integrator('DisplacementControl', Node, dof, Dincr)
        Analysis_Proc(int(u / Dincr))

        logger.info("%d Cyclic of Displacement, Minus of Displacement...", ii)
        ops.integrator('DisplacementControl', Node, dof, negdel)
        Analysis_Proc(int(2 * u / Dincr))

        logger.info("%d Cyclic of Displacement, Back to Zero...", ii)
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
        ops.analysis('Static')
        ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic.Anaylsis Trying Newton ..", step)
            ops.algorithm('Newton')
            ops.analysis('Static')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "NO. %d of Cyclic.Anaylsis Trying SecantNewton ..", step)
            ops.algorithm('SecantNewton')
            ops.analysis('Static')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "No. %d of Cyclic.Anaylsis Trying ModifiedNewton ..", step)
            ops.algorithm('ModifiedNewton')
            ops.analysis('Static')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info(
                "NO. %d of Cyclic. Anaylsis Trying NewtonWithLineSearch ..", step)
            ops.algorithm('NewtonLineSearch')
            ops.analysis('Static')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic.Anaylsis Trying Newton ..", step)
            ops.algorithm('Newton')
            ops.analysis('Static')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic.Anaylsis Trying BFGS ..", step)
            ops.algorithm('BFGS')
            ops.analysis('Static')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. %d of Cyclic. Anaylsis Trying Broyden ..", step)
            ops.algorithm('Broyden', count=500)
            ops.analysis('Static')
            ok = ops.analyze(1)

        if ok != 0:
            logger.info("No. $step of Cyclic. Analysis Convergence Failure!")


if __name__ == "__main__":
    pass
