# --------------------------------------------------------------------------------------------------
# 3D model of 1-Story 1-Bay Special Concentric Braced Frame - dynamic and pushover analysis
#---------------------------------------------------------------------------------------------------
# Braces are defined with 10 force-based beam-column elements (with 3 IPs) 
# Gusset plates are modeled with: (i) force based beam-column elements (with 2 IPs), (ii) rotational hinge, (iii) pin
# Rigid portions of gusset plates, beams and columns are modeled with elastic elements.  
# Geometric imperfection of braces is parabolic in shape, out-of-plane, with the inital imperfection in the middle of the brace of Leff/1000.
# Beams and columns are modeled with force-based beam-column elements


# Created by:  Vesna Terzic, UC Berkeley, 2013
# Units: kips, inches, seconds

# Element ID conventions:
#	1x = frame columns 
#	2a = frame beams 
#	3a00 = braces
#	4ab = gusset plates
#	5a, 6a, 7ab = rigid elements of beams, columns and braces
#
#	where:
#		x = Pier  #
#		a, b = integers describing the location (see description where elements are defined)
#-------------------------------------------------------------------------------------------------------

foreach GP_Model { "RH" "GP" "pin" } {
# GP stands for gusset plate connection model based on Uriz report: PEER 2008/08
# RH stands for gusset plate connection model that uses rotational spring based on: Po-Chien Hsiao, Dawn E. Lehman, Charles W. Roeder, (2012), "Improved analytical model for special concentrically braced frames", Journal of Constructional Steel Research 73 (21012) 80-94			
# pin stands for pinned gusset plate connection
###################################################################################################
#          Set Up & Source Definition									  
###################################################################################################
	wipe;							    # clear memory of past model definitions
	model BasicBuilder -ndm 3 -ndf 6;	# Define the model builder, ndm = #dimension, ndf = #dofs
	source WSection3D.tcl;				# procedure for creating standard steel W section
	source HSSsection3D.tcl;			# procedure for creating standard steel HSS section
	source GPsection3D.tcl;				# procedure for creating gusset plate section
	
###################################################################################################
#          Define Analysis Type and create output folder 										  
###################################################################################################
# Define type of analysis:  "pushover" = pushover;  "dynamic" = dynamic
	set analysisType "dynamic";
 
	if {$analysisType == "pushover"} {
		if { $GP_Model == "GP" } {
			set dataDir Pushover-Output-GP;			# name of output folder
		} elseif  { $GP_Model == "RH" } {
			set dataDir Pushover-Output-RH;
		} else {
			set dataDir Pushover-Output-pin
		}
		file mkdir $dataDir; 								# create output folder
	}
	if {$analysisType == "dynamic"} {
		if { $GP_Model == "GP" } {
			set dataDir Dynamic-Output-GP-10El-EQ20;					# name of output folder
		} elseif  { $GP_Model == "RH" } {
			set dataDir Dynamic-Output-RH-10El-EQ20;
		} else {
			set dataDir Dynamic-Output-pin-10El-EQ20
		}
		set subDir1 DriftAcceleration
		set subDir2 ForceDeformation
		file mkdir $dataDir/$subDir1; 												# create output folder
		file mkdir $dataDir/$subDir2;
	}
	
###################################################################################################
#          Define Building Geometry, Nodes, and Constraints											  
###################################################################################################
# define structure-geometry parameters
	set WBay      360.;		            # bay width in inches
	set HStory    180.;         		# 1st story height in inches

# calculate locations frame nodes:
	set Pier1  0.0;						# leftmost column line
	set Pier2  [expr $Pier1 + $WBay];
	set Floor1 0.0;						 # ground floor
	set Floor2 [expr $Floor1 + $HStory];

# joint offset distance for beams, columns, and braces (from gusset plate geometry)
	set jOff_col_b 44.81;    	# joint offset at the bottom of the column (gusset-plate conection)
	set jOff_beam_m 50.56;    	# joint offset from the middle node of beam (gusset-plate conection) 
	set jOff_brace_b  26.2;    	# joint offset at the bottom of a braces in X and Y direction (from work point to yield line)
	set jOff_brace_t  31.95;    # joint offset at the top of a brace in X and Y direction (from work point to yield line)
	set jOff_beam_e  7.61;      # joint offset for the beam at its ends (from column centerline to the shear tab hinge line)
	set jOff_col_t  13.355;     # joint offset for a column at the beam-column conection (Dbeam/2)

# end node ofsets of the braces (from a work point to the beginning of the brace)
	set nOff_brace_b  28.68;    	# bottom of a brace in X and Y direction
	set nOff_brace_t  34.43;    	# top of a brace in X and Y direction
	
# brace effective lenght, number of elements per braace, and initial imperfection
	set PI [expr 2.*asin(1.0)]
	set alpha [expr $PI/4.]
	set Leff [expr ($WBay/2.)/cos($alpha)-$nOff_brace_b/cos($alpha)-$nOff_brace_t/cos($alpha)]; #effective brace lenght 
	set noEle 10; # number of elements per brace
	set p_ratio 1000.; #coresponds to 0.05% of the effective lenght
	set p [expr 1./$p_ratio*$Leff]; #imperfection of the brace

# floor masses 
	set g 386.4;			# acceleration due to gravity
	set NodalMass2H 2.513; # horizontal mass 	
	set NodalMass2V 0.21;  # veritcal mass

# define nodes and assign masses to beam-column intersections of frame
	# command:  node nodeID xcoord ycoord -mass mass_dof1 mass_dof2 mass_dof3
	node 1 $Pier1 $Floor1 0.0;
	node 2 $Pier2 $Floor1 0.0;
	node 3 $Pier1 $Floor2 0.0 -mass [expr $NodalMass2H/3.] [expr $NodalMass2V*0.375] 0.0 0.0 0.0 0.0;
	node 4 [expr $WBay/2.0] $Floor2 0.0 -mass [expr $NodalMass2H/3.] [expr $NodalMass2V*0.25] 0.0 0.0 0.0 0.0;
	node 5 $Pier2 $Floor2 0.0 -mass [expr $NodalMass2H/3.] [expr $NodalMass2V*0.375] 0.0 0.0 0.0 0.0;	 

# define extra nodes in the beam
    # at shear tabs (pin connection) 
	node 321 [expr $Pier1+$jOff_beam_e] $Floor2 0.0
	node 322 [expr $Pier1+$jOff_beam_e] $Floor2 0.0
	node 521 [expr $Pier2-$jOff_beam_e] $Floor2 0.0
	node 522 [expr $Pier2-$jOff_beam_e] $Floor2 0.0
	# at gusset plate conection
	node 421 [expr $WBay/2.0-$jOff_beam_m] $Floor2 0.0
	node 422 [expr $WBay/2.0+$jOff_beam_m] $Floor2 0.0

# define extra nodes  in the columns
	# nodes at the base
	node 11 $Pier1 [expr $Floor1+$jOff_col_b] 0.0
	node 21 $Pier2 [expr $Floor1+$jOff_col_b] 0.0
	# nodes at the beam-column conection
	node 31 $Pier1 [expr $Floor2-$jOff_col_t] 0.0
	node 51 $Pier2 [expr $Floor2-$jOff_col_t] 0.0

# define extra nodes for rigid links in the braces:
	if { $GP_Model == "GP" } {
		node 13  [expr $Pier1+$jOff_brace_b] 			[expr $Floor1+$jOff_brace_b] 0.0
		node 431 [expr $Pier1+$WBay/2.0-$jOff_brace_t] 	[expr $Floor2-$jOff_brace_t] 0.0 
		node 23  [expr $Pier2-$jOff_brace_b] 			[expr $Floor1+$jOff_brace_b] 0.0 
		node 432 [expr $Pier2-$WBay/2.0+$jOff_brace_t] 	[expr $Floor2-$jOff_brace_t] 0.0 
	} else {
		node 13  [expr $Pier1+$nOff_brace_b] 			[expr $Floor1+$nOff_brace_b] 0.0
		node 431 [expr $Pier1+$WBay/2.0-$nOff_brace_t] 	[expr $Floor2-$nOff_brace_t] 0.0 
		node 23  [expr $Pier2-$nOff_brace_b] 			[expr $Floor1+$nOff_brace_b] 0.0 
		node 432 [expr $Pier2-$WBay/2.0+$nOff_brace_t] 	[expr $Floor2-$nOff_brace_t] 0.0 
	}

# define extra nodes along the braces:
#----------------------------------------------
	# nodeID convention:  "3acd" where and a = left or right
	# "a" convention: 1 = left; 2 = right;
	# cd = node numbering for the brace (can be between 1 and 99)
	
# nodes of the left brace of storey 1
	# puts "brace 1"
	set orient "pos"
	set shift 3100
	set Xi [expr $Pier1+$nOff_brace_b];  # x coordinate of node 3101
	set Yi [expr $Floor1+$nOff_brace_b]; # y coordinate of node 3101
	set Zi 0.0
	set eleL  [expr $Leff/$noEle]
	for { set i 1 } { $i <= [expr $noEle+1] } { incr i} {
		#local coordinates
		set xm [expr $eleL*($i-1)]
		set ym 0.0
		set zm [expr 4.*$p/$Leff*$xm*(1.-$xm/$Leff)]; 
		#global coordinates
		if {$orient == "pos"} {
			set Xm [expr $Xi+cos($alpha)*$xm];
			set Ym [expr $Yi+sin($alpha)*$xm];
			set Zm [expr $Zi+$zm];
		} else {
			set Xm [expr $Xi-cos($alpha)*$xm];
			set Ym [expr $Yi+sin($alpha)*$xm];
			set Zm [expr $Zi+$zm];
		}
		if { $i == [expr $noEle+1] } {
			set Xm [expr $Pier1+$WBay/2.0-$nOff_brace_t]; # x coordinate of the last node
			set Ym [expr $Floor2-$nOff_brace_t]; # y coordinate of the last node
			set Zm 0.0
		}
		#define nodes
		node [expr $shift+$i] $Xm $Ym $Zm
		#puts "node: [expr $shift+$i] $Xm $Ym $Zm"
	}
	
# nodes of the right brace of storey 1
	# puts "brace 2"
	set orient "neg"
	set shift 3200
	set Xi [expr $Pier2-$nOff_brace_b]; # x coordinate of node 3201
	set Yi [expr $Floor1+$nOff_brace_b];  # y coordinate of node 3201
	set Zi 0.0
	for { set i 1 } { $i <= [expr $noEle+1] } { incr i} {
		#local coordinates
		set xm [expr $eleL*($i-1)]
		set ym 0.0
		set zm [expr 4.*$p/$Leff*$xm*(1.-$xm/$Leff)]; 
		#global coordinates
		if {$orient == "pos"} {
			set Xm [expr $Xi+cos($alpha)*$xm];
			set Ym [expr $Yi+sin($alpha)*$xm];
			set Zm [expr $Zi+$zm];
		} else {
			set Xm [expr $Xi-cos($alpha)*$xm];
			set Ym [expr $Yi+sin($alpha)*$xm];
			set Zm [expr $Zi+$zm];
		}
		if { $i == [expr $noEle+1] } {
			set Xm [expr $Pier2-$WBay/2.0+$nOff_brace_t]; # x coordinate of the last node
			set Ym [expr $Floor2-$nOff_brace_t]; # y coordinate of of the last node
			set Zm 0.0
		}
		#define nodes
		node [expr $shift+$i] $Xm $Ym $Zm
		#puts "node: [expr $shift+$i] $Xm $Ym $Zm"
	}

# assign boundary condidtions
#------------------------------------------------------- 
	# command:  fix nodeID dxFixity dyFixity rzFixity
	# fixity values: 1 = constrained; 0 = unconstrained
	
	# fix the base of the frame;
	fix 1 1 1 1 1 1 1;
	fix 2 1 1 1 1 1 1;

# fix the displacement of the frame in z direction and rotation in X & Y dir.
	# beam nodes
	fix 3 0 0 1 0 1 0
	fix 4 0 0 1 1 0 0
	fix 5 0 0 1 0 1 0

# define constraints for pined beam-to-column connection
	equalDOF 322 321 1 2 3 4 5    
	equalDOF 522 521 1 2 3 4 5

# define constraints for zeroLenght elements used to model out of plane rotational hinge
	if { $GP_Model == "RH" || $GP_Model == "pin" } {
		equalDOF 13 3101 1 2 3 6    
		equalDOF 23 3201 1 2 3 6
		equalDOF 431 [expr 3101+$noEle] 1 2 3 6    
		equalDOF 432 [expr 3201+$noEle] 1 2 3 6
	}
	
###################################################################################################
#          Define Materials and Sections													  
###################################################################################################

# define material for nonlinear beams and columns
	set matID_BC 1
	set matID_fatBC 2
	set Es 29000.0;  # modulus of elasticity for steel
	set Fy 50.0; 	 # yield stress of steel
	set b 0.003;	 # strain hardening ratio
	uniaxialMaterial Steel02 $matID_BC $Fy $Es $b 20 0.925 0.15 0.0005 0.01 0.0005 0.01
	uniaxialMaterial Fatigue $matID_fatBC $matID_BC 


# define material for braces 
	set matID_Brace 3
	set matID_fatBrace 4
	set Fy_b 46.0; 	 # yield stress of steel
	set E0 0.095
	set m -0.5
	uniaxialMaterial Steel02 $matID_Brace $Fy_b $Es $b 20 0.925 0.15 0.0005 0.01 0.0005 0.01
	uniaxialMaterial Fatigue $matID_fatBrace $matID_Brace -E0 $E0 -m $m -min -1.0 -max 0.04
	#uniaxialMaterial Fatigue $matID_fatBrace $matID_Brace -E0 $E0 -m $m

# define material for gusset plates 
	# GP_Model == GP
	set matID_GP 5
	set Fy_gp 50.0
	uniaxialMaterial Steel02 $matID_GP $Fy_gp $Es $b 20 0.925 0.15 0.0005 0.01 0.0005 0.01
	# GP_Model == RH
	# out-of-plane rotational hinge (dir 5 in local coordinate system)
	set matID_RHb 11
	set matID_RHt 12
	set My_b 772.
	set My_t 772.
	set Krot_b 18045.12
	set Krot_t 15571.02
	set b 0.01
	uniaxialMaterial Steel02 $matID_RHb $My_b $Krot_b $b 20 0.925 0.15 0.0005 0.01 0.0005 0.01
	uniaxialMaterial Steel02 $matID_RHt $My_t $Krot_t $b 20 0.925 0.15 0.0005 0.01 0.0005 0.01
	# torsional rotation (dir 4 in local coordinate system)
	set matID_RH_tors 13
	uniaxialMaterial Elastic $matID_RH_tors 10.e7
	# free rotation simulating pin connection (dir 5 in local coordinate system)
	set matID_pin 14
	uniaxialMaterial Elastic $matID_pin 10.e-7
	
# define material for ghost truss
	set matID_GT 6
	uniaxialMaterial Elastic $matID_GT 100.0
	
# define material for rigid truss elements
	set matID_RT 7
	uniaxialMaterial Elastic $matID_RT $Es

# define sections
#-----------------
	set secTagC 10
	set secTagB 20
	set secTagBr 30
	set secTagGPb 40
	set secTagGPt 50
	
	# command: WSection3D  secID matID matTorsion d bf tf tw nfdw nftw nfbf nftf J
	# column: W14x176
	WSection3D $secTagC $matID_fatBC $secTagC 15.22 15.65  1.31 0.83  8 2 8 4  26.5 
 	# beam: W27x84
	WSection3D $secTagB $matID_fatBC $secTagB 26.71 9.96   0.64 0.46  8 2 8 4  2.81
	
		
# define sections for braces
	# command: HSSsection3D secID matID matTorsion d t nfdy nfty nfdz nftz
	# HSS10x10x0.625
	HSSsection3D $secTagBr $matID_fatBrace $secTagBr 10. 0.625 5 4 5 2 	  	
	
# define sections for gusset plates
	# command: GPsection3D secID matID matTorsion d t nfd nft 
	# bottom of the brace
	GPsection3D $secTagGPb $matID_GP $secTagGPb 49. 1.375   8 8  
	# top of the brace
	GPsection3D $secTagGPt $matID_GP $secTagGPt 49. 1.375   8 8

###################################################################################################
#          Define Geometric Transformation													  
###################################################################################################
	set transfTag_C 1
	set transfTag_Brace 2
	set transfTag_B 3
 
# rigid links of columns; columns
	geomTransf PDelta $transfTag_C 0  0  1 
	
# braces, gusset plates
	geomTransf Corotational $transfTag_Brace 0  0  1 
	
# beams
	geomTransf PDelta $transfTag_B 0  0  1 

###################################################################################################
#          Define Elements													  
###################################################################################################

	set tol 1.e-8
	set maxIter 10
	
# define columns of a braced frame:
#----------------------------------
	# eleID convention: "1x", 1 = column, x=Pier #
	# command arguments:     $eleID $iNode $jNode $numIntgrPts $secTag $transfTag	
	element forceBeamColumn   11      11     31        4         $secTagC       $transfTag_C   -iter  $maxIter $tol
	element forceBeamColumn   12      21     51        4         $secTagC       $transfTag_C   -iter  $maxIter $tol

	
# define beams of a braced frame:
#--------------------------------
	# eleID convention: "2a", 2 = beam,  a = location of the beam
	# "a" convention: 1 = left; 2 = right;
	# command arguments:     $eleID $iNode $jNode $numIntgrPts $secTag $transfTag
	element forceBeamColumn   21     322     421       3       $secTagB       $transfTag_B  -iter  $maxIter $tol 
	element forceBeamColumn   22     422     522       3       $secTagB       $transfTag_B  -iter  $maxIter $tol 

# define braces:
#----------------
	# eleID convention: "3acd", 3 = brace, a = location of the brace
	# "a" convention: 1 = left brace; 2 = right brace;
	# cd = element numbering for the brace (can be between 1 and 99)
	# command arguments:     $eleID $iNode $jNode $numIntgrPts $secTag $transfTag
	set NIP 3
	
	# storey 1 - left brace
	set shift 3100
	for { set i 1 } { $i <= [expr $noEle] } { incr i} {
		element forceBeamColumn   [expr $shift+$i]     [expr $shift+$i]    [expr $shift+$i+1]        $NIP         $secTagBr       $transfTag_Brace  -iter  $maxIter $tol 
	}
	
	# storey 1 - right brace
	set shift 3200
	for { set i 1 } { $i <= [expr $noEle] } { incr i} {
		element forceBeamColumn   [expr $shift+$i]     [expr $shift+$i]    [expr $shift+$i+1]        $NIP         $secTagBr       $transfTag_Brace  -iter  $maxIter $tol 
	}
	
# define gusset plates:
#----------------------
	if { $GP_Model == "GP" } {
		# eleID convention: "4ab", 4 = gusset plate, a, b = location of the gusset plate
		# "a" convention: 1 = left brace; 2 = right brace;
		# "b" convention: 1 = bottom; 2 = top
		# command arguments:     $eleID $iNode $jNode $numIntgrPts $secTag $transfTag
		set NIP 2
		# left brace
		set shift 3100
		element forceBeamColumn   411              13             [expr $shift+1]         $NIP         $secTagGPb       $transfTag_Brace
		element forceBeamColumn   412    [expr $shift+$noEle+1]         431               $NIP         $secTagGPt       $transfTag_Brace
		# right brace
		set shift 3200
		element forceBeamColumn   421              23             [expr $shift+1]        $NIP         $secTagGPb       $transfTag_Brace
		element forceBeamColumn   422    [expr $shift+$noEle+1]         432              $NIP         $secTagGPt       $transfTag_Brace
	} elseif { $GP_Model == "RH" } {
		# command arguemnts:  $eleTag           $iNode               $jNode          -mat $matTag1 $matTag2 ... -dir $dir1 $dir2 
		# left brace
		set shift 3100
		element zeroLength      411              13             [expr $shift+1]      -mat $matID_RH_tors $matID_RHb            -dir 4 5 -orient 1 1 0 -1 1 0
		element zeroLength      412    [expr $shift+$noEle+1]         431            -mat $matID_RH_tors $matID_RHt            -dir 4 5 -orient 1 1 0 -1 1 0
		# right brace
		set shift 3200
		element zeroLength      421              23             [expr $shift+1]      -mat $matID_RH_tors $matID_RHb            -dir 4 5 -orient -1 1 0 -1 -1 0
		element zeroLength      422    [expr $shift+$noEle+1]         432            -mat $matID_RH_tors $matID_RHt            -dir 4 5 -orient -1 1 0 -1 -1 0
	} else {
		# command arguemnts:  $eleTag           $iNode               $jNode          -mat $matTag1 $matTag2 ... -dir $dir1 $dir2 
		# left brace
		set shift 3100
		element zeroLength      411              13             [expr $shift+1]      -mat $matID_RH_tors $matID_pin            -dir 4 5 -orient 1 1 0 -1 1 0
		element zeroLength      412    [expr $shift+$noEle+1]         431            -mat $matID_RH_tors $matID_pin            -dir 4 5 -orient 1 1 0 -1 1 0
		# right brace
		set shift 3200
		element zeroLength      421              23             [expr $shift+1]      -mat $matID_RH_tors $matID_pin            -dir 4 5 -orient -1 1 0 -1 -1 0
		element zeroLength      422    [expr $shift+$noEle+1]         432            -mat $matID_RH_tors $matID_pin            -dir 4 5 -orient -1 1 0 -1 -1 0
	}		
	
# define rigid links:
#-----------------------
	set Jrigid 1.0e4
	set G [expr $Es/2.0/(1+0.3)]
	
	#braces
	#-----------
	set Arigid [expr 25.7*10.]; # area of the brace multiplied by 10
	set Irigid [expr 548.*10]; # I of the brace multiplied by 10
	# eleID convention: "5xa", 5 = rigid link for braces, a = location of the rigid link
	# "a" convention: 1 = left-botom; 2 = left-top; 3 = right-bottom; 4 = right-top;
	# comand arguemnts:       $eleTag $iNode $jNode   $A     $E   $G   $J       $Iy     $Iz        $transfTag
	element elasticBeamColumn  	51      1     13 	$Arigid  $Es  $G $Jrigid  $Irigid $Irigid     $transfTag_Brace
	element elasticBeamColumn  	52    431      4 	$Arigid  $Es  $G $Jrigid  $Irigid $Irigid     $transfTag_Brace
	element elasticBeamColumn  	53      2     23 	$Arigid  $Es  $G $Jrigid  $Irigid $Irigid     $transfTag_Brace
	element elasticBeamColumn  	54    432      4 	$Arigid  $Es  $G $Jrigid  $Irigid $Irigid     $transfTag_Brace
	
	#beams
	#-----------
	set Arigid [expr 24.7*10.]; # area of the beam multiplied by 10
	set IrigidZ [expr 2850.*10]; # Iz of the beam multiplied by 10
	set IrigidY [expr 106.*10]; # Iy of the beam multiplied by 10
	
	# eleID convention: "6a", 6 = rigid link of beams, , a = location of the rigid link
	# "a" convention: 1 = left; 2 = right;  3 = left-middle; 4 = right-middle;
	# comand arguemnts:       $eleTag $iNode $jNode        $A     $E   $G   $J       $Iy     $Iz         $transfTag
	element elasticBeamColumn  	61    3     321 	$Arigid  $Es  $G $Jrigid  $IrigidY $IrigidZ     $transfTag_B
	element elasticBeamColumn  	62    521     5 	$Arigid  $Es  $G $Jrigid  $IrigidY $IrigidZ     $transfTag_B
	element elasticBeamColumn  	63    421     4 	$Arigid  $Es  $G $Jrigid  $IrigidY $IrigidZ     $transfTag_B
	element elasticBeamColumn  	64    4     422 	$Arigid  $Es  $G $Jrigid  $IrigidY $IrigidZ     $transfTag_B

	#columns
	#-----------
	set Arigid [expr 51.8*10.]; # area of the column multiplied by 10
	set IrigidZ [expr 2140.*10]; # Iz of the column multiplied by 10
	set IrigidY [expr 838.*10]; # Iy of the column multiplied by 10
	
	# eleID convention: "7xa", 7 = rigid link of columns, x = pier #, a = location of the rigid link
	# "a" convention: 1 = botom; 2 = top; 
	# comand arguemnts:       $eleTag $iNode $jNode   $A     $E   $G   $J       $Iy     $Iz   $transfTag
	element elasticBeamColumn  	711      1     11 	$Arigid  $Es  $G $Jrigid  $IrigidY $IrigidZ     $transfTag_C
	element elasticBeamColumn  	712     31      3	$Arigid  $Es  $G $Jrigid  $IrigidY $IrigidZ     $transfTag_C
	element elasticBeamColumn  	721      2     21 	$Arigid  $Es  $G $Jrigid  $IrigidY $IrigidZ     $transfTag_C
	element elasticBeamColumn  	722     51      5	$Arigid  $Es  $G $Jrigid  $IrigidY $IrigidZ     $transfTag_C
	
# ghost trusses to the braces (with very small stiffness) to diminish convergence problems
#------------------------------
	set Agt 0.05; #truss area
	# braces
	element corotTruss 81  3101 [expr 3101+$noEle]  $Agt $matID_GT
	element corotTruss 82  3201 [expr 3201+$noEle]  $Agt $matID_GT
	
# add rigid truss elemnts to assure that the beam nodes move horizontaly together 
#--------------------------------------------------------------------------------
	set ArigidT  1000.0; # define area of truss section (make much larger than A of frame elements)
	# command: element truss $eleID $iNode $jNode $A $materialID
	element truss  91 3  4 $ArigidT $matID_RT;	
	element truss  92 4  5 $ArigidT $matID_RT;	
	
############################################
#              Display the model
############################################
	recorder display "Model" 10 10 500 500 -wipe
	prp 0 0 50
	vup 0 1 0
	vpn 2 -1 1
	display 1 2 10
	
############################################################################
#              Gravity Loads & Gravity Analysis
############################################################################
	
	pattern Plain 101 Linear {
		
		# distributed loads
		#eleLoad -ele $eleTag1 <$eleTag2 ....> -type -beamUniform $Wz <$Wx>
		set MgF [expr $WBay/($WBay-2.*$jOff_beam_m-2.*$jOff_beam_e)]; # magnifying factor to accont for the load that can not be applied on the rigid portions of elements
		set dl_F2  [expr -0.11238*$MgF];	# distributed load at Floor 2 
		
		# Floor 2 loads
		eleLoad -ele 21 22  -type -beamUniform $dl_F2 0.0

	}
		
# Gravity-analysis: load-controlled static analysis
	set Tol 1.0e-6;							# convergence tolerance for test
	constraints Plain;				# how it handles boundary conditions
	#constraints Penalty 1.0e15 1.0e15;
	numberer RCM;							# renumber dof's to minimize band-width (optimization)
	system BandGeneral;						# how to store and solve the system of equations in the analysis (large model: try UmfPack)
	test NormDispIncr $Tol 10;				# determine if convergence has been achieved at the end of an iteration step
	algorithm Newton ;						# use Newton's solution algorithm: updates tangent stiffness at every iteration
	set NstepGravity 10;					# apply gravity in 10 steps
	set DGravity [expr 1.0/$NstepGravity];	# load increment
	integrator LoadControl $DGravity;		# determine the next time step for an analysis
	analysis Static;						# define type of analysis static or transient
	analyze $NstepGravity;					# apply gravity

	# maintain constant gravity loads and reset time to zero
	loadConst -time 0.0
	puts "Model Built"
	
############################################################################
#                       Eigenvalue Analysis                    			   
############################################################################
	set pi [expr 2.0*asin(1.0)];						# Definition of pi
	set nEigenI 1;										# mode i = 1
	set nEigenJ 3;										# mode j = 2
	set lambdaN [eigen [expr $nEigenJ]];				# eigenvalue analysis for nEigenJ modes
	set lambdaI [lindex $lambdaN [expr 0]];				# eigenvalue mode i = 1
	set lambdaJ [lindex $lambdaN [expr $nEigenJ-2]];	# eigenvalue mode j = 2
	set w1 [expr pow($lambdaI,0.5)];					# w1 (1st mode circular frequency)
	set w2 [expr pow($lambdaJ,0.5)];					# w2 (2nd mode circular frequency)
	set T1 [expr 2.0*$pi/$w1];							# 1st mode period of the structure
	set T2 [expr 2.0*$pi/$w2];							# 2nd mode period of the structure
	puts "T1 = $T1 s";									# display the first mode period in the command window
	puts "T2 = $T2 s";									# display the second mode period in the command window

# # Display the first two mode shapes
	# #--------------------------------------------
	# recorder display "Mode 1" 10 10 500 500 -wipe
	# prp 0 0 50
	# vup 0 1 0
	# vpn 2 -1 1
	# display -1 2 50
	
	# recorder display "Mode 2" 10 520 500 500 -wipe
	# prp 0 0 50
	# vup 0 1 0
	# vpn 2 -1 1
	# display -2 2 20

############################################################################
#              Pushover Analysis                			   			   #
############################################################################
	if {$analysisType == "pushover"} { 
		puts "Running Pushover..."
	# assign lateral loads and create load pattern:  use ASCE 7-10 distribution

		pattern Plain 200 Linear {
			load 3 0.5 0.0 0.0 0.0 0.0 0.0 ;
			load 5 0.5 0.0 0.0 0.0 0.0 0.0 ;				
		}

	# recorde disp at node 3 and reactions at the bottom nodels
		recorder Node -file "$dataDir/node3D.out" -time -node 3 -dof 1 disp	
		recorder Node -file "$dataDir/reactions.out" -time -node 1 2 -dof 1 reaction
	
	# displacement parameters
		set IDctrlNode 3;					    # node where disp is read for disp control
		set IDctrlDOF 1;					    # degree of freedom read for disp control (1 = x displacement)
		set Dmax [expr 0.01*$HStory];			# maximum displacement of pushover
		set Dincr [expr $Dmax/1000.];		    # displacement increment
		
	# pushover analysis commands
		constraints Plain;
		numberer RCM;
		system BandGeneral;
		test NormUnbalance 1.0e-6 10;
		algorithm Newton;
		integrator DisplacementControl $IDctrlNode $IDctrlDOF $Dincr;
		analysis Static;
		set ok 0
		set currentDisp 0.0
		while {$ok == 0 && $currentDisp < $Dmax} {
			set ok [analyze 1]
			if {$ok != 0} {
			test NormDispIncr 1.0e-6 1000 1
			algorithm Newton –initial
			set ok [analyze 1]
			test NormDispIncr 1.0e-6 10
			algorithm Newton
			} 
			set currentDisp [nodeDisp $IDctrlNode 1]
		}
		
		puts "node3disp: [nodeDisp 3 1], node4disp: [nodeDisp 4 1], node5disp: [nodeDisp 5 1]"
		puts "TargetDisp: $Dmax"
	} 	
		
############################################################################
#              Transient Analysis                			   			   #
############################################################################
	if {$analysisType == "dynamic"} { 
		puts "Running Transient analysis..."
	# record drift histories
		# drift recorder command: recorder Drift -file $filename -iNode $NodeI_ID -jNode $NodeJ_ID -dof $dof -perpDirn $Record.drift.perpendicular.to.this.direction
		recorder Drift -file "$dataDir/$subDir1/Drift.out" -iNode 1 -jNode 3 -dof 1 -perpDirn 2;
	# record forces and deformations of columns
		recorder Element -xml "$dataDir/$subDir2/Column_Force.out" -time -ele 11 12 force
		recorder Element -xml "$dataDir/$subDir2/Column_basDef.out" -time -ele 11 12 basicDeformation
	# record forces and deformations of beams
		recorder Element -xml "$dataDir/$subDir2/Beam_Force.out" -time -ele 21 22 force
		recorder Element -xml "$dataDir/$subDir2/Beam_basDef.out" -time -ele 21 22 basicDeformation
	# record reactions
		recorder Node -xml "$dataDir/$subDir2/Reaction.out" -time -node 1 2 -dof 1 2 3 reaction
	# record nodal displacements
		recorder Node -xml "$dataDir/$subDir2/dispT.out" -time -node 3 4 5 -dof 1 2 3 disp
	# record displacements at the middle nodes of braces
	set lst [list [expr 3100+$noEle/2+1] [expr 3200+$noEle/2+1]]
		eval recorder Node -xml "$dataDir/$subDir2/Braces_MN_Disp.out" -time -node $lst -dof 1 2 3 disp
	# record section forces and deformation at the middle of the braces
		eval recorder Element -xml "$dataDir/$subDir2/Brace_MN_ForceDeformation.out" -time -ele $lst section 1 forceAndDeformation
	# record stress-strain of the outer most fiber at the section at the middle of the element
		eval recorder Element -xml "$dataDir/$subDir2/Brace_MN_StressStrain8.out" -time -ele $lst section 1 fiber 8 stressStrain
		eval recorder Element -xml "$dataDir/$subDir2/Brace_MN_StressStrain29.out" -time -ele $lst section 1 fiber 29 stressStrain
	# record basic deformations of the middle brace element
		eval recorder Element -xml "$dataDir/$subDir2/Brace_MN_BasicDef.out" -time -ele $lst basicDeformation	
		
		source Dynamic.EQ.tcl
	}

	wipe
} 	