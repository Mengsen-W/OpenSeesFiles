# @Author: Mengsen.Wang
# @Date: 2020-05-27 15:13:30
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-27 15:13:30
# @Description: Bridge in multi-point excitation

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
recorder Node -file output/node0.out -time -nodeRange 1 100 -dof 1 2 3 disp
recorder Node -file output/node1.out -time -nodeRange 101 200 -dof 1 2 3 disp
recorder Node -file output/node2.out -time -nodeRange 201 241 -dof 1 2 3 disp
recorder Node -file output/node203.out -time -node 203 -dof 1 2 3 disp
recorder Element -file output/ele330.out -time -ele 330 localForce

puts "rayleigh"
source rayleigh.tcl


set iGMfile "DM1X.txt"
set iGMfact "1"
set dt 0.02
set dispSeries1 "Series -dt $dt -filePath $iGMfile -factor  $iGMfact"

set iGMfile "DM1X.txt"
set iGMfact "1"
set dt 0.02
set dispSeries2 "Series -dt $dt -filePath $iGMfile -factor  $iGMfact";

pattern MultiSupport  1   {
    groundMotion 1 Plain -disp $dispSeries1
    imposedMotion 1 1 1
    imposedMotion 3 1 1
}
pattern MultiSupport  2   {
    groundMotion 2 Plain -disp $dispSeries2
    imposedMotion 2 1 2
    imposedMotion 4 1 2
}

constraints Transformation
numberer Plain
system SparseSPD
test EnergyIncr 1.0e-4 200
algorithm Newton
integrator Newmark 0.5 0.25
analysis Transient
analyze 1000 0.02

ModelInfo_Proc modelInfo.log

wipe
reset