# @Author: Mengsen.Wang
# @Date: 2020-06-16 15:59:35
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-06-16 16:14:37
# @Description: Influence line

source Cyclic.tcl
ModelInfo_Proc model_log.log
set num 604
while {$num<681} {
  wipe
  puts "System"
  model basic -ndm 3 -ndf 6

  puts "nodes"
  source nodes.tcl

  puts "material"
  source material.tcl

  puts "section"
  source section.tcl

  puts "transformation"
  source transformation.tcl

  puts "element"
  source elements.tcl

  puts "recorder"
  set filename1 "output/Ele1-$num.out"
  set filename374 "output/Ele374-$num.out"
  set filename641 "output/Ele641-$num.out"
  recorder Element -file $filename1 -time -ele 1 localForce
  recorder Element -file $filename374 -time -ele 374 localForce
  recorder Element -file $filename641 -time -ele 641 localForce

  puts "Loading At Node: $num"
  pattern Plain $num Linear {
  load $num 0.000E+000 0.000E+000 -1.000E+000 0.000E+000 0.000E+000 0.000E+000
  }

  constraints Plain
  numberer Plain
  system BandGeneral
  test EnergyIncr 1.0e-6 200
  algorithm Newton
  integrator LoadControl 1.000E+000
  analysis Static
  analyze 1
  set num [expr {$num + 1}]
}

ModelInfo_Proc model_info.log

wipe
reset





