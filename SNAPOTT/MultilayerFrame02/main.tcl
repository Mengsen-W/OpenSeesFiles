# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-20 15:11:14
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-20 15:11:14

reset
wipe

source Cyclic.tcl

ModelInfo_Proc modellog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "Nodes"
source nodes.tcl

puts "rigidDiaphragm"
source rigidDiaphragm.tcl

puts "Fixed"
source fixed.tcl

puts "material"
source material.tcl

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
source recorder.tcl

puts "loading"
source load.tcl

puts "analysis"

# must use Lagrange
constraints Lagrange
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 1.000E-002
analysis Static
analyze 100

ModelInfo_Proc modelInfo.log

wipe
reset
