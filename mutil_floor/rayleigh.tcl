# @Author: Mengsen.Wang
# @Date: 2020-09-10 14:14:49
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-10 14:14:49


set numModes 3
set lambda [eigen  $numModes]
set period "output/Periods.txt"
set Periods [open $period "w"]
puts $Periods " $lambda"
close $Periods
record

set xDamp 0.05
set nEigenI 1
set nEigenJ 2
set nEigenK 3

set lambdaN [eigen  $nEigenK]

set lambdaI [lindex $lambdaN [expr $nEigenI-1]]
set lambdaJ [lindex $lambdaN [expr $nEigenJ-1]]
set lambdaK [lindex $lambdaN [expr $nEigenK-1]]

set omegaI [expr pow($lambdaI,0.5)]
set omegaJ [expr pow($lambdaJ,0.5)]
set omegaK [expr pow($lambdaK,0.5)]

set alphaM [expr $xDamp*(2*$omegaI*$omegaJ*$omegaK)/($omegaI+$omegaJ+$omegaK)]
set betaKcurr [expr 2.*$xDamp/($omegaI+$omegaJ+$omegaK)]
rayleigh $alphaM $betaKcurr 0 0

set IDloadTag 1001;
set iGMfile "GM1X.txt"
set iGMdirection "1"
set iGMfact "0.138"
set dt 0.02

foreach GMdirection $iGMdirection GMfile $iGMfile GMfact $iGMfact {
  incr IDloadTag
  set GMfatt [expr 1*$GMfact]
  set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $GMfatt"
  pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries
}