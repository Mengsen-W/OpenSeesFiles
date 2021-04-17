## DynamicAnalysis
# Unit: m，s，N，kg

################……start……#####################
#################################################
wipe; #wipe preceding data

#################################################
#(1)define the global coordinate system
model basic -ndm 3 -ndf 6 ;  # 3-dimentional，6 DoFs

#################################################
#(2)node，begin with 1nmk (n 横轴，m纵轴, k floor)
# nodes
# nodes 1 1
node 1110 0.000000 0.000000 0.000000;
node 1111 0.000000 0.000000 3.300000;
node 1112 0.000000 0.000000 6.600000;
node 1113 0.000000 0.000000 9.900000;
node 1114 0.000000 0.000000 13.200000;
# nodes 1 2
node 1120 0.000000 6.000000 0.000000;
node 1121 0.000000 6.000000 3.300000;
node 1122 0.000000 6.000000 6.600000;
node 1123 0.000000 6.000000 9.900000;
node 1124 0.000000 6.000000 13.200000;
# nodes 1 3
node 1130 0.000000 9.000000 0.000000;
node 1131 0.000000 9.000000 3.300000;
node 1132 0.000000 9.000000 6.600000;
node 1133 0.000000 9.000000 9.900000;
node 1134 0.000000 9.000000 13.200000;
# nodes 1 4
node 1140 0.000000 15.000000 0.000000;
node 1141 0.000000 15.000000 3.300000;
node 1142 0.000000 15.000000 6.600000;
node 1143 0.000000 15.000000 9.900000;
node 1144 0.000000 15.000000 13.200000;
# nodes 2 1
node 1210 6.000000 0.000000 0.000000;
node 1211 6.000000 0.000000 3.300000;
node 1212 6.000000 0.000000 6.600000;
node 1213 6.000000 0.000000 9.900000;
node 1214 6.000000 0.000000 13.200000;
# nodes 2 2
node 1220 6.000000 6.000000 0.000000;
node 1221 6.000000 6.000000 3.300000;
node 1222 6.000000 6.000000 6.600000;
node 1223 6.000000 6.000000 9.900000;
node 1224 6.000000 6.000000 13.200000;
# nodes 2 3
node 1230 6.000000 9.000000 0.000000;
node 1231 6.000000 9.000000 3.300000;
node 1232 6.000000 9.000000 6.600000;
node 1233 6.000000 9.000000 9.900000;
node 1234 6.000000 9.000000 13.200000;
# nodes 2 4
node 1240 6.000000 15.000000 0.000000;
node 1241 6.000000 15.000000 3.300000;
node 1242 6.000000 15.000000 6.600000;
node 1243 6.000000 15.000000 9.900000;
node 1244 6.000000 15.000000 13.200000;
# nodes 3 1
node 1310 12.000000 0.000000 0.000000;
node 1311 12.000000 0.000000 3.300000;
node 1312 12.000000 0.000000 6.600000;
node 1313 12.000000 0.000000 9.900000;
node 1314 12.000000 0.000000 13.200000;
# nodes 3 2
node 1320 12.000000 6.000000 0.000000;
node 1321 12.000000 6.000000 3.300000;
node 1322 12.000000 6.000000 6.600000;
node 1323 12.000000 6.000000 9.900000;
node 1324 12.000000 6.000000 13.200000;
# nodes 3 3
node 1330 12.000000 9.000000 0.000000;
node 1331 12.000000 9.000000 3.300000;
node 1332 12.000000 9.000000 6.600000;
node 1333 12.000000 9.000000 9.900000;
node 1334 12.000000 9.000000 13.200000;
# nodes 3 4
node 1340 12.000000 15.000000 0.000000;
node 1341 12.000000 15.000000 3.300000;
node 1342 12.000000 15.000000 6.600000;
node 1343 12.000000 15.000000 9.900000;
node 1344 12.000000 15.000000 13.200000;
# nodes 4 1
node 1410 18.000000 0.000000 0.000000;
node 1411 18.000000 0.000000 3.300000;
node 1412 18.000000 0.000000 6.600000;
node 1413 18.000000 0.000000 9.900000;
node 1414 18.000000 0.000000 13.200000;
# nodes 4 2
node 1420 18.000000 6.000000 0.000000;
node 1421 18.000000 6.000000 3.300000;
node 1422 18.000000 6.000000 6.600000;
node 1423 18.000000 6.000000 9.900000;
node 1424 18.000000 6.000000 13.200000;
# nodes 4 3
node 1430 18.000000 9.000000 0.000000;
node 1431 18.000000 9.000000 3.300000;
node 1432 18.000000 9.000000 6.600000;
node 1433 18.000000 9.000000 9.900000;
node 1434 18.000000 9.000000 13.200000;
# nodes 4 4
node 1440 18.000000 15.000000 0.000000;
node 1441 18.000000 15.000000 3.300000;
node 1442 18.000000 15.000000 6.600000;
node 1443 18.000000 15.000000 9.900000;
node 1444 18.000000 15.000000 13.200000;
# nodes 5 1
node 1510 24.000000 0.000000 0.000000;
node 1511 24.000000 0.000000 3.300000;
node 1512 24.000000 0.000000 6.600000;
node 1513 24.000000 0.000000 9.900000;
node 1514 24.000000 0.000000 13.200000;
# nodes 5 2
node 1520 24.000000 6.000000 0.000000;
node 1521 24.000000 6.000000 3.300000;
node 1522 24.000000 6.000000 6.600000;
node 1523 24.000000 6.000000 9.900000;
node 1524 24.000000 6.000000 13.200000;
# nodes 5 3
node 1530 24.000000 9.000000 0.000000;
node 1531 24.000000 9.000000 3.300000;
node 1532 24.000000 9.000000 6.600000;
node 1533 24.000000 9.000000 9.900000;
node 1534 24.000000 9.000000 13.200000;
# nodes 5 4
node 1540 24.000000 15.000000 0.000000;
node 1541 24.000000 15.000000 3.300000;
node 1542 24.000000 15.000000 6.600000;
node 1543 24.000000 15.000000 9.900000;
node 1544 24.000000 15.000000 13.200000;
# nodes 6 1
node 1610 30.000000 0.000000 0.000000;
node 1611 30.000000 0.000000 3.300000;
node 1612 30.000000 0.000000 6.600000;
node 1613 30.000000 0.000000 9.900000;
node 1614 30.000000 0.000000 13.200000;
# nodes 6 2
node 1620 30.000000 6.000000 0.000000;
node 1621 30.000000 6.000000 3.300000;
node 1622 30.000000 6.000000 6.600000;
node 1623 30.000000 6.000000 9.900000;
node 1624 30.000000 6.000000 13.200000;
# nodes 6 3
node 1630 30.000000 9.000000 0.000000;
node 1631 30.000000 9.000000 3.300000;
node 1632 30.000000 9.000000 6.600000;
node 1633 30.000000 9.000000 9.900000;
node 1634 30.000000 9.000000 13.200000;
# nodes 6 4
node 1640 30.000000 15.000000 0.000000;
node 1641 30.000000 15.000000 3.300000;
node 1642 30.000000 15.000000 6.600000;
node 1643 30.000000 15.000000 9.900000;
node 1644 30.000000 15.000000 13.200000;
# nodes 7 1
node 1710 36.000000 0.000000 0.000000;
node 1711 36.000000 0.000000 3.300000;
node 1712 36.000000 0.000000 6.600000;
node 1713 36.000000 0.000000 9.900000;
node 1714 36.000000 0.000000 13.200000;
# nodes 7 2
node 1720 36.000000 6.000000 0.000000;
node 1721 36.000000 6.000000 3.300000;
node 1722 36.000000 6.000000 6.600000;
node 1723 36.000000 6.000000 9.900000;
node 1724 36.000000 6.000000 13.200000;
# nodes 7 3
node 1730 36.000000 9.000000 0.000000;
node 1731 36.000000 9.000000 3.300000;
node 1732 36.000000 9.000000 6.600000;
node 1733 36.000000 9.000000 9.900000;
node 1734 36.000000 9.000000 13.200000;
# nodes 7 4
node 1740 36.000000 15.000000 0.000000;
node 1741 36.000000 15.000000 3.300000;
node 1742 36.000000 15.000000 6.600000;
node 1743 36.000000 15.000000 9.900000;
node 1744 36.000000 15.000000 13.200000;


# mass center
node 1001 18.000000 7.500000 3.300000;
node 1002 18.000000 7.500000 6.600000;
node 1003 18.000000 7.500000 9.900000;
node 1004 18.000000 7.500000 13.200000;


# mass
#################################################
mass 1001 120690.000000 120690.000000 0.000000 0.000000 0.000000 0.000000;
mass 1002 120690.000000 120690.000000 0.000000 0.000000 0.000000 0.000000;
mass 1003 120690.000000 120690.000000 0.000000 0.000000 0.000000 0.000000;
mass 1004 120690.000000 120690.000000 0.000000 0.000000 0.000000 0.000000;


#################################################
#(3)restraint
fix 1110 1 1 1 1 1 1;
fix 1120 1 1 1 1 1 1;
fix 1130 1 1 1 1 1 1;
fix 1140 1 1 1 1 1 1;
fix 1210 1 1 1 1 1 1;
fix 1220 1 1 1 1 1 1;
fix 1230 1 1 1 1 1 1;
fix 1240 1 1 1 1 1 1;
fix 1310 1 1 1 1 1 1;
fix 1320 1 1 1 1 1 1;
fix 1330 1 1 1 1 1 1;
fix 1340 1 1 1 1 1 1;
fix 1410 1 1 1 1 1 1;
fix 1420 1 1 1 1 1 1;
fix 1430 1 1 1 1 1 1;
fix 1440 1 1 1 1 1 1;
fix 1510 1 1 1 1 1 1;
fix 1520 1 1 1 1 1 1;
fix 1530 1 1 1 1 1 1;
fix 1540 1 1 1 1 1 1;
fix 1610 1 1 1 1 1 1;
fix 1620 1 1 1 1 1 1;
fix 1630 1 1 1 1 1 1;
fix 1640 1 1 1 1 1 1;
fix 1710 1 1 1 1 1 1;
fix 1720 1 1 1 1 1 1;
fix 1730 1 1 1 1 1 1;
fix 1740 1 1 1 1 1 1;

fix 1001 0 0 1 1 1 0;
fix 1002 0 0 1 1 1 0;
fix 1003 0 0 1 1 1 0;
fix 1004 0 0 1 1 1 0;

rigidDiaphragm 3 1001 1111 1121 1131 1141 1211 1221 1231 1241 1311 1321 1331 1341 1411 1421 1431 1441 1511 1521 1531 1541 1611 1621 1631 1641 1711 1721 1731 1741;
rigidDiaphragm 3 1002 1112 1122 1132 1142 1212 1222 1232 1242 1312 1322 1332 1342 1412 1422 1432 1442 1512 1522 1532 1542 1612 1622 1632 1642 1712 1722 1732 1742;
rigidDiaphragm 3 1003 1113 1123 1133 1143 1213 1223 1233 1243 1313 1323 1333 1343 1413 1423 1433 1443 1513 1523 1533 1543 1613 1623 1633 1643 1713 1723 1733 1743;
rigidDiaphragm 3 1004 1114 1124 1134 1144 1214 1224 1234 1244 1314 1324 1334 1344 1414 1424 1434 1444 1514 1524 1534 1544 1614 1624 1634 1644 1714 1724 1734 1744;


#################################################
#(4)material，begin with 2
uniaxialMaterial Steel01 21 335000000.000000 2100000000.000000 0.063000;   #steel01
uniaxialMaterial Concrete01 22 20100000.000000 0.002000 4020000.000000 0.033000;   #Concrete01


#################################################
#(5)section

section Fiber 31 -GJ 1e+10 {  ; # column 500*500
patch rect 22 20 20 -0.200000 -0.200000 0.200000 0.200000 
patch rect 22 20 2 -0.250000 -0.250000 0.250000 -0.200000 
patch rect 22 20 2 -0.250000 0.200000 0.250000 0.250000 
patch rect 22 2 20 -0.250000 -0.200000 -0.200000 0.200000 
patch rect 22 2 20 0.200000 -0.200000 0.250000 0.200000 
layer straight 21 2 0.000804 -0.200000 -0.200000 0.200000 -0.200000 
layer straight 21 2 0.000804 -0.200000 0.200000 0.200000 0.200000 
}
section Fiber 32 -GJ 1e+10 {  ; # beam 250*500
patch rect 22 20 20 -0.075000 -0.200000 0.075000 0.200000 
patch rect 22 20 2 -0.125000 -0.250000 0.125000 -0.200000 
patch rect 22 20 2 -0.125000 0.200000 0.125000 0.250000 
patch rect 22 2 20 -0.125000 -0.200000 -0.075000 0.200000 
patch rect 22 2 20 0.075000 -0.200000 0.125000 0.200000 
layer straight 21 2 0.000314 -0.075000 -0.200000 0.075000 -0.200000 
layer straight 21 2 0.000314 -0.075000 0.200000 0.075000 0.200000 
}
#################################################
#(6)coordinate transformation，begin with 4
geomTransf PDelta 41 0 1 0; #P-Delta transformation for column
geomTransf Linear 42 0 0 1; #inear transformation for beam


#################################################
#(7)element，begin with 5
#column

# trans Long  1 1
element nonlinearBeamColumn 11101111 1110 1111 5 31 41;
element nonlinearBeamColumn 11111112 1111 1112 5 31 41;
element nonlinearBeamColumn 11121113 1112 1113 5 31 41;
element nonlinearBeamColumn 11131114 1113 1114 5 31 41;
# trans Long  1 2
element nonlinearBeamColumn 11201121 1120 1121 5 31 41;
element nonlinearBeamColumn 11211122 1121 1122 5 31 41;
element nonlinearBeamColumn 11221123 1122 1123 5 31 41;
element nonlinearBeamColumn 11231124 1123 1124 5 31 41;
# trans Long  1 3
element nonlinearBeamColumn 11301131 1130 1131 5 31 41;
element nonlinearBeamColumn 11311132 1131 1132 5 31 41;
element nonlinearBeamColumn 11321133 1132 1133 5 31 41;
element nonlinearBeamColumn 11331134 1133 1134 5 31 41;
# trans Long  1 4
element nonlinearBeamColumn 11401141 1140 1141 5 31 41;
element nonlinearBeamColumn 11411142 1141 1142 5 31 41;
element nonlinearBeamColumn 11421143 1142 1143 5 31 41;
element nonlinearBeamColumn 11431144 1143 1144 5 31 41;
# trans Long  2 1
element nonlinearBeamColumn 12101211 1210 1211 5 31 41;
element nonlinearBeamColumn 12111212 1211 1212 5 31 41;
element nonlinearBeamColumn 12121213 1212 1213 5 31 41;
element nonlinearBeamColumn 12131214 1213 1214 5 31 41;
# trans Long  2 2
element nonlinearBeamColumn 12201221 1220 1221 5 31 41;
element nonlinearBeamColumn 12211222 1221 1222 5 31 41;
element nonlinearBeamColumn 12221223 1222 1223 5 31 41;
element nonlinearBeamColumn 12231224 1223 1224 5 31 41;
# trans Long  2 3
element nonlinearBeamColumn 12301231 1230 1231 5 31 41;
element nonlinearBeamColumn 12311232 1231 1232 5 31 41;
element nonlinearBeamColumn 12321233 1232 1233 5 31 41;
element nonlinearBeamColumn 12331234 1233 1234 5 31 41;
# trans Long  2 4
element nonlinearBeamColumn 12401241 1240 1241 5 31 41;
element nonlinearBeamColumn 12411242 1241 1242 5 31 41;
element nonlinearBeamColumn 12421243 1242 1243 5 31 41;
element nonlinearBeamColumn 12431244 1243 1244 5 31 41;
# trans Long  3 1
element nonlinearBeamColumn 13101311 1310 1311 5 31 41;
element nonlinearBeamColumn 13111312 1311 1312 5 31 41;
element nonlinearBeamColumn 13121313 1312 1313 5 31 41;
element nonlinearBeamColumn 13131314 1313 1314 5 31 41;
# trans Long  3 2
element nonlinearBeamColumn 13201321 1320 1321 5 31 41;
element nonlinearBeamColumn 13211322 1321 1322 5 31 41;
element nonlinearBeamColumn 13221323 1322 1323 5 31 41;
element nonlinearBeamColumn 13231324 1323 1324 5 31 41;
# trans Long  3 3
element nonlinearBeamColumn 13301331 1330 1331 5 31 41;
element nonlinearBeamColumn 13311332 1331 1332 5 31 41;
element nonlinearBeamColumn 13321333 1332 1333 5 31 41;
element nonlinearBeamColumn 13331334 1333 1334 5 31 41;
# trans Long  3 4
element nonlinearBeamColumn 13401341 1340 1341 5 31 41;
element nonlinearBeamColumn 13411342 1341 1342 5 31 41;
element nonlinearBeamColumn 13421343 1342 1343 5 31 41;
element nonlinearBeamColumn 13431344 1343 1344 5 31 41;
# trans Long  4 1
element nonlinearBeamColumn 14101411 1410 1411 5 31 41;
element nonlinearBeamColumn 14111412 1411 1412 5 31 41;
element nonlinearBeamColumn 14121413 1412 1413 5 31 41;
element nonlinearBeamColumn 14131414 1413 1414 5 31 41;
# trans Long  4 2
element nonlinearBeamColumn 14201421 1420 1421 5 31 41;
element nonlinearBeamColumn 14211422 1421 1422 5 31 41;
element nonlinearBeamColumn 14221423 1422 1423 5 31 41;
element nonlinearBeamColumn 14231424 1423 1424 5 31 41;
# trans Long  4 3
element nonlinearBeamColumn 14301431 1430 1431 5 31 41;
element nonlinearBeamColumn 14311432 1431 1432 5 31 41;
element nonlinearBeamColumn 14321433 1432 1433 5 31 41;
element nonlinearBeamColumn 14331434 1433 1434 5 31 41;
# trans Long  4 4
element nonlinearBeamColumn 14401441 1440 1441 5 31 41;
element nonlinearBeamColumn 14411442 1441 1442 5 31 41;
element nonlinearBeamColumn 14421443 1442 1443 5 31 41;
element nonlinearBeamColumn 14431444 1443 1444 5 31 41;
# trans Long  5 1
element nonlinearBeamColumn 15101511 1510 1511 5 31 41;
element nonlinearBeamColumn 15111512 1511 1512 5 31 41;
element nonlinearBeamColumn 15121513 1512 1513 5 31 41;
element nonlinearBeamColumn 15131514 1513 1514 5 31 41;
# trans Long  5 2
element nonlinearBeamColumn 15201521 1520 1521 5 31 41;
element nonlinearBeamColumn 15211522 1521 1522 5 31 41;
element nonlinearBeamColumn 15221523 1522 1523 5 31 41;
element nonlinearBeamColumn 15231524 1523 1524 5 31 41;
# trans Long  5 3
element nonlinearBeamColumn 15301531 1530 1531 5 31 41;
element nonlinearBeamColumn 15311532 1531 1532 5 31 41;
element nonlinearBeamColumn 15321533 1532 1533 5 31 41;
element nonlinearBeamColumn 15331534 1533 1534 5 31 41;
# trans Long  5 4
element nonlinearBeamColumn 15401541 1540 1541 5 31 41;
element nonlinearBeamColumn 15411542 1541 1542 5 31 41;
element nonlinearBeamColumn 15421543 1542 1543 5 31 41;
element nonlinearBeamColumn 15431544 1543 1544 5 31 41;
# trans Long  6 1
element nonlinearBeamColumn 16101611 1610 1611 5 31 41;
element nonlinearBeamColumn 16111612 1611 1612 5 31 41;
element nonlinearBeamColumn 16121613 1612 1613 5 31 41;
element nonlinearBeamColumn 16131614 1613 1614 5 31 41;
# trans Long  6 2
element nonlinearBeamColumn 16201621 1620 1621 5 31 41;
element nonlinearBeamColumn 16211622 1621 1622 5 31 41;
element nonlinearBeamColumn 16221623 1622 1623 5 31 41;
element nonlinearBeamColumn 16231624 1623 1624 5 31 41;
# trans Long  6 3
element nonlinearBeamColumn 16301631 1630 1631 5 31 41;
element nonlinearBeamColumn 16311632 1631 1632 5 31 41;
element nonlinearBeamColumn 16321633 1632 1633 5 31 41;
element nonlinearBeamColumn 16331634 1633 1634 5 31 41;
# trans Long  6 4
element nonlinearBeamColumn 16401641 1640 1641 5 31 41;
element nonlinearBeamColumn 16411642 1641 1642 5 31 41;
element nonlinearBeamColumn 16421643 1642 1643 5 31 41;
element nonlinearBeamColumn 16431644 1643 1644 5 31 41;
# trans Long  7 1
element nonlinearBeamColumn 17101711 1710 1711 5 31 41;
element nonlinearBeamColumn 17111712 1711 1712 5 31 41;
element nonlinearBeamColumn 17121713 1712 1713 5 31 41;
element nonlinearBeamColumn 17131714 1713 1714 5 31 41;
# trans Long  7 2
element nonlinearBeamColumn 17201721 1720 1721 5 31 41;
element nonlinearBeamColumn 17211722 1721 1722 5 31 41;
element nonlinearBeamColumn 17221723 1722 1723 5 31 41;
element nonlinearBeamColumn 17231724 1723 1724 5 31 41;
# trans Long  7 3
element nonlinearBeamColumn 17301731 1730 1731 5 31 41;
element nonlinearBeamColumn 17311732 1731 1732 5 31 41;
element nonlinearBeamColumn 17321733 1732 1733 5 31 41;
element nonlinearBeamColumn 17331734 1733 1734 5 31 41;
# trans Long  7 4
element nonlinearBeamColumn 17401741 1740 1741 5 31 41;
element nonlinearBeamColumn 17411742 1741 1742 5 31 41;
element nonlinearBeamColumn 17421743 1742 1743 5 31 41;
element nonlinearBeamColumn 17431744 1743 1744 5 31 41;


# Beam 

# 1floor 1trans 
element nonlinearBeamColumn 11111121 1111 1121 5 32 42;
element nonlinearBeamColumn 11211131 1121 1131 5 32 42;
element nonlinearBeamColumn 11311141 1131 1141 5 32 42;
# 1floor 2trans 
element nonlinearBeamColumn 12111221 1211 1221 5 32 42;
element nonlinearBeamColumn 12211231 1221 1231 5 32 42;
element nonlinearBeamColumn 12311241 1231 1241 5 32 42;
# 1floor 3trans 
element nonlinearBeamColumn 13111321 1311 1321 5 32 42;
element nonlinearBeamColumn 13211331 1321 1331 5 32 42;
element nonlinearBeamColumn 13311341 1331 1341 5 32 42;
# 1floor 4trans 
element nonlinearBeamColumn 14111421 1411 1421 5 32 42;
element nonlinearBeamColumn 14211431 1421 1431 5 32 42;
element nonlinearBeamColumn 14311441 1431 1441 5 32 42;
# 1floor 5trans 
element nonlinearBeamColumn 15111521 1511 1521 5 32 42;
element nonlinearBeamColumn 15211531 1521 1531 5 32 42;
element nonlinearBeamColumn 15311541 1531 1541 5 32 42;
# 1floor 6trans 
element nonlinearBeamColumn 16111621 1611 1621 5 32 42;
element nonlinearBeamColumn 16211631 1621 1631 5 32 42;
element nonlinearBeamColumn 16311641 1631 1641 5 32 42;
# 1floor 7trans 
element nonlinearBeamColumn 17111721 1711 1721 5 32 42;
element nonlinearBeamColumn 17211731 1721 1731 5 32 42;
element nonlinearBeamColumn 17311741 1731 1741 5 32 42;
# 2floor 1trans 
element nonlinearBeamColumn 11121122 1112 1122 5 32 42;
element nonlinearBeamColumn 11221132 1122 1132 5 32 42;
element nonlinearBeamColumn 11321142 1132 1142 5 32 42;
# 2floor 2trans 
element nonlinearBeamColumn 12121222 1212 1222 5 32 42;
element nonlinearBeamColumn 12221232 1222 1232 5 32 42;
element nonlinearBeamColumn 12321242 1232 1242 5 32 42;
# 2floor 3trans 
element nonlinearBeamColumn 13121322 1312 1322 5 32 42;
element nonlinearBeamColumn 13221332 1322 1332 5 32 42;
element nonlinearBeamColumn 13321342 1332 1342 5 32 42;
# 2floor 4trans 
element nonlinearBeamColumn 14121422 1412 1422 5 32 42;
element nonlinearBeamColumn 14221432 1422 1432 5 32 42;
element nonlinearBeamColumn 14321442 1432 1442 5 32 42;
# 2floor 5trans 
element nonlinearBeamColumn 15121522 1512 1522 5 32 42;
element nonlinearBeamColumn 15221532 1522 1532 5 32 42;
element nonlinearBeamColumn 15321542 1532 1542 5 32 42;
# 2floor 6trans 
element nonlinearBeamColumn 16121622 1612 1622 5 32 42;
element nonlinearBeamColumn 16221632 1622 1632 5 32 42;
element nonlinearBeamColumn 16321642 1632 1642 5 32 42;
# 2floor 7trans 
element nonlinearBeamColumn 17121722 1712 1722 5 32 42;
element nonlinearBeamColumn 17221732 1722 1732 5 32 42;
element nonlinearBeamColumn 17321742 1732 1742 5 32 42;
# 3floor 1trans 
element nonlinearBeamColumn 11131123 1113 1123 5 32 42;
element nonlinearBeamColumn 11231133 1123 1133 5 32 42;
element nonlinearBeamColumn 11331143 1133 1143 5 32 42;
# 3floor 2trans 
element nonlinearBeamColumn 12131223 1213 1223 5 32 42;
element nonlinearBeamColumn 12231233 1223 1233 5 32 42;
element nonlinearBeamColumn 12331243 1233 1243 5 32 42;
# 3floor 3trans 
element nonlinearBeamColumn 13131323 1313 1323 5 32 42;
element nonlinearBeamColumn 13231333 1323 1333 5 32 42;
element nonlinearBeamColumn 13331343 1333 1343 5 32 42;
# 3floor 4trans 
element nonlinearBeamColumn 14131423 1413 1423 5 32 42;
element nonlinearBeamColumn 14231433 1423 1433 5 32 42;
element nonlinearBeamColumn 14331443 1433 1443 5 32 42;
# 3floor 5trans 
element nonlinearBeamColumn 15131523 1513 1523 5 32 42;
element nonlinearBeamColumn 15231533 1523 1533 5 32 42;
element nonlinearBeamColumn 15331543 1533 1543 5 32 42;
# 3floor 6trans 
element nonlinearBeamColumn 16131623 1613 1623 5 32 42;
element nonlinearBeamColumn 16231633 1623 1633 5 32 42;
element nonlinearBeamColumn 16331643 1633 1643 5 32 42;
# 3floor 7trans 
element nonlinearBeamColumn 17131723 1713 1723 5 32 42;
element nonlinearBeamColumn 17231733 1723 1733 5 32 42;
element nonlinearBeamColumn 17331743 1733 1743 5 32 42;
# 4floor 1trans 
element nonlinearBeamColumn 11141124 1114 1124 5 32 42;
element nonlinearBeamColumn 11241134 1124 1134 5 32 42;
element nonlinearBeamColumn 11341144 1134 1144 5 32 42;
# 4floor 2trans 
element nonlinearBeamColumn 12141224 1214 1224 5 32 42;
element nonlinearBeamColumn 12241234 1224 1234 5 32 42;
element nonlinearBeamColumn 12341244 1234 1244 5 32 42;
# 4floor 3trans 
element nonlinearBeamColumn 13141324 1314 1324 5 32 42;
element nonlinearBeamColumn 13241334 1324 1334 5 32 42;
element nonlinearBeamColumn 13341344 1334 1344 5 32 42;
# 4floor 4trans 
element nonlinearBeamColumn 14141424 1414 1424 5 32 42;
element nonlinearBeamColumn 14241434 1424 1434 5 32 42;
element nonlinearBeamColumn 14341444 1434 1444 5 32 42;
# 4floor 5trans 
element nonlinearBeamColumn 15141524 1514 1524 5 32 42;
element nonlinearBeamColumn 15241534 1524 1534 5 32 42;
element nonlinearBeamColumn 15341544 1534 1544 5 32 42;
# 4floor 6trans 
element nonlinearBeamColumn 16141624 1614 1624 5 32 42;
element nonlinearBeamColumn 16241634 1624 1634 5 32 42;
element nonlinearBeamColumn 16341644 1634 1644 5 32 42;
# 4floor 7trans 
element nonlinearBeamColumn 17141724 1714 1724 5 32 42;
element nonlinearBeamColumn 17241734 1724 1734 5 32 42;
element nonlinearBeamColumn 17341744 1734 1744 5 32 42;


# 1floor 1Long
element nonlinearBeamColumn 11111211 1111 1211 5 32 42;
element nonlinearBeamColumn 12111311 1211 1311 5 32 42;
element nonlinearBeamColumn 13111411 1311 1411 5 32 42;
element nonlinearBeamColumn 14111511 1411 1511 5 32 42;
element nonlinearBeamColumn 15111611 1511 1611 5 32 42;
element nonlinearBeamColumn 16111711 1611 1711 5 32 42;
# 1floor 2Long
element nonlinearBeamColumn 11211221 1121 1221 5 32 42;
element nonlinearBeamColumn 12211321 1221 1321 5 32 42;
element nonlinearBeamColumn 13211421 1321 1421 5 32 42;
element nonlinearBeamColumn 14211521 1421 1521 5 32 42;
element nonlinearBeamColumn 15211621 1521 1621 5 32 42;
element nonlinearBeamColumn 16211721 1621 1721 5 32 42;
# 1floor 3Long
element nonlinearBeamColumn 11311231 1131 1231 5 32 42;
element nonlinearBeamColumn 12311331 1231 1331 5 32 42;
element nonlinearBeamColumn 13311431 1331 1431 5 32 42;
element nonlinearBeamColumn 14311531 1431 1531 5 32 42;
element nonlinearBeamColumn 15311631 1531 1631 5 32 42;
element nonlinearBeamColumn 16311731 1631 1731 5 32 42;
# 1floor 4Long
element nonlinearBeamColumn 11411241 1141 1241 5 32 42;
element nonlinearBeamColumn 12411341 1241 1341 5 32 42;
element nonlinearBeamColumn 13411441 1341 1441 5 32 42;
element nonlinearBeamColumn 14411541 1441 1541 5 32 42;
element nonlinearBeamColumn 15411641 1541 1641 5 32 42;
element nonlinearBeamColumn 16411741 1641 1741 5 32 42;
# 2floor 1Long
element nonlinearBeamColumn 11121212 1112 1212 5 32 42;
element nonlinearBeamColumn 12121312 1212 1312 5 32 42;
element nonlinearBeamColumn 13121412 1312 1412 5 32 42;
element nonlinearBeamColumn 14121512 1412 1512 5 32 42;
element nonlinearBeamColumn 15121612 1512 1612 5 32 42;
element nonlinearBeamColumn 16121712 1612 1712 5 32 42;
# 2floor 2Long
element nonlinearBeamColumn 11221222 1122 1222 5 32 42;
element nonlinearBeamColumn 12221322 1222 1322 5 32 42;
element nonlinearBeamColumn 13221422 1322 1422 5 32 42;
element nonlinearBeamColumn 14221522 1422 1522 5 32 42;
element nonlinearBeamColumn 15221622 1522 1622 5 32 42;
element nonlinearBeamColumn 16221722 1622 1722 5 32 42;
# 2floor 3Long
element nonlinearBeamColumn 11321232 1132 1232 5 32 42;
element nonlinearBeamColumn 12321332 1232 1332 5 32 42;
element nonlinearBeamColumn 13321432 1332 1432 5 32 42;
element nonlinearBeamColumn 14321532 1432 1532 5 32 42;
element nonlinearBeamColumn 15321632 1532 1632 5 32 42;
element nonlinearBeamColumn 16321732 1632 1732 5 32 42;
# 2floor 4Long
element nonlinearBeamColumn 11421242 1142 1242 5 32 42;
element nonlinearBeamColumn 12421342 1242 1342 5 32 42;
element nonlinearBeamColumn 13421442 1342 1442 5 32 42;
element nonlinearBeamColumn 14421542 1442 1542 5 32 42;
element nonlinearBeamColumn 15421642 1542 1642 5 32 42;
element nonlinearBeamColumn 16421742 1642 1742 5 32 42;
# 3floor 1Long
element nonlinearBeamColumn 11131213 1113 1213 5 32 42;
element nonlinearBeamColumn 12131313 1213 1313 5 32 42;
element nonlinearBeamColumn 13131413 1313 1413 5 32 42;
element nonlinearBeamColumn 14131513 1413 1513 5 32 42;
element nonlinearBeamColumn 15131613 1513 1613 5 32 42;
element nonlinearBeamColumn 16131713 1613 1713 5 32 42;
# 3floor 2Long
element nonlinearBeamColumn 11231223 1123 1223 5 32 42;
element nonlinearBeamColumn 12231323 1223 1323 5 32 42;
element nonlinearBeamColumn 13231423 1323 1423 5 32 42;
element nonlinearBeamColumn 14231523 1423 1523 5 32 42;
element nonlinearBeamColumn 15231623 1523 1623 5 32 42;
element nonlinearBeamColumn 16231723 1623 1723 5 32 42;
# 3floor 3Long
element nonlinearBeamColumn 11331233 1133 1233 5 32 42;
element nonlinearBeamColumn 12331333 1233 1333 5 32 42;
element nonlinearBeamColumn 13331433 1333 1433 5 32 42;
element nonlinearBeamColumn 14331533 1433 1533 5 32 42;
element nonlinearBeamColumn 15331633 1533 1633 5 32 42;
element nonlinearBeamColumn 16331733 1633 1733 5 32 42;
# 3floor 4Long
element nonlinearBeamColumn 11431243 1143 1243 5 32 42;
element nonlinearBeamColumn 12431343 1243 1343 5 32 42;
element nonlinearBeamColumn 13431443 1343 1443 5 32 42;
element nonlinearBeamColumn 14431543 1443 1543 5 32 42;
element nonlinearBeamColumn 15431643 1543 1643 5 32 42;
element nonlinearBeamColumn 16431743 1643 1743 5 32 42;
# 4floor 1Long
element nonlinearBeamColumn 11141214 1114 1214 5 32 42;
element nonlinearBeamColumn 12141314 1214 1314 5 32 42;
element nonlinearBeamColumn 13141414 1314 1414 5 32 42;
element nonlinearBeamColumn 14141514 1414 1514 5 32 42;
element nonlinearBeamColumn 15141614 1514 1614 5 32 42;
element nonlinearBeamColumn 16141714 1614 1714 5 32 42;
# 4floor 2Long
element nonlinearBeamColumn 11241224 1124 1224 5 32 42;
element nonlinearBeamColumn 12241324 1224 1324 5 32 42;
element nonlinearBeamColumn 13241424 1324 1424 5 32 42;
element nonlinearBeamColumn 14241524 1424 1524 5 32 42;
element nonlinearBeamColumn 15241624 1524 1624 5 32 42;
element nonlinearBeamColumn 16241724 1624 1724 5 32 42;
# 4floor 3Long
element nonlinearBeamColumn 11341234 1134 1234 5 32 42;
element nonlinearBeamColumn 12341334 1234 1334 5 32 42;
element nonlinearBeamColumn 13341434 1334 1434 5 32 42;
element nonlinearBeamColumn 14341534 1434 1534 5 32 42;
element nonlinearBeamColumn 15341634 1534 1634 5 32 42;
element nonlinearBeamColumn 16341734 1634 1734 5 32 42;
# 4floor 4Long
element nonlinearBeamColumn 11441244 1144 1244 5 32 42;
element nonlinearBeamColumn 12441344 1244 1344 5 32 42;
element nonlinearBeamColumn 13441444 1344 1444 5 32 42;
element nonlinearBeamColumn 14441544 1444 1544 5 32 42;
element nonlinearBeamColumn 15441644 1544 1644 5 32 42;
element nonlinearBeamColumn 16441744 1644 1744 5 32 42;


#################################################
#(8)output
#creat folder）
if { [file exists output] == 0 } {   
file mkdir output
}
recorder Node -file output/displacement_lateral_1.txt -node 1001 1002 1003 1004 -dof 1 disp;
recorder Node -file output/displacement_lateral_2.txt -node 1001 1002 1003 1004 -dof 2 disp;


# recorder Drift -file output/drift.txt -time -iNode 1110 1001 1002 1003 -jNode 1001 1002 1003 1004 -dof 1 -perpDirn 3 
# source DisplayPlane_IR.tcl;		# procedure for displaying a plane in model 
# source DisplayModel3D_IR.tcl;		# procedure for displaying 3D perspectives of model
# DisplayModel3D DeformedShape ;	 # options: DeformedShape NodeNumbers ModeShape

#rayleigh damper;
set Zeta_Damp 0.05;
set nEigenI 1;
set nEigenII 2;

set lambdaN [eigen [expr $nEigenII]];
set lambdaI [lindex $lambdaN [expr $nEigenI-1]];
set lambdaII [lindex $lambdaN [expr $nEigenII-1]];

set omegaI [expr pow($lambdaI,0.5)];
set omegaII [expr pow($lambdaII,0.5)];



set alphaM [expr $Zeta_Damp*2.0*$omegaI*$omegaII/($omegaI + $omegaII)];
set betaKinit [expr $Zeta_Damp*2.0/($omegaI + $omegaII)];
rayleigh $alphaM 0 $betaKinit 0;
# puts $alphaM
# puts $betaKinit

set lambdaN_1 [eigen 4];
set PI [expr 2*asin(1.0)]; 
set omega {}
set f {} 
set T {} 
foreach lam $lambdaN_1 {
	lappend omega [expr sqrt($lam)] 
	lappend f [expr sqrt($lam)/(2*$PI)]
	lappend T [expr (2*$PI)/sqrt($lam)] 
}
puts "*******************************************"
puts "frequency are $omega Rad/Sec"
puts "frequency are $f Hz" 
puts "periods are $T Sec"
puts "*******************************************"
# puts "periods are $T" 

set outFile [open period.txt w]
puts $outFile "frequency=$omega  Rad/Sec;";
puts $outFile " periods=$T Sec ";
puts $outFile " alphaM=$alphaM ";
puts $outFile " betaKinit=$betaKinit";
close $outFile;

#时程分析
set factor_GM1 [expr 10];
set factor_GM2 [expr 10];
set dt 0.02;

set AccelSeries1 "Series -dt $dt -filePath earthquake_1x_0.02.txt -factor  $factor_GM1";
set AccelSeries2 "Series -dt $dt -filePath earthquake_1y_0.02.txt -factor  $factor_GM2";
pattern UniformExcitation 501 1 -accel  $AccelSeries1;
pattern UniformExcitation 502 2 -accel  $AccelSeries2;


set startT [clock seconds]
constraints Transformation;           #约束边界处理
numberer RCM;                             #结点自由度编号采用输入结点顺序
system BandGeneral;                            #矩阵带宽处理
test EnergyIncr 1e-1 2000;             #收敛采用能量准则，容许误差1E-10，最多迭代2000次
algorithm Newton -initial;                      #迭代算法 algorithm Linear 0.7; algorithm Newton;
integrator Newmark 0.5 0.25;               #Newmark法
analysis Transient;                        #动态分析
analyze 1000 $dt;                          #分析1000*dt步
set endT [clock seconds]
puts "finish time :[expr $endT-$startT] seconds."


#################……结束……#####################
#################################################
puts "Ground Motion Done. End Time: [getTime]"
puts OVER
