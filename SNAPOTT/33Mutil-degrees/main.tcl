# @Author: Mengsen.Wang
# @Date: 2020-06-18 17:50:54
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-18 17:50:54
# @Description: Lateral multi - freedom simplified model

reset
wipe

source Cyclic.tcl
ModelInfo_Proc model_log.log

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
source nodes.tcl

puts "material"

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
source recorder.tcl

set numModes 10
set lambda [eigen  $numModes]
puts $lambda
set period "output/Periods.txt"
set Periods [open $period "w"]
puts $Periods " $lambda"
close $Periods
record

ModelInfo_Proc model_info.log

wipe
reset