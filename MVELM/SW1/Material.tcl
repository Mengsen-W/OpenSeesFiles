puts "Material"
# No.6 steel
uniaxialMaterial Steel02 1 263 1.88E+5 0.0055 20 0.925 0.0015

# No.8 steel
uniaxialMaterial Steel02 2 305 1.94E+5 0.0053 20 0.925 0.0015

# concrete
#uniaxialMaterial Concrete02 3 -19.35 -0.0027 -3.87 -0.0297 0.1 2.37 1000
uniaxialMaterial Concrete02 4 -14.58 -0.002 -3.16 -0.0515 0.1 2.37 1000

uniaxialMaterial ConcreteCM 3 -19.35 -0.0027 3E4 1.24 9.91 2.37 0.00025 1.2 1E4
#uniaxialMaterial ConcreteCM 4 -14.58 -0.002 3E4 1.62 2.3 2.37 0.00025 1.2 1E4

set rouX 0.0098
set sro1 0.014
set sro2 0.006
set nu 0.2
set alfadow 0.05

# Fixed-Strut-Angle-Model
nDMaterial FSAM 6 0 2 1 3 $rouX $sro1 $nu $alfadow
nDMaterial FSAM 7 0 2 2 3 $rouX $sro2 $nu $alfadow