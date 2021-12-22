"""
Date: 2021-11-08 19:38:29
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-11-11 20:28:34
FilePath: \OPS_Paper\handle_data\from_skeleton_get_stiffness_degradation.py
Description: file content
"""

skeleton_data = [
    [-72, -536.38956],
    [-68, -559.83225],
    [-64, -575.16594],
    [-60, -576.4885],
    [-56, -570.86688],
    [-52, -570.21104],
    [-48, -569.094],
    [-44, -567.49944],
    [-40, -559.70921],
    [-36, -544.81953],
    [-32, -528.76389],
    [-28, -513.30977],
    [-24, -482.096],
    [-20, -463.659],
    [-16, -407.51952],
    [-12, -358.1781],
    [-8, -328.5692],
    [-4, -247.6452],
    [4, 247.62584],
    [8, 338.53375],
    [12, 366.89995],
    [16, 415.83172],
    [20, 471.206],
    [24, 488.087],
    [28, 519.55157],
    [32, 535.5485],
    [36, 551.23849],
    [40, 566.01487],
    [44, 574.40076],
    [48, 576.315],
    [52, 577.41698],
    [56, 577.2048],
    [60, 582.1809],
    [64, 579.36024],
    [68, 563.30147],
    [72, 539.40348],
]


def from_skeleton_get_stiffness_degradation():
    for i in skeleton_data:
        print(i[-1] / i[-2])


def get_skeleton_data():
    pass


def main():
    from_skeleton_get_stiffness_degradation()


if __name__ == "__main__":
    main()
