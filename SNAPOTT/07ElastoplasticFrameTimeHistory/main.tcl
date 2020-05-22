# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-21 16:22:15
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-22 17:28:36
# @Description: Elastictoplastic frame time history

reset
wipe

source Cyclic.tcl

ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
source nodes.tcl

puts "mass"
source mass.tcl

puts "material"
source material.tcl

puts "section"
source section.tcl

puts "transformation"
source transformation.tcl

puts "element"
source elements.tcl

puts "recorder"
source recorder.tcl

puts "gravity"
source load.tcl

puts "Gravity analysis"
source gravity.tcl

puts "history time analysis"
source timehistory.tcl

ModelInfo_Proc modelInfo.log

wipe
reset