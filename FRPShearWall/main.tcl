# * @coding = utf-8
# * @Decription: FRP with Shear Wall
# * @Author: Mengsen.Wang
# * @Date: 2020-02-13 20:09:06
# * @Last Modified by: Mengsen.Wang
# * @Last Modified time: 2020-02-13 20:09:47

wipe

puts "System"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "Nodes"
source Nodes.tcl
puts "End of Nodes"

puts "Material"
source Material.tcl
puts "End of Material"

puts "Elements"
source Elements.tcl
puts "End of Elements"

puts "Gravity"
Gravity_Proc 10
puts "End of Gravity"

puts "Output"
recorder Node -file F-Disp.txt -time -node 602 -dof 1 disp
puts "End of Output"

puts "Pushover"
pattern Plain 2 Linear {
load 602 1E3 0 0 0 0 0
}


# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
set DT {4 7 12 18 22 27 32 36 42 47 51 57 60 66 70 76 80 86 90 96 100 106 110 116 120 126 130}
foreach dt $DT {
    Cyclic_Function $dt 1 1 602 1 1E-2 1000
}

puts "All of End"
wipe