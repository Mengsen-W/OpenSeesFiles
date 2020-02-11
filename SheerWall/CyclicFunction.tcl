# * @Coding: utf-8
# * @Descripition: function of Cyclic
# * @Author: Mengsen.Wang
# * @Date: 2020-02-11 21:33:52

proc Cyclic_Function { Ddelta Dnum Dincr Node dof tol iter } {

    #Ddelta: Displacement increment of each cyclic loading
    #Dnum: Number of cyclic loading times
    #Dincr: Displacement increment in each analyze step
    #Node: Node which applied displacment
    #dof: Direction of cyclic loading
    #tol: the tolerance criteria used to check for convergence
    #iter: the max number of iterations to check before returning failure condition

    constraints Transformation
    numberer RCM
    system UmfPack
    test NormDispIncr $tol $iter 0
    analysis Static
    for {set ii 1} {$ii <=$Dnum} {incr ii} {
        set u [expr $Ddelta*$ii]
        set negdel [expr $Dincr * -1]
        integrator DisplacementControl $Node $dof $Dincr
        Analysis_Proc [expr int($u/$Dincr)]
        integrator DisplacementControl $Node $dof $negdel
        Analysis_Proc [expr int(2*$u/$Dincr)]
        integrator DisplacementControl $Node $dof $Dincr
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
		#if {$ok != 0} {
			#puts "Trying Broyden .."
			#algorithm Broyden 500
			#set ok [analyze 1]
			#algorithm Newton
		#}
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

