# @Author: Mengsen.Wang
# @Date: 2020-08-11 11:49:45
# @Last Modified by:   Mengsen.Wang
# @Last Modified time: 2020-08-11 11:49:45


reset
wipe

model BasicBuilder -ndm 3 -ndf 6

node 1 0 0 0
node 2 1 1 1

uniaxialMaterial Steel02 1 250 157035 0.23 15 0.925 0.15
uniaxialMaterial Steel02 2 250 157035 0.23 15 0.925 0.15
uniaxialMaterial Steel02 3 250 157035 0.23 15 0.925 0.15

element twoNodeLink 1 1 2 -mat 1 2 3 -dir 1 2 6;
