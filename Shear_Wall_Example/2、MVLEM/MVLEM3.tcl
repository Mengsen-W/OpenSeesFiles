wipe
model basic -ndm 2 -ndf 3

node 1  0     0
node 4  0     1000
node 5  0     2000
node 2  0     3100

fix 1  1 1 1

uniaxialMaterial Steel02    1  479.6   200000   0.002817  18.5  0.925  0.15 
uniaxialMaterial Steel02    2  503.8   200000   0.002389  18.5  0.925  0.15


#uniaxialMaterial Concrete02 3  -27.562  -0.002394  -5.5136   -0.0169     0.1  2.8  1000
#uniaxialMaterial Concrete02 4  -23.028  -0.002      -4.6056   -0.00542    0.1  2.8  1000

uniaxialMaterial ConcreteCM  3  -27.562  -0.002394   30000  7  1.035  2.3  0.0002  1.2 10000  
uniaxialMaterial ConcreteCM  4  -23.028  -0.002      30000  7  1.035  2.3  0.0002  1.2 10000  

set H 3000
##Width 
set B 1800
##Thickness
set T 200
set A [expr $B * $T]
set G 1.2E4
set GAs [expr $G * $A * 0.0.833]
uniaxialMaterial Elastic 5 $GAs

set b1 400
set b2 200
##Boundary Steel Ratio
set sro1 0.008478
##Central Steel Ratio
set sro2 0.003925
element MVLEM 1 0  1 4  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1 -rho $sro1 $sro2 $sro2 $sro2 $sro2 $sro2  $sro1 -matConcrete  3 4 4 4 4 4 3 -matSteel  2 1 1 1 1 1 2 -matShear 5
element MVLEM 2 0  4 5  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1 -rho $sro1 $sro2 $sro2 $sro2 $sro2 $sro2  $sro1 -matConcrete  3 4 4 4 4 4 3 -matSteel  2 1 1 1 1 1 2 -matShear 5
element MVLEM 3 0  5 2  7  0.4 -thick  $T $T $T $T $T $T $T -width $b1 $b2 $b2 $b2 $b2  $b2 $b1 -rho $sro1 $sro2 $sro2 $sro2 $sro2 $sro2  $sro1 -matConcrete  3 4 4 4 4 4 3 -matSteel  2 1 1 1 1 1 2 -matShear 5

recorder Node -file m3.txt -time -node 2 -dof 1  disp

pattern Plain 1 Linear {
    load 2  0 -730000 0 
}
constraints Penalty 1e20 1e20 
#constraints Penalty 1e20 1e20        
numberer RCM            
system BandGeneral      
test NormDispIncr 1.0e-6 1000  
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
system BandGeneral              
test NormDispIncr 1.0e-6 1000               
algorithm KrylovNewton    
analysis Static
set increments {
    0.12 -0.12 -0.12 0.12
    0.27 -0.27 -0.27 0.27 
    0.38 -0.38 -0.38 0.38
    0.46 -0.46 -0.46 0.46
    0.65 -0.65 -0.65 0.65 
    0.65 -0.65   
    } 
for {set i 0} {$i<22} {incr i 1} {
 set increment [lindex $increments $i]
 integrator DisplacementControl 2 1 $increment
 analyze 100
}
