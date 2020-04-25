# @Author: Mengsen.Wang
# @Date: 2020-04-25 13:56:10
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-04-25 16:56:10
# @Decription: 尝试采用

# 尝试使用 corotTruss 构造单元
# 暂不考虑单元质量

# y = 0 平面 4 个单元
element corotTruss 1 1 2 50265.5 1
element corotTruss 2 2 3 50265.5 1
element corotTruss 3 2 4 50265.5 1
# element corotTruss 4 4 1 50265.5 1
# element corotTruss 5 4 2 50265.5 1

# y = 1 平面 4 个单元
# element corotTruss 5 5 6 50265.5 1
# element corotTruss 6 6 7 50265.5 1
# element corotTruss 7 7 8 50265.5 1
# element corotTruss 8 8 5 50265.5 1

# # 连接 4 个单元
# element corotTruss 9 5 1 50265.5 1
# element corotTruss 10 6 2 50265.5 1
# element corotTruss 11 7 3 50265.5 1
# element corotTruss 12 8 4 50265.5 1

# # 斜撑杆 2 个单元
# element corotTruss 13 7 2 50265.5 1
# element corotTruss 14 8 1 50265.5 1