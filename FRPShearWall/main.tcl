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

puts "Element"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "Gravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "Output"
recorder Node -file F-Disp.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "Pushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.05 2607 1 1E-2 1000
ModelInfo_Proc model.txt
puts "All of End"

wipe
