# @Author: Mengsen.Wang
# @Date: 2020-09-15 15:06:06
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-15 15:06:06

# 前处理部分 ---------------------------------------------------------------------

# ------------------------------------------------------------------------------
# 设置基本输出信息
# ------------------------------------------------------------------------------
set model_name "SP4";
set date_dir SFI_MVLEM_$model_name;
file makedir $date_dir;

# -----------------------------------------------------------------------------
# 创建模型空间，2维3自由度
# -----------------------------------------------------------------------------
model basic -ndm 2 -ndf 3;

# -----------------------------------------------------------------------------
# 设置墙体几何尺寸，节点信息，边界条件
# -----------------------------------------------------------------------------

# 墙体尺寸
set H 72; # 设置墙高
set t 6;  # 设置墙厚

# 创建节点
node 1 0 0;
node 2 0 12;
node 3 0 24;
node 4 0 40;
node 5 0 56;
node 6 0 $H;

# 边界条件
fix 1 1 1 1;  # 全约束 1节点

# 设置作用节点和自由度
set IDctrlNode 6; # 施加作用节点号
set IDctrlDOF 1;  # 施加作用节点自由度编号

# -----------------------------------------------------------------------------
# 定义单轴材料
# -----------------------------------------------------------------------------

# 钢筋部分
# uniaxialMaterial SteelMPF $mattag  $fyp  $fyn  $E0  $bp  $bn   $R0  $a1  $a2

# steel X
set fyX 58.4103;	# fy
set bx 0.01; 		  # strain hardening

# steel Y web
set fyYw 58.4103; 	# fy
set byw 0.01; 		  # strain hardening

# steel Y boundary
set fyYb 69.0; 		# fy
set byb 0.002; 		# strain hardening

# steel misc
set Esy 29000.0; 	# Young's modulus
set Esx $Esy; 		# Young's modulus
set R0 20.0; 		  # initial value of curvature parameter
set A1 0.925;		  # curvature degradation parameter
set A2 0.15;		  # curvature degradation parameter

# Build steel materials
uniaxialMaterial    SteelMPF  1 $fyX $fyX $Esx $bx $bx $R0 $A1 $A2; 	  # steel X
uniaxialMaterial    SteelMPF  2 $fyYw $fyYw $Esy $byw $byw $R0 $A1 $A2; # steel Y web
uniaxialMaterial    SteelMPF  3 $fyYb $fyYb $Esy $byb $byb $R0 $A1 $A2; # steel Y boundary

# 混凝土部分
# uniaxialMaterial ConcreteCM $mattag  $fpcc  $epcc  $Ec  $rc  $xcrn   $ft  $et  $rt   $xcrp <-GapClose $gap>

# unconfined
set fpc 8.09; 		  # peak compressive stress
set ec0 -0.002371;	# strain at peak compressive stress
set ft 0.335798;	  # peak tensile stress
set et 0.00008;		  # strain at peak tensile stress
set Ec 5403.2172; 	# Young's modulus
set xcrnu 1.022;	  # cracking strain - compression
set xcrp 10000;		  # cracking strain - tension
set ru 15;		  	  # shape parameter - compression
set rt 1.2;			    # shape parameter - tension

# confined
set fpcc 10.479723; # peak compressive stress
set ec0c -0.005873; # strain at peak compressive stress
set Ecc 5953.9187; 	# Young's modulus
set xcrnc 1.023;	  # cracking strain - compression
set rc 12.072964;	  # shape parameter - compression

# Build concrete materials
uniaxialMaterial ConcreteCM 4 -$fpc   $ec0   $Ec  $ru  $xcrnu  $ft  $et  $rt  $xcrp -GapClose 0; # unconfined concrete
uniaxialMaterial ConcreteCM 5 -$fpcc  $ec0c  $Ecc $rc  $xcrnc  $ft  $et  $rt  $xcrp -GapClose 0; # confined concrete

# -----------------------------------------------------------------------------
# 定义FSAM多维材料
# -----------------------------------------------------------------------------

# Reinforcing ratios
# nDMaterial FSAM $mattag   $rho  $sX  $sY  $conc  $rouX  $rouY  $nu  $alfadow
set rouXw 0.0074; 	# X web
set rouXb 0.0082; 	# X boundary
set rouYw 0.0074; 	# Y web
set rouYb 0.0587; 	# Y boundary

# Shear resisting mechanism parameters
set nu 0.2; 		    # friction coefficient
set alfadow 0.012; 	# dowel action stiffness parameter

nDMaterial FSAM         6    0.0   1     2     4  $rouXw $rouYw  $nu  $alfadow; # Web (unconfined concrete)
nDMaterial FSAM         7    0.0   1     3     5  $rouXb $rouYb  $nu  $alfadow; # Boundary (confined concrete only)


# -----------------------------------------------------------------------------
# 定义单元
# -----------------------------------------------------------------------------

# element SFI_MVLEM eleTag iNode jNode m c -thick fiberThick -width fiberWidth -mat matTags
element SFI_MVLEM  1  1  2 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM  2  2  3 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM  3  3  4 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM  4  4  5 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7
element SFI_MVLEM  5  5  6 5 0.4 -thick $t $t $t $t $t -width 9 10 10 10 9 -mat 7 6 6 6 7

# -----------------------------------------------------------------------------
# 定义荷载
# -----------------------------------------------------------------------------

# 定义轴压力
set N [expr 149.0];

# 创建线性重力荷载模式和线性时间序列
pattern Plain 1 "Linear" {
  # load nodeID xForce yForce xyMoment
  load $IDctrlNode 0.0 [expr -$N] 0.0
}


# 由层间位移角定义位移控制加载形式
set iDmax "0.001 0.0025 0.005 0.0075 0.01 0.015 0.02 0.03";
set Dincr 0.015;		  # 位移控加载增量步
set CycleType Full;		# 滞回加载方式
set Ncycles 2;			  # 指定每个峰值的周期数
set Tol 1.0e-5;
set LunitTXT "inch";

# 模型建立完毕，前处理完毕 ---------------------------------------------------------

# 后处理部分 ---------------------------------------------------------------------

# 设置记录器
source SFI_MVLEM_recorder.tcl;
