recorder Element -file output/ele0.out -time -eleRange 1 47 localForce
recorder Node -file output/node0.out -time -nodeRange 1 28 -dof 1 2 3 disp
recorder Node -file output/node8.out -time -node 8 -dof 1 2 3 disp
recorder Node -file output/node7.out -time -node 7 -dof 1 2 3 disp
recorder Node -file output/node12.out -time -node 12 -dof 1 2 3 disp
recorder Node -file output/node20.out -time -node 20 -dof 1 2 3 disp
recorder Element -file output/ele0_sec1d.out -time -eleRange 1 47 section 1 deformation
recorder Element -file output/ele0_sec3d.out -time -eleRange 1 47 section 4 deformation