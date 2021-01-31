# * @coding = utf-8
# * @Decription: Node fot FRP Shear Wall
# * @Author: Mengsen.Wang
# * @Date: 2020-02-13 20:47:29
# * @Last Modified time: 2020-2-14 14:05:48

# 墙高 2000 ，墙厚 200 ，墙宽 1000 ，高宽比 2.0
# 边缘约束区长度 175 + 25
# 保护层厚度 25
# 箍筋间距 80 共26跟
# 纵筋为 25 112.5 200 300 400 500 600 700 800 887.5 975

# x - z plane nodes
## center of shear wall
puts "center of shear wall"
for { set Storey 1 } { $Storey <= 26 } { incr Storey } {
    for { set i 5 } { $i <= 11 } { incr i } {
    set nodelTag [expr $Storey * 100 + $i]
    node $nodelTag [expr ($i - 5) * 100 + 200] 0 [expr ($Storey - 1) * 80]
    }
}

## band constraint zone
puts "Constraint zone"
for { set Storey 1 } {$Storey <= 26} {incr Storey} {
    set nodelTag1 [expr $Storey * 100 + 1]
    node $nodelTag1 0 0 [expr ($Storey - 1) * 80]

    set nodelTag2 [expr $Storey * 100 + 2]
    node $nodelTag2 20 0 [expr ($Storey - 1) * 80]

    set nodelTag3 [expr $Storey * 100 + 3]
    node $nodelTag3 40 0 [expr ($Storey - 1) * 80]

    set nodelTag4 [expr $Storey * 100 + 4]
    node $nodelTag4 120 0 [expr ($Storey - 1) * 80]

    set nodelTag12 [expr $Storey * 100 + 12]
    node $nodelTag12 880 0 [expr ($Storey - 1) * 80]

    set nodelTag13 [expr $Storey * 100 + 13]
    node $nodelTag13 960 0 [expr ($Storey - 1) * 80]

    set nodelTag14 [expr $Storey * 100 + 14]
    node $nodelTag14 980 0 [expr ($Storey - 1) * 80]

    set nodelTag15 [expr $Storey * 100 + 15]
    node $nodelTag15 1000 0 [expr ($Storey - 1) * 80]
}

fixZ 0. 1 1 1 1 1 1