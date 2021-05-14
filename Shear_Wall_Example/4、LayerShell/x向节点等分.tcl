set ZNum 10
# Nmeber of Elements in X
set XNum 8
# Height
set H 3000
# Width 
set B 1800
# Thickness
set T 200
set NumZ [expr $H / $ZNum]
set NumX [expr $B / $XNum]
# Define Node
for { set i  0} { $i <= $ZNum } { incr i} {
    for {set ii 1} { $ii <= $XNum +1 } {incr ii} {
    set NodeTag [expr ($i + 1) * 100 + $ii]
    set NodeZ [expr $NumZ * $i]
    set NodeX [expr ($ii - 1 ) * $NumX ]      
    node $NodeTag   $NodeX   0   $NodeZ  
# puts    "node $NodeTag   $NodeX   0   $NodeZ  "
    }   
}
