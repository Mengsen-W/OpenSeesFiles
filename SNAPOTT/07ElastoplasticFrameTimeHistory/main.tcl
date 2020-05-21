# @coding = utf-8
# @Author: Mengsen.Wang
# @Date: 2020-05-21 16:22:15
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-05-21 16:22:15
# @Description: Elastictoplastic frame time history

reset
wipe

source Cyclic.tcl

ModelInfo_Proc modelLog.log

puts "System"
model basic -ndm 3 -ndf 6

puts "nodes"
source nodes.tcl

puts "mass"
source mass.tcl

puts "material"
source material.tcl

puts "section.tcl"
source section.tcl

puts "transformation"
source transformation.tcl

puts "element"
source element.tcl

puts "recorder"
source recorder.tcl

puts "gravity"
source load.tcl

puts "analysis"
constraints Plain
numberer Plain
system BandGeneral
test EnergyIncr 1.0e-6 200
algorithm Newton
integrator LoadControl 0.1
analysis Static
analyze 10
loadConst -time 0.0

set xDamp 0.05;
set nEigenI 1;
set nEigenJ 2;
set lambdaN [eigen [expr $nEigenJ]]
set lambdaI [lindex $lambdaN [expr $nEigenI-1]];
set lambdaJ [lindex $lambdaN [expr $nEigenJ-1]];
set omegaI [expr pow($lambdaI,0.5)];
set omegaJ [expr pow($lambdaJ,0.5)];
set alphaM [expr $xDamp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)];
set betaKcurr [expr 2.*$xDamp/($omegaI+$omegaJ)];
rayleigh $alphaM $betaKcurr 0 0

set IDloadTag 1001;
set iGMfile "GM1X.txt"
set iGMdirection "1"
set iGMfact "0.6072"
set dt 0.02
foreach GMdirection $iGMdirection GMfile $iGMfile GMfact $iGMfact { 
incr IDloadTag; 
set GMfatt [expr 1*$GMfact];  
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $GMfatt";
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries; 
}  
  
constraints Transformation; 
numberer Plain;  
system UmfPack; 
test NormDispIncr  1.0e-1 1000; 
algorithm Newton 
integrator Newmark 0.5 0.25 
analysis Transient
analyze 3000 0.005
