# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-21 14:54:04
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-21 15:04:44
# @Description: Frame Modal Analysis

reset
wipe

source Cyclic.tcl

ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
source nodes.tcl

puts "material"
source material.tcl

puts "transformation"
source transformation.tcl
puts "element"
source elements.tcl

puts "recorder"
source recorder.tcl

set numModes 12
# analysis Modal save to lambda array
set lambda [eigen  $numModes]
set period "output/Periods.txt"
# open file
set Periods [open $period "w"]
# write in file
puts $Periods " $lambda"
close $Periods
# recoder in file
record

ModelInfo_Proc modelInfo.log
