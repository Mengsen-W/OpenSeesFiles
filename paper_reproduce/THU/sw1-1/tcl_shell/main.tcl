source Liblog.tcl

wipe

ModelInfo_Proc modelLog.log

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
##d=6transverse     0.2403                0             11
##d=6transverse     0.3676                0             11
##core              24.696                              4
##core              24.696                              4
##core              24.696                              4
##core              24.696                              4
##d=6transverse     0.3676                0             11
##d=6transverse     0.2403                0             11
##cover               12.5                              4

# section LayeredShell $sectionTag $nLayers $matTag1 $thickness1...$matTagn $thicknessn
section   LayeredShell      1          10     4       0.0125   11 0.0002403  11  0.0003676  4 0.024696 4 0.024696 4 0.024696 4 0.024696  11  0.0003676 11 0.0002403 4 0.0125

#middle region
# material    absolute thickness   angle(steel)    material tag
##cover              12.5                               4
##d=6transverse     0.2403                0             11
##d=6longitudinal   0.2356               90             10
##core             49.5241                              4
##core             49.5241                              4
##d=6longitudinal   0.2356               90             10
##d=6transverse     0.2403                0             11
##cover              12.5                               4

section   LayeredShell 2 8 4 0.0125 11 0.0002403  10  0.0002356 4 0.0495241 4 0.0495241  10  0.0002356 11 0.0002403 4 0.0125

#define nodes
node 1 0.0 0 0
node 2 0.2 0 0
node 3 0.5 0 0
node 4 0.8 0 0
node 5 1.0 0 0

node  6 0.0 0.2 0
node  7 0.2 0.2 0
node  8 0.5 0.2 0
node  9 0.8 0.2 0
node 10 1.0 0.2 0

node 11 0.0 0.4 0
node 12 0.2 0.4 0
node 13 0.5 0.4 0
node 14 0.8 0.4 0
node 15 1.0 0.4 0

node 16 0.0 0.6 0
node 17 0.2 0.6 0
node 18 0.5 0.6 0
node 19 0.8 0.6 0
node 20 1.0 0.6 0

node 21 0.0 0.8 0
node 22 0.2 0.8 0
node 23 0.5 0.8 0
node 24 0.8 0.8 0
node 25 1.0 0.8 0

node 26 0.0 1.0 0
node 27 0.2 1.0 0
node 28 0.5 1.0 0
node 29 0.8 1.0 0
node 30 1.0 1.0 0

node 31 0.0 1.2 0
node 32 0.2 1.2 0
node 33 0.5 1.2 0
node 34 0.8 1.2 0
node 35 1.0 1.2 0
node 36 0.0 1.4 0

node 37 0.2 1.4 0
node 38 0.5 1.4 0
node 39 0.8 1.4 0
node 40 1.0 1.4 0

node 41 0.0 1.6 0
node 42 0.2 1.6 0
node 43 0.5 1.6 0
node 44 0.8 1.6 0
node 45 1.0 1.6 0

node 46 0.0 1.8 0
node 47 0.2 1.8 0
node 48 0.5 1.8 0
node 49 0.8 1.8 0
node 50 1.0 1.8 0
node 51 0.0 2.0 0
node 52 0.2 2.0 0
node 53 0.5 2.0 0
node 54 0.8 2.0 0
node 55 1.0 2.0 0

element ShellMITC4 1  1  2  7  6 1
element ShellMITC4 2  2  3  8  7 2
element ShellMITC4 3  3  4  9  8 2
element ShellMITC4 4  4  5 10  9 1

element ShellMITC4 5	6	 7	12	11 1
element ShellMITC4 6	7	 8	13	12 2
element ShellMITC4 7	8	 9	14	13 2
element ShellMITC4 8	9	10	15	14 1

element ShellMITC4 9	11	12	17	16 1
element ShellMITC4 10	12	13	18	17 2
element ShellMITC4 11	13	14	19	18 2
element ShellMITC4 12	14	15	20	19 1

element ShellMITC4 13	16	17	22	21 1
element ShellMITC4 14	17	18	23	22 2
element ShellMITC4 15	18	19	24	23 2
element ShellMITC4 16	19	20	25	24 1

element ShellMITC4 17	21	22	27	26 1
element ShellMITC4 18	22	23	28	27 2
element ShellMITC4 19	23	24	29	28 2
element ShellMITC4 20	24	25	30	29 1

element ShellMITC4 21	26	27	32	31 1
element ShellMITC4 22	27	28	33	32 2
element ShellMITC4 23	28	29	34	33 2
element ShellMITC4 24	29	30	35	34 1

element ShellMITC4 25	31	32	37	36 1
element ShellMITC4 26	32	33	38	37 2
element ShellMITC4 27	33	34	39	38 2
element ShellMITC4 28	34	35	40	39 1

element ShellMITC4 29	36	37	42	41 1
element ShellMITC4 30	37	38	43	42 2
element ShellMITC4 31	38	39	44	43 2
element ShellMITC4 32	39	40	45	44 1

element ShellMITC4 33	41	42	47	46 1
element ShellMITC4 34	42	43	48	47 2
element ShellMITC4 35	43	44	49	48 2
element ShellMITC4 36	44	45	50	49 1

element ShellMITC4 37	46	47	52	51 1
element ShellMITC4 38	47	48	53	52 2
element ShellMITC4 39	48	49	54	53 2
element ShellMITC4 40	49	50	55	54 1

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


pattern Plain 1 Linear {
load 53 0 -246000 0 0 0 0
}

constraints Plain
numberer RCM
system BandGeneral
test NormDispIncr 1.0e-6 2000
algorithm Newton
integrator LoadControl 0.01
analysis Static
analyze 100

puts "gravity analyze ok..."
wipeAnalysis
loadConst -time 0.0;

recorder Node -file 53.txt -time -node  53 -dof 1  disp
recorder Node -file 1.txt -time -node 1 2 3 4 5 -dof 1 reaction

timeSeries Path 1 -dt 0.1 -filePath data.txt ;
pattern Plain 2 1 {
  sp 53 1 1
 }


constraints Penalty 1e20 1e20
numberer RCM
system BandGeneral
test NormDispIncr 1.0e-5 1000 0
algorithm KrylovNewton
integrator LoadControl 0.1
analysis Static
analyze 500

ModelInfo_Proc modelInfo.log

wipe
reset