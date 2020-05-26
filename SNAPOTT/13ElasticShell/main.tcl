# @Author: Mengsen.Wang
# @Date: 2020-05-26 15:09:16
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-26 15:27:16
# @Decription: Elastic shell

reset
wipe

source Cyclic.tcl

ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
source nodes.tcl

puts "material"
source material.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 100 -dof 1 2 3 disp
recorder Node -file output/node1.out -time -nodeRange 101 121 -dof 1 2 3 disp
recorder Node -file output/node6.out -time -node 6 -dof 1 2 3 disp

puts "loading"
## Load Case = PUSH
pattern Plain 1 Linear {
load 4 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 6 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 79 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 90 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 101 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 112 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 1.000E+000
analysis Static
analyze 1

ModelInfo_Proc modelInfo.log

wipe
reset
