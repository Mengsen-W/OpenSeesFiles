wipe;

# model Infomation 2 number of dimension 2 number of degree of freedom
model Basic -ndm 2 -ndf 2

#setting outfile
if { [file exists truss_exple] == 0} {
        file mkdir truss_exple;
}

# setting node
node 1 0.0 0.0
node 2 144.0 0.0
node 3 168.0 0.0
node 4 72.0 96.0

#setting fix
fix 1 1 1
fix 2 1 1
fix 3 1 1

#setting Material
uniaxialMaterial Elastic 1 3000.0

#setting element
element truss 1 1 4 10.0 1
element truss 2 2 4 5.0 1
element truss 3 3 4 5.0 1

#setting outfile
recorder Node -file truss_exple/disp_4.csv -time -node 4 -dof 1 2 disp
recorder Node -file truss_exple/reaction_1.csv -time -node 1 -dof 1 2 reaction
recorder Node -file truss_exple/reaction_2.csv -time -node 2 -dof 1 2 reaction
recorder Node -file truss_exple/reaction_3.csv -time -node 3 -dof 1 2 reaction

#setting pattern
pattern Plain 1 Linear {
    load 4 100.0 -50.0
}

#setting constraints
constraints Transformation
numberer RCM
system BandSPD
test NormDispIncr 1.0e-6 6 2
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10