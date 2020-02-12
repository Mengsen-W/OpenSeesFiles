# * @Coding: utf-8
# * @Descripition: This is a main framework of sheer wall
# * @Author: Mengsen.Wang
# * @Date: 2020-02-11 21:27:43

wipe

puts "System of model"
model BasicBuilder -ndm 3 -ndf 6
source CyclicFunction.tcl
puts "End of system edit"

puts "Nodes"
source Nodes.tcl
puts "End of Nodes"

puts "Material"
source Material.tcl
puts "End of Material"

puts "Elements"
source Elements.tcl
puts "End of Elements"
