# @Author: Mengsen.Wang
# @Date: 2020-05-23 15:47:08
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-23 15:47:08
# @Description: Joint unit element

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
recorder Node -file output/node0.out -time -nodeRange 1 32 -dof 1 2 3 disp
recorder Node -file output/node1.out -time -node 1 -dof 1 2 3 disp
recorder Node -file output/node13.out -time -node 13 -dof 1 2 3 disp
recorder Node -file output/node12.out -time -node 12 -dof 1 2 3 disp
recorder Element -file output/ele33axialForce.out -time -ele 33 axialForce
recorder Element -file output/ele33deformation.out -time -ele 33 deformation

puts "loading"
## Load Case = PUSH
pattern Plain 1 Linear {
load 1 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 2 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 5 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 6 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 9 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 10 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 17 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 18 1.000E+003 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator DisplacementControl 1 1 3
analysis Static
analyze 100

ModelInfo_Proc modelInfo.log

record
wipe
reset