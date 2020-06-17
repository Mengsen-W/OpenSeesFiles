# @Author: Mengsen.Wang
# @Date: 2020-06-17 17:22:29
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-17 17:51:29
# @Description: Collap simulation

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
source element.tcl

puts "recorder"
recorder Node -file output/node35.out -time -node 35 -dof 1 2 3 disp

puts "loading"
source gravity.tcl

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10


loadConst  -time 0
pattern Plain 2 Linear {
load 35 0.000E+000 0.000E+000 -3.000E+005 0.000E+000 0.000E+000 0.000E+000
}
puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 0.01
analysis Static
analyze 100

ModelInfo_Proc model_info.log

wipe
reset

