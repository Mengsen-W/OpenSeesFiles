# ----------------------------------------------------
# Displacement Controlled Analysis
# ----------------------------------------------------

source gravity.tcl

puts "Model generated and gravity load applied successfully";

# Set the gravity loads to be constant & reset the time in the domain
loadConst -time 0.0

set Fact $H;	# scale drift ratio by storey height for displacement cycles

# Set lateral load pattern with a Linear TimeSeries
set Plateral 1.0;		# Reference lateral load	
pattern Plain 200 "Linear" {

	load $IDctrlNode $Plateral 0.0 0.0
}

set load_step 1;

# set up analysis parameters
source LibAnalysisStaticParameters.tcl;	# constraintsHandler,DOFnumberer,system-ofequations,convergenceTest,solutionAlgorithm,integrator

#  perform Static Cyclic Displacements Analysis
source LibGeneratePeaks.tcl

set fmt1 "%s Cyclic analysis: CtrlNode %.3i, dof %.1i, Disp=%.4f %s";	# format for screen/file output of DONE/PROBLEM analysis

foreach Dmax $iDmax {

	set iDstep [GeneratePeaks $Dmax $Dincr $CycleType $Fact];	# this proc is defined above

	for {set i 1} {$i <= $Ncycles} {incr i 1} {
		
		set zeroD 0
		set D0 0.0 
		foreach Dstep $iDstep {
			set D1 $Dstep
			set Dincr [expr $D1 - $D0]
			integrator DisplacementControl  $IDctrlNode $IDctrlDOF $Dincr
			analysis Static
			# ----------------------------------------------first analyze command------------------------
			set ok [analyze 1]
			# ----------------------------------------------if convergence failure-------------------------
			if {$ok != 0} {
				# if analysis fails, we try some other stuff
				# performance is slower inside this loop	global maxNumIterStatic;# max no. of iterations performed before "failure to converge" is ret'd
				if {$ok != 0} {
					puts "Trying Newton with Initial Tangent .."
					test NormDispIncr   $Tol 2000 0
					algorithm Newton -initial
					set ok [analyze 1]
					test $testTypeStatic $TolStatic      $maxNumIterStatic    0
					algorithm $algorithmTypeStatic 500 1
				}
				if {$ok != 0} {
					puts "Trying Broyden .."
					algorithm Broyden 500
					set ok [analyze 1 ]
					algorithm $algorithmTypeStatic
				}
				if {$ok != 0} {
					set putout [format $fmt1 "PROBLEM" $IDctrlNode $IDctrlDOF [nodeDisp $IDctrlNode $IDctrlDOF] $LunitTXT]
					puts $putout
					return -1
				}; # end if
			}; # end if
			# -----------------------------------------------------------------------------------------------------
			set D0 $D1;			# move to next step

			# print load step on the screen
			puts "Load Step: [expr $load_step]"
			set load_step [expr $load_step+1]

		}; # end Dstep

	};	# end i
		
};	# end of iDmaxCycl
# -----------------------------------------------------------------------------------------------------
if {$ok != 0 } {
	puts [format $fmt1 "PROBLEM" $IDctrlNode $IDctrlDOF [nodeDisp $IDctrlNode $IDctrlDOF] $LunitTXT]
} else {
	puts [format $fmt1 "DONE"  $IDctrlNode $IDctrlDOF [nodeDisp $IDctrlNode $IDctrlDOF] $LunitTXT]
}

# Print the state at control node
print node $IDctrlNode