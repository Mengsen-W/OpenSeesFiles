# * @coding = utf-8
# * @Decription: Gravity
# * @Author: Mengsen.Wang
# * @Date: 2020-02-14 19:30:48
# * @Last Modified time: 2020-02-14 19:30:48

# 轴压力 743kN
# 自重 10kN
pattern Plain 1 Linear {
    for { set Storey 1 } { $Storey <= 26 } { incr Storey } {
        for { set i 1 } { $i <= 15 } { incr i } {
            set nodelTag [expr $Storey * 100 + $i]
            load $nodelTag 0 0 -25.64 0 0 0
        }
    }

    for { set i 1} { $i <= 15 } { incr i } {
        set nodelTag [expr 2600 + $i]
        load $nodelTag 0 0 -49533.33 0 0 0
    }
}