wipe

model basic -ndm 3 -ndf 6

# nDMaterial PlaneStressUserMaterial $matTag $nStatevs $nProps $Prop1 ... $ Propn
#                                                               fc       ft      fcu     epsc0     epscu  epstu  stc
nDMaterial PlaneStressUserMaterial    1       40         7    20.7e6   2.07e6  -4.14e6  -0.002    -0.006  0.001  0.08

# nDMaterial PlateFromPlaneStress $matTag $PlaneStressMatTag $OutOfPlaneShearModulus
nDMaterial   PlateFromPlaneStress     4         1                 1.25e10

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

                                                            
#confined region is divided into 10 layers��middle region is divided into 8 layers

#confined region
# material    absolute thickness   angle(steel)    material tag
##cover               12.5                              4
##d=6transverse     0.1839                0             11
##d=6transverse     0.3676                0             11
##core              24.724                              4
##core              24.724                              4
##core              24.724                              4
##core              24.724                              4
##d=6transverse     0.3676                0             11
##d=6transverse     0.1839                0             11
##cover               12.5                              4

# section LayeredShell $sectionTag $nLayers $matTag1 $thickness1...$matTagn $thicknessn
section   LayeredShell      1          10     4       0.0125   11 0.0001839  11  0.0003676  4 0.024724 4 0.024724 4 0.024724 4 0.024724  11  0.0003676 11 0.0001839 4 0.0125

#middle region
# material    absolute thickness   angle(steel)    material tag
##cover              12.5                               4
##d=6transverse     0.1839                0             11
##d=6longitudinal   0.2356               90             10
##core             49.581                              4
##core             49.581                              4
##d=6longitudinal   0.2356               90             10
##d=6transverse     0.1839                0             11
##cover              12.5                               4

section   LayeredShell 2 8 4 0.0125 11 0.0001839  10  0.0002356 4 0.049581 4 0.049581  10  0.0002356 11 0.0001839 4 0.0125

source node.tcl
source element.tcl


#longitudinal reinforced steel in the confined region insert in the shell elements as truss elements
element truss 41 1 6 223.53e-6 7
element truss 42 6 11 223.53e-6 7
element truss 43 11 16 223.53e-6 7
element truss 44 16 21 223.53e-6 7
element truss 45 21 26 223.53e-6 7
element truss 46 26 31 223.53e-6 7
element truss 47 31 36 223.53e-6 7
element truss 48 36 41 223.53e-6 7
element truss 49 41 46 223.53e-6 7
element truss 50 46 51 223.53e-6 7

element truss 51  2  7 223.53e-6 7
element truss 52  7 12 223.53e-6 7
element truss 53 12 17 223.53e-6 7
element truss 54 17 22 223.53e-6 7
element truss 55 22 27 223.53e-6 7
element truss 56 27 32 223.53e-6 7
element truss 57 32 37 223.53e-6 7
element truss 58 37 42 223.53e-6 7
element truss 59 42 47 223.53e-6 7
element truss 60 47 52 223.53e-6 7

element truss 61  4  9 223.53e-6 7
element truss 62  9 14 223.53e-6 7
element truss 63 14 19 223.53e-6 7
element truss 64 19 24 223.53e-6 7
element truss 65 24 29 223.53e-6 7
element truss 66 29 34 223.53e-6 7
element truss 67 34 39 223.53e-6 7
element truss 68 39 44 223.53e-6 7
element truss 69 44 49 223.53e-6 7
element truss 70 49 54 223.53e-6 7

element truss 71 5  10 223.53e-6 7
element truss 72 10 15 223.53e-6 7
element truss 73 15 20 223.53e-6 7
element truss 74 20 25 223.53e-6 7
element truss 75 25 30 223.53e-6 7
element truss 76 30 35 223.53e-6 7
element truss 77 35 40 223.53e-6 7
element truss 78 40 45 223.53e-6 7
element truss 79 45 50 223.53e-6 7
element truss 80 50 55 223.53e-6 7
fixY 0.0 1 1 1 1 1 1

recorder Node -file node1to5-dof1.txt -time -node 1 2 3 4 5 -dof 1 reaction 

pattern Plain 1 Linear {
load 53 0 -246000 0 0 0 0
}

recorder Node -file node53-dof1.txt -time -node  53 -dof 1  disp

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
  sp 53 1 1
 }


constraints Penalty 1e20 1e20;       				
numberer RCM;					
system BandGeneral;				
test NormDispIncr 1.0e-5 1000 2; 				
algorithm KrylovNewton;		
integrator LoadControl 0.1;			
analysis Static	;
analyze 500