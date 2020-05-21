# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-21 15:15:49
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-21 15:15:49
# @Description: Elastic frame time history analysis

reset
wipe
puts "System"
model basic -ndm 3 -ndf 6

puts "node"
source nodes.tcl

puts "mass"
source mass.tcl
puts "node"
puts "material"
uniaxialMaterial Elastic 1 1.999E+005
uniaxialMaterial Elastic 2 2.680E+004
uniaxialMaterial Elastic 3 1.999E+005
puts "transformation"
geomTransf Linear 1 1.000 0.000 0.000 
geomTransf Linear 2 1.000 0.000 0.000 
geomTransf Linear 3 1.000 0.000 0.000 
geomTransf Linear 4 1.000 0.000 0.000 
geomTransf Linear 5 0.000 0.000 1.000 
geomTransf Linear 6 0.000 0.000 1.000 
geomTransf Linear 7 0.000 0.000 1.000 
geomTransf Linear 8 0.000 0.000 1.000 
geomTransf Linear 9 1.000 0.000 0.000 
geomTransf Linear 10 1.000 0.000 0.000 
geomTransf Linear 11 1.000 0.000 0.000 
geomTransf Linear 12 1.000 0.000 0.000 
geomTransf Linear 13 1.000 0.000 0.000 
geomTransf Linear 14 1.000 0.000 0.000 
geomTransf Linear 15 0.000 0.000 1.000 
geomTransf Linear 16 0.000 0.000 1.000 
geomTransf Linear 17 0.000 0.000 1.000 
geomTransf Linear 18 0.000 0.000 1.000 
geomTransf Linear 19 0.000 0.000 1.000 
geomTransf Linear 20 0.000 0.000 1.000 
geomTransf Linear 21 0.000 0.000 1.000 
geomTransf Linear 22 1.000 0.000 0.000 
geomTransf Linear 23 1.000 0.000 0.000 
geomTransf Linear 24 1.000 0.000 0.000 
geomTransf Linear 25 1.000 0.000 0.000 
geomTransf Linear 26 1.000 0.000 0.000 
geomTransf Linear 27 1.000 0.000 0.000 
geomTransf Linear 28 0.000 0.000 1.000 
geomTransf Linear 29 0.000 0.000 1.000 
geomTransf Linear 30 0.000 0.000 1.000 
geomTransf Linear 31 0.000 0.000 1.000 
geomTransf Linear 32 0.000 0.000 1.000 
geomTransf Linear 33 0.000 0.000 1.000 
geomTransf Linear 34 0.000 0.000 1.000 
geomTransf Linear 35 1.000 0.000 0.000 
geomTransf Linear 36 1.000 0.000 0.000 
geomTransf Linear 37 1.000 0.000 0.000 
geomTransf Linear 38 1.000 0.000 0.000 
geomTransf Linear 39 1.000 0.000 0.000 
geomTransf Linear 40 1.000 0.000 0.000 
geomTransf Linear 41 0.000 0.000 1.000 
geomTransf Linear 42 0.000 0.000 1.000 
geomTransf Linear 43 0.000 0.000 1.000 
geomTransf Linear 44 0.000 0.000 1.000 
geomTransf Linear 45 0.000 0.000 1.000 
geomTransf Linear 46 0.000 0.000 1.000 
geomTransf Linear 47 0.000 0.000 1.000 
puts "element"
element elasticBeamColumn 1 1 2 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 1
element elasticBeamColumn 2 3 4 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 2
element elasticBeamColumn 3 5 6 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 3
element elasticBeamColumn 4 7 8 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 4
element elasticBeamColumn 5 6 8 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 5
element elasticBeamColumn 6 4 2 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 6
element elasticBeamColumn 7 8 2 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 7
element elasticBeamColumn 8 6 4 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 8
element elasticBeamColumn 9 9 3 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 9
element elasticBeamColumn 10 10 1 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 10
element elasticBeamColumn 11 11 5 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 11
element elasticBeamColumn 12 12 7 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 12
element elasticBeamColumn 13 13 14 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 13
element elasticBeamColumn 14 15 16 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 14
element elasticBeamColumn 15 7 1 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 15
element elasticBeamColumn 16 1 16 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 16
element elasticBeamColumn 17 3 14 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 17
element elasticBeamColumn 18 5 3 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 18
element elasticBeamColumn 19 3 1 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 19
element elasticBeamColumn 20 14 16 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 20
element elasticBeamColumn 21 5 7 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 21
element elasticBeamColumn 22 17 9 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 22
element elasticBeamColumn 23 18 10 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 23
element elasticBeamColumn 24 19 11 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 24
element elasticBeamColumn 25 20 12 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 25
element elasticBeamColumn 26 21 13 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 26
element elasticBeamColumn 27 22 15 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 27
element elasticBeamColumn 28 12 10 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 28
element elasticBeamColumn 29 10 15 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 29
element elasticBeamColumn 30 9 13 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 30
element elasticBeamColumn 31 11 9 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 31
element elasticBeamColumn 32 9 10 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 32
element elasticBeamColumn 33 13 15 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 33
element elasticBeamColumn 34 11 12 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 34
element elasticBeamColumn 35 23 17 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 35
element elasticBeamColumn 36 24 18 1.600E+005 2.680E+004 1.117E+004 3.605E+009 2.133E+009 2.133E+009 36
element elasticBeamColumn 37 25 19 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 37
element elasticBeamColumn 38 26 20 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 38
element elasticBeamColumn 39 27 21 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 39
element elasticBeamColumn 40 28 22 2.400E+005 2.680E+004 1.117E+004 7.512E+009 7.200E+009 3.200E+009 40
element elasticBeamColumn 41 20 18 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 41
element elasticBeamColumn 42 18 22 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 42
element elasticBeamColumn 43 17 21 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 43
element elasticBeamColumn 44 19 17 1.500E+005 2.680E+004 1.117E+004 2.817E+009 3.125E+009 1.125E+009 44
element elasticBeamColumn 45 17 18 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 45
element elasticBeamColumn 46 21 22 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 46
element elasticBeamColumn 47 19 20 1.800E+005 2.680E+004 1.117E+004 3.708E+009 5.400E+009 1.350E+009 47
puts "recorder"
recorder Node -file node8.out -time -node 8 -dof 1 disp
recorder Node -file node0.out -time -nodeRange 1 28 -dof 1 2 3 disp
 
set xDamp 0.05;
set nEigenI 1;
set nEigenJ 2;
set lambdaN [eigen [expr $nEigenJ]];
set lambdaI [lindex $lambdaN [expr $nEigenI-1]];
set lambdaJ [lindex $lambdaN [expr $nEigenJ-1]];
set omegaI [expr pow($lambdaI,0.5)]; 
set omegaJ [expr pow($lambdaJ,0.5)];
set alphaM [expr $xDamp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)]; 
set betaKcurr [expr 2.*$xDamp/($omegaI+$omegaJ)];   
rayleigh $alphaM $betaKcurr 0 0  
  
set IDloadTag 1001;
set iGMfile "GM1X.txt";
set iGMdirection "1"; 
set iGMfact "0.138";  
set dt 0.02;   
foreach GMdirection $iGMdirection GMfile $iGMfile GMfact $iGMfact { 
incr IDloadTag; 
set GMfatt [expr 1*$GMfact];  
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $GMfatt";
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries; 
}  
  
constraints Transformation; 
numberer Plain;  
system UmfPack; 
test EnergyIncr 1.0e-4 200; 
algorithm Newton 
integrator Newmark 0.5 0.25 
analysis Transient
analyze 1000 0.02
