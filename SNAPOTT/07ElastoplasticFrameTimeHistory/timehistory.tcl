set xDamp 0.05
set nEigenI 1
set nEigenJ 2
set lambdaN [eigen [expr $nEigenJ]]
set lambdaI [lindex $lambdaN [expr $nEigenI-1]]
set lambdaJ [lindex $lambdaN [expr $nEigenJ-1]]
set omegaI [expr pow($lambdaI,0.5)]
set omegaJ [expr pow($lambdaJ,0.5)]
set alphaM [expr $xDamp*(2*$omegaI*$omegaJ)/($omegaI+$omegaJ)]
set betaKcurr [expr 2.*$xDamp/($omegaI+$omegaJ)]
rayleigh $alphaM $betaKcurr 0 0

set period "output/Periods.txt"
# open file
set Periods [open $period "w"]
# write in file
puts $Periods "$lambdaN"
close $Periods
# This command is used to cause all the recorders
# to do a record on the current state of the model.
record

set IDloadTag 1001;
set iGMfile "GM1X.txt"
set iGMdirection "1"
set iGMfact "0.6072"
set dt 0.02
foreach GMdirection $iGMdirection GMfile $iGMfile GMfact $iGMfact {
incr IDloadTag
set GMfatt [expr 1*$GMfact]
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $GMfatt"
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries
}

constraints Transformation
numberer Plain
system UmfPack
test NormDispIncr  1.0e-1 1000
algorithm Newton
integrator Newmark 0.5 0.25
analysis Transient
analyze 3550 4.225352113e-3