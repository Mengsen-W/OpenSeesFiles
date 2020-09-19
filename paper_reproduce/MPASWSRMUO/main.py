import openseespy.opensees as ops
import openseespy.postprocessing.Get_Rendering as opsplt


ops.wipe();
ops.model('basic', '-ndm', 2, '-ndf', 3)
opsplt.plot_model()

