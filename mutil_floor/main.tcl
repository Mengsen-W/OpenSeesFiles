# @Author: Mengsen.Wang
# @Date: 2020-09-10 12:09:45
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-10 12:09:45

# SI F-N L-m

reset
wipe

source log.tcl

ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "node"
source nodes.tcl

puts "mass"
source mass.tcl

puts "element"
source elements.tcl

puts "rayleigh"
source rayleigh.tcl

puts "recorder"
source recorder.tcl

constraints Transformation
numberer Plain
system UmfPack
test EnergyIncr 1.0e-4 200
algorithm Newton

# ! maybe you will change integrator with another

# integrator Explicitdifference
# integrator CentralDifference
# integrator TRBDF2
# integrator HHT 0.9
# integrator GeneralizedAlpha 1.0 0.8
# integrator Newmark 0.5 0.25
analysis Transient
analyze 1000 0.02

ModelInfo_Proc modelInfo.log

wipe
reset