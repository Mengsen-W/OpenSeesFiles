# @Author: Mengsen.Wang
# @Date: 2020-05-27 15:40:56
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-05-27 15:46:34
# @Description: Shear wall cycle

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

puts "section"
source section.tcl

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 31 -dof 1 2 3 disp
recorder Element -file output/ele0.out -time -eleRange 1 36 localForce
recorder Node -file output/node26.out -time -node 26 -dof 1 2 3 disp

puts "gravity"
## Load Case = DEAD
pattern Plain 1 Linear {
load 29 0.000E+000 0.000E+000 -2.433E+005 0.000E+000 0.000E+000 0.000E+000
load 30 0.000E+000 0.000E+000 -2.433E+005 0.000E+000 0.000E+000 0.000E+000
load 31 0.000E+000 0.000E+000 -2.433E+005 0.000E+000 0.000E+000 0.000E+000
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

loadConst 0.0
puts "pushover"
## Load Case = PUSH
pattern Plain 2 Linear {
load 26 0.000E+000 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
analysis Static

integrator DisplacementControl 26 2 0.2
analyze 100
integrator DisplacementControl 26 2 -0.4
analyze 100
integrator DisplacementControl 26 2 0.6
analyze 100
integrator DisplacementControl 26 2 -0.8
analyze 100
integrator DisplacementControl 26 2 1.0
analyze 100
integrator DisplacementControl 26 2 -1.2
analyze 100
integrator DisplacementControl 26 2 1.4
analyze 100
integrator DisplacementControl 26 2 -1.4
analyze 100
integrator DisplacementControl 26 2 1.2
analyze 100

ModelInfo_Proc modelInfo.log

wipe
reset