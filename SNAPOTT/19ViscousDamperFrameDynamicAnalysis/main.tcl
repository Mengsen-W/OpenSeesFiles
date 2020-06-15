# @Author: Mengsen.Wang
# @Date: 2020-06-15 16:10:58
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-15 16:53:53
# @Description: viscous damper frame dynamic analysis

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

puts "fixed"
source fixed.tcl

puts "material"
source material.tcl

puts "section"
source section.tcl

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Element -file output/ele110.out -time -ele 110 localForce
recorder Node -file output/disp45.out -time -node 45 -dof 1  disp
recorder Node -file output/vel45.out -time -node 45 -dof 1  vel
recorder Node -file output/disp14.out -time -node 14 -dof 1  disp

puts "rayleigh"
set xDamp 0.02
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
set iGMfact "5"
set dt 0.02
foreach GMdirection $iGMdirection GMfile $iGMfile GMfact $iGMfact {
incr IDloadTag
set GMfatt [expr 1*$iGMfact]
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $GMfatt"
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries
}

puts "analysis"
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