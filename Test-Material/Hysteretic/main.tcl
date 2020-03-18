# * @Author: Mengsen.Wang
# * @Date: 2020-03-18 10:20:06
# * @Last Modified by:   Mengsen.Wang
# * @Last Modified time: 2020-03-18 10:20:06

# TODO: 测试材料性能
# TODO: 测试多层单元的整体化问题
# TODO: 测试钢筋的衰减效应
# TODO: 测试纵筋层单元和杆端元的区别

reset
wipe

source Cyclic.tcl
ModelInfo_Proc Hysteretic/modelLog.txt
puts "System"
model BasicBuilder -ndm 3 -ndf 6
puts "Nodes"
source Nodes.tcl
puts "Material"
source Material.tcl
puts "Elements"
source Elements.tcl
puts "Gravity"
source Gravity.tcl
Gravity_Proc 100
recorder Node -file Hysteretic/Disp-Hysteretic.txt -time -node 302 -dof 1 disp
pattern Plain 2 Linear {
    load 302 1 0 0 0 0 0
}
Cyclic_Function 0.0001 800000 0.00005 302 1 1E-3 100000
ModelInfo_Proc Hysteretic/modelInfo.txt
wipe
reset
