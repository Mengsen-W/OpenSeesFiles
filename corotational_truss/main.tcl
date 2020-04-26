# @Author: Mengsen.Wang
# @Date: 2020-04-25 14:28:17
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-04-25 16:28:17
# @Decription: 考虑几何非线性和材料非线性的钢结构的失稳模拟

# 单位 mm / N / kg / s / MPa

reset
wipe

source Cyclic.tcl
puts "Recorder"
source Recorder.tcl
ModelInfo_Proc output/modelLog.txt
puts "System"
model BasicBuilder -ndm 3 -ndf 6
puts "Nodes"
source Nodes.tcl
puts "Material"
source Material.tcl
puts "Elements"
source Elements.tcl
pattern Plain 1 Linear {
    load 5 0 0 1e3 0 0 0
    load 6 0 0 1e3 0 0 0
}
Cyclic_Function 80 1 0.1 5 3 5E-4 1000
ModelInfo_Proc output/modelInfo.txt
wipe
reset
