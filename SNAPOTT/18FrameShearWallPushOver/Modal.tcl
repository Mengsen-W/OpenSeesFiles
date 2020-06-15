set numModes 39
set lambda [eigen  $numModes]
set period "output/Periods.txt"
set Periods [open $period "w"]
puts $Periods " $lambda"
close $Periods
record