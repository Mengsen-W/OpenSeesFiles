# @Author: Mengsen.Wang
# @Date: 2020-05-23 15:04:15
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-23 15:04:15
# @Description: single pressure conection unit

reset
wipe

source Cyclic.tcl
ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "node"
source nodes.tcl

puts "material"
source material.tcl

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 24 -dof 1 2 3 disp
recorder Node -file output/node24.out -time -node  24 -dof 1 2 3 disp
recorder Element -file output/ele23.out -time -eleRange 13 23 axialForce

puts "gravity"
## Load Case = DEAD
pattern Plain 1 Linear {
load 24 0.000E+000  0.000E+000 1000.00  0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 1000
algorithm Newton
integrator DisplacementControl 24 3 -0.01
analysis Static
analyze 100

loadConst 0

pattern Plain 2 Linear {
load 24 1.000E+000  0.000E+000 0.00  0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 1000
algorithm Newton
integrator DisplacementControl 24 1 0.5
analysis Static
analyze 100

ModelInfo_Proc modelInfo.tcl

record

wipe
reset