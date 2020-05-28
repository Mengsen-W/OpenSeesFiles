# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-19 17:03:32
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-19 17:03:32
# @Description: Static analysis of truss bridge

reset
wipe
source CyclicFunction.tcl
ModelInfo_Proc modelLog.txt

puts "System"
model basic -ndm 3 -ndf 3

puts "node"
source nodes.tcl

puts "material"
source material.tcl

puts "element"
source elements.tcl

puts "recorder"
source recorder.tcl

puts "loading"
source load.tcl

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 1.000E-002
analysis Static
analyze 100

ModelInfo_Proc modelInfo.txt

wipe
reset