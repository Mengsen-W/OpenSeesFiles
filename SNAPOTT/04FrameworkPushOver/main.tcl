# @ coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-20 15:53:54
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-20 17:03:36

reset
wipe

source Cyclic.tcl
ModelInfo_Proc modellog.log

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
source recorder.tcl

puts "gravity"
source loadDead.tcl

puts "analysis"

constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10
loadConst 0.0

puts "pushover"
source loadPush.tcl

puts "analysis"

constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-3 1000
algorithm Newton
integrator DisplacementControl 8 1 3
analysis Static
analyze 100

ModelInfo_Proc modelInfo.log

