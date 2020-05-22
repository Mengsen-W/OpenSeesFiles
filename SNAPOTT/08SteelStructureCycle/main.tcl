# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-22 16:44:56
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-22 16:44:56
# @Description: steel structure cycle

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
## Load Case = DEAD
pattern Plain 1 Linear {
load 2 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
load 4 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
load 6 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
load 8 0.000E+000 0.000E+000 -1.000E+005 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 0.5
analysis Static
analyze 10

loadConst -time 0.0

puts "pushover"
## Load Case = PUSH
pattern Plain 3 Linear {
load 2 2.500E+002 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 4 2.500E+002 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 6 2.500E+002 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
load 8 2.500E+002 0.000E+000 0.000E+000 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer RCM
system UmfPack
test NormDispIncr  1.0e-1 200
algorithm Newton
analysis Static

integrator DisplacementControl 4 1 0.1
analyze 1000
integrator DisplacementControl 4 1 -0.2
analyze 1000
integrator DisplacementControl 4 1 0.225
analyze 1000
integrator DisplacementControl 4 1 -0.250
analyze 1000

ModelInfo_Proc modelInfo.log

wipe
reset