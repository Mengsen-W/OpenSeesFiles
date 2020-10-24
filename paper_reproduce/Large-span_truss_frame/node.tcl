# @Author: Mengsen.Wang
# @Date: 2020-10-24 19:22:01

# | 4 8 ... 84
# | 3 7 ... 83
# | 2 6 ... 82
# | 1 5 ... 81

for { set i 0 } { $i <= 6 } { incr i } {
  node [expr $i * 4 + 1] [expr $i * 2.375] 0 0
  node [expr $i * 4 + 2] [expr $i * 2.375] 1.5 0
  node [expr $i * 4 + 3] [expr $i * 2.375] 7.5 0
  node [expr $i * 4 + 4] [expr $i * 2.375] 9.0 0
}

for { set i 7 } { $i <= 14 } { incr i } {
  node [expr $i * 4 + 1] [expr ($i - 6) * 3.563 + 14.25] 0 0
  node [expr $i * 4 + 2] [expr ($i - 6) * 3.563 + 14.25] 1.5 0
  node [expr $i * 4 + 3] [expr ($i - 6) * 3.563 + 14.25] 7.5 0
  node [expr $i * 4 + 4] [expr ($i - 6) * 3.563 + 14.25] 9.0 0
}

for { set i 15 } { $i <= 20 } { incr i } {
  node [expr $i * 4 + 1] [expr ($i - 14) * 2.375 + 42.754] 0 0
  node [expr $i * 4 + 2] [expr ($i - 14) * 2.375 + 42.754] 1.5 0
  node [expr $i * 4 + 3] [expr ($i - 14) * 2.375 + 42.754] 7.5 0
  node [expr $i * 4 + 4] [expr ($i - 14) * 2.375 + 42.754] 9.0 0
}

# | 90 ... 110
# | 89 ... 109
node 89 0 0 6
node 90 0 9 6
node 91 4.75 0 6
node 92 4.75 9 6
node 93 9.5 0 6
node 94 9.5 9 6
node 95 14.25 0 6
node 96 14.25 9 6
node 97 21.375 0 6
node 98 21.375 9 6
node 99 28.5 0 6
node 100 28.5 9 6
node 101 35.625 0 6
node 102 35.625 9 6
node 103 42.75 0 6
node 104 42.74 9 6
node 105 47.5 0 6
node 106 47.5 9 6
node 107 52.25 0 6
node 108 52.25 9 6
node 109 57 0 6
node 110 57 9 6

fix 89 1 1 1 0 0 0
fix 90 1 1 1 0 0 0
fix 109 1 1 1 0 0 0
fix 110 1 1 1 0 0 0

set Fy 345e6
set E 206e9
set b 0.01
uniaxialMaterial Steel02 1 $Fy $E $b 18.5 0.925 0.15