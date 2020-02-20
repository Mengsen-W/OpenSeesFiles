# * @Coding: utf-8
# * @Descripition: This is a Nodes files of main
# * @Author: Mengsen.Wang
# * @Date: 2020-02-12 17:35:21
# * @Last Modified time: 2020-02-12 17:35:21

puts "x-z plane nodes "
# x-z plane nodes
# "." means node
# ._._._._._._. z = 1500
# ._._._._._._. z = 1200
# ._._._._._._. z = 900
# ._._._._._._. z = 600
# ._._._._._._. z = 300
# ._._._._._. z = 0
# -390 -240 -90 90 240 390 x
# z = 0 x = 0 面 没有 (0,0,0) 节点，即没有 107 节点
for {set Storey 1 } { $Storey <= 6 }  { incr Storey } {
    set NodeTag1 [expr { $Storey *100 + 1 }]
    set NodeTag2 [expr { $Storey *100 + 2 }]
    set NodeTag3 [expr { $Storey *100 + 3 } ]
    set NodeTag4 [expr { $Storey *100 + 4 } ]
    set NodeTag5 [expr { $Storey *100 + 5 } ]
    set NodeTag6 [expr { $Storey *100 + 6 } ]
    set NodeTag7 [expr { $Storey *100 + 7 } ]

    set Nodey [expr { ($Storey - 1) * 300 }]

    set Nodex1 -390 ; set Nodex2 -90 ;set Nodex5 -240
    set Nodex3 [expr { $Nodex2 * -1 }]
    set Nodex4 [expr { $Nodex1 * -1 }]
    set Nodex6 [expr { $Nodex5 * -1 }]

    node $NodeTag1 $Nodex1 0 $Nodey
    node $NodeTag2 $Nodex2 0 $Nodey
    node $NodeTag3 $Nodex3 0 $Nodey
    node $NodeTag4 $Nodex4 0 $Nodey
    node $NodeTag5 $Nodex5 0 $Nodey
    node $NodeTag6 $Nodex6 0 $Nodey

    if {$Nodey != 0 } {
        node $NodeTag7 0 0 $Nodey
    }
}
puts "300 end"


# 在上面基础上每两层插入层，使得间距为150
for {set Storey 1 } { $Storey <= 5 }  { incr Storey } {
    set NodeTag1 [expr { ($Storey + 6)*100 + 1 }]
    set NodeTag2 [expr { ($Storey + 6)*100 + 2 }]
    set NodeTag3 [expr { ($Storey + 6)*100 + 3 }]
    set NodeTag4 [expr { ($Storey + 6)*100 + 4 }]
    set NodeTag5 [expr { ($Storey + 6)*100 + 5 }]
    set NodeTag6 [expr { ($Storey + 6)*100 + 6 }]

    set Nodey [expr { ($Storey - 1) * 300 + 150 }]
    set Nodex1 -390 ; set Nodex2 -90 ;set Nodex5 -240
    set Nodex3 [expr { $Nodex2 * -1 }]
    set Nodex4 [expr { $Nodex1 * -1 }]
    set Nodex6 [expr { $Nodex5 * -1 }]

    node $NodeTag1 $Nodex1 0 $Nodey
    node $NodeTag2 $Nodex2 0 $Nodey
    node $NodeTag3 $Nodex3 0 $Nodey
    node $NodeTag4 $Nodex4 0 $Nodey
    node $NodeTag5 $Nodex5 0 $Nodey
    node $NodeTag6 $Nodex6 0 $Nodey
}

# 再插入260间距
for {set Storey 1 } { $Storey <= 5 }  { incr Storey } {
    set NodeTag1 [expr { ($Storey + 11)*100 + 1 }]
    set NodeTag2 [expr { ($Storey + 11)*100 + 2 }]
    set NodeTag3 [expr { ($Storey + 11)*100 + 3 }]
    set NodeTag4 [expr { ($Storey + 11)*100 + 4 }]
    set NodeTag5 [expr { ($Storey + 11)*100 + 5 }]
    set NodeTag6 [expr { ($Storey + 11)*100 + 6 }]

    set NodeTag7 [expr { ($Storey + 11) *100 + 7 }]

    set Nodey [expr { ($Storey - 1) * 300 + 260 }]
    set Nodex1 -390 ; set Nodex2 -90 ;set Nodex5 -240
    set Nodex3 [expr { $Nodex2 * -1 }]
    set Nodex4 [expr { $Nodex1 * -1 }]
    set Nodex6 [expr { $Nodex5 * -1 }]

    node $NodeTag1 $Nodex1 0 $Nodey
    node $NodeTag2 $Nodex2 0 $Nodey
    node $NodeTag3 $Nodex3 0 $Nodey
    node $NodeTag4 $Nodex4 0 $Nodey
    node $NodeTag5 $Nodex5 0 $Nodey
    node $NodeTag6 $Nodex6 0 $Nodey

    if {$Nodey != 0 } {
        node $NodeTag7 0 0 $Nodey
    }
}

# 0->150->260->300->450->560->600
# 750->860->900->1050->1160->1200
# 1350->1460->1500


# 为 z = 0 的所有节点，所有自由度限制
# 相当于底边固定
puts "Constraint"
fixZ 0. 1 1 1 1 1 1