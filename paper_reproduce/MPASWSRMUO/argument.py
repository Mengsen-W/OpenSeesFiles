"""
Author: Mengsen.Wang
Date: 2020-09-19 10: 36: 37
Last Modified by:   Mengsen.Wang
Last Modified time: 2020-09-19 10: 36: 37
Description: shear wall geometric parameters
"""
# Written by MengsenWang SZU China
# mengsen_wang@163.com

#                 Use SI
#                 Node Tag                height
# 1011 2011 3011 4011 5011 6011 7011 8011 3.2
# 1010 2010 3010 4010 5010 6010 7010 8010 2.88
# 1009 2009 3009 4009 5009 6009 7009 8009 2.56
# 1008 2008 3008 4008 5008 6008 7008 8008 2.24
# 1007 2007 3007 4007 5007 6007 7007 8007 1.92
# 1006 2006 3006 4006 5006 6006 7006 8006 1.60
# 1005 2005 3005 4005 5005 6005 7005 8005 1.28
# 1004 2004 3004 4004 5004 6004 7004 8004 0.96
# 1003 2003 3003 4003 5003 6003 7003 8003 0.64
# 1002 2002 3002 4002 5002 6002 7002 8002 0.32
# 1001 2001 3001 4001 5001 6001 7001 8001 0.00
# /|\  /|\  /|\  /|\  /|\  /|\  /|\  /|\  full fixed
# 0.0 0.16 0.32 0.64 0.96 1.28 1.44 1.60  length


from log import logger, log_ini

ASCII_model: str = "\
Written by MengsenWang SZU Chinan\n\
mengsen_wang@163.com\n\n\
                 Use SI\n\
                 Node Tag                height\n\
 1011 2011 3011 4011 5011 6011 7011 8011 3.2\n\
 1010 2010 3010 4010 5010 6010 7010 8010 2.88\n\
 1009 2009 3009 4009 5009 6009 7009 8009 2.56\n\
 1008 2008 3008 4008 5008 6008 7008 8008 2.24\n\
 1007 2007 3007 4007 5007 6007 7007 8007 1.92\n\
 1006 2006 3006 4006 5006 6006 7006 8006 1.60\n\
 1005 2005 3005 4005 5005 6005 7005 8005 1.28\n\
 1004 2004 3004 4004 5004 6004 7004 8004 0.96\n\
 1003 2003 3003 4003 5003 6003 7003 8003 0.64\n\
 1002 2002 3002 4002 5002 6002 7002 8002 0.32\n\
 1001 2001 3001 4001 5001 6001 7001 8001 0.00\n\
 /|\  /|\  /|\  /|\  /|\  /|\  /|\  /|\  full fixed\n\
 0.0 0.16 0.32 0.64 0.96 1.28 1.44 1.60  length\n\
\n\n\
confined region\n\
material    absolute thickness(mm)   angle(steel)    material tag\n\
cover               15.0                              30\n\
d=6transverse     0.2949                0              7\n\
d=6transverse     0.5886                0              7\n\
core              42.059                              30\n\
core              42.059                              30\n\
core              42.059                              30\n\
core              42.059                              30\n\
d=6transverse     0.5886                0              7\n\
d=6transverse     0.2949                0              7\\
cover               15.0                              30\n\
\n\n\
middle region\n\
material    absolute thickness(mm)   angle(steel)    material tag\n\
cover               15.0                               30\n\
d=6transverse     0.2949                0               7\n\
d=6longitudinal   0.5886               90               6\n\
core              84.117                               30\n\
core              84.117                               30\n\
d=6longitudinal   0.5886               90               6\n\
d=6transverse     0.2949                0               7\n\
cover               15.0                               30\n\
\n\n\
"
print(ASCII_model)
log_init(True, "output\\",
         "testLog.log", ASCII_model)


length: float = 1.6
width: float = 0.2
hight: float = 3.2
constraint_coefficient: float = 0.2
constraint_left_end: float = 0.64
constraint_right_begin: float = 1.28
hight_num: int = 11
constraint_num: int = 3
center_num: int = 2
sum_row_num: int = 8
sum_col_num: int = 11
node_index: int = 1000
ndm: int = 3
ndf: int = 6

constraint_length: float = constraint_coefficient * length

hight_div: float = [(hight / (sum_col_num - 1) * i)
                    for i in range(sum_col_num)]
constraint_div_left: float = [(constraint_length / (constraint_num - 1) * i)
                              for i in range(constraint_num)]
constraint_div_right: float = [
    ((constraint_length / (constraint_num - 1) * i) + constraint_right_begin) for i in range(constraint_num)]
center_div: float = [(constraint_left_end + ((constraint_right_begin - constraint_left_end) / center_num) * i)
                     for i in range(center_num)]
length_div: float = constraint_div_left + center_div + constraint_div_right


longitudinal_steel: float = [379e6, 202.7e9, 0.01, 18.5, 0.925, 0.15]

transverse_steel: float = [392e6, 200.6e9, 0.01, 18.5, 0.925, 0.15]

c30_con: float = [40, 7, 20.7e6, 2.07e6, -
                  4.14e6, -0.002, -0.005, 0.001, 0.08, 1.25e10]
c40_con: float = [40, 7, 30.8e6, 3.08e6, -
                  6.16e6, -0.002, -0.005, 0.001, 0.05, 1.283e10]

if __name__ == "__main__":
    print(hight_div)
    print(constraint_div_left)
    print(constraint_div_right)
    print(center_div)
    print(length_div)
