import openseespy.opensees as ops
from libCycliAnalysis import CyclicDisplace

ops.reset()
ops.wipe()

ops.logFile('output.log')
# set model
ops.start()

ops.model('basic', '-ndm', 2, '-ndf', 3)

ops.node(1, 0, 0)
ops.node(2, 0, 1)

ops.fix(1, 1, 1, 1)
ops.fix(2, 1, 0, 1)

ops.uniaxialMaterial('Elastic', 1, 202.7e9)
ops.element('Truss', 1, 1, 2, 0.1, 1)

ops.recorder('Node', '-file', 'disp.out', '-node', 2, '-time',
             '-dof',  2, 'disp')
# set timeSeries
ops.timeSeries('Linear', 1)
ops.pattern('Plain', 1, 1)
ops.load(2, 0, 1, 0)

# ops.constraints('Penalty', 1e20, 1e20)
# ops.numberer('RCM')
# ops.system('BandGeneral')
# ops.test('NormDispIncr', 1.0e-2, 1000)
# ops.algorithm('KrylovNewton')
# ops.integrator('DisplacementControl', 2, 2, 1)
# # ops.integrator("LoadControl", 0.01)
# ops.analysis('Static')
# ops.analyze(1)
# ops.integrator('DisplacementControl', 2, 2, -1)
# ops.analysis('Static')
# ops.analyze(2)
# ops.integrator('DisplacementControl', 2, 2, 1)
# ops.analysis('Static')
# ops.analyze(1)

CyclicDisplace(1, 20, 1, 2, 2, 1e-2, 1000)


if __name__ == "__main__":
    # for debug
    ops.stop()
    ops.printModel()
