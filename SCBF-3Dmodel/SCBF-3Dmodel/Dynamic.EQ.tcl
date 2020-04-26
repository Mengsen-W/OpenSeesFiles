# ------------------------------------------------------------------------------
# Dynamic Earthquake Analysis
# Created by:  Vesna Terzic, UC Berkeley, 2011                               
# execute this file after you have built the model, and after you apply gravity
# ------------------------------------------------------------------------------

# source in procedures
	source ReadSMDfile.tcl;		# procedure for reading GM file and converting it to proper format

# Uniform Earthquake ground motion (uniform acceleration input at all support nodes)
	set GMdirection 1;								# ground-motion direction
	set GMfileH "Oak_2_50_20_FN" ;					# ground-motion filenames: horizntal component
	set GMfileV "Oak_2_50_20_UP" ;					# ground-motion filenames: vertical component
	set GMfact 1.5;									# ground-motion scaling factor

#############################################################################
#                     Define & Apply Damping
#############################################################################
# RAYLEIGH damping parameters 
# C=$alphaM*M + $betaKcurr*Kcurrent + $betaKcomm*KlastCommit + $beatKinit*$Kinitial

	set xDamp 0.03; # damping ratio
	set betaKcomm [expr 2.*$xDamp*$T1/(2.*$pi)];
	
	#assign tangent stifness proportional damping to columns, beams, braces and gusset plate of a braced frame
	region 1 -ele 11   12  -rayleigh 0. 0. 0. $betaKcomm;   #columns
	region 2 -ele 21   22  -rayleigh 0. 0. 0. $betaKcomm;   #beams
	set lastBraceEl [expr 3201+$noEle]
	region 3 -eleRange 3101 $lastBraceEl  -rayleigh 0. 0. 0. $betaKcomm; #braces
	if { $GP_Model == "GP" } {
		region 4 -eleRange 411  422  -rayleigh 0. 0. 0. $betaKcomm;  #gusset plates
	}

#################################################################################################
#  Perform Dynamic Ground-Motion Analysis for Horizonal and Vertical Componenet of Ground Motion
#################################################################################################
	# Uniform EXCITATION: acceleration input
	set IDloadTag 400;	# for uniform support excitation	
	set inFileH $GMfileH.acc
	set inFileV $GMfileV.acc
	set outFileH $GMfileH.g3
	set outFileV $GMfileV.g3
	ReadSMDFile $inFileH $outFileH dt nPt;		# call procedure to convert the horizontal ground-motion file
	ReadSMDFile $inFileV $outFileV dt nPt;		# call procedure to convert the vertical ground-motion file
	set GMfatt [expr $g*$GMfact];				# data in input file is in g Unifts -- ACCELERATION TH
	timeSeries Path 10 -dt $dt -filePath $outFileH -factor  $GMfatt;		# horizonatal time series information
	timeSeries Path 11 -dt $dt -filePath $outFileV -factor  $GMfatt;    	# veritcal time series information
	pattern UniformExcitation $IDloadTag $GMdirection -accel 10;			# create Unifform excitation for horizontal GM
	pattern UniformExcitation [expr $IDloadTag+1] 2 -accel 11; 				# create Unifform excitation for vertical GM 

	# record absolute floor accelerations
	recorder Node -file "$dataDir/$subDir1/FloorAcc.out" -time -timeSeries 10 -node 3 -dof 1 accel
	
	# define analysis objects and performe analysis
	set tFinal	[expr $dt*$nPt];	# maximum duration of ground-motion analysis
	constraints Plain
	numberer RCM
	system BandGeneral
	test NormDispIncr 1.0e-6 10  
	algorithm Newton
	integrator Newmark 0.5 0.25
	analysis Transient
	
	set deltaT 0.001
	set ok 0.0
	set currentTime 0.0
	while {$ok == 0 && $currentTime < $tFinal} {
		set ok [analyze 1 $deltaT]
		if {$ok != 0} {
			test NormDispIncr 1e-6 2000  
			algorithm Newton -initial 
			set ok [analyze 1 $deltaT]
			test NormDispIncr 1.0e-6 10  
			algorithm Newton
		}
	if {$ok != 0} {
			test NormDispIncr 1.0e-6 200 1
			algorithm NewtonLineSearch 0.8
			set ok [analyze 1 $deltaT]
			test NormDispIncr 1.0e-6 10 
			algorithm Newton	
		} 
		if {$ok != 0} {
			test NormDispIncr 1.0e-6 2000 
			algorithm Newton -initialThenCurrent
			set ok [analyze 1 $deltaT]
			test NormDispIncr 1.0e-6 10 
			algorithm Newton
		} 		
		set currentTime [getTime]
	}
	
	puts "Ground Motion Done. End Time: [getTime]. tFinal: $tFinal."