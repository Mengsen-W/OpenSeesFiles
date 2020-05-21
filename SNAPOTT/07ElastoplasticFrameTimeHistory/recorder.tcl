recorder Node -file output/node59.out -time -node 59 -dof 1 disp
recorder Node -file output/node0.out -time -nodeRange 1 63 -dof 1 2 3 disp
recorder Element -file output/shear.out -time -eleRange 106 114 localForce