# * @Author: Mengsen.Wang
# * @Date: 2020-02-11 17:54:46
# * @Last Modified by:   Mengsen.Wang
# * @Last Modified time: 2020-02-11 17:54:46

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
recorder Node -file disp_3_2.txt -time -node 3 -dof 1 2 3 disp
recorder Node -file disp_2_2.txt -time -node 2 -dof 1 2 3 disp
recorder Node -file reaction_1_2.txt -time -node 1 -dof 1 2 3 reaction
recorder Drift -file drift_1_2.txt -time -iNode 1 -jNode 2 -dof 1 -perpDirn 2
recorder Drift -file drift_2_2.txt -time -iNode 2 -jNode 3 -dof 1 -perpDirn 2
recorder Element -file force_1_2.txt -time -ele 1 globalForce
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

puts " Seismic analyze "
mass 2 1.0e4 1.0e4 1.0e4
mass 3 1.0e4 1.0e4 1.0e4
loadConst -time 0.0
timeSeries Path 1 -dt 0.02 -filePath EQ01.txt -factor 9.8
pattern UniformExcitation 2 1 -accel 1
set temp [eigen 1]
scan $temp "%e" w1s
set w1 [expr sqrt($w1s)]
puts "First-order modal frequency f:  [expr $w1/6.28]"
set ksi 0.02
set a0 0
set a1 [expr $ksi*2.0/$w1]
rayleigh $a0 0.0 $a1 0.0
puts "end of rayleigh"
wipeAnalysis
constraints Plain
numberer Plain
system BandGeneral
test NormDispIncr 1.0e-8 10 5
algorithm Newton
integrator Newmark 0.5 0.25
analysis Transient
analyze 1000 0.02
puts "end of seismic "