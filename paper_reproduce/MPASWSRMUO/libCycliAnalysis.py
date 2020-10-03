"""
Author: Mengsen.Wang
Date: 2020-09-20 10:16:22
Last Modified by: Mengsen.Wang
Last Modified time: 2020-09-20 10:16:22
Description： management all of process
"""

import openseespy.opensees as ops
from liblog import logger


def generated_peek(cycle_type: str = 'Full', d_max: int = 0, increment: float = 0.01, factor: float = 1.0):
    '''
    @Brief generate incremental displacements for d_max\n
    @Param cycle_type:str optional, default=Full
        -- Push (0->+peak)
        -- Half (0->+peak->0)
        -- Full (0->+peak->0->-peak->0)
    @Param d_max: peak displacement (can be + or negative)\n
    @Param increment displacement increment (optional, default=0.01, independently of units)\n
    @Param factor scaling factor (optional, default=1)\n
    @ iDstepFileName  -- file name where displacement history is stored temporarily, until next disp. peak
    @ output variable
    @ iDstep  -- vector of displacement increments
    '''
    data: float = []
    disp = 0
    d_max = d_max * factor

    if d_max < 0:
        # avoid the divide by zero
        dx = -increment
    else:
        dx = increment

    num_steps = int(abs(d_max) / increment) + 1

    if cycle_type == 'Full':
        pass
    if cycle_type == 'Push':
        data = push(0, d_max, increment)

    if cycle_type == 'Half':
        for i in range(num_steps):
            data.extend(push(0, disp, increment))
            data.pop()
            data.extend(push(disp, 0, -increment))
            data.pop()
            disp = disp + increment
            # data.extend(push(0, disp, -increment))
    return data


def push(start: float, end: float, inc: float):
    data: float = []
    num = int(abs((end - start) / inc))
    disp = start
    for _ in range(num + 1):
        data.append(disp)
        disp = disp + inc
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
    displacements = generated_peek('Half', 2, 0.5)
    print(displacements)
