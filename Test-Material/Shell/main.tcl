# * @Author: Mengsen.Wang
# * @Date: 2020-03-18 10:20:06
# * @Last Modified by:   Mengsen.Wang
# * @Last Modified time: 2020-03-18 10:20:06

# TODO: 测试壳单元分层和分块的影响
reset
wipe

source Cyclic.tcl
ModelInfo_Proc Shell/modelLog.txt
puts "System"
model BasicBuilder -ndm 3 -ndf 6
puts "Nodes"
source Nodes.tcl
puts "Material"
source MaterialShell.tcl
puts "Elements"
source Elements.tcl
puts "Gravity"
source Gravity.tcl
Gravity_Proc 10
recorder Node -file Shell/Disp.txt -time -node 4 -dof 1 disp
pattern Plain 2 Linear {
    load 4 1E3 0 0 0 0 0
}
Cyclic_Function 1 500 1 4 1 1E-2 100000
ModelInfo_Proc Shell/modelInfo.txt
wipe
reset
