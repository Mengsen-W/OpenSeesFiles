puts "FiberSection"
section Fiber 1 {
fiber 2.5 5 50 4
fiber -2.5 5 50 4
fiber 2.5 -5 50 4
fiber -2.5 -5 50 4
fiber 7.5 5 50 4
fiber -7.5 5 50 4
fiber 7.5 -5 50 4
fiber -7.5 -5 50 4
fiber 12.5 5 50 4
fiber -12.5 5 50 4
fiber 12.5 -5 50 4
fiber -12.5 -5 50 4
fiber 17.5 5 50 4
fiber -17.5 5 50 4
fiber 17.5 -5 50 4
fiber -17.5 -5 50 4
fiber 2.5 15 50 4
fiber -2.5 15 50 4
fiber 2.5 -15 50 4
fiber -2.5 -15 50 4
fiber 7.5 15 50 4
fiber -7.5 15 50 4
fiber 7.5 -15 50 4
fiber -7.5 -15 50 4
fiber 12.5 15 50 4
fiber -12.5 15 50 4
fiber 12.5 -15 50 4
fiber -12.5 -15 50 4
fiber 17.5 15 50 4
fiber -17.5 15 50 4
fiber 17.5 -15 50 4
fiber -17.5 -15 50 4
fiber 2.5 25 50 4
fiber -2.5 25 50 4
fiber 2.5 -25 50 4
fiber -2.5 -25 50 4
fiber 7.5 25 50 4
fiber -7.5 25 50 4
fiber 7.5 -25 50 4
fiber -7.5 -25 50 4
fiber 12.5 25 50 4
fiber -12.5 25 50 4
fiber 12.5 -25 50 4
fiber -12.5 -25 50 4
fiber 17.5 25 50 4
fiber -17.5 25 50 4
fiber 17.5 -25 50 4
fiber -17.5 -25 50 4
fiber 2.5 35 50 4
fiber -2.5 35 50 4
fiber 2.5 -35 50 4
fiber -2.5 -35 50 4
fiber 7.5 35 50 4
fiber -7.5 35 50 4
fiber 7.5 -35 50 4
fiber -7.5 -35 50 4
fiber 12.5 35 50 4
fiber -12.5 35 50 4
fiber 12.5 -35 50 4
fiber -12.5 -35 50 4
fiber 17.5 35 50 4
fiber -17.5 35 50 4
fiber 17.5 -35 50 4
fiber -17.5 -35 50 4
fiber 15 -35 12.56 2
fiber 15 35 12.56 2
fiber -15 -35 12.56 2
fiber -15 35 12.56 2
}
#Beam Shear Stiffness
uniaxialMaterial Elastic 101 32E6
#Wall Shear Stiffness
uniaxialMaterial Elastic 102 1.44E8
section Aggregator 1001 101 Vy 101 Vz -section 1

geomTransf Linear 1

puts "Beams"
for {set Storey 2 } { $Storey <= 6 }  { incr Storey } {
set NodejTag [expr { int($Storey)} ]
set NodeiTag [expr { 100 +$NodejTag  } ] 
set ElementTag [expr { $NodeiTag }]
#element forceBeamColumn $ElementTag $NodejTag  $NodeiTag 1 "HingeRadau 1001 80 1001 80 1001"
 
element dispBeamColumn $ElementTag $NodejTag  $NodeiTag 5 1001 1
}


puts "RigidBeams_RightSide"
for {set Storey 2 } { $Storey <= 6 }  { incr Storey } {
set NodeiTag [expr { int($Storey) }]
set NodejTag [expr { int($Storey +10)  }]
set ElementTag [expr {110 + int($Storey)} ] 
element elasticBeamColumn $ElementTag $NodejTag  $NodeiTag 3E4 3E4 2E8 1
}


puts "RigidBeams_LeftSide"
for {set Storey 2 } { $Storey <= 6 }  { incr Storey } {
set NodeiTag [expr { int($Storey)  + 110}]
set NodejTag [expr { int($Storey) +100  }]
set ElementTag [expr {120 + int($Storey)} ] 
element elasticBeamColumn $ElementTag $NodejTag  $NodeiTag 3E4 3E4 2E8 1
}


puts "MVLEM_RightSide"
for {set Storey 1 } { $Storey <= 5 }  { incr Storey } {
set NodeiTag [expr { int($Storey) +10 }]
set NodejTag [expr { int($Storey + 1) +10 }]
set ElementTag [expr {int($Storey)} ]
#element MVLEM $ElementTag 0 $NodeiTag $NodejTag 5 0.4 -thick 80 80 80 80 80 80 -width 50 50 50 50 50 50 -rho 0.014 0.006 0.006 0.006 0.006 0.014 -matConcrete 3 3 3 3 3 3 -matSteel 1 2 2 2 2 1 -matShear 102
element SFI_MVLEM $ElementTag $NodeiTag $NodejTag 5 0.4 -thick 80 80 80 80 80 80 -width 50 50 50 50 50 50  -mat 6 7 7 7 6
}


puts "MVLEM_RightSide"
for {set Storey 1 } { $Storey <= 5 }  { incr Storey } {
set NodeiTag [expr { int($Storey) +110 }]
set NodejTag [expr { int($Storey + 1) +110 }]
set ElementTag [expr {int($Storey+5)} ]
element SFI_MVLEM $ElementTag $NodeiTag $NodejTag 5 0.4 -thick 80 80 80 80 80 80 -width 50 50 50 50 50 50  -mat 6 7 7 7 6
}
