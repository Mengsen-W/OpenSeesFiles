"""
@Author: Mengsen.Wang
@Date: 2020-09-19 10: 36: 37
@Last Modified by:   Mengsen.Wang
@Last Modified time: 2020-09-19 10: 36: 37
@Description: shear wall geometric parameters
"""

"""
use SI
"""

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


if __name__ == "__main__":
    print(hight_div)
    print(constraint_div_left)
    print(constraint_div_right)
    print(center_div)
    print(length_div)
