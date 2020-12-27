# @Author: Mengsen.Wang
# @Date: 2020-10-21 22:11:51

reset
wipe

model basic -ndm 2 -ndf 2
node 1 0.0 0.0
node 2 10.0 0.0 -mass 10000.0 10000.0

fix 1 1 1
fix 2 0 1

uniaxialMaterial Steel02 1 335 200000 0.00001
element truss 1 1 2 282600 1

recorder Node -file node2.out -time -node 2 -dof 1 2 disp
recorder Element -file stress.out -time -ele 1 -material stress
recorder Element -file strain.out -time -ele 1 -material strain

set tabas "Path -filePath tabas.txt -dt 0.02 -factor 10"
pattern UniformExcitation 1 1 -accel $tabas

constraints Transformation
numberer RCM
test NormDispIncr 1.e-8 25 2
algorithm Newton
system BandSPD
integrator Newmark 0.66 0.275625
analysis Transient
analyze 1000 0.01
wipe
reset