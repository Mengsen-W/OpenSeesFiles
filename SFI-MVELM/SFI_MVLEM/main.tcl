# @Author: Mengsen.Wang
# @Date: 2020-09-15 17:14:02
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-15 17:14:02

reset
wipe

source Cyclic.tcl
ModelInfo_Proc modelLog.log

source SFI_MVLEM_SP4.tcl
source SFI_MVLEM_gravity_analysis.tcl
source SFI_MVLEM_displacement_analysis.tcl

puts "\nAll of End\n"
ModelInfo_Proc modelInfo.txt

wipe
reset
