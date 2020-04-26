############################################################################################
# WSection3D.tcl
#
# This routine creates a fiber section and aggregates torsion to it: AISC standard W section 
# 
# Variables
	# secID = section ID number
	# matID = material ID number
	# matTorsion = torsion material ID number 
	# d  = nominal depth	
	# bf = flange width
	# tf = flange thickness
	# tw = web thickness
	# nfdw = number of fibers along web depth 
	# nftw = number of fibers along web thickness
	# nfbf = number of fibers along flange width
	# nftf = number of fibers along flange thickness
	# J    = Torsional constant (can be found in steel manual)
############################################################################################

############################################################################################

proc WSection3D { secID matID matTorsion d bf tf tw nfdw nftw nfbf nftf J} {
	set dw [expr $d - 2 * $tf]
	set y1 [expr -$d/2]
	set y2 [expr -$dw/2]
	set y3 [expr  $dw/2]
	set y4 [expr  $d/2]
  
	set z1 [expr -$bf/2]
	set z2 [expr -$tw/2]
	set z3 [expr  $tw/2]
	set z4 [expr  $bf/2]
    
	set secTag [expr $secID + 2000]
	
	section fiberSec  $secTag  {
   		#                     nfIJ  nfJK    yI  zI    yJ  zJ    yK  zK    yL  zL
   		patch quadr  $matID  $nfbf $nftf   $y1 $z4   $y1 $z1   $y2 $z1   $y2 $z4
   		patch quadr  $matID  $nftw $nfdw   $y2 $z3   $y2 $z2   $y3 $z2   $y3 $z3
   		patch quadr  $matID  $nfbf $nftf   $y3 $z4   $y3 $z1   $y4 $z1   $y4 $z4
		
	}
	
	# assign torsional Stiffness (for 3D Model)
	set E  29000. ; #modulus of elasticity of steel
	set nu 0.3; 	# Poisson ratio for steel
	set G [expr $E/2.0/(1+$nu)]; 	# shear modulus  
	set GJ [expr $G*$J];  			# torsional stiffness   
	uniaxialMaterial Elastic $matTorsion $GJ; # define elastic torsional stiffness			
	section Aggregator $secID $matTorsion T -section $secTag;	# combine section properties
}