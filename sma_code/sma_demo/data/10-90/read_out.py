'''
Date: 2021-04-07 15:26:28
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-07 21:28:34
'''

import os


def write_to_csv():
    for i in sorted(out_data):
        print("temperature = {}, stress = {}".format(i, out_data[i]))
        file_handle.write('{},{}\n'.format(i, out_data[i]))


def get_number(file):

    temperature = round(float(file.split('_')[-1][0:-4]), 2)
    fd = open(file, "r")
    line = fd.readline().split()[1]
    out_data[temperature] = line
    print("temperature = {}, stress = {}".format(
        temperature, out_data[temperature]))


file_handle = open('output.csv', mode='w')
out_data = {}
for root, dirs, files in os.walk('.'):
    for file in files:
        if(file.split('.')[-1] == "out"):
            print(file)
            get_number(file)

write_to_csv()
