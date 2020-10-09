# @Author: Mengsen.Wang
# @Date: 2020-10-09 21:44:06
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-10-09 21:44:06

# -----------------------------------------------
# Units(SI): N, m, sec, Pa
# -----------------------------------------------

# Set Up Directories
set modelName "MVLEM";        # Model Name
set dataDir MVLEM_$modelName; # Name of output folder
file mkdir $dataDir;

# Create ModelBuilder for 2D element (with two-dimensions and 2 DOF/node)
model BasicBuilder -ndm 3 -ndf 6;

# --------------------------------------------
# Set geometry, nodes, boundary conditions
# --------------------------------------------

# Wall Geometry
set H 2.0;    # Wall height
set t 0.125;  # Wall thickness

# Create nodes
# node nodeId xCrd yCrd
node 1 0 0;
node 2 0 1.25;
node 3 0 1.75;
node 4 0 2.0;
node 5 0 5.25;
node 6 0 9.0;
node 7 0 18.0;
node 8 0 30.0;
node 9 0 36.0;
node 10 0 37.25;
node 11 0 37.75;
node 12 0 54.0;
node 13 0 72.0;
node 14 0 90.0;
node 15 0 108.0;
node 16 0 126.0;
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
set fyYbp 57.3; 	# fy - tension
set bybp 0.0185; 	# strain hardening - tension
set fyYbn 63.0; 	# fy - compression
set bybn 0.02; 		# strain hardening - compression

# steel Y web
set fyYwp 48.8; 	# fy - tension
set bywp 0.035; 	# strain hardening - tension
set fyYwn 65.0; 	# fy - compression
set bywn 0.02; 		# strain hardening - compression

# steel misc
set Es 29000.0; 	# Young's modulus
set R0 20.0; 		# initial value of curvature parameter
set a1 0.925; 		# curvature degradation parameter
set a2 0.0015;		# curvature degradation parameter

# Build steel materials
uniaxialMaterial    SteelMPF  1 $fyYbp $fyYbn $Es $bybp $bybn $R0 $a1 $a2; # steel Y boundary
uniaxialMaterial    SteelMPF  2 $fyYwp $fyYwn $Es $bywp $bywn $R0 $a1 $a2; # steel Y web

# Set MVLEM Reinforcing Ratios
set rouYb 0.029333; 	# Y boundary
set rouYw 0.003333; 	# Y web

# CONCRETE ........................................................
# uniaxialMaterial ConcreteCM $mattag  $fpcc  $epcc  $Ec  $rc  $xcrn   $ft  $et  $rt   $xcrp <-GapClose $gap>

# unconfined
set fpc 6.2; 		# peak compressive stress
set ec0 -0.0021;	# strain at peak compressive stress
set ft 0.295;		# peak tensile stress
set et 0.00008;		# strain at peak tensile stress
set Ec 4500; 		# Young's modulus
set xcrnu 1.039;	# cracking strain - compression
set xcrp 10000;		# cracking strain - tension	
set ru 7;			# shape parameter - compression
set rt 1.2;			# shape parameter - tension

# confined
set fpcc 6.9036; 	# peak compressive stress
set ec0c -0.0033;	# strain at peak compressive stress
set Ecc 5091.3; 	# Young's modulus
set xcrnc 1.0125;	# cracking strain - compression	
set rc 7.3049;		# shape parameter - compression

# Build concrete materials
# confined concrete
uniaxialMaterial ConcreteCM 3 -$fpcc  $ec0c  $Ecc $rc  $xcrnc  $ft  $et  $rt  $xcrp -GapClose 1; 
# unconfined concrete
uniaxialMaterial ConcreteCM 4 -$fpc   $ec0   $Ec  $ru  $xcrnu  $ft  $et  $rt  $xcrp -GapClose 1; 

# SHEAR ........................................................
# uniaxialMaterial Elastic $matTag $E <$eta> <$Eneg>
# NOTE: large shear stiffness assigned since only flexural response
set Ashweb 192;					# Gross area of the wall cross section
set G 1875000;					# Shear Modulus
set GAs [expr $G * $Ashweb]; 	# Shear Stiffness

# Build shear material
uniaxialMaterial Elastic 5 $GAs;

# ------------------------------
#  Define MVLEM elements
# ------------------------------

# element MVLEM eleTag iNode jNode m c -thick fiberThick -width fiberWidth -rho Rho -matConcrete matTagsConcrete -matSteel matTagsSteel -matShear matTagShear\n";
element MVLEM  1  0.0 1   2  8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  2  0.0 2   3  8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  3  0.0 3   4  8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  4  0.0 4   5  8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  5  0.0 5   6  8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  6  0.0 6   7  8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  7  0.0 7   8  8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  8  0.0 8   9  8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  9  0.0 9   10 8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  10 0.0 10  11 8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  11 0.0 11  12 8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  12 0.0 12  13 8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  13 0.0 13  14 8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  14 0.0 14  15 8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  15 0.0 15  16 8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5
element MVLEM  16 0.0 16  17 8 0.4 -thick $t $t $t $t $t $t $t $t -width 7.5 1.5 7.5 7.5 7.5 7.5 1.5 7.5 -rho $rouYb 0.0 $rouYw $rouYw $rouYw $rouYw 0.0 $rouYb -matConcrete 3 4 4 4 4 4 4 3 -matSteel 1 2 2 2 2 2 2 1 -matShear 5

# ------------------------------
# End of model generation
# ------------------------------

# Initialize
initialize

# ------------------------------
# Recorder generation
# ------------------------------

# Nodal recorders
recorder Node -file $dataDir/MVLEM_Dtop.out -time -node $IDctrlNode -dof 1 disp
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

set N [expr 85.0]; # kips

# -------------------------------------------------------
# Set parameters for displacement controlled analysis
# -------------------------------------------------------

# vector of displacement-cycle peaks in terms of wall drift ratio (flexural displacements)
set iDmax "0.000330792 0.001104233 0.002925758 0.004558709 0.006625238 0.010816268 0.014985823 0.019655056";
set Dincr 0.001;		# displacement increment for displacement controlled analysis. 
set CycleType Full;		# type of static analysis: Full / Push / Half
set Ncycles 2;			# specify the number of cycles at each peak
set Tol 1.0e-5;
set LunitTXT "inch";