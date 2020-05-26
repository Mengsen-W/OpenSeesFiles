# @Author: Mengsen.Wang
# @Date: 2020-05-26 15:32:08
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-26 15:32:08
# @Description: Elastoplastic analysis of grid frame

reset
wipe

source Cyclic.tcl

ModelInfo_Proc modelLog.log

puts "System"
# truss element don't consider rotational degree of freedom
# pay attention to the "mass"
model basic -ndm 3 -ndf 3

puts "node"
source nodes.tcl

puts "material"
source material.tcl

puts "section"
source section.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 100 -dof 1 2 3 disp
recorder Node -file output/node1.out -time -nodeRange 101 179 -dof 1 2 3 disp
recorder Node -file output/node51.out -time -node 51 -dof 1 2 3 disp
recorder Element -file output/ele549_Force.out -time -ele 549 axialForce
recorder Element -file output/ele549_Deform.out -time -ele 549 deformation

puts "rayleigh"
source rayleigh.tcl

puts "seismicWave"
source seismicWave.tcl

constraints Transformation
numberer Plain
system UmfPack
test EnergyIncr 1.0e-4 200
algorithm Newton
integrator Newmark 0.5 0.25
analysis Transient
analyze 2000 0.01

ModelInfo_Proc modelInfo.log

wipe
reset