wipe
model basic -ndm 2 -ndf 3

node 1  0     0
node 3  0     500
node 4  0     1000
node 5  0     1500
node 6  0     2000
node 7  0     2500
node 2  0     3100

fix 1  1 1 1


uniaxialMaterial Steel02    1  479.6   200000   0.002817  18.5  0.925  0.15 
uniaxialMaterial Steel02    2  503.8   200000   0.002389  18.5  0.925  0.15

#uniaxialMaterial SteelMPF    1  479.6  479.6  200000   0.002817  0.002817  18.5  0.925  0.15 
#uniaxialMaterial SteelMPF    2  503.8  503.8  200000   0.002839  0.002839  18.5  0.925  0.15


uniaxialMaterial ConcreteCM  3  -27.562  -0.002394   30000  7  1.035  2.3  0.00025  1.2 10000  
uniaxialMaterial ConcreteCM  4  -23.028  -0.002      30000  7  1.035  2.3  0.00025  1.2 10000  




# nDMaterial FSAM $mattag   $rho  $sX  $sY  $conc  $rouX    $rouY    $nu   $alfadow   
nDMaterial FSAM         5    0.0   1     2     3   0.0042   0.0085   0.2   0.01
nDMaterial FSAM         6    0.0   1     1     4   0.0042   0.0039   0.2   0.01


set T 200
set b1 400
set b2 200

element SFI_MVLEM 1   1 3  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1  -mat  5  6 6 6 6 6 5
element SFI_MVLEM 2   3 4  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1  -mat  5  6 6 6 6 6 5
element SFI_MVLEM 3   4 5  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1  -mat  5  6 6 6 6 6 5
element SFI_MVLEM 4   5 6  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1  -mat  5  6 6 6 6 6 5
element SFI_MVLEM 5   6 7  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1  -mat  5  6 6 6 6 6 5
element SFI_MVLEM 6   7 2  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1  -mat  5  6 6 6 6 6 5


recorder Node -file sm1.txt -time -node 2 -dof 1  disp

pattern Plain 1 Linear {
    load 2  0 -730000 0 
}
constraints Penalty 1e20 1e20 
#constraints Penalty 1e20 1e20        
numberer RCM            
system BandGeneral      
test NormDispIncr 1.0e-6 2000  
algorithm Newton   
# algorithm NewtonLineSearch     KrylovNewton      
integrator LoadControl 1    
analysis Static         
analyze 1
loadConst  0.0

pattern Plain 2 Linear {
    load 2 1000 0 0
}
constraints Penalty 1e20 1e20
    numberer RCM
    #system UmfPack
    system BandGeneral;
    test NormDispIncr 1e-3  2000  
    algorithm KrylovNewton; 
    
  
    source  shu.tcl
    set D0 0.0
    foreach  Dstep  $iDstep {
    set D1 $Dstep 
    set Dincr [expr $D1 - $D0 ] 
    integrator DisplacementControl 2 1  $Dincr
     analysis Static
     set ok [analyze 1] 
     
        if {$ok != 0} {
        if {$ok != 0} {
            algorithm Newton -initial
            set ok [analyze 1]
            algorithm Newton
        }
     
        if {$ok != 0} {
            puts "Trying Broyden .."
            algorithm Broyden 300
            set ok [analyze 1]
            algorithm Newton
        }
    
        if {$ok != 0} {
            algorithm NewtonLineSearch 0.8
            set ok [analyze 1]
            algorithm Newton
        }
        if {$ok != 0} {
        }  
    }
    set D0  $D1
}


