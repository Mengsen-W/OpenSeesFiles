# @Author: Mengsen.Wang
# @Date: 2020-09-15 15:52:35
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-15 15:52:35

# 引用前处理信息
source SFI_MVLEM_SP4.tcl

# -----------------------------------------------------------------------------
# 施加重力荷载
# -----------------------------------------------------------------------------

# 创建荷载方案，采用力控制加荷方法，共有10步迭代
integrator LoadControl 0.1

# 创建矩阵保存方法
system BandGeneral

# 创建收敛性测试，残差容许值为 1.0-5，最大失败迭代步为 100
test NormDispIncr $Tol  100 0

# 创建自由度矩阵构建方式为 RCM
numberer RCM

# 创建施加约束的方法
constraints Transformation

# 创建迭代算法为 Newton
algorithm Newton

# 创建分析对象
analysis 	Static

# 开始分析
analyze 10