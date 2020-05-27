# @Author: Mengsen.Wang
# @Date: 2020-05-26 16:29:00
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-27 15:06:10
# @Description: Prestressed beam

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
recorder Node -file output/node0.out -time -nodeRange 1 24 -dof 1 2 3 disp
recorder Node -file output/node19.out -time -node 19 -dof 1 2 3 disp

puts "loading in zero"
## Load Case =  Construction simulation
pattern Plain 1 Linear {
load 3 0.000E+000 0.000E+000 0 0.000E+000 0.000E+000 0.000E+000
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

puts "load in dead"
## Load Case = DEAD
pattern Plain 2 Linear {
load 19 0.000E+000 0.000E+000 -1.000E+003 0.000E+000 0.000E+000 0.000E+000
}
puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
analysis Static
integrator DisplacementControl 19 3 -1.000E+000
analyze 360

ModelInfo_Proc modelInfo.log

wipe
reset
