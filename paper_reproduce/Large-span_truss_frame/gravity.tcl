# @Author: Mengsen.Wang
# @Date: 2020-10-24 22:48:32

pattern Plain 1 Linear -factor 1000 {
  for { set i 0 } { $i <= 6 } { incr i } {
    load [expr $i * 4 + 1] 0 0 -1 0 0 0
    load [expr $i * 4 + 2] 0 0 -1 0 0 0
    load [expr $i * 4 + 3] 0 0 -1 0 0 0
    load [expr $i * 4 + 4] 0 0 -1 0 0 0
  }

  for { set i 7 } { $i <= 14 } { incr i } {
    load [expr $i * 4 + 1] 0 0 -1 0 0 0
    load [expr $i * 4 + 2] 0 0 -1 0 0 0
    load [expr $i * 4 + 3] 0 0 -1 0 0 0
    load [expr $i * 4 + 4] 0 0 -1 0 0 0
  }

  for { set i 15 } { $i <= 20 } { incr i } {
    load [expr $i * 4 + 1] 0 0 -1 0 0 0
    load [expr $i * 4 + 2] 0 0 -1 0 0 0
    load [expr $i * 4 + 3] 0 0 -1 0 0 0
    load [expr $i * 4 + 4] 0 0 -1 0 0 0

}
