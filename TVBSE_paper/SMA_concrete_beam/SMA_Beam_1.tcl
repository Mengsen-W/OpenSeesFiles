# Date: 2021-10-05
# Author: mengmei Zhang



#   /\ y
#    |
#    |
#     ----> x beam long directory
#   /
#  /
# /
#|/ z

# mm N

proc get_strain { address } {
  try {
    set fid [open $address r]
  } trap {POSIX ENOENT} {} {
    puts "failed to open"
    return 0
  }
  catch {seek $fid -$upperBoundLength end}
  set content [read -nonewline $fid]
  close $fid
  set lastline [lindex [split $content "\n"] end]
  return [lindex [split $lastline] end]
}

proc run { temperature } {
reset
wipe
puts "system basic setup ..."
model basic -ndm 3
puts "system basic setuped"

puts "node setup ..."
# beam node
node 1 0 0 0
node 2 125 0 0
node 3 825 0 0
node 4 1025 0 0
node 5 1225 0 0
node 6 1925 0 0
node 7 2050 0 0

#sma node
node 8 0 40 52.5
node 9 825 -110 52.5
node 10 1225 -110 52.5
node 11 2050 40 52.5

node 12 0 40 -52.5
node 13 825 -110 -52.5
node 14 1225 -110 -52.5
node 15 2050 40 -52.5
puts "node setuped"

puts "fix setup ..."
# fix 1 0 0 0 0 0 1
fix 2 1 1 0 0 1 0
# fix 3 0 0 0 0 0 1
# fix 4 0 0 0 0 0 1
# fix 5 0 0 0 0 0 1
fix 6 0 1 1 0 0 1
# fix 7 0 0 0 0 0 1

# 转向架只有x方向位移
fix 9 0 1 1 1 1 1 1
fix 10 0 1 1 1 1 1 1
fix 13 0 1 1 1 1 1 1
fix 14 0 1 1 1 1 1 1

# 刚性梁约束
rigidLink beam 1 8
rigidLink beam 3 9
rigidLink beam 5 10
rigidLink beam 7 11

rigidLink beam 1 12
rigidLink beam 3 13
rigidLink beam 5 14
rigidLink beam 7 15

puts "fix setuped"

puts "material setup ..."
set test_1 -0.568
set test_2 5.5e-5
set test_3 8210
# uniaxialMaterial Concrete02 1 -36.2 -0.0568 -3.78 -0.0033 5e-5 3.7 8120
uniaxialMaterial Concrete02 1 -36.2 $test_1  -3.78 -0.0033 5e-5 $test_2 $test_3
uniaxialMaterial Steel02 2 365.9 1.83e5 1e-15; #14 1.83e5
uniaxialMaterial Steel02 3 328.3 1.83e5 1e-15; #8
uniaxialMaterial SMA 4 1 $temperature 22e3 0.35 -698 53.46 79.9 48.39 29.99 22 0 0.05 0
puts "material setuped"

puts "section setup ..."
section Fiber 1 -GJ 1e15 {
    fiber 87.5 -25 1250 1
    fiber 87.5 25 1250 1
    fiber 71 -21 50.265 3
    fiber 71 21 50.265 3
    fiber 50 -12.5 1199.735 1
    fiber 50 12.5 1199.735 1
    fiber 0 -37.5 3750 1
    fiber 0 37.5 3750 1
    fiber 0 -12.5 1250 1
    fiber 0 12.5 1250 1
    fiber -50 -12.5 1096.062 1
    fiber -50 12.5 1096.062 1
    fiber -68 -18 153.938 2
    fiber -68 18 153.938 2
    # fiber -68 -18 153.938 3
    # fiber -68 18 153.938 3
    fiber -87.5 -25 1250 1
    fiber -87.5 25 1250 1
}
puts "section seted"

puts "elements setup ..."
geomTransf Linear 1 0 0 1
element dispBeamColumn 1 1 2 10 1 1
element dispBeamColumn 2 2 3 10 1 1
element dispBeamColumn 3 3 4 10 1 1
element dispBeamColumn 4 4 5 10 1 1
element dispBeamColumn 5 5 6 10 1 1
element dispBeamColumn 6 6 7 10 1 1

# sma
element truss 7 8 9 19.625 4
element truss 8 9 10 19.625 4
element truss 9 10 11 19.625 4

element truss 10 12 13 19.625 4
element truss 11 13 14 19.625 4
element truss 12 14 15 19.625 4
puts "elements setuped"

puts "recorder setup ..."
recorder Node -file output/deflection_SMA_Beam_1_$temperature.out -time -node 4 -dof 2 disp
# recorder Node -file output/force_SMA_Beam_1_$temperature.out -time -node 3 9 -dof 2 reaction
#recorder Node -file D:\\paper_data_from_me\\deflection_SMA_Beam_1.out -time -node 4 -dof 2 disp
puts "recorder seted"

puts "load setup ..."
pattern Plain 1 Linear {
    #load 4 0 -20000 0 0 0 0
    load 3 0 -10000 0 0 0 0
    load 5 0 -10000 0 0 0 0
}
puts "load setuped"

puts "analysis begin"
constraints Transformation
numberer Plain
system BandGeneral
test NormUnbalance 1e-5 200000
integrator LoadControl 1e-3
algorithm KrylovNewton
analysis Static
analyze 1000
puts "all of finished"

wipe
reset
}

set begin_temperature 80
set end_temperature 80
set step_temperature 2

for {set index 0} { $index < [expr ($end_temperature - $begin_temperature) / $step_temperature + 1] } { incr index } {
  set temperature [expr $begin_temperature + $index * $step_temperature]
  puts [format "temperature = %f begin" $temperature]
  run $temperature
}