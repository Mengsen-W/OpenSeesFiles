# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-19 14:22:02
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-19 14:22:02
# @Description: Elastoplastic analysis of simply supported beams

reset
wipe
source CyclicFunction.tcl
ModelInfo_Proc modelLog.txt

puts "System"
model basic -ndm 3 -ndf 6

puts "node"
source nodes.tcl

puts "material"
source material.tcl

puts "section"
source section.tcl

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
algorithm KrylovNewton
integrator DisplacementControl 5 3 -0.1
analysis Static
analyze 100

ModelInfo_Proc modelInfo.txt

wipe
reset