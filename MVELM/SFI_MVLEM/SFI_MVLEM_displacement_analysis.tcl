# @Author: Mengsen.Wang
# @Date: 2020-09-15 16:11:22
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-15 16:11:22

# -----------------------------------------------------------------------------
# 施加位移控加载过程
# -----------------------------------------------------------------------------

puts "Model generated and gravity load applied successfully";

# 设置重力荷载为常量，并重置求解域时间
loadConst -time 0.0;

# 设置层间位移角系数为墙体高度
set Fact $H;

# 设置具有线性时间序列的位移加载模式

set Plateral 1.0; # 参考横向荷载
pattern Plain 200 "Linear" {
  load $IDctrlNode $Plateral 0.0 0.0
}

set load_step 1;

source LibAnalysisStaticParameters.tcl
source LibGeneratePeaks.tcl

# 格式化输出信息
set fmt1 "%s Cyclic analysis: CtrlNode %.3i, dof %.1i, Disp=%.4f %s";

foreach Dmax $iDmax {

	set iDstep [GeneratePeaks $Dmax $Dincr $CycleType $Fact];

	for {set i 1} {$i <= $Ncycles} {incr i 1} {
		set zeroD 0
		set D0 0.0
		foreach Dstep $iDstep {
			set D1 $Dstep
			set Dincr [expr $D1 - $D0]
			integrator DisplacementControl  $IDctrlNode $IDctrlDOF $Dincr
			analysis Static
			# 第一次计算
			set ok [analyze 1]
			# 如果未收敛
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
          # 全部失败后打印信息直接退出循环
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

# 当退出循环时会打印状态信息
if {$ok != 0 } {
	puts [format $fmt1 "PROBLEM" $IDctrlNode $IDctrlDOF [nodeDisp $IDctrlNode $IDctrlDOF] $LunitTXT]
} else {
	puts [format $fmt1 "DONE"  $IDctrlNode $IDctrlDOF [nodeDisp $IDctrlNode $IDctrlDOF] $LunitTXT]
}

# 打印作用点信息
print node $IDctrlNode