# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-19 14:37:50
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-19 14:37:50


recorder Node -file output/node0.out -time -nodeRange 1 7 -dof 1 2 3 disp
recorder Node -file output/node5.out -time -node 5 -dof 1 2 3 disp
recorder Element -file output/ele0.out -time -eleRange 1 6 localForce
recorder Element -file output/ele0_sec1d.out -time -eleRange 1 6 section 1 deformation
recorder Element -file output/ele0_sec3d.out -time -eleRange 1 6 section 3 deformation