import openseespy.opensees as ops
import log

import nodes
import element
import recorder
import load
import analysis


log.log_init("log.log", 1)

log.logger.info("begin to opensees")

ops.reset()
ops.wipe()

log.logger.info("System, ndm = 3, dnf = 6")
ops.model("basic", "-ndm", 3, "-ndf", 6)

log.logger.info("Pre Processing of node")
nodes.node_create()
nodes.fixed_create()

log.logger.info("Pre Processing of element")
element.material_create()
element.section_create()
element.geometric_Transf_create()
element.element_create()

log.logger.info("recorder")
recorder.recorder_create()
load.dead_load()
analysis.analysis_plain()


log.model_info("modelInfo.log")
log.logger.info("end opensees")

ops.wipe()
ops.reset()
