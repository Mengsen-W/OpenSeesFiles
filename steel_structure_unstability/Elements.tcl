# @Author: Mengsen.Wang
# @Date: 2020-04-25 13:56:10
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-04-25 16:56:10
# @Decription: 尝试采用

# 尝试使用 dispBeam 构造单元
# 暂不考虑单元质量

# section
section Fiber 1 -GJ 0 {
  patch circ 1 360 10 0.0 0.0 780 800 0.0 360.0
}


# geomTransf
geomTransf PDelta 1 0 0 1
geomTransf PDelta 2 1 0 0

# y = 0 平面 4 个单元
element dispBeamColumn 1 1 2 10 1 1
element dispBeamColumn 2 2 3 10 1 2
element dispBeamColumn 3 3 4 10 1 1
element dispBeamColumn 4 4 1 10 1 2

# y = 1 平面 4 个单元
element dispBeamColumn 5 5 6 10 1 1
element dispBeamColumn 6 6 7 10 1 2
element dispBeamColumn 7 7 8 10 1 1
element dispBeamColumn 8 8 5 10 1 2

# 连接 4 个单元
element dispBeamColumn 9 5 1 10 1 1
element dispBeamColumn 10 6 2 10 1 1
element dispBeamColumn 11 7 3 10 1 1
element dispBeamColumn 12 8 4 10 1 1

# 斜撑杆 2 个单元
element dispBeamColumn 13 8 1 10 1 2
element dispBeamColumn 14 7 2 10 1 2