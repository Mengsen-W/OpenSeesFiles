wipe
model basic -ndm 2 -ndf 3

node 1  0     0
node 4  0     1000
node 5  0     2000
node 2  0     3100
node 11  0     0
node 22  0     3100


fix 1  1 1 1
equalDOF  1 11   1 2  
equalDOF  2 22   1 2 

uniaxialMaterial Bond_SP01 10  479.6  0.3835   603.8  13.42   0.3  0.6
uniaxialMaterial Bond_SP01 12  503.8  0.4253   628.1  14.88   0.3  0.6

uniaxialMaterial Steel02    1  479.6   200000   0.02  18.5  0.925  0.15 
uniaxialMaterial Steel02    2  503.8   200000   0.02  18.5  0.925  0.15

uniaxialMaterial Concrete01 3  -27.562  -0.002394   -5.5136   -0.0169   
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
section Fiber 2 {  

    patch rect 3  8  3    -880   -80   -500    80 
    patch rect 3  8  3     500   -80   880    80   
    patch rect 4  15  3    -500   -80   500    80  
    
    patch rect 4  40 1   -900  80    900    100
    patch rect 4  40 1   -900  -100   900    -80
    patch rect 4  1  3   -900  -80   -880   80
    patch rect 4  1  3   880   -80   900    80  
    
    fiber   -880  80   113.04  12
    fiber   -700  80   113.04  12
    fiber   -520  80   113.04  12
    fiber   880   80   113.04  12
    fiber   700   80   113.04  12
    fiber   520   80   113.04  12
    fiber   -400  80   78.5    10
    fiber   -200  80   78.5    10
    fiber   0     80   78.5    10
    fiber   200   80   78.5    10
    fiber   400   80   78.5    10
    
    fiber   -880  -80   113.04  12
    fiber   -700  -80   113.04  12
    fiber   -520  -80   113.04  12
    fiber   880   -80   113.04  12
    fiber   700   -80   113.04  12
    fiber   520   -80   113.04  12
    fiber   -400  -80   78.5    10
    fiber   -200  -80   78.5    10
    fiber   0     -80   78.5    10
    fiber   200   -80   78.5    10
    fiber   400   -80   78.5    10             
  
    }


geomTransf Linear 1 

element zeroLengthSection   1  1  11     2
element dispBeamColumn      2  11  4  5  1  1
element dispBeamColumn      4  4  5   5  1  1
element dispBeamColumn      6  5  22  5  1  1
element zeroLengthSection   5  22  2     2


recorder Node -file f0.txt -time -node 2 -dof 1  disp

pattern Plain 1 Linear {
    load 2  0 -730000 0 
}
constraints Penalty 1e20 1e20 
#constraints Penalty 1e20 1e20        
numberer RCM            
system BandGeneral      
test NormDispIncr 1.0e-10 2000  
algorithm KrylovNewton  
# algorithm NewtonLineSearch     KrylovNewton      
integrator LoadControl 1    
analysis Static         
analyze 1
loadConst  0.0

pattern Plain 2 Linear {
    load 2 1 0 0
}
constraints Penalty 1e20 1e20                   
numberer RCM                    
system BandGeneral              
test NormDispIncr 1.0e-10 2000               
algorithm KrylovNewton    
analysis Static

set increments {
    0.012 -0.012 -0.012 0.012
    0.027 -0.027 -0.027 0.027 
    0.038 -0.038 -0.038 0.038
    0.046 -0.046 -0.046 0.046
    0.065 -0.065 -0.065 0.065 
    0.065 -0.065   
    } 
for {set i 0} {$i<22} {incr i 1} {
 set increment [lindex $increments $i]
 integrator DisplacementControl 2 1 $increment
 analyze 1000
 puts "$i" 
}
