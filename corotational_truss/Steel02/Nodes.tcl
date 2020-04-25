# * @Author: Mengsen.Wang
# * @Date: 2020-03-18 14:53:33
# * @Last Modified by:   Mengsen.Wang
# * @Last Modified time: 2020-03-18 14:53:33

# * @ Descripition: 测试一些单元和杆件的微观特性需要一个单元模版

# * @ Hight: 200
# * @ Weight: 100
# * @ Thickness: 100
# * @ Numbers: 9

# Story: 纵向
# i: 横向
for { set Storey 1 } { $Storey <= 3 } { incr Storey } {
    for { set i 1} { $i <= 3 } { incr i } {
        set nodeTag [ expr $Storey * 100 + $i ]
        node $nodeTag  [ expr ($i - 1) * 50 ]  0 [ expr ($Storey - 1) * 100 ]
     }
 }
fixZ 0. 1 1 1 1 1 1