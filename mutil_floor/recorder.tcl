# @Author: Mengsen.Wang
# @Date: 2020-09-10 14:56:28
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-10 14:56:28

recorder Node -file output/node2_disp.txt -time -node 2 -dof 1 2 3 disp
recorder Node -file output/node3_disp.txt -time -node 3 -dof 1 2 3 disp
recorder Node -file output/node4_disp.txt -time -node 4 -dof 1 2 3 disp
recorder Node -file output/node5_disp.txt -time -node 5 -dof 1 2 3 disp
recorder Node -file output/node6_disp.txt -time -node 6 -dof 1 2 3 disp
recorder Node -file output/node7_disp.txt -time -node 7 -dof 1 2 3 disp

recorder Node -file output/node2_vel.txt -time -node 2 -dof 1 2 3 vel
recorder Node -file output/node3_vel.txt -time -node 3 -dof 1 2 3 vel
recorder Node -file output/node4_vel.txt -time -node 4 -dof 1 2 3 vel
recorder Node -file output/node5_vel.txt -time -node 5 -dof 1 2 3 vel
recorder Node -file output/node6_vel.txt -time -node 6 -dof 1 2 3 vel
recorder Node -file output/node7_vel.txt -time -node 7 -dof 1 2 3 vel

recorder Node -file output/node2_accel.txt -time -node 2 -dof 1 2 3 accel
recorder Node -file output/node3_accel.txt -time -node 3 -dof 1 2 3 accel
recorder Node -file output/node4_accel.txt -time -node 4 -dof 1 2 3 accel
recorder Node -file output/node5_accel.txt -time -node 5 -dof 1 2 3 accel
recorder Node -file output/node6_accel.txt -time -node 6 -dof 1 2 3 accel
recorder Node -file output/node7_accel.txt -time -node 7 -dof 1 2 3 accel

recorder Drift -file output/node2drift.txt -time -iNode 2 -jNode 1 -dof 1 2 3
recorder Drift -file output/node3drift.txt -time -iNode 3 -jNode 2 -dof 1 2 3
recorder Drift -file output/node4drift.txt -time -iNode 4 -jNode 3 -dof 1 2 3
recorder Drift -file output/node5drift.txt -time -iNode 5 -jNode 4 -dof 1 2 3
recorder Drift -file output/node6drift.txt -time -iNode 6 -jNode 5 -dof 1 2 3
recorder Drift -file output/node7drift.txt -time -iNode 7 -jNode 6 -dof 1 2 3

recorder Node -file output/eigen1_node0.txt -time -nodeRange 1 6 -dof 1 2 3 "eigen 1"
recorder Node -file output/eigen2_node0.txt -time -nodeRange 1 6 -dof 1 2 3 "eigen 2"
recorder Node -file output/eigen3_node0.txt -time -nodeRange 1 6 -dof 1 2 3 "eigen 3"