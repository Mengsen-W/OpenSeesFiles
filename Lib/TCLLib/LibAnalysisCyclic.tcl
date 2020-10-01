# @Author: Mengsen.Wang
# @Date: 2020-09-15 16:54:33
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-15 17:37:33

############################################
# ATTENTION PLEASE                         #
# This lib with GNU General Public License #
# Author mail: mengsen_wang@163.com        #
############################################



proc CyclicDisplace { Ddelta Dnum Dincr Node dof tol iter } {
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

proc Analysis_Proc { Num } {
  # default: Newton → Newton -initila → Broyden → NewtonWithLineSearch
  # Num: the number of analyze step
  # analyze if successful return 0
  # if NOT successful return < 0
  for {set step 1} {$step <=$Num} {incr step} {
    puts "No. $step of Cyclic. Anaylsis KrylovNewton.."
    algorithm KrylovNewton -maxDim 10
    set ok [analyze 1]

    if {$ok != 0} {
    puts "No. $step of Cyclic.Anaylsis Trying Newton .."
    algorithm Newton
    set ok [analyze 1]
    }

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
    puts "No. $step of Cyclic.Anaylsis Trying Newton .."
    algorithm Newton
    set ok [analyze 1]
    }

    if {$ok != 0} {
        puts "No. $step of Cyclic. Analysis Convergence Failure!\n"
    }
  }
}