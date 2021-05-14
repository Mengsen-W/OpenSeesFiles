wipe
model basic -ndm 2 -ndf 3

node 1  0     0
node 4  0     1000
node 5  0     2000
node 2  0     3100

fix 1  1 1 1

uniaxialMaterial Steel02    1  479.6   200000   0.002817  18.5  0.925  0.15 
uniaxialMaterial Steel02    2  503.8   200000   0.002389  18.5  0.925  0.15

uniaxialMaterial Concrete01 3  -27.562  -0.002394  -5.5136   -0.0169   
uniaxialMaterial Concrete01 4  -23.028  -0.002      -4.6056   -0.00542 

section Fiber 1 {  
    patch rect 3  8  3    -880   -80   -500    80 
    patch rect 3  8  3     500   -80   880    80   
    patch rect 4  15  3    -500   -80   500    80  
    
    patch rect 4  40 1   -900  80    900    100
    patch rect 4  40 1   -900  -100   900    -80
    patch rect 4  1  3   -900  -80   -880   80
    patch rect 4  1  3   880   -80   900    80  
    
    
    fiber   -880  80   113.04  2
    fiber   -700  80   113.04  2
    fiber   -520  80   113.04  2
    fiber   880   80   113.04  2
    fiber   700   80   113.04  2
    fiber   520   80   113.04  2
    fiber   -400  80   78.5    1
    fiber   -200  80   78.5    1
    fiber   0     80   78.5    1
    fiber   200   80   78.5    1
    fiber   400   80   78.5    1
    
    fiber   -880  -80   113.04  2
    fiber   -700  -80   113.04  2
    fiber   -520  -80   113.04  2
    fiber   880   -80   113.04  2
    fiber   700   -80   113.04  2
    fiber   520   -80   113.04  2
    fiber   -400  -80   78.5    1
    fiber   -200  -80   78.5    1
    fiber   0     -80   78.5    1
    fiber   200   -80   78.5    1
    fiber   400   -80   78.5    1                
    }

geomTransf Linear 1 

element dispBeamColumn      2  1  4  5  1  1
element dispBeamColumn      3  4  5  5  1  1
element dispBeamColumn      4  5  2  5  1  1




recorder Node -file f.txt -time -node 2 -dof 1  disp

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
foreach disp  {1200 2700 3800 4600 6500 } { 
integrator DisplacementControl    2   1   0.01
analyze   $disp
integrator DisplacementControl    2   1   -0.01 
analyze   $disp 
integrator DisplacementControl    2   1   -0.01
analyze   $disp
integrator DisplacementControl    2   1   0.01
analyze   $disp
}