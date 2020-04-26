############################################################################################
# HSSsection3D.tcl
#
# This routine creates a fiber section and aggregates torsion to it: AISC standard square HSS section 
# 
    #             
    #              /\  y ;
    #               |
    #               |
    #               |
    #               |
    #    <-----------
    #    z

# Variables
	# secID = section ID number
	# matID = material ID number
	# matTorsion = torsion material ID number 
	# d  	= nominal depth	
	# t		= tube tickness
	# nfdy 	= number of fibers along depth that goes along local y axis 
	# nfty 	= number of fibers along thickness that goes along local y axis
	# nfdz 	= number of fibers along depth that goes along local z axis
	# nftz 	= number of fibers along thickness that goes along local z axis
	 
############################################################################################

############################################################################################

proc HSSsection3D { secID matID matTorsion d t nfdy nfty nfdz nftz} {
	set dw [expr $d - 2 * $t]
	set y1 [expr -$d/2]
	set y2 [expr -$dw/2]
	set y3 [expr  $dw/2]
	set y4 [expr  $d/2]
  
	set z1 [expr -$d/2]
	set z2 [expr -$dw/2]
	set z3 [expr  $dw/2]
	set z4 [expr  $d/2]
	
	set secTag [expr $secID + 1000]
  
	section fiberSec  $secTag  {
   		#                     nfIJ  nfJK    yI  zI    yJ  zJ    yK  zK    yL  zL
   		patch quadr  $matID  $nftz $nfdy   $y2 $z4   $y2 $z3   $y3 $z3   $y3 $z4
   		patch quadr  $matID  $nftz $nfdy   $y2 $z2   $y2 $z1   $y3 $z1   $y3 $z2
   		patch quadr  $matID  $nfdz $nfty   $y1 $z4   $y1 $z1   $y2 $z1   $y2 $z4
   		patch quadr  $matID  $nfdz $nfty   $y3 $z4   $y3 $z1   $y4 $z1   $y4 $z4
	}
	
	# assign torsional Stiffness (for 3D Model)
	set E  29000. ; #modulus of elasticity of steel
	set nu 0.3; 	# Poisson ratio for steel
	set G 	[expr $E/2.0/(1+$nu)]; # shear modulus
	set do 	[expr $d-$t]; 			# median depth
	set J	[expr $do**3*$t]; 		# torsional constant   
	set GJ 	[expr $G*$J];  			# torsional stiffness   
	uniaxialMaterial Elastic $matTorsion $GJ;					# define elastic torsional stiffness
	section Aggregator $secID $matTorsion T -section $secTag;	# combine section properties
}


