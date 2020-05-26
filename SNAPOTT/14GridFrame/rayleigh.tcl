set xDamp 0.02
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
