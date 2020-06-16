# @Author: Mengsen.Wang
# @Date: 2020-06-16 15:30:24
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-16 15:50:31
# @Descriptin: 3-d steel struct with shell

reset
wipe

source Cyclic.tcl
ModelInfo_Proc model_info.log

puts "System"
model basic -ndm 3 -ndf 6
puts "nodes"
source nodes.tcl

puts "material"
nDMaterial J2Plasticity 16 171666 79231 200 300 1.0 1.0
##SHELL20
# This command is used to construct a plate-fiber material wrapper
# which converts any three-dimensional material into a plate fiber material
# (by static condensation) appropriate for shell analysis.
nDMaterial PlateFiber 601 16
# This command allows the user to construct a MembranePlateFiberSection object,
# which is a section that numerically integrates through the plate thickness
# with "fibers" and is appropriate for plate and shell analysis.
section PlateFiber 701 601 20.00


puts "shell element"
source elements.tcl

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 100 -dof 1 2 3 disp
recorder Node -file output/node1.out -time -nodeRange 101 200 -dof 1 2 3 disp
recorder Node -file output/node2.out -time -nodeRange 201 300 -dof 1 2 3 disp
recorder Node -file output/node3.out -time -nodeRange 301 400 -dof 1 2 3 disp
recorder Node -file output/node4.out -time -nodeRange 401 500 -dof 1 2 3 disp
recorder Node -file output/node5.out -time -nodeRange 501 580 -dof 1 2 3 disp
recorder Node -file output/node286.out -time -node 286 -dof 1 2 3 disp

recorder Element -file output/Stress366.out -time -ele 366 stresses

puts "loading"
## Load Case = PUSH
pattern Plain 3 Linear {
load 272 0.000E+000 0.000E+000 -4.000E+005 0.000E+000 0.000E+000 0.000E+000
load 273 0.000E+000 0.000E+000 -4.000E+005 0.000E+000 0.000E+000 0.000E+000
load 286 0.000E+000 0.000E+000 -4.000E+005 0.000E+000 0.000E+000 0.000E+000
load 293 0.000E+000 0.000E+000 -4.000E+005 0.000E+000 0.000E+000 0.000E+000
load 300 0.000E+000 0.000E+000 -4.000E+005 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator DisplacementControl 286 3 -1.000E+000
analysis Static
analyze 10

ModelInfo_Proc model_info.log

wipe
reset