wipe

model basic -ndm 3 -ndf 6

# nDMaterial PlaneStressUserMaterial $matTag $nStatevs $nProps $Prop1 ... $ Propn
#                                                               fc         ft    fcu     epsc0     epscu  epstu  stc
nDMaterial PlaneStressUserMaterial    1       40         7    30.8e6     3.08e6 -6.16e6  -0.002    -0.005 0.001 0.05

# nDMaterial PlateFromPlaneStress $matTag $PlaneStressMatTag $OutOfPlaneShearModulus
nDMaterial   PlateFromPlaneStress    4        1   1.283e10

#steel
##d=10 longitudinal reinforced steel in the confined region 
uniaxialMaterial   Steel02        7 379e6   202.7e9  0.01 18.5 0.925 0.15
##d=6  transverse reinforced steel and longitudinal reinforced steel in the middle region
uniaxialMaterial   Steel02        8 392e6   200.6e9  0.01 18.5 0.925 0.15

#angle=90 longitudinal reinforced steel
##d=10
nDMaterial   PlateRebar          9               7     90
##d=6
nDMaterial   PlateRebar         10               8     90

#angle=0 transverse reinforced steel
##d=6
nDMaterial   PlateRebar         11               8     0

                                                            
#confined region is divided into 10 layers£¬middle region is divided into 8 layers

#confined region
# material    absolute thickness   angle(steel)    material tag
##cover               12.5                              4
##d=6transverse     0.3023             0                11
##d=6transverse     0.4367             0                11
##core             24.6305                              4
##core             24.6305                              4
##core             24.6305                              4
##core             24.6305                              4
##d=6transverse     0.4367             0                11
##d=6transverse     0.3023             0                11
##cover               12.5                              4

# section LayeredShell $sectionTag $nLayers $matTag1 $thickness1...$matTagn $thicknessn
section   LayeredShell       1        10        4      0.0125 11 0.0003023  11  0.0004367  4 0.0246305 4 0.0246305 4 0.0246305 4 0.0246305  11  0.0004367 11 0.0003023 4 0.0125

# material    absolute thickness   angle(steel)    material tag
##cover               12.5                              4
##d=6transverse     0.3023             0                11
##d=6longitudinal   0.2356            90                10
##core             49.4621                              4
##core             49.4621                              4
##d=6longitudinal   0.2356            90                10
##d=6transverse     0.3023             0                11
##cover               12.5                              4

section   LayeredShell 2 8 4 0.0125 11 0.0003023  10  0.0002356 4 0.0494621 4 0.0494621  10  0.0002356 11 0.0003023 4 0.0125

source node.tcl
source element.tcl

element truss 41 1 6 223.53e-6 7
element truss 42 6 11 223.53e-6 7
element truss 43 11 16 223.53e-6 7
element truss 44 16 21 223.53e-6 7
element truss 45 21 26 223.53e-6 7

element truss 51  2  7 223.53e-6 7
element truss 52  7 12 223.53e-6 7
element truss 53 12 17 223.53e-6 7
element truss 54 17 22 223.53e-6 7
element truss 55 22 27 223.53e-6 7

element truss 61  4  9 223.53e-6 7
element truss 62  9 14 223.53e-6 7
element truss 63 14 19 223.53e-6 7
element truss 64 19 24 223.53e-6 7
element truss 65 24 29 223.53e-6 7

element truss 71 5  10 223.53e-6 7
element truss 72 10 15 223.53e-6 7
element truss 73 15 20 223.53e-6 7
element truss 74 20 25 223.53e-6 7
element truss 75 25 30 223.53e-6 7

fixY 0.0 1 1 1 1 1 1

recorder Node -file 1.txt -time -node 1 2 3 4 5 -dof 1 reaction 

pattern Plain 1 Linear {
load 27 0 -493000 0 0 0 0
load 29 0 -493000 0 0 0 0
}

recorder Node -file 28.txt -time -node  28 -dof 1  disp

constraints Plain
numberer RCM
system BandGeneral
test NormDispIncr 1.0e-6 200 ;
algorithm BFGS -count 100
integrator LoadControl 0.1;				
analysis Static				
analyze 10;					

puts "gravity analyze ok..."
loadConst -time 0.0;

timeSeries Path 1 -dt 0.1 -filePath shuju2.txt ;
pattern Plain 2 1 {
  sp 28 1 1
 }

constraints Penalty 1e20 1e20;      				
numberer RCM;					
system BandGeneral;				
test NormDispIncr 1.0e-5 1000 2; 				
algorithm KrylovNewton;		
integrator LoadControl 0.1;			
analysis Static	;
analyze 500