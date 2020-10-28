# @Author: Mengsen.Wang
# @Date: 2020-10-24 22:48:32

recorder Node -file log/FS_44_disp.out -node 44 -dof 1 2 3 -time disp
recorder Node -file log/FS_43_disp.out -node 43 -dof 1 2 3 -time disp
recorder Node -file log/FS_42_disp.out -node 42 -dof 1 2 3 -time disp
recorder Node -file log/FS_41_disp.out -node 41 -dof 1 2 3 -time disp

recorder Node -file log/FS_89_rea.out -node 89 -dof 1 2 3 -time reaction
recorder Node -file log/FS_90_rea.out -node 90 -dof 1 2 3 -time reaction
recorder Node -file log/FS_109_rea.out -node 109 -dof 1 2 3 -time reaction
recorder Node -file log/FS_110_rea.out -node 110 -dof 1 2 3 -time reaction

pattern Plain 1 Linear {
  for { set i 0 } { $i <= 6 } { incr i } {
    load [expr $i * 4 + 1] 0 0 -1000 0 0 0
    load [expr $i * 4 + 2] 0 0 -3500 0 0 0
    load [expr $i * 4 + 3] 0 0 -3500 0 0 0
    load [expr $i * 4 + 4] 0 0 -1000 0 0 0
  }

  for { set i 7 } { $i <= 14 } { incr i } {
    load [expr $i * 4 + 1] 0 0 -1000 0 0 0
    load [expr $i * 4 + 2] 0 0 -3500 0 0 0
    load [expr $i * 4 + 3] 0 0 -3500 0 0 0
    load [expr $i * 4 + 4] 0 0 -1000 0 0 0
  }

  for { set i 15 } { $i <= 20 } { incr i } {
    load [expr $i * 4 + 1] 0 0 -1000 0 0 0
    load [expr $i * 4 + 2] 0 0 -3500 0 0 0
    load [expr $i * 4 + 3] 0 0 -3500 0 0 0
    load [expr $i * 4 + 4] 0 0 -1000 0 0 0
  }

}