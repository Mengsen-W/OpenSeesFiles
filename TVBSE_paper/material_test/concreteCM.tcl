# Date: 2021-04-29 17:11:36
# Author: Mengsen Wang
# LastEditors: Mengsen Wang
# LastEditTime: 2021-04-29 17:34:57

# mm N Mpa
source lib.tcl
reset
wipe
model BasicBuilder -ndm 2 -ndf 3

node 1 0 0
node 2 1000 0
fix 1 1 1 1

# uniaxialMaterial ConcreteCM $mattag $fpcc $epcc $Ec $rc $xcrn $ft $et $rt $xcrp <-GapClose $gap>
uniaxialMaterial ConcreteCM 1 \
-31.7 -0.00234 3.25e4 5 0.03 6.34 0.001 1.2 10000 1

section Fiber 1 -GJ 1 {
  patch circ 1 100 100 0 0 0 10 0 360
}
geomTransf Linear 1
element dispBeamColumn 1 1 2 9 1 1

recorder Node -file out.txt -time -closeOnWrite -node 2 -dof 2 disp
pattern Plain 1 Linear {
  load 2 0 1e-6 0
}

Cyclic_Function 1 8e6 1 2 2 1e-15 100000

wipe
reset