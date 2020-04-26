# @Author: Mengsen.Wang
# @Date: 2020-04-25 14:31:21
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-04-25 16:31:21

# 考虑模型共设计 8 个节点，构成一个正方体
# 边长为 1000mm
# 暂不考虑质量

# y = 0 平面 4 个节点
node 1 0 0 0
node 2 1000 0 0
node 3 1000 0 1000
node 4 0 0 1000

# y = 1 平面 4 个节点
node 5 0 1000 0
node 6 1000 1000 0
node 7 1000 1000 1000
node 8 0 1000 1000

# 加载约束
# equalDOF 5 6 1 2 3 4 5 6


# 全约束 y = 0 平面的 4 个节点
fixY 0.0 1 1 1 1 1 1
