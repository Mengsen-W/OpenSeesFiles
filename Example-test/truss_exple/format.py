# coding = "utf-8"
# Authors: Mengsen.Wang
# Time: 2020-1-20 19:54:21

import pandas as pd
import numpy as np

file = open("D:/wangmengsen/Code/OpenSEES/truss_exple/reaction_1.out", "r")
list_data = file.readlines()
list = []
name = ["time", "displace", "force"]
for i in list_data:
    str(i)
    list.append([i])
    print(list)



