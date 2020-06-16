# @Author: Mengsen.Wang
# @Date: 2020-06-16 17:21:33
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-16 17:21:33
# @Description: compisite beam

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
source elements.tcl

puts "recorder"
recorder Node -file output/node8.out -time -node 8 -dof 1 2 3 disp

puts "loading"
## Load Case = DEAD
pattern Plain 1 Linear {
load 8 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator DisplacementControl 8 3 -15.000E-001
analysis Static
analyze 100

ModelInfo_Proc model_info.log

wipe
reset




