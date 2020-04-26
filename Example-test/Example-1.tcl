 # @Author: Mengsen.Wang
 # @Date: 2020-02-09 08:52:08
 # @Last Modified by: Mengsen.Wang
 # @Last Modified time: 2020-02-09 15:13:51


wipe;
model BasicBuilder -ndm 2 -ndf 2
node 1 0.0 0.0
node 2 144.0 0.0
node 3 168.0 0.0
node 4 72.0 96.0
fix 1 1 1
fix 2 1 1
fix 3 1 1
uniaxialMaterial Elastic 1 3000.0
element truss 1 1 4 10.0 1
element truss 2 2 4 5.0 1
element truss 3 3 4 5.0 1

recorder Node -file disp_4.txt -time -node 4 -dof 1 2 disp
recorder Node -file reaction_1.txt -time -node 1 -dof 1 2 reaction
recorder Node -file reaction_2.txt -time -node 2 -dof 1 2 reaction
recorder Node -file reaction_3.txt -time -node 3 -dof 1 2 reaction

pattern Plain 1 Linear {
    load 4 100.0 -50.0
}

constraints Transformation
numberer RCM
system BandSPD
test NormDispIncr 1.0e-6 6 2
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10

wipe
