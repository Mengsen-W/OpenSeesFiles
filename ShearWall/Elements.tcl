# * @Coding: utf-8
# * @Descripition: Elements of model
# * @Author: Mengsen.Wang
# * @Date: 2020-02-12 19:21:36
# * @Last Modified time: 2020-02-12 19:21:36

puts "Beams"
geomTransf Linear 1 0 1 0
set ElementTag 1
for {set Storey 2 } { $Storey <= 6 }  { incr Storey } {
    set NodeiTag [expr { ($Storey + 10) * 100 + 2} ]
    set NodejTag [expr { ($Storey + 10) * 100 + 7 } ]
    set NodekTag [expr { $Storey * 100 + 7} ]
    set NodelTag [expr { $Storey * 100 + 2 } ]
    element ShellMITC4 $ElementTag $NodeiTag $NodejTag $NodekTag $NodelTag  3
    #element forceBeamColumn $ElementTag $NodejTag  $NodeiTag 1 "HingeRadau 1001 80 1001 80 1001"
    #element dispBeamColumn $ElementTag $NodeiTag  $NodejTag 5 1001 1
    incr ElementTag
    # element dispBeamColumn $ElementTag $NodekTag  $NodejTag 3 1001 1
    # incr ElementTag
}

for {set Storey 2 } { $Storey <= 6 }  { incr Storey } {
    set NodeiTag [expr { ($Storey + 10) * 100 + 7} ]
    set NodejTag [expr { ($Storey + 10) * 100 + 3 } ]
    set NodekTag [expr { $Storey * 100 + 3} ]
    set NodelTag [expr { $Storey * 100 + 7 } ]
    element ShellMITC4 $ElementTag $NodeiTag $NodejTag $NodekTag $NodelTag  3
    #element forceBeamColumn $ElementTag $NodejTag  $NodeiTag 1 "HingeRadau 1001 80 1001 80 1001"
    #element dispBeamColumn $ElementTag $NodeiTag  $NodejTag 5 1001 1
    incr ElementTag
    # element dispBeamColumn $ElementTag $NodekTag  $NodejTag 3 1001 1
    # incr ElementTag
}


# puts "RigidBeams_RightSide"
# for {set Storey 2 } { $Storey <= 6 }  { incr Storey } {
#     set NodeiTag [expr { $Storey * 100 + 3 }]
#     set NodejTag [expr { $Storey * 100 + 6  }]
#     element elasticBeamColumn $ElementTag $NodejTag  $NodeiTag 3E4 3E4 1.5E4  1E10 2E8 2E8 1
#     incr ElementTag
# }


# puts "RigidBeams_LeftSide"
# for {set Storey 2 } { $Storey <= 6 }  { incr Storey } {
#     set NodeiTag [expr { $Storey * 100 + 5 }]
#     set NodejTag [expr { $Storey * 100 + 2  }]
#     element elasticBeamColumn $ElementTag $NodejTag  $NodeiTag 3E4 3E4 1.5E4  1E10 2E8 2E8 1
#     incr ElementTag
# }

puts "Shell_RightSide"
##First Column
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr $Storey * 100 + 3]
    set nodej [expr $Storey * 100 + 6]
    set nodek [expr ($Storey + 6) * 100 + 6]
    set nodel [expr ($Storey + 6) * 100 + 3]
    set eleid [expr 100 + $Storey]
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr ($Storey + 6)  * 100 + 3]
    set nodej [expr ($Storey + 6) * 100 + 6]
    set nodek [expr ($Storey + 11) * 100 + 6]
    set nodel [expr ($Storey + 11) * 100 + 3]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}

for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr ($Storey + 11)  * 100 + 3]
    set nodej [expr ($Storey + 11) * 100 + 6]
    set nodek [expr ($Storey + 1) * 100 + 6]
    set nodel [expr ($Storey + 1) * 100 + 3]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
##Second Column
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr $Storey * 100 + 6]
    set nodej [expr $Storey * 100 + 4]
    set nodek [expr ($Storey + 6) * 100 + 4]
    set nodel [expr ($Storey + 6) * 100 + 6]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr ($Storey + 6)  * 100 + 6]
    set nodej [expr ($Storey + 6) * 100 + 4]
    set nodek [expr ($Storey + 11) * 100 + 4]
    set nodel [expr ($Storey + 11) * 100 + 6]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr ($Storey + 11)  * 100 + 6]
    set nodej [expr ($Storey + 11) * 100 + 4]
    set nodek [expr ($Storey + 1) * 100 + 4]
    set nodel [expr ($Storey + 1) * 100 + 6]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}

puts "Shell_LeftSide"
##First Column
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr $Storey * 100 + 1]
    set nodej [expr $Storey * 100 + 5]
    set nodek [expr ($Storey + 6) * 100 + 5]
    set nodel [expr ($Storey + 6) * 100 + 1]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr ($Storey + 6)  * 100 + 1]
    set nodej [expr ($Storey + 6) * 100 + 5]
    set nodek [expr ($Storey + 11) * 100 + 5]
    set nodel [expr ($Storey + 11) * 100 + 1]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr ($Storey + 11)  * 100 + 1]
    set nodej [expr ($Storey + 11) * 100 + 5]
    set nodek [expr ($Storey + 1) * 100 + 5]
    set nodel [expr ($Storey + 1) * 100 + 1]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
##Second Column
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr $Storey * 100 + 5]
    set nodej [expr $Storey * 100 + 2]
    set nodek [expr ($Storey + 6) * 100 + 2]
    set nodel [expr ($Storey + 6) * 100 + 5]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr ($Storey + 6)  * 100 + 5]
    set nodej [expr ($Storey + 6) * 100 + 2]
    set nodek [expr ($Storey + 11) * 100 + 2]
    set nodel [expr ($Storey + 11) * 100 + 5]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}
for {set Storey 1 } {$Storey <= 5} {incr Storey} {
    set nodei [expr ($Storey + 11)  * 100 + 5]
    set nodej [expr ($Storey + 11) * 100 + 2]
    set nodek [expr ($Storey + 1) * 100 + 2]
    set nodel [expr ($Storey + 1) * 100 + 5]
    incr eleid
    element ShellMITC4 $eleid $nodei $nodej $nodek $nodel 2
}

puts "Truss"
set As1 [expr $sro1 * 50 * 80]
set As2 [expr $sro2 * 50 * 80]
set TrussID 10000
for {set i 1 } {$i <= 5 } {incr i} {
    for {set ii 1 } {$ii <= 6 } {incr ii} {
        set nodei [expr $i * 100 + $ii]
        set nodej [expr ($i+6) * 100 + $ii]
        set nodek [expr ($i+1) * 100 + $ii]
        set nodel [expr ($i+11) * 100 + $ii]
        if { $ii <= 4} {
            element truss $TrussID $nodei $nodej $As1 1
            incr TrussID
            element truss $TrussID $nodej $nodel $As1 1
            incr TrussID
            element truss $TrussID $nodel $nodek $As1 1
            incr TrussID
        } else {
            element truss $TrussID $nodei $nodej $As1 2
            incr TrussID
            element truss $TrussID $nodej $nodel $As1 2
            incr TrussID
             element truss $TrussID $nodel $nodek $As1 2
            incr TrussID
        }
    }
}

for {set i 2 } {$i <= 6 } {incr i} {
    set NodeiTag [expr { ($i + 10) * 100 + 2} ]
    set NodejTag [expr { ($i + 10) * 100 + 7 } ]
    set NodekTag [expr { $i * 100 + 7} ]
    set NodelTag [expr { $i * 100 + 2 } ]
    element truss $TrussID $NodeiTag $NodejTag 25 2
    incr TrussID
    element truss $TrussID $NodelTag $NodekTag 25 2
    incr TrussID
}

for {set i 2 } {$i <= 6 } {incr i} {
    set NodeiTag [expr { ($i + 10) * 100 + 7} ]
    set NodejTag [expr { ($i + 10) * 100 + 3 } ]
    set NodekTag [expr { $i * 100 + 3} ]
    set NodelTag [expr { $i * 100 + 7 } ]
    element truss $TrussID $NodeiTag $NodejTag 25 2
    incr TrussID
    element truss $TrussID $NodelTag $NodekTag 25 2
    incr TrussID
}

#ModelInfo_Proc model.txt
puts "Gravity"
pattern Plain 1 Linear {
    load 602 0 0 -52500 0 0 0
    load 603 0 0 -52500 0 0 0
    for {set i 1 } {$i <= 5 } {incr i} {
        set LoadNode1 [expr $i * 100 + 2]
        set LoadNode2 [expr $i * 100 + 3]
        load $LoadNode1 0 0 -190 0 0 0
        load $LoadNode2 0 0 -190 0 0 0
    }
}
