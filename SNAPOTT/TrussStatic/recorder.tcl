# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-19 17:03:32
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-19 17:03:32
# @Description: Static analysis of truss bridge

recorder Node -file output/node0.out -time -nodeRange 1 18 -dof 1 2 3 disp
recorder Node -file output/node5.out -time -node 5 -dof 1 2 3 disp
recorder Element -file output/ele0.out -time -eleRange 1 46 localForce