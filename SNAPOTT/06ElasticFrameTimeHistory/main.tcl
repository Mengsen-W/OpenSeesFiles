# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-21 15:15:49
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-21 16:08:49
# @Description: Elastic frame time history analysis

reset
wipe
source Cyclic.tcl

ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "node"
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
recorder Node -file output/node8.out -time -node 8 -dof 1 disp
recorder Node -file output/node0.out -time -nodeRange 1 28 -dof 1 2 3 disp

# set  damping ratio
set xDamp 0.05
# set eigen 1 and 2
set nEigenI 1
set nEigenJ 2

# nEigenJ
# eigen use max value in mode of verbration
set lambdaN [eigen [expr $nEigenJ]]

# extract characteristic value
set lambdaI [lindex $lambdaN [expr $nEigenI-1]]
set lambdaJ [lindex $lambdaN [expr $nEigenJ-1]]

# circular frequency
set omegaI [expr pow($lambdaI,0.5)]
set omegaJ [expr pow($lambdaJ,0.5)]

# mass correlation coefficient, a0
set alphaM [expr $xDamp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)]
# stiffness correlation coefficient, a1
set betaKcurr [expr 2.*$xDamp/($omegaI+$omegaJ)]
# set rayleigh dumping
rayleigh $alphaM $betaKcurr 0 0

# just a tag of load, any of value is ok
set IDloadTag 1001;
set iGMfile "GM1X.txt"
# x direction
# should set array to analyze multi-direction
set iGMdirection "1"
set iGMfact "0.138"
set dt 0.02

# multi-list foreach, everytime incr position in every list
foreach GMdirection $iGMdirection GMfile $iGMfile GMfact $iGMfact {
  incr IDloadTag
  set GMfatt [expr 1*$GMfact]
  set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $GMfatt"
  pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries
}

# adaptive dynamic analysis
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
