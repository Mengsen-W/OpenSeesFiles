
wipe

model basic -ndm 3 -ndf 6
# Define Node

node 101   0    0   0
node 201   0    0   310
node 301   0    0   620
node 401   0    0   930
node 501   0    0   1240
node 601   0    0   1550
node 701   0    0   1860
node 801   0    0   2170
node 901   0    0   2480
node 1001   0    0   2790
node 1101   0    0   3100
node 102   200    0   0
node 202   200    0   310
node 302   200    0   620
node 402   200    0   930
node 502   200    0   1240
node 602   200    0   1550
node 702   200    0   1860
node 802   200    0   2170
node 902   200    0   2480
node 1002   200    0   2790
node 1102   200    0   3100
node 103   400    0   0
node 203   400    0   310
node 303   400    0   620
node 403   400    0   930
node 503   400    0   1240
node 603   400    0   1550
node 703   400    0   1860
node 803   400    0   2170
node 903   400    0   2480
node 1003   400    0   2790
node 1103   400    0   3100
node 104   650    0   0
node 204   650    0   310
node 304   650    0   620
node 404   650    0   930
node 504   650    0   1240
node 604   650    0   1550
node 704   650    0   1860
node 804   650    0   2170
node 904   650    0   2480
node 1004   650    0   2790
node 1104   650    0   3100
node 105   900    0   0
node 205   900    0   310
node 305   900    0   620
node 405   900    0   930
node 505   900    0   1240
node 605   900    0   1550
node 705   900    0   1860
node 805   900    0   2170
node 905   900    0   2480
node 1005   900    0   2790
node 1105   900    0   3100
node 106   1150    0   0
node 206   1150    0   310
node 306   1150    0   620
node 406   1150    0   930
node 506   1150    0   1240
node 606   1150    0   1550
node 706   1150    0   1860
node 806   1150    0   2170
node 906   1150    0   2480
node 1006   1150    0   2790
node 1106   1150    0   3100
node 107   1400    0   0
node 207   1400    0   310
node 307   1400    0   620
node 407   1400    0   930
node 507   1400    0   1240
node 607   1400    0   1550
node 707   1400    0   1860
node 807   1400    0   2170
node 907   1400    0   2480
node 1007   1400    0   2790
node 1107   1400    0   3100
node 108   1600    0   0
node 208   1600    0   310
node 308   1600    0   620
node 408   1600    0   930
node 508   1600    0   1240
node 608   1600    0   1550
node 708   1600    0   1860
node 808   1600    0   2170
node 908   1600    0   2480
node 1008   1600    0   2790
node 1108   1600    0   3100
node 109   1800    0   0
node 209   1800    0   310
node 309   1800    0   620
node 409   1800    0   930
node 509   1800    0   1240
node 609   1800    0   1550
node 709   1800    0   1860
node 809   1800    0   2170
node 909   1800    0   2480
node 1009   1800    0   2790
node 1109   1800    0   3100


fix  101  1 1 1 1 1 1
fix  102  1 1 1 1 1 1
fix  103  1 1 1 1 1 1
fix  104  1 1 1 1 1 1
fix  105  1 1 1 1 1 1
fix  106  1 1 1 1 1 1
fix  107  1 1 1 1 1 1
fix  108  1 1 1 1 1 1
fix  109  1 1 1 1 1 1



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


element ShellMITC4 101 101 102 202 201 111
element ShellMITC4 102 102 103 203 202 111
element ShellMITC4 103 103 104 204 203  222
element ShellMITC4 104 104 105 205 204  222
element ShellMITC4 105 105 106 206 205  222
element ShellMITC4 106 106 107 207 206  222
element ShellMITC4 107 107 108 208 207 111
element ShellMITC4 108 108 109 209 208 111
element ShellMITC4 201 201 202 302 301 111
element ShellMITC4 202 202 203 303 302 111
element ShellMITC4 203 203 204 304 303  222
element ShellMITC4 204 204 205 305 304  222
element ShellMITC4 205 205 206 306 305  222
element ShellMITC4 206 206 207 307 306  222
element ShellMITC4 207 207 208 308 307 111
element ShellMITC4 208 208 209 309 308 111
element ShellMITC4 301 301 302 402 401 111
element ShellMITC4 302 302 303 403 402 111
element ShellMITC4 303 303 304 404 403  222
element ShellMITC4 304 304 305 405 404  222
element ShellMITC4 305 305 306 406 405  222
element ShellMITC4 306 306 307 407 406  222
element ShellMITC4 307 307 308 408 407 111
element ShellMITC4 308 308 309 409 408 111
element ShellMITC4 401 401 402 502 501 111
element ShellMITC4 402 402 403 503 502 111
element ShellMITC4 403 403 404 504 503  222
element ShellMITC4 404 404 405 505 504  222
element ShellMITC4 405 405 406 506 505  222
element ShellMITC4 406 406 407 507 506  222
element ShellMITC4 407 407 408 508 507 111
element ShellMITC4 408 408 409 509 508 111
element ShellMITC4 501 501 502 602 601 111
element ShellMITC4 502 502 503 603 602 111
element ShellMITC4 503 503 504 604 603  222
element ShellMITC4 504 504 505 605 604  222
element ShellMITC4 505 505 506 606 605  222
element ShellMITC4 506 506 507 607 606  222
element ShellMITC4 507 507 508 608 607 111
element ShellMITC4 508 508 509 609 608 111
element ShellMITC4 601 601 602 702 701 111
element ShellMITC4 602 602 603 703 702 111
element ShellMITC4 603 603 604 704 703  222
element ShellMITC4 604 604 605 705 704  222
element ShellMITC4 605 605 606 706 705  222
element ShellMITC4 606 606 607 707 706  222
element ShellMITC4 607 607 608 708 707 111
element ShellMITC4 608 608 609 709 708 111
element ShellMITC4 701 701 702 802 801 111
element ShellMITC4 702 702 703 803 802 111
element ShellMITC4 703 703 704 804 803  222
element ShellMITC4 704 704 705 805 804  222
element ShellMITC4 705 705 706 806 805  222
element ShellMITC4 706 706 707 807 806  222
element ShellMITC4 707 707 708 808 807 111
element ShellMITC4 708 708 709 809 808 111
element ShellMITC4 801 801 802 902 901 111
element ShellMITC4 802 802 803 903 902 111
element ShellMITC4 803 803 804 904 903  222
element ShellMITC4 804 804 805 905 904  222
element ShellMITC4 805 805 806 906 905  222
element ShellMITC4 806 806 807 907 906  222
element ShellMITC4 807 807 808 908 907 111
element ShellMITC4 808 808 809 909 908 111
element ShellMITC4 901 901 902 1002 1001 111
element ShellMITC4 902 902 903 1003 1002 111
element ShellMITC4 903 903 904 1004 1003  222
element ShellMITC4 904 904 905 1005 1004  222
element ShellMITC4 905 905 906 1006 1005  222
element ShellMITC4 906 906 907 1007 1006  222
element ShellMITC4 907 907 908 1008 1007 111
element ShellMITC4 908 908 909 1009 1008 111
element ShellMITC4 1001 1001 1002 1102 1101 111
element ShellMITC4 1002 1002 1003 1103 1102 111
element ShellMITC4 1003 1003 1004 1104 1103  222
element ShellMITC4 1004 1004 1005 1105 1104  222
element ShellMITC4 1005 1005 1006 1106 1105  222
element ShellMITC4 1006 1006 1007 1107 1106  222
element ShellMITC4 1007 1007 1008 1108 1107 111
element ShellMITC4 1008 1008 1009 1109 1108 111

element truss 1010 101 201 226.08 8
element truss 2010 201 301 226.08 8
element truss 3010 301 401 226.08 8
element truss 4010 401 501 226.08 8
element truss 5010 501 601 226.08 8
element truss 6010 601 701 226.08 8
element truss 7010 701 801 226.08 8
element truss 8010 801 901 226.08 8
element truss 9010 901 1001 226.08 8
element truss 10010 1001 1101 226.08 8
element truss 1020 102 202 226.08 8
element truss 2020 202 302 226.08 8
element truss 3020 302 402 226.08 8
element truss 4020 402 502 226.08 8
element truss 5020 502 602 226.08 8
element truss 6020 602 702 226.08 8
element truss 7020 702 802 226.08 8
element truss 8020 802 902 226.08 8
element truss 9020 902 1002 226.08 8
element truss 10020 1002 1102 226.08 8
element truss 1030 103 203 226.08 8
element truss 2030 203 303 226.08 8
element truss 3030 303 403 226.08 8
element truss 4030 403 503 226.08 8
element truss 5030 503 603 226.08 8
element truss 6030 603 703 226.08 8
element truss 7030 703 803 226.08 8
element truss 8030 803 903 226.08 8
element truss 9030 903 1003 226.08 8
element truss 10030 1003 1103 226.08 8
element truss 1070 107 207 226.08 8
element truss 2070 207 307 226.08 8
element truss 3070 307 407 226.08 8
element truss 4070 407 507 226.08 8
element truss 5070 507 607 226.08 8
element truss 6070 607 707 226.08 8
element truss 7070 707 807 226.08 8
element truss 8070 807 907 226.08 8
element truss 9070 907 1007 226.08 8
element truss 10070 1007 1107 226.08 8
element truss 1080 108 208 226.08 8
element truss 2080 208 308 226.08 8
element truss 3080 308 408 226.08 8
element truss 4080 408 508 226.08 8
element truss 5080 508 608 226.08 8
element truss 6080 608 708 226.08 8
element truss 7080 708 808 226.08 8
element truss 8080 808 908 226.08 8
element truss 9080 908 1008 226.08 8
element truss 10080 1008 1108 226.08 8
element truss 1090 109 209 226.08 8
element truss 2090 209 309 226.08 8
element truss 3090 309 409 226.08 8
element truss 4090 409 509 226.08 8
element truss 5090 509 609 226.08 8
element truss 6090 609 709 226.08 8
element truss 7090 709 809 226.08 8
element truss 8090 809 909 226.08 8
element truss 9090 909 1009 226.08 8
element truss 10090 1009 1109 226.08 8

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
test NormDispIncr 1.0e-1 2000               
algorithm KrylovNewton       
integrator LoadControl 0.1          
analysis Static 
analyze 1550
