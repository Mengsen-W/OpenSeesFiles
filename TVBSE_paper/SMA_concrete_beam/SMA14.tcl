# @Date: 2021-03-12 14:33:06
# @Author: Mengmei Zhang
# @LastEditors: Mengmei Zhang
# @LastEditTime: 2021-03-23 09:11:23
# @Description: SMA used in 2d-beam

# 单位 米(m) 牛顿(N) 帕斯卡(Pa)

#             +             4
#             8
#       +           +       2
#       6           7
# + --- + --- + --- + --- + 0 SMA
# 1     2     3     4     5
#    1     1     1     1

proc run {temperature} {
  reset
  wipe
  puts "system"
  model basic -ndm 2 -ndf 3

  puts "node"
  node 1 0.0 0.0
  node 2 1 0.0
  node 3 3 0.0

  puts "fix"
  fix 1 1 1 1
  fix 3 1 1 1

  puts "material"
  # uniaxialMaterial SMA tag heating_state temperature E theta omega As Af Ms Mf initial_temperature prestress prestrain optimal_prestrain
  uniaxialMaterial SMA 2 1 $temperature 11.2e9 3e5 -472e6 80 170 120 30 14 17.49e6 0.1 0.1
  uniaxialMaterial Elastic 1 206e9

  puts "section"
  section Fiber 2 -GJ 1 {
    # SMA φ6
    patch circ 2 9 9 0.0 0.0 0 0.003 0 360
  }
  section Fiber 1 -GJ 1 {
    patch circ 1 9 9 0.0 0.0 0 0.003 0 360
  }

  #element dispBeamColumn $eleTag $iNode $jNode $numIntgrPts -sections $secTag1
  #$secTag2 ... $transfTag <-mass $massDens> <-cMass> <-integration $intType>
  puts "elements"
  geomTransf Linear 1
  set intType "Legendre"
  element dispBeamColumn 1 1 2 9 2 1 -integration $intType
  element dispBeamColumn 2 2 3 9 1 1 -integration $intType

  puts "recorder"
  recorder Element -file ele_fixed_all_$temperature.out -time -element 1 section 2 fiber 0.0 0.0 stressStrain

  puts "loading"
  pattern Plain 1 Linear {
    load 3 1 0 0
  }

  puts "analysis"
  constraints Plain
  numberer RCM
  test NormDispIncr 1e-3 1000 0
  algorithm KrylovNewton
  system UmfPack
  integrator LoadControl 1e-4
  analysis Static
  analyze 1000

  wipe
  reset
}

set begin_temperature 14
set end_temperature 192
set step_temperature 1

for {set index 0} { $index < [expr ($end_temperature - $begin_temperature) / $step_temperature + 1] } { incr index } {
  set temperature [expr $begin_temperature + $index * $step_temperature]
  puts [format "temperature = %f" $temperature]
  run $temperature
}
