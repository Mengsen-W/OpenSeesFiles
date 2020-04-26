# @Author: Mengsen.Wang
# @Date: 2020-04-25 17:12:56
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-04-25 17:12:56
# @Decription: 记录器

if { [file exists output] == 0 } {
  file mkdir output
}
recorder Node -file output/Disp_Node_5.txt -time -node 5 -dof 3 disp
recorder Node -file output/Disp_Node_6.txt -time -node 6 -dof 3 disp
recorder Node -file output/Disp_Node_7.txt -time -node 7 -dof 3 disp
recorder Node -file output/Disp_Node_8.txt -time -node 8 -dof 3 disp

recorder Element -file output/Force_ele_9_sec_5.txt -time -ele 9 section 5 force
recorder Element -file output/Disp_ele_9_sec_5.txt -time -ele 9 section 5 deformation

recorder Element -file output/Force_ele_9_sec_1.txt -time -ele 9 section 1 force
recorder Element -file output/Disp_ele_9_sec_1.txt -time -ele 9 section 1 deformation

recorder Element -file output/Force_ele_9_sec_9.txt -time -ele 9 section 9 force
recorder Element -file output/Disp_ele_9_sec_9.txt -time -ele 9 section 9 deformation

recorder Element -file output/Force_ele_10_sec_5.txt -time -ele 10 section 5 force
recorder Element -file output/Disp_ele_10_sec_5.txt -time -ele 10 section 5 deformation

recorder Element -file output/Force_ele_10_sec_1.txt -time -ele 10 section 1 force
recorder Element -file output/Disp_ele_10_sec_1.txt -time -ele 10 section 1 deformation

recorder Element -file output/Force_ele_10_sec_9.txt -time -ele 10 section 9 force
recorder Element -file output/Disp_ele_10_sec_9.txt -time -ele 10 section 9 deformation