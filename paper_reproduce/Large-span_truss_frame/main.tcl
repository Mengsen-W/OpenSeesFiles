# @Brief: Large span truss span
# @Author: Mengsen.Wang
# @Date: 2020-10-23 18:57:22

# 6d616b65736d657369636b
# use m N Pa

reset
wipe

source LibLog.tcl

set model_name "LSTS"
ModelInfo_Proc modelLog.txt

model basic -ndm 3 -ndf 6

source pre.tcl
source gravity.tcl

constraints Plain
numberer RCM
system FullGeneral
test NormDispIncr 1 10000000 1
algorithm KrylovNewton
integrator LoadControl 0.1
analysis Static
analyze 10000000

# printA -file matrix2.txt
# ModelInfo_Proc modelInfo.txt

wipe
reset