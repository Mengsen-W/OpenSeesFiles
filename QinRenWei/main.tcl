# * @coding = utf-8
# * @Decription: FRP with Shear Wall
# * @Author: Mengsen.Wang
# * @Date: 2020-02-13 20:09:06
# * @Last Modified time: 2020-03-06 20:09:47

reset
wipe

source Cyclic.tcl
ModelInfo_Proc modelLog.txt
puts "\nSystem"
model BasicBuilder -ndm 3 -ndf 6
puts "End of System"

puts "\nNodes"
source Nodes.tcl
puts "End of Nodes"

puts "\nMaterial"
source Material.tcl
puts "End of Material"

puts "\nElement"
source Elements.tcl
puts "End of Element"

puts "\nGravity"
source Gravity.tcl
Gravity_Proc 10
puts "End of Gravity"

puts "\nOutput"
recorder Node -file Disp-middle.txt -time -node 2608 -dof 1 disp
puts "End of Output"

puts "\nPushover"
pattern Plain 2 Linear {
load 2608 1E3 0 0 0 0 0
}
puts "End of Pushover"

# 若 Dnum 设为1，则 Ddelta 为每一圈的最大位移
# 若 Dnum 不唯一，则 Ddelta 为每圈的增量
Cyclic_Function 2 35 2 2608 1 1E-2 10000
puts "\nAll of End\n"
ModelInfo_Proc modelInfo.txt

wipe
reset
exit

