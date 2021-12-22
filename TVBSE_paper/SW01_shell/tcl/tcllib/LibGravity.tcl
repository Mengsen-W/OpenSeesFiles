# @Author: Mengsen.Wang
# @Date: 2020-09-15 16:54:33
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-15 17:37:33

############################################
# ATTENTION PLEASE                         #
# This lib with GNU General Public License #
# Author mail: mengsen_wang@163.com        #
############################################

proc Gravity_Proc { step } {
  # step: step of Gravity load times
  # 加载重力荷载的分析步数
  set incr [expr 1./$step]
  constraints Transformation
  numberer RCM
  system UmfPack
  test NormDispIncr 1.0e-6 200 0
  integrator LoadControl $incr
  algorithm BFGS -count 100
  analysis Static
  analyze $step
  loadConst -time 0.0
}