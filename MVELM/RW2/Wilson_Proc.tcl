#---------------------------------------------------------
#微信公众号：结构乌托邦
#公众号微信号：Wilson_Struct
#---------------------------------------------------------

#Ddelta：Displacement increment of each cyclic loading. （每次低周往复加载的位移增量）
#Dnum：Number of cyclic loading times. （低周往复加载次数）
#Dincr：Displacement increment in each step.（分析步的位移增量）
#Node：Node which applied displacment. （施加位移的节点）
#dof：Direction of cyclic loading. （施加位移的方向）

proc Cyclic_Proc { Ddelta Dnum Dincr Node dof tol iter } {
	constraints Transformation
	numberer RCM
	#system UmfPack
	system BandGeneral;
	test NormDispIncr $tol $iter
	#algorithm NewtonLineSearch 
	algorithm KrylovNewton;	
	analysis Static
	for {set ii 1} {$ii <=$Dnum} {incr ii} {
		set u [expr $Ddelta*$ii]
		set negdel [expr $Dincr * -1]
		integrator DisplacementControl $Node $dof $Dincr;
		Analysis_Proc [expr int($u/$Dincr)]
		integrator DisplacementControl $Node $dof $negdel;
		Analysis_Proc [expr int(2*$u/$Dincr)]
		integrator DisplacementControl $Node $dof $Dincr;
		Analysis_Proc [expr int($u/$Dincr)]
	}
}

#默认Newton → Newton -initila → Broyden → NewtonWithLineSearch
#Num：分析步数
proc Analysis_Proc { Num } {
	for {set step 1} {$step <=$Num} {incr step} {
		#初始为Newton法（切线）
		algorithm Newton -initial
		set ok [analyze 1]
		#收敛失败，尝试使用Broyden
		if {$ok != 0} {
			puts "Trying Broyden .."
			algorithm Broyden 300
			set ok [analyze 1]
			algorithm Newton
		}
		#收敛失败，尝试使用NewtonWithLineSearch
		if {$ok != 0} {
			puts "Trying NewtonWithLineSearch .."
			algorithm NewtonLineSearch 0.8
			set ok [analyze 1]
			algorithm Newton
		}
		if {$ok != 0} {
			puts "Convergence Failure!"
		}
	}
}

proc Gravity_Proc { step } {
	set incr [expr 1./$step]	
	constraints Transformation
	numberer RCM
	system UmfPack
	test EnergyIncr 1.0e-6 200
	integrator LoadControl $incr
	algorithm Newton
	analysis Static
	analyze $step
	puts "Gravity Done."
	loadConst -time 0.0
}




