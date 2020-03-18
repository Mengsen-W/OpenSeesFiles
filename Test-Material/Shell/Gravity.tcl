#  * @Author: Mengsen.Wang
#  * @Date: 2020-03-18 15:19:39
#  * @Last Modified by:   Mengsen.Wang
#  * @Last Modified time: 2020-03-18 15:19:39

#  * @Description: 轴压比0.2 轴力76400

# pattern Plain 1 Linear {
#     for { set Storey 1 } { $Storey <= 3 } { incr Storey } {
#         for { set i 1 } { $i <= 3 } { incr i } {
#             set nodelTag [expr $Storey * 100 + $i]
#             load $nodelTag 0 0 -4244 0 0 0
#         }
#     }
# }

pattern Plain 1 Linear {
    load 1 0 0 -19100 0 0 0
    load 2 0 0 -19100 0 0 0
    load 3 0 0 -19100 0 0 0
    load 4 0 0 -19100 0 0 0
}