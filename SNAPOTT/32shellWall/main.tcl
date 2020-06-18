# @Author: Mengsen.Wang
# @Date: 2020-06-18 17:00:57
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-18 17:00:57
# @Description: shell wall

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

puts "element"
source elements.tcl

puts "gravity"
## Load Case = DEAD
pattern Plain 2 Linear {
load 25 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
load 26 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
load 36 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
load 46 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
load 56 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
load 66 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 1.000E-002
analysis Static
analyze 10

loadConst 0

puts "pushover"
## Load Case = PUSH
pattern Plain 1 Linear {
load 25 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 26 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 36 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 46 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 56 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 66 1.000E+005 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
}


recorder Node    -file output/D66.out     -time   -node       1 2 3 4 5 66   -dof 1 2 3 disp
recorder Node -file output/node0.out -time -nodeRange 1 66 -dof 1 2 3 disp

constraints Penalty 1e20 1e20
numberer Plain
system BandGeneral
test NormDispIncr 1.0e-4 2000 2
algorithm KrylovNewton
integrator DisplacementControl 66 1 0.1
analysis Static
analyze 200


ModelInfo_Proc model_info.log

wipe
reset