#---------------------------------------------------------
#微信公众号：结构乌托邦
#公众号微信号：Wilson_Struct
#Cyclic_Proc：低周往复加载函数，可自动更换迭代方法
#---------------------------------------------------------

#Ddelta：Displacement increment of each cyclic loading. （每次低周往复加载的位移增量）
#Dnum：Number of cyclic loading times. （低周往复加载次数）
#Dincr：Displacement increment in each step.（分析步的位移增量）
#Node：Node which applied displacment. （施加位移的节点）
#dof：Direction of cyclic loading. （施加位移的方向）
#

proc Cyclic_Proc { Ddelta Dnum Dincr Node dof tol iter } {
	constraints Transformation
	numberer RCM
	system UmfPack
	test NormDispIncr $tol $iter 0	
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
		algorithm KrylovNewton
		set ok [analyze 1]
		#收敛失败，尝试使用Broyden
		if {$ok != 0} {
			puts "Trying Broyden .."
			algorithm Broyden 500
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

#FileNme：File name. （存储单元、节点信息的文件名）
proc ModelInfo_Proc { FileName } {
	logFile $FileName
	print -node
	print -ele
	wipe
}

proc Mode_Proc { ModeNum } {
	set pi 3.1415926
	set lambda [eigen -fullGenLapack  $ModeNum]
	set period "Periods.txt"
	set Periods [open $period "w"]
	set i 1
	foreach lam $lambda {
		set period [expr 2*$pi / sqrt($lam)]
		set period [format "%.3f" $period]
		set str "Mode "; append str $i; append str ": "; append str $period
		puts $Periods "$str"; puts "$str"
		incr i
	}
	close $Periods
	record
}

proc Rayleigh_Proc { Mode1 Mode2 Damp } {
	set lambdaN [eigen -fullGenLapack [expr $Mode2]]
	set lambdaI [lindex $lambdaN [expr $Mode1-1]]
	set lambdaJ [lindex $lambdaN [expr $Mode2-1]]
	set omegaI [expr pow($lambdaI,0.5)]
	set omegaJ [expr pow($lambdaJ,0.5)]
	set alphaM [expr $Damp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)]
	set betaKcurr [expr 2.*$Damp/($omegaI+$omegaJ)]
	rayleigh $alphaM $betaKcurr 0 0
	puts "Rayleigh Damping Defined"
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

proc GMDefine_Proc { LoadTag GMFileList GMDirList GMFactList dt } {
	foreach GMFile $GMFileList GMDir $GMDirList GMFact $GMFactList {
		set AccelSeries "Series -dt $dt -filePath $GMFile -factor $GMFact"
		pattern UniformExcitation $LoadTag $GMDir -accel $AccelSeries
		incr LoadTag
		puts "Earthquake Defined"
	}
}

proc GMDefine_Proc3 { dt LoadTag a } {
	set drname "GM/GM"
	set gmxname $drname; append gmxname "$a"; append gmxname "-X.txt"
	set gmyname $drname; append gmyname "$a"; append gmyname "-Y.txt"

	set AccelSeries "Series -dt $dt -filePath $gmxname -factor 9.8E3"
	pattern UniformExcitation $LoadTag 1 -accel $AccelSeries
	incr LoadTag
	set AccelSeries "Series -dt $dt -filePath $gmyname -factor 9.8E3"
	pattern UniformExcitation $LoadTag 2 -accel $AccelSeries
}




