import openseespy.opensees as ops
from libCycliAnalysis import CyclicDisplace

ops.reset()
ops.wipe()

ops.logFile('output.log')
# set model
ops.start()

ops.model('basic', '-ndm', 3, '-ndf', 6)

ops.node(1, 0, 0, 0)
ops.node(2, 0, 1, 0)
ops.node(3, 1, 0, 0)
ops.node(4, 1, 1, 0)

ops.fix(1, 1, 1, 1, 0, 0, 0)
ops.fix(3, 1, 1, 1, 0, 0, 0)

ops.nDMaterial('PlaneStressUserMaterial', 3, 40, 7, 20.7e6, 2.07e6, -
               4.14e6, -0.002, -0.005, 0.001, 0.08)
ops.nDMaterial('PlateFromPlaneStress', 30, 3, 1.25e10)
ops.section('LayeredShell', 1, 3, 30, 0.015, 30, 0.015, 30, 0.015)

# ops.uniaxialMaterial('Elastic', 1, 202.7e9)
# ops.element('Truss', 1, 1, 2, 0.1, 1)
ops.element('ShellMITC4', 1, 1, 3, 4, 2, 1)

ops.recorder('Node', '-file', 'disp.out', '-node', 2, '-time',
             '-dof',  1, 'disp')
ops.recorder('Node', '-file', 'reac.out', '-node', 2, '-time',
             '-dof',  1, 'reaction')
# set timeSeries
ops.timeSeries('Linear', 1)
ops.pattern('Plain', 1, 1)
ops.load(2, 1, 0, 0, 0, 0, 0)

# ops.constraints('Penalty', 1e20, 1e20)
# ops.numberer('RCM')
# ops.system('BandGeneral')
# ops.test('NormDispIncr', 1.0e-2, 1000)
# ops.integrator('DisplacementControl', 2, 1, 1)
# ops.algorithm('KrylovNewton')
# ops.analysis('Static')
# ops.analyze(5)
# ops.integrator('DisplacementControl', 2, 1, -1)
# ops.algorithm('KrylovNewton')
# ops.analysis('Static')
# ops.analyze(10)
# ops.integrator('DisplacementControl', 2, 1, 1)
# ops.algorithm('KrylovNewton')
# ops.analysis('Static')
# ops.analyze(5)
# ops.integrator('DisplacementControl', 2, 1, 1)
# ops.algorithm('KrylovNewton')
# ops.analysis('Static')
# ops.analyze(10)
# ops.integrator('DisplacementControl', 2, 1, -1)
# ops.algorithm('KrylovNewton')
# ops.analysis('Static')
# ops.analyze(20)
# ops.integrator('DisplacementControl', 2, 1, 1)
# ops.algorithm('KrylovNewton')
# ops.analysis('Static')
# ops.analyze(10)

CyclicDisplace(1, 20, 1, 2, 1, 1e-2, 1000)


if __name__ == "__main__":
    # for debug
    ops.stop()
    ops.printModel()
