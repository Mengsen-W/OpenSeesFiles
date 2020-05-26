# iGMfatt mean factor of amplification

puts "x direction"
set IDloadTag 101
set iGMfile "GM1X.txt"
set GMdirection "1"
set iGMfatt "5"
set dt 0.02
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $iGMfatt"
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries

puts "z direction"
set IDloadTag 102
set iGMfile "GM1Y.txt"
set GMdirection "2"
set iGMfatt "5"
set dt 0.02
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $iGMfatt"
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries

puts "z direction"
set IDloadTag 103
set iGMfile "GM1Z.txt"
set GMdirection "3"
set iGMfatt "5"
set dt 0.02;
set AccelSeries "Series -dt $dt -filePath $iGMfile -factor  $iGMfatt"
pattern UniformExcitation  $IDloadTag  $GMdirection -accel  $AccelSeries

