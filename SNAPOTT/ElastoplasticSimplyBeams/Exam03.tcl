wipe
puts "System"
model basic -ndm 3 -ndf 6
puts "restraint"
node 1 0.000E+000 0.000E+000 0.000E+000
node 2 3.000E+003 0.000E+000 0.000E+000
node 3 5.000E+002 0.000E+000 0.000E+000
node 4 1.000E+003 0.000E+000 0.000E+000
node 5 1.500E+003 0.000E+000 0.000E+000
node 6 2.000E+003 0.000E+000 0.000E+000
node 7 2.500E+003 0.000E+000 0.000E+000
puts "rigidDiaphragm"
puts "node"
fix 1 1 1 1 1 0 1;
fix 2 0 1 1 1 0 1;
fix 3 0 1 0 1 0 1;
fix 4 0 1 0 1 0 1;
fix 5 0 1 0 1 0 1;
fix 6 0 1 0 1 0 1;
fix 7 0 1 0 1 0 1;
puts "material"
uniaxialMaterial Steel01 1 335 200000 0.00001 
uniaxialMaterial Concrete01 2 -26.8 -0.002 -10 -0.0033
##NB300X600 
section Fiber 1 {
fiber -1.250E+002 -2.500E+002 5.000E+003 2
fiber -7.500E+001 -2.500E+002 5.000E+003 2
fiber -2.500E+001 -2.500E+002 5.000E+003 2
fiber 2.500E+001 -2.500E+002 5.000E+003 2
fiber 7.500E+001 -2.500E+002 5.000E+003 2
fiber 1.250E+002 -2.500E+002 5.000E+003 2
fiber -1.250E+002 -1.500E+002 5.000E+003 2
fiber -7.500E+001 -1.500E+002 5.000E+003 2
fiber -2.500E+001 -1.500E+002 5.000E+003 2
fiber 2.500E+001 -1.500E+002 5.000E+003 2
fiber 7.500E+001 -1.500E+002 5.000E+003 2
fiber 1.250E+002 -1.500E+002 5.000E+003 2
fiber -1.250E+002 -5.000E+001 5.000E+003 2
fiber -7.500E+001 -5.000E+001 5.000E+003 2
fiber -2.500E+001 -5.000E+001 5.000E+003 2
fiber 2.500E+001 -5.000E+001 5.000E+003 2
fiber 7.500E+001 -5.000E+001 5.000E+003 2
fiber 1.250E+002 -5.000E+001 5.000E+003 2
fiber -1.250E+002 5.000E+001 5.000E+003 2
fiber -7.500E+001 5.000E+001 5.000E+003 2
fiber -2.500E+001 5.000E+001 5.000E+003 2
fiber 2.500E+001 5.000E+001 5.000E+003 2
fiber 7.500E+001 5.000E+001 5.000E+003 2
fiber 1.250E+002 5.000E+001 5.000E+003 2
fiber -1.250E+002 1.500E+002 5.000E+003 2
fiber -7.500E+001 1.500E+002 5.000E+003 2
fiber -2.500E+001 1.500E+002 5.000E+003 2
fiber 2.500E+001 1.500E+002 5.000E+003 2
fiber 7.500E+001 1.500E+002 5.000E+003 2
fiber 1.250E+002 1.500E+002 5.000E+003 2
fiber -1.250E+002 2.500E+002 5.000E+003 2
fiber -7.500E+001 2.500E+002 5.000E+003 2
fiber -2.500E+001 2.500E+002 5.000E+003 2
fiber 2.500E+001 2.500E+002 5.000E+003 2
fiber 7.500E+001 2.500E+002 5.000E+003 2
fiber 1.250E+002 2.500E+002 5.000E+003 2
fiber -1.150E+002 2.650E+002 3.900E+002 1
fiber 1.150E+002 2.650E+002 3.900E+002 1
fiber -1.150E+002 -2.650E+002 4.900E+002 1
fiber 0.000E+000 -2.650E+002 4.900E+002 1
fiber 1.150E+002 -2.650E+002 4.900E+002 1
}
puts "transformation"
geomTransf Linear 1 0.000 0.000 1.000 
geomTransf Linear 2 0.000 0.000 1.000 
geomTransf Linear 3 0.000 0.000 1.000 
geomTransf Linear 4 0.000 0.000 1.000 
geomTransf Linear 5 0.000 0.000 1.000 
geomTransf Linear 6 0.000 0.000 1.000 
puts "element"
element nonlinearBeamColumn 1 1 3 3 1 1
element nonlinearBeamColumn 2 3 4 3 1 2
element nonlinearBeamColumn 3 4 5 3 1 3
element nonlinearBeamColumn 4 5 6 3 1 4
element nonlinearBeamColumn 5 6 7 3 1 5
element nonlinearBeamColumn 6 7 2 3 1 6
puts "recorder"
recorder Node -file node0.out -time -nodeRange 1 7 -dof 1 2 3 disp
recorder Node -file node5.out -time -node 5 -dof 1 2 3 disp
recorder Element -file ele0.out -time -eleRange 1 6 localForce
recorder Element -file ele0_sec1d.out -time -eleRange 1 6 section 1 deformation 
recorder Element -file ele0_sec3d.out -time -eleRange 1 6 section 3 deformation 
puts "loading"
## Load Case = DEAD
pattern Plain 1 Linear {
eleLoad -ele 1 -type -beamUniform 0 -1.000E+001 0
eleLoad -ele 2 -type -beamUniform 0 -1.000E+001 0
eleLoad -ele 3 -type -beamUniform 0 -1.000E+001 0
eleLoad -ele 4 -type -beamUniform 0 -1.000E+001 0
eleLoad -ele 5 -type -beamUniform 0 -1.000E+001 0
eleLoad -ele 6 -type -beamUniform 0 -1.000E+001 0
}
puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator DisplacementControl 5 3 -0.1
analysis Static
analyze 100
