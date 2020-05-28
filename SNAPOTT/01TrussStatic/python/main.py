import openseespy.opensees as ops
import log

import nodes
import material
import element
import recorder
import load
import analysis


log.log_init("log.log", 1)

log.logger.info("begin to opensees")

ops.reset()
ops.wipe()

log.logger.info("model")
ops.model("basic", "-ndm", 3, "-ndf", 3)

nodes.node_create()
nodes.node_fix()
material.material_create()
element.element_create()
recorder.recorder_create()
load.load_create()
analysis.analysis_create()


log.model_info("modelInfo.log")
log.logger.info("end opensees")
ops.wipe()
ops.reset()
