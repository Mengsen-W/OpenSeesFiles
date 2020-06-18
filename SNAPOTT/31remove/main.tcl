# @Author: Mengsen.Wang
# @Date: 2020-06-18 16:21:49
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-18 16:47:26
# @Description: remove command

reset
wipe


source Cyclic.tcl
ModelInfo_Proc model_log.log

set currentTime [getTime]
puts $currentTime

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
source nodes.tcl

puts "material"
source material.tcl

puts "element"
source elements.tcl

puts "recorder"
recorder Node -file output/node0.out -time -nodeRange 1 100 -dof 1 2 3 disp
recorder Node -file output/node1.out -time -nodeRange 101 121 -dof 1 2 3 disp
recorder Node -file output/node88.out -time -node  88  -dof 1 2 3 disp

puts "loading"
## Load Case = DEAD
pattern Plain 1 Linear {
load 14 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
load 20 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
load 26 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
load 32 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
load 56 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
load 72 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
load 88 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
load 104 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
load 120 0.000E+000 0.000E+000 -1.000E+006 0.000E+000 0.000E+000 0.000E+000
}

puts "analysis"
constraints Plain
numberer Plain
system FullGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10

# hold load const
loadConst 0


# pattern Plain 2 Linear {

# }

constraints Transformation
numberer    RCM
test        NormDispIncr 1.0e-6 200
algorithm   KrylovNewton
system      SparseGeneral
integrator  LoadControl 1
analysis    Static

# every time remove element and analyze
remove element 32
analyze 4
remove element 50
analyze 4
remove element 52
analyze 4
remove element 70
analyze 4
remove element 31
analyze 4
remove element 49
# fix again warring is means that update
fix 67 1 1 1 1 1 1
analyze 4
remove element 51
fix 81 1 1 1 1 1 1
analyze 4
remove element 69
fix 83 1 1 1 1 1 1
analyze 4

ModelInfo_Proc model_info.log

wipe
reset