# @Author: Mengsen.Wang
# @Date: 2020-10-09 21:44:06
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-10-09 21:44:06

# -----------------------------------------------
# Units(SI): N, m, sec, Pa
# -----------------------------------------------

reset
wipe

# Set Up Directories
set modelName "THU";        # Model Name
set dataDir MVLEM_$modelName; # Name of output folder
file mkdir $dataDir;

# Create ModelBuilder for 2D element (with two-dimensions and 2 DOF/node)
model BasicBuilder -ndm 2 -ndf 3;

# --------------------------------------------
# Set geometry, nodes, boundary conditions
# --------------------------------------------

# Wall Geometry
set H 2.0;    # Wall height
set W 1.0;    # Wall width
set t 0.125;  # Wall thickness

# Create nodes
# node nodeId xCrd yCrd
node 1 0 0;
node 2 0 0.125;
node 3 0 0.25;
node 4 0 0.375;
node 5 0 0.5;
node 6 0 0.625;
node 7 0 0.75;
node 8 0 0.875;
node 9 0 1.0;
node 10 0 1.125;
node 11 0 1.25;
node 12 0 1.375;
node 13 0 1.5;
node 14 0 1.625;
node 15 0 1.75;
node 16 0 1.875;
node 17 0 $H;

# Boundary conditions
fix 1 1 1 1;	# Fixed condition at node 1

# Set Control Node and DOF
set IDctrlNode 17;
set IDctrlDOF 1;

# ------------------------------------------------------------------------
# Define uniaxial materials
# ------------------------------------------------------------------------

# STEEL ...........................................................
# uniaxialMaterial SteelMPF $mattag  $fyp  $fyn  $E0  $bp  $bn   $R0  $a1  $a2

# steel Y boundary
set fyYbp 379e6;  # fy - tension
set bybp 0.01;    # strain hardening - tension
set fyYbn 370e6;  # fy - compression
set bybn 0.01;    # strain hardening - compression
set Esbn 202.7e9; # Young's modulus

# steel Y web
set fyYwp 392e6;  # fy - tension
set bywp 0.001;    # strain hardening - tension
set fyYwn 390e6;  # fy - compression
set bywn 0.01;    # strain hardening - compression
set Eswn 200.6e9; # Young's modulus

# steel misc
set R0 20.0;    # initial value of curvature parameter
set a1 0.925;   # curvature degradation parameter
set a2 0.0015;  # curvature degradation parameter

# Build steel materials
# uniaxialMaterial    SteelMPF  1 $fyYbp $fyYbn $Esbn $bybp $bybn $R0 $a1 $a2; # steel Y boundary
# uniaxialMaterial    SteelMPF  2 $fyYwp $fyYwn $Eswn $bywp $bywn $R0 $a1 $a2; # steel Y web

uniaxialMaterial Steel02 1 379e6 202.7e9 0.01 18.5 0.925 0.15
uniaxialMaterial Steel02 2 392e6 200.6e9 0.01 18.5 0.925 0.15

# Set MVLEM Reinforcing Ratios
set rouYb 0.027130; 	# Y boundary
set rouYw 0.009; 	    # Y web

# CONCRETE ........................................................
# uniaxialMaterial ConcreteCM $mattag  $fpcc  $epcc  $Ec  $rc  $xcrn   $ft  $et  $rt   $xcrp <-GapClose $gap>

# unconfined
set fpc 20.7e6;     # peak compressive stress
set ec0 0.002;     # strain at peak compressive stress
set ft 2.07e6;      # peak tensile stress
set et 0.08;        # strain at peak tensile stress
set Ec 1.087e10;    # Young's modulus
set xcrnu 4.14e6;   # cracking strain - compression
set xcrp 10000;     # cracking strain - tension
set ru 0.7;         # shape parameter - compression
set rt 0.12;        # shape parameter - tension

# confined
set fpcc 20.7e6;      # peak compressive stress
set ec0c 0.002;      # strain at peak compressive stress
set Ecc 1.087e10;     # Young's modulus
set xcrnc 4.14e6;     # cracking strain - compression
set rc 0.7;           # shape parameter - compression

# Build concrete materials
# confined concrete
uniaxialMaterial ConcreteCM 3 -$fpcc  $ec0c  $Ecc $rc  $xcrnc  $ft  $et  $rt  $xcrp -GapClose 1;
# unconfined concrete
uniaxialMaterial ConcreteCM 4 -$fpc   $ec0   $Ec  $ru  $xcrnu  $ft  $et  $rt  $xcrp -GapClose 1;

# SHEAR ........................................................
# uniaxialMaterial Elastic $matTag $E <$eta> <$Eneg>
# NOTE: large shear stiffness assigned since only flexural response
set Ashweb 0.125;				# Gross area of the wall cross section
set G 1.875e9;					# Shear Modulus
set GAs [expr $G * $Ashweb]; 	# Shear Stiffness

# Build shear material
uniaxialMaterial Elastic 5 $GAs;

# ------------------------------
#  Define MVLEM elements
# ------------------------------

# element MVLEM eleTag iNode jNode m c -thick fiberThick -width fiberWidth -rho Rho -matConcrete matTagsConcrete -matSteel matTagsSteel -matShear matTagShear\n";
element MVLEM  1  0.0 1   2  5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  2  0.0 2   3  5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  3  0.0 3   4  5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  4  0.0 4   5  5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  5  0.0 5   6  5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  6  0.0 6   7  5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  7  0.0 7   8  5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  8  0.0 8   9  5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  9  0.0 9   10 5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  10 0.0 10  11 5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  11 0.0 11  12 5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  12 0.0 12  13 5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  13 0.0 13  14 5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  14 0.0 14  15 5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  15 0.0 15  16 5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5
element MVLEM  16 0.0 16  17 5 0.4 -thick $t $t $t $t $t -width 0.2 0.2 0.2 0.2 0.2  -rho $rouYb $rouYw $rouYw $rouYw $rouYb -matConcrete 3 4 4 4 3 -matSteel 1 2 2 2 1 -matShear 5

# ------------------------------
# End of model generation
# ------------------------------

# Initialize
initialize

# ------------------------------
# Recorder generation
# ------------------------------

# Nodal recorders
recorder Node -file $dataDir/MVLEM_Dtop.out -time -node $IDctrlNode -dof $IDctrlDOF disp
recorder Node -file $dataDir/MVLEM_DOFs.out -time -node 1 2 3 4 -dof 1 2 3 disp

# Element recorders
recorder Element -file $dataDir/MVLEM_Fgl.out -time -ele 1 2 3 globalForce
recorder Element -file $dataDir/MVLEM_Curvature.out -time -ele 1 2 3 Curvature

# Fiber responses
recorder Element -file $dataDir/MVLEM_fiber_strain.out -time -ele 1 fiber_strain
recorder Element -file $dataDir/MVLEM_fiber_stress_concrete.out -time -ele 1 fiber_stress_concrete
recorder Element -file $dataDir/MVLEM_fiber_stress_steel.out -time -ele 1 fiber_stress_steel

# Shear spring response
recorder Element -file $dataDir/MVLEM_shear_force_def.out -time -ele 1 shear_force_deformation

# ---------------------
# Define Axial Load
# ---------------------

set N [expr 246000]; # kips

# -------------------------------------------------------
# Set parameters for displacement controlled analysis
# -------------------------------------------------------

# vector of displacement-cycle peaks in terms of wall drift ratio (flexural displacements)
set iDmax "0.001 0.002 0.003 0.004 0.005 0.006 0.007 0.008 0.009 0.01";
set Dincr 0.0001;		# displacement increment for displacement controlled analysis.
set CycleType Full;		# type of static analysis: Full / Push / Half
set Ncycles 1;			# specify the number of cycles at each peak
set Tol 1.0e-3;
set LunitTXT "m";