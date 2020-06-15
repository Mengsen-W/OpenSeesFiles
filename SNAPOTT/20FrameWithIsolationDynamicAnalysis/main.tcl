# @Author: Mengsen.Wang
# @Date: 2020-06-15 17:05:48
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-15 17:05:48
# @Description: Frame whit isolaton dynamic analysisa

reset
wipe

source Cyclic.tcl
ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
source nodes.tcl

puts "mass"
source mass.tcl

puts "material"
source material.tcl

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Node -file output/node2.out -time -node 2 -dof 1 2 3 disp
recorder Node -file output/node118.out -time -node 118 -dof 1 2 3 disp
recorder Element -file output/ele244.out -time -ele 244 localForce
recorder Element -file output/ele245.out -time -ele 245 localForce
recorder Element -file output/ele244d.out -time -ele 244 deformation

set xDamp 0.05
set nEigenI 1
set nEigenJ 2
set lambdaN [eigen [expr $nEigenJ]]
set lambdaI [lindex $lambdaN [expr $nEigenI-1]]
set lambdaJ [lindex $lambdaN [expr $nEigenJ-1]]
set omegaI [expr pow($lambdaI,0.5)]
set omegaJ [expr pow($lambdaJ,0.5)]
set alphaM [expr $xDamp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)]
set betaKcurr [expr 2.*$xDamp/($omegaI+$omegaJ)]
rayleigh $alphaM $betaKcurr 0 0


set IDloadTag 1001
set iGMfile "GM1X.txt"
set iGMdirection "1"
set iGMfact "10"
set dt 0.02
foreach GMdirection $iGMdirection GMfile $iGMfile GMfact $iGMfact {
incr IDloadTag
set GMfatt [expr 1*$iGMfact]
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $GMfatt"
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries
}

constraints Transformation
numberer Plain
system UmfPack
test EnergyIncr 1.0e-4 200
algorithm Newton
integrator Newmark 0.5 0.25
analysis Transient
analyze 1000 0.02

ModelInfo_Proc modelInfo.log

wipe
reset

