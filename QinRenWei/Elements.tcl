# * @coding = utf-8
# * @Decription: Elements
# * @Author: Mengsen.Wang
# * @Date: 2020-02-14 16:27:40
# * @Last Modified time: 2020-02-14 16:27:40

## ----- shell -----
# center of shear wall
for { set i 1 } { $i < 26 } { incr i } {
    for { set j 5 } { $j < 11 } { incr j } {
        set nodelTagi [expr $i * 100 + $j]
        set nodelTagj [expr $i * 100 + ($j + 1)]
        set nodelTagk [expr ($i + 1) * 100 + $j]
        set nodelTagl [expr ($i + 1) * 100 + ($j + 1)]
        set eleTag [expr $i * 100 + $j]
        element ShellMITC4 $eleTag $nodelTagi $nodelTagj $nodelTagl $nodelTagk 2
    }
}

# band constraint zone
for { set i 1} { $i < 26} { incr i } {
    for { set j 1 } { $j < 5 } { incr j } {
        set nodelTagi [expr $i * 100 + $j]
        set nodelTagj [expr $i * 100 + ($j + 1)]
        set nodelTagk [expr ($i + 1) *100 + $j]
        set nodelTagl [expr ($i + 1) *100 + ($j + 1)]
        set eleTag [expr $i * 100 + $j]
        element ShellMITC4 $eleTag $nodelTagi $nodelTagj $nodelTagl $nodelTagk 1
    }
}

for { set i 1} { $i < 26} { incr i } {
    for { set j 11 } { $j < 15 } {incr j} {
        set nodelTagi [expr $i * 100 + $j]
        set nodelTagj [expr $i * 100 + ($j + 1)]
        set nodelTagk [expr ($i + 1)*100 + $j]
        set nodelTagl [expr ($i + 1)*100 + ($j + 1)]
        set eleTag [expr $i * 100 + $j]
        element ShellMITC4 $eleTag $nodelTagi $nodelTagj $nodelTagl $nodelTagk 1
    }
}

# ---- truss ----
#main SFCB
for { set j 3 } { $j <= 5 } { incr j} {
    for { set i 1} { $i < 26 } { incr i } {
        set TrussID [expr $j * 10000 + $i]
        set nodei [expr $i *100 + $j]
        set nodej [expr ($i + 1) * 100 + $j]
        element truss $TrussID $nodei $nodej 314.1593 4
    }
}
for { set j 11 } { $j <= 13 } { incr j } {
    for { set i 1} { $i < 26 } { incr i } {
        set TrussID [expr $j * 10000 + $i]
        set nodei [expr $i *100 + $j]
        set nodej [expr ($i + 1) * 100 + $j]
        element truss $TrussID $nodei $nodej 314.1593 4
    }
}

# middle SFCB
for { set j 6 } { $j <= 10 } { incr j } {
    for { set i 1} { $i < 26 } { incr i } {
        set TrussID [expr $j * 10000 + $i]
        set nodei [expr $i *100 + $j]
        set nodej [expr ($i + 1) * 100 + $j]
        element truss $TrussID $nodei $nodej 78.540 3
    }
}

# GFRP 拉索
for { set i 1 } { $i < 26 } { incr i } {
    set TrussID [expr 2* 10000 + $i]
    set nodei [expr $i *100 + 2]
    set nodej [expr ($i + 1) * 100 + 2]
    element truss $TrussID $nodei $nodej 314.1593 5
}

for { set i 1} { $i < 26 } { incr i } {
    set TrussID [expr 14 * 10000 + $i]
    set nodei [expr $i *100 + 14]
    set nodej [expr ($i + 1) * 100 + 14]
    element truss $TrussID $nodei $nodej 314.1593 5
}
