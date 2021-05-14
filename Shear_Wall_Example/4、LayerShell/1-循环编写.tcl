
wipe
model basic -ndm 3 -ndf 6
# Nmeber of Elements in Z
set ZNum 10
# Nmeber of Elements in X
set XNum 8
# Height
set H 3100
# Width 
set B 1800
# Thickness
set T 200
set NumZ [expr $H / $ZNum]


# Define Node
foreach  NodeX  {0 200  400 650 900 1150 1400 1600 1800 } ii { 1 2 3 4 5 6 7 8 9 } {
for { set i  0} { $i <= $ZNum } { incr i} {
    set NodeTag [expr ($i + 1) * 100 + $ii]
    set NodeZ [expr $NumZ * $i]           
    node $NodeTag   $NodeX   0   $NodeZ     
    #  puts    "node $NodeTag   $NodeX    0   $NodeZ  "    
}
}

fixZ  0 1 1 1 1 1 1


nDMaterial PlaneStressUserMaterial    2       40         7      23.03    2.303    -8.61   -0.0022    -0.008    0.001  0.05
nDMaterial   PlateFromPlaneStress     4         2                 1.2e4

# steel-10
uniaxialMaterial Steel02     7    479.6   200000   0.002817  18.5  0.925  0.15 
nDMaterial   PlateRebar      9        7     90
nDMaterial   PlateRebar      10       7      0
# steel-12
uniaxialMaterial Steel02     8   503.8   200000   0.002389  18.5  0.925  0.15
nDMaterial   PlateRebar      11        8     90


#Confined
section   LayeredShell      111    10     4 20   10 0.549   10 0.42    4 39.516   4 39.516   4 39.516   4 39.516    10 0.42   10 0.549  4 20 
##UnConfined
section   LayeredShell      222    8      4 20   10 0.42   11 0.3925   4 79.187   4 79.187   11 0.3925   10 0.42  4 20 


#Define  Element
for {set i 1 } { $i <= $ZNum } { incr i } {
    for {set ii 1 } {$ii <= $XNum } {incr ii} {
        set nodei [expr $i * 100 + $ii]
        set nodej [expr $i * 100 + $ii + 1 ] 
        set nodek [expr ($i + 1) * 100 + $ii + 1 ] 
        set nodel [expr ($i + 1) * 100 + $ii] 
        set eleTag $nodei
        if { $ii==1 ||  $ii==2 || $ii==7 || $ii==8 } {
        set a 111           
        } else {
            set a 222
             }
        element ShellMITC4 $eleTag $nodei $nodej $nodek $nodel $a
  #puts    "element ShellMITC4 $eleTag $nodei $nodej $nodek $nodel   $a  "
       
    }
}


set As1 226.08
foreach  i  {1 2 3 7 8 9  } {

    for {set ii 1 } {$ii <= $ZNum } {incr ii} {
        set nodei [expr $ii * 100 + $i]
        set nodej [expr ($ii+1) * 100 + $i]
        set TrussTag [expr $nodei*10]
        element truss $TrussTag $nodei $nodej $As1 8
#puts    "element truss $TrussTag $nodei $nodej $As1 8  "
        
    }
}

set LoadNode 1105

recorder Node -file disp1.txt -time -node $LoadNode -dof 1  disp
recorder Node -file force1.txt -time -node $LoadNode -dof 1  reaction

pattern Plain 1 Linear {
    load $LoadNode 0 0 -730000 0 0 0
}
constraints Penalty 1e20 1e20       
numberer RCM
system BandGeneral
test NormDispIncr 1.0e-6 2000 ;
#algorithm BFGS -count 100
algorithm KrylovNewton   
integrator LoadControl 0.1;             
analysis Static             
analyze 10;                 
loadConst -time 0.0;


timeSeries Path 1 -dt 0.1 -filePath jiazai.txt 
pattern Plain 2 1 {
    sp $LoadNode 1 1
}
constraints Penalty 1e20 1e20                 
numberer RCM                    
system BandGeneral              
test NormDispIncr 1.0e-2 2000               
algorithm KrylovNewton       
integrator LoadControl 0.1          
analysis Static 
analyze 1505

