# * @Coding: utf-8
# * @Descripition: function of Cyclic
# * @Author: Mengsen.Wang
# * @Date: 2020-02-11 21:33:52
# * @Last Modified Time: 2020-03-06 16:40:53

#Ddelta: Displacement increment of each cyclic loading
#每一个循环圈的位移增量
#Dnum: Number of cyclic loading times
#循环的总圈数
#Dincr: Displacement increment in each analyze step
#每一圈循环的增量步
#Node: Node which applied displacment
#dof: Direction of cyclic loading
#tol: the tolerance criteria used to check for convergence
#iter: the max number of iterations to check before returning failure condition
#u:Maxmini of cyclic displacment
#每一圈循环的最大位移
#negdel: reverse of Dincr of cyclic increment step
#每圈的反向增量步
#u/Dincr: number of direction cyclic step
#一个方向的最大增量步步数
#2 * u/Dincr: reverse direction cyclic step
#反向加载的步数 因为要先回到远点再向负方向加载

proc Cyclic_Function { Ddelta Dnum Dincr Node dof tol iter } {
    constraints Transformation
    numberer RCM
    system UmfPack
    test NormDispIncr $tol $iter 0
    analysis Static
    for {set ii 1} {$ii <=$Dnum} {incr ii} {
        set u [expr $Ddelta*$ii]
        set negdel [expr $Dincr * -1]
	    puts "$ii Cyclic of Displacement, Plus of Displacement..."
        integrator DisplacementControl $Node $dof $Dincr
        Analysis_Proc [expr int($u/$Dincr)]
	    puts "$ii Cyclic of Displacement, Minus of Displacement..."
        integrator DisplacementControl $Node $dof $negdel
        Analysis_Proc [expr int(2*$u/$Dincr)]
	    puts "$ii Cyclic of Displacement, Back to Zero..."
        integrator DisplacementControl $Node $dof $Dincr
        Analysis_Proc [expr int($u/$Dincr)]
    }
}

#默认Newton → Newton -initila → Broyden → NewtonWithLineSearch
#Num: the number of analyze step
#分析步数
#analyze if successful return 0
#if NOT successful return < 0
proc Analysis_Proc { Num } {
    for {set step 1} {$step <=$Num} {incr step} {
        puts "No. $step of Cyclic. Anaylsis KrylovNewton.."
        algorithm KrylovNewton
        set ok [analyze 1]

        # if {$ok != 0} {
        # puts "NO. $step of Cyclic.Anaylsis Trying SecantNewton .."
        # algorithm SecantNewton
        # set ok [analyze 1]
        # }

        # if {$ok != 0} {
        # puts "No. $step of Cyclic.Anaylsis Trying ModifiedNewton .."
        # algorithm ModifiedNewton
        # set ok [analyze 1]
        # }

        # if {$ok != 0} {
        # 	puts "NO. $step of Cyclic. Anaylsis Trying NewtonWithLineSearch .."
        # 	algorithm NewtonLineSearch
        # 	set ok [analyze 1]
        # }

        # if {$ok != 0} {
        # puts "No. $step of Cyclic.Anaylsis Trying Newton .."
        # algorithm Newton
        # set ok [analyze 1]
        # }

        # if {$ok != 0} {
        # 	puts "No. $step of Cyclic.Anaylsis Trying BFGS .."
        # 	algorithm BFGS
        # 	set ok [analyze 1]
        # }

        if {$ok != 0} {
            puts "No. $step of Cyclic. Anaylsis Trying Broyden .."
            algorithm Broyden 500
            set ok [analyze 1]
        }

        if {$ok != 0} {
            puts "No. $step of Cyclic. Analysis Convergence Failure!\n"
        }
	}
}

#FileNme：File name
#存储单元、节点信息的文件名
proc ModelInfo_Proc { FileName } {
    logFile $FileName
    print -node
    print -ele
    getTime
}


#step: step of Gravity load times
#加载重力荷载的分析步数
proc Gravity_Proc { step } {
    set incr [expr 1./$step]
    constraints Transformation
    numberer RCM
    system UmfPack
    test NormDispIncr 1.0e-6 200 0
    integrator LoadControl $incr
    algorithm BFGS -count 100
    analysis Static
    analyze $step
    puts "\nGravity Done."
    loadConst -time 0.0
}
