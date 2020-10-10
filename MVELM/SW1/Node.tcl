puts "Nodes"

for {set Storey 1 } { $Storey <= 6 }  { incr Storey } {

set NodeTag1 [expr { int($Storey) }]
set NodeTag2 [expr { int($Storey +10)  }]
set NodeTag3 [expr { 100 +$NodeTag1  } ] 
set NodeTag4 [expr { 100 +$NodeTag2  } ] 

set Nodey [expr { ($Storey - 1) * 300 }]
set Nodex1 90 ; set Nodex2 240 ;
set Nodex3 [expr { $Nodex1 * -1 }]  
set Nodex4 [expr { $Nodex2 * -1 }]  

node $NodeTag1 $Nodex1 $Nodey
node $NodeTag2 $Nodex2 $Nodey
node $NodeTag3 $Nodex3 $Nodey
node $NodeTag4 $Nodex4 $Nodey
}


puts "Constraint"
fix 1 1 1 1
fix 11 1 1 1
fix 101 1 1 1
fix 111 1 1 1