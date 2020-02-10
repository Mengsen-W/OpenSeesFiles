# * @Author: Mengsen.Wang
# * @Date: 2020-02-10 13:18:46
# * @Last Modified by:   Mengsen.Wang
# * @Last Modified time: 2020-02-10 13:18:46

# 该算例模型为弹性混凝土柱
# 三节点两单元 一端固定
# 截面积大小 为 0.5m * 0.5m E = 3e8

wipe

puts " construct model "
model BasicBuilder -ndm 2 -ndf 3
node 1 0 0
node 2 0 3.0
node 3 0 6.0
fix 1 1 1 1
geomTransf Linear 1
element elasticBeamColumn 1 1 2 0.25 3.0e10 5.2e-3 1
element elasticBeamColumn 2 2 3 0.25 3.0e10 5.2e-3 1
puts "end construct"

puts " Output Files "
recorder Node -file disp_3.txt -time -node 3 -dof 1 2 3 disp
recorder Node -file disp_2.txt -time -node 2 -dof 1 2 3 disp
recorder Node -file reaction_1.txt -time -node 1 -dof 1 2 3 reaction
recorder Drift -file drift_1.txt -time -iNode 1 -jNode 2 -dof 1 -perpDirn 2
recorder Drift -file drift_2.txt -time -iNode 2 -jNode 3 -dof 1 -perpDirn 2
recorder Element -file force_1.txt -time -ele 1 globalForce
puts " End output "

puts " Gravity "
pattern Plain 1 Linear {
    load 2 0.0 -1.0e5 0.0
    load 3 0.0 -1.0e5 0.0
}
puts " end Gravity "

puts " Start analyze "
constraints Plain
numberer Plain
system BandGeneral
test NormDispIncr 1.0e-8 6 2
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10
puts "Finish analyze "

puts " push over "
loadConst -time 0.0
pattern Plain 2 Linear {
    load 2 0.5 0.0 0.0
    load 3 1.0 0.0 0.0
}
integrator DisplacementControl 3 1 0.00001
analyze 50000
puts " end pushover "
