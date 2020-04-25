# @Author: Mengsen.Wang
# @Date: 2020-04-25 14:28:17
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-04-25 16:28:17
# @Decription: 考虑几何非线性和材料非线性的钢结构的失稳模拟

# 单位 mm / N / kg / s / MPa

reset
wipe

source Cyclic.tcl
ModelInfo_Proc modelLog.txt
puts "System"
model BasicBuilder -ndm 3 -ndf 6
puts "Nodes"
source Nodes.tcl
puts "Material"
source Material.tcl
puts "Elements"
source Elements.tcl
recorder Node -file Disp.txt -time -node 4 -dof 1 disp
pattern Plain 1 Linear {
    load 3 1 0 0 0 0 0
}
Cyclic_Function 0.0000001 800000000 0.00000005 4 1 1E-3 10000
ModelInfo_Proc modelInfo.txt
wipe
reset
