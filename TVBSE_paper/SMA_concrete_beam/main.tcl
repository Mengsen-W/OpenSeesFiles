# Date: 2021-08-15 15:36:04
# Author: Mengsen Wang

# /\ z
# |
# |
# ----> x

# mm N MPa

model basic -ndm 3 -ndf 6

node 1 0 0 0
node 2 25 0 0
node 3 100 0 0
node 4 200 0 0
node 5 300 0 0
node 6 400 0 0
node 7 500 0 0
node 8 600 0 0
node 9 700 0 0
node 10 800 0 0

node 11 900 0 0

node 12 1000 0 0
node 13 1100 0 0
node 14 1200 0 0
node 15 1300 0 0
node 16 1400 0 0
node 17 1500 0 0
node 18 1600 0 0
node 19 1700 0 0
node 20 1775 0 0
node 21 1800 0 0

fix 1 0 1 0 1 0 1
fix 2 1 1 1 1 0 1
fix 3 0 1 0 1 0 1
fix 4 0 1 0 1 0 1
fix 5 0 1 0 1 0 1
fix 6 0 1 0 1 0 1
fix 7 0 1 0 1 0 1
fix 8 0 1 0 1 0 1
fix 9 0 1 0 1 0 1
fix 10 0 1 0 1 0 1
fix 11 0 1 0 1 0 1
fix 12 0 1 0 1 0 1
fix 13 0 1 0 1 0 1
fix 14 0 1 0 1 0 1
fix 15 0 1 0 1 0 1
fix 16 0 1 0 1 0 1
fix 17 0 1 0 1 0 1
fix 18 0 1 0 1 0 1
fix 19 0 1 0 1 0 1
fix 20 0 1 1 1 0 1
fix 21 0 1 0 1 0 1

# 内部通长筋
uniaxialMaterial Steel01 1 335 2e5 1e-5

# 混凝土
uniaxialMaterial Concrete01 2 -36.2e4 -0.005 3.78 0.001

# SMA
uniaxialMaterial Elastic 3 2e5

# 截面 一共11个

# 0/1800 mm
section Fiber 1 -GJ 1e9 {
  fiber 0 0 20000 2
}

# 25/1775 mm
section Fiber 2 -GJ 1e9 {
  fiber 0 0 20000 2
  fiber 22 72 28.27 1
  fiber -22 72 28.27 1
  fiber -17 -67 201.06 1
  fiber 17 -67 201.06 1
  fiber 50 50 19.63 3
  fiber -50 50 19.63 3
}

# 100/1700 mm
section Fiber 3 -GJ 1e9 {
  fiber 0 0 20000 2
  fiber 22 72 28.27 1
  fiber -22 72 28.27 1
  fiber -17 -67 201.06 1
  fiber 17 -67 201.06 1
  fiber 50 28.57 19.63 3
  fiber -50 28.57 19.63 3
}

# 200/1600 mm
section Fiber 4 -GJ 1e9 {
  fiber 0 0 20000 2
  fiber 22 72 28.27 1
  fiber -22 72 28.27 1
  fiber -17 -67 201.06 1
  fiber 17 -67 201.06 1
  fiber 50 7.14 19.63 3
  fiber -50 7.14 19.63 3
}

# 300/1500 mm
section Fiber 5 -GJ 1e9 {
  fiber 0 0 20000 2
  fiber 22 72 28.27 1
  fiber -22 72 28.27 1
  fiber -17 -67 201.06 1
  fiber 17 -67 201.06 1
  fiber 50 -14.28 19.63 3
  fiber -50 -14.28 19.63 3
}

# 400/1400 mm
section Fiber 6 -GJ 1e9 {
  fiber 0 0 20000 2
  fiber 22 72 28.27 1
  fiber -22 72 28.27 1
  fiber -17 -67 201.06 1
  fiber 17 -67 201.06 1
  fiber 50 -35.7 19.63 3
  fiber -50 -35.7 19.63 3
}

# 500/1300 mm
section Fiber 7 -GJ 1e9 {
  fiber 0 0 20000 2
  fiber 22 72 28.27 1
  fiber -22 72 28.27 1
  fiber -17 -67 201.06 1
  fiber 17 -67 201.06 1
  fiber 50 -57.14 19.63 3
  fiber -50 -57.14 19.63 3
}

# 600/1200 mm
section Fiber 8 -GJ 1e9 {
  fiber 0 0 20000 2
  fiber 22 72 28.27 1
  fiber -22 72 28.27 1
  fiber -17 -67 201.06 1
  fiber 17 -67 201.06 1
  fiber 50 -78.57 19.63 3
  fiber -50 -78.57 19.63 3
}

# 700/1100 mm
section Fiber 9 -GJ 1e9 {
  fiber 0 0 20000 2
  fiber 22 72 28.27 1
  fiber -22 72 28.27 1
  fiber -17 -67 201.06 1
  fiber 17 -67 201.06 1
  fiber 50 -100 19.63 3
  fiber -50 -100 19.63 3
}

geomTransf Linear 1 0 0 1

element dispdispBeamColumn 1 1 2 9 1 1
element dispdispBeamColumn 2 2 3 9 2 1
element dispdispBeamColumn 3 3 4 9 3 1
element dispdispBeamColumn 4 4 5 9 4 1
element dispdispBeamColumn 5 5 6 9 5 1
element dispdispBeamColumn 6 6 7 9 6 1
element dispdispBeamColumn 7 7 8 9 7 1
element dispdispBeamColumn 8 8 9 9 8 1
element dispdispBeamColumn 9 9 10 9 9 1
element dispdispBeamColumn 10 10 11 9 9 1
element dispdispBeamColumn 11 11 12 9 9 1
element dispdispBeamColumn 12 12 13 9 9 1
element dispdispBeamColumn 13 13 14 9 8 1
element dispdispBeamColumn 14 14 15 9 7 1
element dispdispBeamColumn 15 15 16 9 6 1
element dispdispBeamColumn 16 16 17 9 5 1
element dispdispBeamColumn 17 17 18 9 4 1
element dispdispBeamColumn 18 18 19 9 3 1
element dispdispBeamColumn 19 19 20 9 2 1
element dispdispBeamColumn 20 20 21 9 1 1

