# @Author: Mengsen.Wang
# @Date: 2020-10-10 15:02:04
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-10-10 15:02:04

// UNDO
set modelName "THU"
set dataDir SFI_MVLEM_$modelName
file mkdir $dataDir

model basic -ndm 3 -ndf 6

# use N, m, Pa

set H 2.0;
set t 0.125;

node 1 0 0 0;
node 2 0 0.125 0;
node 3 0 0.25 0;
node 4 0 0.375 0;
node 5 0 0.5 0;
node 6 0 0.625 0;
node 7 0 0.75 0;
node 8 0 0.875 0;
node 9 0 1.0 0;
node 10 0 1.125 0;
node 11 0 1.25 0;
node 12 0 1.375 0;
node 13 0 1.5 0;
node 14 0 1.625 0;
node 15 0 1.75 0;
node 16 0 1.875 0;
node 17 0 $H;

fix 1 1 1 1 1 1 1

set IDctrlNode 17;
set IDctrlDOF 1;

set fyX ;
set bx ;

set fyYw ;
set byw ;

set fyYb ;
set byb ;

set Esy ;
set Esx ;
set R0 20.0;
set A1 0.925;
set A2 0.15;

# set steel x
uniaxialMaterial SteelMPF 0 $fyX $fyX $Esx $bx $bx $R0 $A1 $A2; 	# steel X
# set steel Y web
uniaxialMaterial SteelMPF 2 $fyYw $fyYw $Esy $byw $byw $R0 $A1 $A2; # steel Y web
# set stell Y boundary
uniaxialMaterial SteelMPF 3 $fyYb $fyYb $Esy $byb $byb $R0 $A1 $A2; # steel Y boundary

set fpc 8.09; 		# peak compressive stress
set ec0 -0.002371;	# strain at peak compressive stress
set ft 0.335798;	# peak tensile stress
set et 0.00008;		# strain at peak tensile stress
set Ec 5403.2172; 	# Young's modulus
set xcrnu 1.022;	# cracking strain - compression
set xcrp 10000;		# cracking strain - tension
set ru 15;			# shape parameter - compression
set rt 1.2;			# shape parameter - tension

# confined
set fpcc 10.479723; # peak compressive stress
set ec0c -0.005873; # strain at peak compressive stress
set Ecc 5953.9187; 	# Young's modulus
set xcrnc 1.023;	# cracking strain - compression
set rc 12.072964;	# shape parameter - compression

# Build concrete materials
uniaxialMaterial ConcreteCM 4 -$fpc   $ec0   $Ec  $ru  $xcrnu  $ft  $et  $rt  $xcrp -GapClose 0; # unconfined concrete
uniaxialMaterial ConcreteCM 5 -$fpcc  $ec0c  $Ecc $rc  $xcrnc  $ft  $et  $rt  $xcrp -GapClose 0; # confined concrete

# ---------------------------------------
#  Define 2D RC Panel Material (FSAM)
# ---------------------------------------

# Reinforcing ratios
set rouXw 0.0074; 	# X web
set rouXb 0.0082; 	# X boundary
set rouYw 0.0074; 	# Y web
set rouYb 0.0587; 	# Y boundary

# Shear resisting mechanism parameters
set nu 0.2; 		# friction coefficient
set alfadow 0.012; 	# dowel action stiffness parameter

# nDMaterial FSAM $mattag   $rho  $sX  $sY  $conc  $rouX  $rouY  $nu  $alfadow
nDMaterial FSAM 6 0.0 1 2 4 $rouXw $rouYw $nu  $alfadow; # Web (unconfined concrete)
nDMaterial FSAM 7 0.0 1 3 5 $rouXb $rouYb $nu  $alfadow; # Boundary (confined concrete only)

# ------------------------------
#  Define SFI_MVLEM elements
# ------------------------------

# element SFI_MVLEM eleTag iNode jNode m c -thick fiberThick -width fiberWidth -mat matTags 
element SFI_MVLEM 1 1 2 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 2 2 3 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 3 3 4 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 4 4 5 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 5 5 6 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 6 6 7 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 7 7 8 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 8 8 9 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 9 9 10 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 10 10 11 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 11 11 12 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 12 12 13 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 13 13 14 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 14 15 16 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM 15 16 17 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7

# ------------------------------
# End of model generation
# ------------------------------

# Initialize
initialize