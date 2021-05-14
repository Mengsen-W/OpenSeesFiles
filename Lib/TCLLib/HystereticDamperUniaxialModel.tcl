#############################################################
# file: HystereticDamperUniaxialModel.tcl
# author: Hanlin DONG
# version: 2.0
# license: MIT License (https://opensource.org/licenses/MIT)
# last update: 2017-09-11 14:00
# (The latest version can be found on http://www.hanlindong.com/)
# readme: 
#   This file defines a procedure that returns a uniaxial material
#     that defines a hysteresis damper.
#   WARNING: temp material is defined at 4xxx~5xxx
# change log:
#   2017-05-16 17:00 v1.0
#     Create file
#   2017-05-16 20:00 v1.1
#     Bug fix. Test passed.
#   2017-09-11 14:00 v2.0
#     Change name: HystereticDamperUniaxialModel.
#############################################################

## Diagram:

# damper

# ^strain        x
# |
# | x          x
# |
# |
# |
# +------------------->stress
#      damper
#      ------

# ^strain        
# |  (fy/K)     
# | x            x 
# |
# |
# |
# +------------------->stress
#      Steel01
#      -------

# ^strain        
# |   
# |              x
# |
# |
# |            x
# +------------------->stress
#    ElasticMultiLinear
#    ------------------

# Args:
# mattag: material tag for the damper material
# stiffness: initial stiffness of the damper and post-lock stiffness of damper
# activation: activation load of the damper
# slotlength: total slot length of the damper (i.e. the free sliding distance of bolt)
# stiffeps: a small stiffness defined to the ElasticMultiLinear material.

puts "HystereticDamperUniaxialModel v2.0 successfully loaded (Copyright: Hanlin DONG, License: MIT) ..."

proc HystereticDamperUniaxialModel {mattag stiffness activation slotlength stiffeps} {
	set strain1 [expr $slotlength / 2.0]
	set strain2 [expr $slotlength / 2.0 + 1]
	set stress1 [expr $slotlength * $stiffeps]
	set stress2 [expr $slotlength * $stiffeps + $stiffness]
	uniaxialMaterial ElasticMultiLinear [expr $mattag + 4000] -strain [expr -$strain2] [expr -$strain1] 0 $strain1 $strain2 -stress [expr -$stress2] [expr -$stress1] 0 $stress1 $stress2
	uniaxialMaterial Steel01 [expr $mattag+5000] $activation [expr $stiffness - $stiffeps] [expr $stiffeps / $stiffness / 100.0]
	uniaxialMaterial Parallel $mattag [expr $mattag + 4000] [expr $mattag + 5000]
	set msg "Hysteresis Damper material $mattag successfully added using HystereticDamperUniaxialModel v2.0
	Main properties: stiffness: $stiffness, activation load: $activation. slot length: $slotlength.
	Minor properties: a small stiffness: $stiffeps"
	puts $msg
	return $msg
}