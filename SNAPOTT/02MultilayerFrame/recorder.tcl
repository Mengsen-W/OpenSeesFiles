# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-20 15:11:14
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-20 15:11:14

recorder Node -file outpus/node0.out -time -nodeRange 1 38 -dof 1 2 3 disp
recorder Element -file output/ele0.out -time -eleRange 1 52 localForce
recorder Node -file output/story_disp.out -time -nodeRange 35 38 -dof 2 disp