# @Brief: Large span truss span
# @Author: Mengsen.Wang
# @Date: 2020-10-23 18:57:22

# 6d616b65736d657369636b
# use m N Pa

reset
wipe

source LibLog.tcl

set model_name "LSTS"
set data_dir dir_$model_name
file mkdir data_dir

ModelInfo_Proc modelLog.txt

model basic -ndm 3 -ndf 6

source node.tcl
source section.tcl
source element.tcl
source gravity.tcl

recorder Node -file $data_dir/F_S_41.out -time -node 41 -dof 2 3 Disp
recorder Node -file $data_dir/F_S_42.out -time -node 42 -dof 2 3 Disp
recorder Node -file $data_dir/F_S_43.out -time -node 43 -dof 2 3 Disp
recorder Node -file $data_dir/F_S_44.out -time -node 44 -dof 2 3 Disp

constraints Transformation
numberer RCM
system BandSPD
test NormDispIncr 1.0e-6 6 2
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10

ModelInfo_Proc modelInfo.txt

wipe
reset