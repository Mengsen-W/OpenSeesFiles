# * @coding = utf-8
# * @Decription: FRP with Shear Wall
# * @Author: Mengsen.Wang
# * @Date: 2020-02-13 20:09:06
# * @Last Modified time: 2020-03-06 20:09:47

reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-1.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-1.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-1.txt
puts "\nAll of End\n"
wipe


reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-2.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-2.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-2.txt
puts "\nAll of End\n"
wipe

reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-3.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-3.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-3.txt
puts "\nAll of End\n"
wipe

reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-4.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-4.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-4.txt
puts "\nAll of End\n"
wipe

reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-5.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-5.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-5.txt
puts "\nAll of End\n"
wipe

reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-6.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-6.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-6.txt
puts "\nAll of End\n"
wipe

reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-7.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-7.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-7.txt
puts "\nAll of End\n"
wipe

reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-8.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-8.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-8.txt
puts "\nAll of End\n"
wipe

reset
wipe

puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material-4-9.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

fixZ 0. 1 1 1 1 1 1

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file F-Disp-4-9.txt -time -node 2607 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2607 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 0.8 2607 1 1E-2 1000
ModelInfo_Proc model-4-9.txt
puts "\nAll of End\n"
wipe
