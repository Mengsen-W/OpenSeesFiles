# @Author: Mengsen.Wang
# @Date: 2020-06-16 15:02:38
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-16 16:02:38
# @Description: soild element

reset
wipe

source Cyclic.tcl

ModelInfo_Proc model_log.log

puts "System"
model basic -ndm 3 -ndf 3

puts "nodes"
source nodes.tcl

puts "material"
nDMaterial ElasticIsotropic 100 206000 0.3
# must be nD material

puts "SOLID element"
source elements.tcl

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 100 -dof 1 2 3 disp
recorder Node -file outputnode1.out -time -nodeRange 101 200 -dof 1 2 3 disp
recorder Node -file output/node2.out -time -nodeRange 201 300 -dof 1 2 3 disp
recorder Node -file output/node3.out -time -nodeRange 301 400 -dof 1 2 3 disp
recorder Node -file output/node4.out -time -nodeRange 401 480 -dof 1 2 3 disp
recorder Node -file output/snode102.out -time -node 102 -dof 1 2 3 disp

puts "loading"
## Load Case = PUSH
pattern Plain 1 Linear {
load 100 0.000E+000 0.000E+000 -1.000E+005
load 101 0.000E+000 0.000E+000 -1.000E+005
load 102 0.000E+000 0.000E+000 -1.000E+005
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 1
analysis Static
analyze 1

ModelInfo_Proc model_info.log

wipe
reset