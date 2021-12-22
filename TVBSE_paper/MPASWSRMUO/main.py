"""
Author: Mengsen.Wang
Date: 2020-09-19 10:53:01
Last Modified by: Mengsen.Wang
Last Modified time: 2020-09-19 10:53:01
"""

# import openseespy.postprocessing.Get_Rendering as opsplt
import openseespy.opensees as ops

import argument as argu
from liblog import logger
import libCycliAnalysis as lib
import perprocess
import nodes

ops.reset()
ops.wipe()

# set model
ops.start()
logger.info("begin")

ops.model('basic', '-ndm', argu.ndm, '-ndf', argu.ndf)

nodes.set_node()
perprocess.set_uniaxial_metrial()
perprocess.set_section()
perprocess.set_element()

ops.recorder('Node', '-file', 'output\\disp.out', '-node', 1008, 2008, 3008, 4008, 5008, 6008, 7008, 8008, '-time',
             '-dof',  3, 'disp')
# set timeSeries
ops.timeSeries('Linear', 1)
logger.info("[Linear] timeSeries tag 1 created")

# set load pattern
ops.pattern('Plain', 1, 1)
load: float = [0, 0, -225000, 0, 0, 0]
for i in range(1, 8):
    ops.load(i * 1000 + 8, *load)
    logger.info(
        "load node = %d and load = [%f, %f, %f, %f, %f, %f]", i * 1000 + 8, *load)

# opsplt.createODB("ShearWall", 'LoadCaseName')
# load analyze
ops.constraints('Plain')
ops.numberer('Plain')
ops.system('BandGen')
ops.test('NormDispIncr', 1.0e-6, 200)
ops.algorithm('Newton')
ops.integrator('LoadControl', 0.01)
ops.analysis('Static')
ok = ops.analyze(100)
logger.info("gravity analyze result is %s", ok == 0)

ops.remove('recorders')
ops.wipeAnalysis()
ops.loadConst('-time', 0.0)

# set hysteresis
ops.recorder('Node', '-file', 'output\\node1008.out',
             '-time', '-node', 1008, '-dof', 1, 'disp')
ops.pattern('Plain', 2, 1)
ops.load(1008, 1, 0, 0, 0, 0, 0)
lib.CyclicDisplace(1e-3, 80, 5e-4, 1008, 1, 1, 1e5)

# disp = lib.full(0, 5, 1e-2)

# ops.system("SparseGeneral", "-piv")    # Overkill, but may need the pivoting!
# ops.test("NormUnbalance", 1.0e-2, 100000, 0)
# ops.numberer("Plain")
# ops.constraints("Plain")

# D0 = 0.0
# for Dstep in disp:
#     D1 = Dstep
#     Dincr = D1-D0
#     ops.algorithm("KrylovNewton")
#     ops.integrator("DisplacementControl",
#                    1008, 1, Dincr)
#     ops.analysis("Static")
#     ok = ops.analyze(1)
#     # ----------------------------------------------if convergence failure-------------------------
#     D0 = D1  # move to next step
#     # end Dstep
#     if ok != 0:
#         logger.info("Analysis failed at %d step.", Dstep)
#     else:
#         logger.info("Analysis completed successfully.")


if __name__ == "__main__":
    # for debug
    ops.stop()
    ops.printModel()
    # opsplt.plot_model('nodes')
    # pass
