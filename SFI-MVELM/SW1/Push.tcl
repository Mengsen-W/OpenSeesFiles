puts "Pushover"
pattern Plain 2 Linear {
load 116 1E3 0 0
}

puts "analysis_Pushover"
constraints Plain
numberer Plain
system BandGeneral
test NormDispIncr 1.0e-2 200
algorithm NewtonLineSearch 0.8
analysis Static
Cyclic_Proc 5 9 0.1 116 1



