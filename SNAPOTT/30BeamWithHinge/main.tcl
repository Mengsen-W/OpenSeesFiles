# @Author: Mengsen.Wang
# @Date: 2020-06-18 15:06:05
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-06-18 15:06:47
# @Description: beam with hinge

reset
wipe

source Cyclic.tcl
ModelInfo_Proc model_log.log

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
source nodes.tcl

puts "material"
source material.tcl

puts "section"
source section.tcl

puts "transformation"
source transformation.tcl

puts "element"
source hinges.tcl
# source nonlineat.tcl

puts "recorder"
recorder Node -file output/hingesnode0.out -time -nodeRange 1 30 -dof 1 2 3 disp
recorder Node -file output/hingesnode2.out -time -node 2 -dof 1 2 3 disp

puts "loading"
## Load Case = PUSH
pattern Plain 1 Linear {
load 2 4.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 4 4.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 1 3.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 3 3.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 13 2.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 14 2.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 19 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 20 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
}
puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator DisplacementControl 2 1 1.000E+000
analysis Static
analyze 100

ModelInfo_Proc model_info.log

reset
wipe