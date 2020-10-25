# @Author: Mengsen.Wang
# @Date: 2020-10-24 19:22:01

node 1 0.000000 0 0
node 2 0.000000 1.5 0
node 3 0.000000 7.5 0
node 4 0.000000 9.0 0
node 5 2.375000 0 0
node 6 2.375000 1.5 0
node 7 2.375000 7.5 0
node 8 2.375000 9.0 0
node 9 4.750000 0 0
node 10 4.750000 1.5 0
node 11 4.750000 7.5 0
node 12 4.750000 9.0 0
node 13 7.125000 0 0
node 14 7.125000 1.5 0
node 15 7.125000 7.5 0
node 16 7.125000 9.0 0
node 17 9.500000 0 0
node 18 9.500000 1.5 0
node 19 9.500000 7.5 0
node 20 9.500000 9.0 0
node 21 11.875000 0 0
node 22 11.875000 1.5 0
node 23 11.875000 7.5 0
node 24 11.875000 9.0 0
node 25 14.250000 0 0
node 26 14.250000 1.5 0
node 27 14.250000 7.5 0
node 28 14.250000 9.0 0
node 29 17.813000 0 0
node 30 17.813000 1.5 0
node 31 17.813000 7.5 0
node 32 17.813000 9.0 0
node 33 21.376000 0 0
node 34 21.376000 1.5 0
node 35 21.376000 7.5 0
node 36 21.376000 9.0 0
node 37 24.939000 0 0
node 38 24.939000 1.5 0
node 39 24.939000 7.5 0
node 40 24.939000 9.0 0
node 41 28.502000 0 0
node 42 28.502000 1.5 0
node 43 28.502000 7.5 0
node 44 28.502000 9.0 0
node 45 32.065000 0 0
node 46 32.065000 1.5 0
node 47 32.065000 7.5 0
node 48 32.065000 9.0 0
node 49 35.628000 0 0
node 50 35.628000 1.5 0
node 51 35.628000 7.5 0
node 52 35.628000 9.0 0
node 53 39.191000 0 0
node 54 39.191000 1.5 0
node 55 39.191000 7.5 0
node 56 39.191000 9.0 0
node 57 42.754000 0 0
node 58 42.754000 1.5 0
node 59 42.754000 7.5 0
node 60 42.754000 9.0 0
node 61 45.129000 0 0
node 62 45.129000 1.5 0
node 63 45.129000 7.5 0
node 64 45.129000 9.0 0
node 65 47.504000 0 0
node 66 47.504000 1.5 0
node 67 47.504000 7.5 0
node 68 47.504000 9.0 0
node 69 49.879000 0 0
node 70 49.879000 1.5 0
node 71 49.879000 7.5 0
node 72 49.879000 9.0 0
node 73 52.254000 0 0
node 74 52.254000 1.5 0
node 75 52.254000 7.5 0
node 76 52.254000 9.0 0
node 77 54.629000 0 0
node 78 54.629000 1.5 0
node 79 54.629000 7.5 0
node 80 54.629000 9.0 0
node 81 57.004000 0 0
node 82 57.004000 1.5 0
node 83 57.004000 7.5 0
node 84 57.004000 9.0 0
node 89 0 0 6
node 90 0 9 6
node 91 4.75 0 6
node 92 4.75 9 6
node 93 9.5 0 6
node 94 9.5 9 6
node 95 14.25 0 6
node 96 14.25 9 6
node 97 21.375 0 6
node 98 21.375 9 6
node 99 28.5 0 6
node 100 28.5 9 6
node 101 35.625 0 6
node 102 35.625 9 6
node 103 42.75 0 6
node 104 42.74 9 6
node 105 47.5 0 6
node 106 47.5 9 6
node 107 52.25 0 6
node 108 52.25 9 6
node 109 57 0 6
node 110 57 9 6

fix 89 1 1 1 0 0 0
fix 90 1 1 1 0 0 0
fix 109 1 1 1 0 0 0
fix 110 1 1 1 0 0 0

set Fy 345e6
set E 206e9
set b 0.01
uniaxialMaterial Steel02 1 345e6 206e9 0.01 18.5 0.925 0.15

# 500 * 500 * 50 * 50 * 50 * 50
# ---- 500
# |   | 500 (y)
# ---- 500
section Fiber 1 -GJ 1 {
  # 侧板
  fiber 0.225 0.025 2.5e-3 1
  fiber 0.225 0.075 2.5e-3 1
  fiber 0.225 0.125 2.5e-3 1
  fiber 0.225 0.175 2.5e-3 1

  fiber 0.225 -0.025 2.5e-3 1
  fiber 0.225 -0.075 2.5e-3 1
  fiber 0.225 -0.125 2.5e-3 1
  fiber 0.225 -0.175 2.5e-3 1

  fiber -0.225 0.025 2.5e-3 1
  fiber -0.225 0.075 2.5e-3 1
  fiber -0.225 0.125 2.5e-3 1
  fiber -0.225 0.175 2.5e-3 1

  fiber -0.225 -0.025 2.5e-3 1
  fiber -0.225 -0.075 2.5e-3 1
  fiber -0.225 -0.125 2.5e-3 1
  fiber -0.225 -0.175 2.5e-3 1

  # 顶板
  fiber 0.025 0.225 2.5e-3 1
  fiber 0.075 0.225 2.5e-3 1
  fiber 0.125 0.225 2.5e-3 1
  fiber 0.175 0.225 2.5e-3 1
  fiber 0.225 0.225 2.5e-3 1

  fiber -0.025 0.225 2.5e-3 1
  fiber -0.075 0.225 2.5e-3 1
  fiber -0.125 0.225 2.5e-3 1
  fiber -0.175 0.225 2.5e-3 1
  fiber -0.225 0.225 2.5e-3 1

  fiber 0.025 -0.225 2.5e-3 1
  fiber 0.075 -0.225 2.5e-3 1
  fiber 0.125 -0.225 2.5e-3 1
  fiber 0.175 -0.225 2.5e-3 1
  fiber 0.225 -0.225 2.5e-3 1

  fiber -0.025 -0.225 2.5e-3 1
  fiber -0.075 -0.225 2.5e-3 1
  fiber -0.125 -0.225 2.5e-3 1
  fiber -0.175 -0.225 2.5e-3 1
  fiber -0.225 -0.225 2.5e-3 1
}

# 500 * 800 * 30 * 30 * 30 *30
# ---- 800
# |   | 500 (y)
# ---- 800
section Fiber 2 -GJ 1 {
  # 侧板
  fiber 0.385 0.015 9e-4 1
  fiber 0.385 0.045 9e-4 1
  fiber 0.385 0.075 9e-4 1
  fiber 0.385 0.105 9e-4 1
  fiber 0.385 0.135 9e-4 1
  fiber 0.385 0.165 9e-4 1
  fiber 0.385 0.195 9e-4 1
  fiber 0.385 0.22 6e-4 1
  fiber 0.385 0.235 3e-4 1

  fiber -0.385 0.015 9e-4 1
  fiber -0.385 0.045 9e-4 1
  fiber -0.385 0.075 9e-4 1
  fiber -0.385 0.105 9e-4 1
  fiber -0.385 0.135 9e-4 1
  fiber -0.385 0.165 9e-4 1
  fiber -0.385 0.195 9e-4 1
  fiber -0.385 0.22 6e-4 1
  fiber -0.385 0.235 3e-4 1

  # 顶板
  fiber 0.385 0.015 9e-4 1
  fiber 0.385 0.045 9e-4 1
  fiber 0.385 0.105 9e-4 1
  fiber 0.385 0.135 9e-4 1
  fiber 0.385 0.165 9e-4 1
  fiber 0.385 0.195 9e-4 1
  fiber 0.385 0.225 9e-4 1
  fiber 0.385 0.255 9e-4 1
  fiber 0.385 0.285 9e-4 1
  fiber 0.385 0.315 9e-4 1
  fiber 0.385 0.345 9e-4 1
  fiber 0.385 0.375 9e-4 1

  fiber -0.385 0.015 9e-4 1
  fiber -0.385 0.045 9e-4 1
  fiber -0.385 0.105 9e-4 1
  fiber -0.385 0.135 9e-4 1
  fiber -0.385 0.165 9e-4 1
  fiber -0.385 0.195 9e-4 1
  fiber -0.385 0.225 9e-4 1
  fiber -0.385 0.255 9e-4 1
  fiber -0.385 0.285 9e-4 1
  fiber -0.385 0.315 9e-4 1
  fiber -0.385 0.345 9e-4 1
  fiber -0.385 0.375 9e-4 1

  fiber 0.385 -0.015 9e-4 1
  fiber 0.385 -0.045 9e-4 1
  fiber 0.385 -0.105 9e-4 1
  fiber 0.385 -0.135 9e-4 1
  fiber 0.385 -0.165 9e-4 1
  fiber 0.385 -0.195 9e-4 1
  fiber 0.385 -0.225 9e-4 1
  fiber 0.385 -0.255 9e-4 1
  fiber 0.385 -0.285 9e-4 1
  fiber 0.385 -0.315 9e-4 1
  fiber 0.385 -0.345 9e-4 1
  fiber 0.385 -0.375 9e-4 1

  fiber -0.385 -0.015 9e-4 1
  fiber -0.385 -0.045 9e-4 1
  fiber -0.385 -0.105 9e-4 1
  fiber -0.385 -0.135 9e-4 1
  fiber -0.385 -0.165 9e-4 1
  fiber -0.385 -0.195 9e-4 1
  fiber -0.385 -0.225 9e-4 1
  fiber -0.385 -0.255 9e-4 1
  fiber -0.385 -0.285 9e-4 1
  fiber -0.385 -0.315 9e-4 1
  fiber -0.385 -0.345 9e-4 1
  fiber -0.385 -0.375 9e-4 1
}

# 500 * 600 * 30 * 30 * 30 * 30
# ---- 600
# |   | 500 (y)
# ---- 600
section Fiber 3 -GJ 1 {
  # 侧板
  fiber 0.585 0.015 9e-4 1
  fiber 0.585 0.045 9e-4 1
  fiber 0.585 0.075 9e-4 1
  fiber 0.585 0.0105 9e-4 1
  fiber 0.585 0.0135 9e-4 1
  fiber 0.585 0.0165 9e-4 1
  fiber 0.585 0.0195 9e-4 1
  fiber 0.585 0.0215 3e-4 1

  fiber -0.585 0.015 9e-4 1
  fiber -0.585 0.045 9e-4 1
  fiber -0.585 0.075 9e-4 1
  fiber -0.585 0.0105 9e-4 1
  fiber -0.585 0.0135 9e-4 1
  fiber -0.585 0.0165 9e-4 1
  fiber -0.585 0.0195 9e-4 1
  fiber -0.585 0.0215 3e-4 1

  # 顶板
  fiber 0.015 0.235 9e-4 1
  fiber 0.045 0.235 9e-4 1
  fiber 0.075 0.235 9e-4 1
  fiber 0.0105 0.235 9e-4 1
  fiber 0.0135 0.235 9e-4 1
  fiber 0.0165 0.235 9e-4 1
  fiber 0.0195 0.235 9e-4 1
  fiber 0.0225 0.235 9e-4 1
  fiber 0.0255 0.235 9e-4 1
  fiber 0.0285 0.235 9e-4 1

  fiber 0.015 -0.235 9e-4 1
  fiber 0.045 -0.235 9e-4 1
  fiber 0.075 -0.235 9e-4 1
  fiber 0.0105 -0.235 9e-4 1
  fiber 0.0135 -0.235 9e-4 1
  fiber 0.0165 -0.235 9e-4 1
  fiber 0.0195 -0.235 9e-4 1
  fiber 0.0225 -0.235 9e-4 1
  fiber 0.0255 -0.235 9e-4 1
  fiber 0.0285 -0.235 9e-4 1

  fiber -0.015 0.235 9e-4 1
  fiber -0.045 0.235 9e-4 1
  fiber -0.075 0.235 9e-4 1
  fiber -0.0105 0.235 9e-4 1
  fiber -0.0135 0.235 9e-4 1
  fiber -0.0165 0.235 9e-4 1
  fiber -0.0195 0.235 9e-4 1
  fiber -0.0225 0.235 9e-4 1
  fiber -0.0255 0.235 9e-4 1
  fiber -0.0285 0.235 9e-4 1

  fiber -0.015 -0.235 9e-4 1
  fiber -0.045 -0.235 9e-4 1
  fiber -0.075 -0.235 9e-4 1
  fiber -0.0105 -0.235 9e-4 1
  fiber -0.0135 -0.235 9e-4 1
  fiber -0.0165 -0.235 9e-4 1
  fiber -0.0195 -0.235 9e-4 1
  fiber -0.0225 -0.235 9e-4 1
  fiber -0.0255 -0.235 9e-4 1
  fiber -0.0285 -0.235 9e-4 1
}

# 200 * 200 * 20 * 20 * 20 * 20
# ---- 200
# |   | 200 (y)
# ---- 200
section Fiber 4 -GJ 1 {
  # 侧板
  fiber 0.09 0.01 2e-4 1
  fiber 0.09 0.03 2e-4 1
  fiber 0.09 0.05 2e-4 1
  fiber 0.09 0.07 2e-4 1

  fiber -0.09 0.01 2e-4 1
  fiber -0.09 0.03 2e-4 1
  fiber -0.09 0.05 2e-4 1
  fiber -0.09 0.07 2e-4 1

  # 顶板
  fiber 0.09 0.01 2e-4 1
  fiber 0.09 0.03 2e-4 1
  fiber 0.09 0.05 2e-4 1
  fiber 0.09 0.07 2e-4 1
  fiber 0.09 0.09 2e-4 1

  fiber 0.09 -0.01 2e-4 1
  fiber 0.09 -0.03 2e-4 1
  fiber 0.09 -0.05 2e-4 1
  fiber 0.09 -0.07 2e-4 1
  fiber 0.09 -0.09 2e-4 1

  fiber -0.09 0.01 2e-4 1
  fiber -0.09 0.03 2e-4 1
  fiber -0.09 0.05 2e-4 1
  fiber -0.09 0.07 2e-4 1
  fiber -0.09 0.09 2e-4 1

  fiber -0.09 -0.01 2e-4 1
  fiber -0.09 -0.03 2e-4 1
  fiber -0.09 -0.05 2e-4 1
  fiber -0.09 -0.07 2e-4 1
  fiber -0.09 -0.09 2e-4 1
}

# H14 * 350 * 200 * 16 * 200 * 16
# 200 |   |
#     |---| 350 (y)
#     |   | 200
section Fiber 5 -GJ 1 {
  # 腹板
  fiber 0.0 0.0 1.96e-4 1
  fiber 0.014 0.0 1.96e-4 1
  fiber 0.028 0.0 1.96e-4 1
  fiber 0.042 0.0 1.96e-4 1
  fiber 0.056 0.0 1.96e-4 1
  fiber 0.07 0.0 1.96e-4 1
  fiber 0.084 0.0 1.96e-4 1
  fiber 0.098 0.0 1.96e-4 1
  fiber 0.112 0.0 1.96e-4 1
  fiber 0.126 0.0 1.96e-4 1
  fiber 0.14 0.0 1.96e-4 1
  fiber 0.154 0.0 1.96e-4 1
  fiber 0.168 0.0 1.96e-4 1

  fiber -0.014 0.0 1.96e-4 1
  fiber -0.028 0.0 1.96e-4 1
  fiber -0.042 0.0 1.96e-4 1
  fiber -0.056 0.0 1.96e-4 1
  fiber -0.07 0.0 1.96e-4 1
  fiber -0.084 0.0 1.96e-4 1
  fiber -0.098 0.0 1.96e-4 1
  fiber -0.112 0.0 1.96e-4 1
  fiber -0.126 0.0 1.96e-4 1
  fiber -0.14 0.0 1.96e-4 1
  fiber -0.154 0.0 1.96e-4 1
  fiber -0.168 0.0 1.96e-4 1

  # 翼缘
  fiber 0.168 0.015 2.56e-4 1
  fiber 0.168 0.031 2.56e-4 1
  fiber 0.168 0.047 2.56e-4 1
  fiber 0.168 0.063 2.56e-4 1
  fiber 0.168 0.079 2.56e-4 1
  fiber 0.168 0.0935 2.08e-4 1

  fiber 0.168 -0.015 2.56e-4 1
  fiber 0.168 -0.031 2.56e-4 1
  fiber 0.168 -0.047 2.56e-4 1
  fiber 0.168 -0.063 2.56e-4 1
  fiber 0.168 -0.079 2.56e-4 1
  fiber 0.168 -0.0935 2.08e-4 1

  fiber -0.168 0.015 2.56e-4 1
  fiber -0.168 0.031 2.56e-4 1
  fiber -0.168 0.047 2.56e-4 1
  fiber -0.168 0.063 2.56e-4 1
  fiber -0.168 0.079 2.56e-4 1
  fiber -0.168 0.0935 2.08e-4 1

  fiber -0.168 -0.015 2.56e-4 1
  fiber -0.168 -0.031 2.56e-4 1
  fiber -0.168 -0.047 2.56e-4 1
  fiber -0.168 -0.063 2.56e-4 1
  fiber -0.168 -0.079 2.56e-4 1
  fiber -0.168 -0.0935 2.08e-4 1
}

# H16 * 450 * 200 * 16 * 200 * 16
# 200 |   |
#     |---| 450 (y)
#     |   | 200
section Fiber 6 -GJ 1 {
  # 腹板
  fiber 8e-3 0 2.56e-4 1
  fiber 0.024 0 2.56e-4 1
  fiber 0.04 0 2.56e-4 1
  fiber 0.056 0 2.56e-4 1
  fiber 0.072 0 2.56e-4 1
  fiber 0.088 0 2.56e-4 1
  fiber 0.104 0 2.56e-4 1
  fiber 0.12 0 2.56e-4 1
  fiber 0.136 0 2.56e-4 1
  fiber 0.152 0 2.56e-4 1
  fiber 0.168 0 2.56e-4 1
  fiber 0.184 0 2.56e-4 1
  fiber 0.2 0 2.56e-4 1
  fiber 0.216 0 2.72e-4 1

  fiber -8e-3 0 2.56e-4 1
  fiber -0.024 0 2.56e-4 1
  fiber -0.04 0 2.56e-4 1
  fiber -0.056 0 2.56e-4 1
  fiber -0.072 0 2.56e-4 1
  fiber -0.088 0 2.56e-4 1
  fiber -0.104 0 2.56e-4 1
  fiber -0.12 0 2.56e-4 1
  fiber -0.136 0 2.56e-4 1
  fiber -0.152 0 2.56e-4 1
  fiber -0.168 0 2.56e-4 1
  fiber -0.184 0 2.56e-4 1
  fiber -0.2 0 2.56e-4 1
  fiber -0.216 0 2.72e-4 1

  # 翼缘
  fiber 0.216 0.016 2.56e-4 1
  fiber 0.216 0.032 2.56e-4 1
  fiber 0.216 0.048 2.56e-4 1
  fiber 0.216 0.064 2.56e-4 1
  fiber 0.216 0.08 2.56e-4 1
  fiber 0.216 0.94 1.92e-4 1

  fiber 0.216 -0.016 2.56e-4 1
  fiber 0.216 -0.032 2.56e-4 1
  fiber 0.216 -0.048 2.56e-4 1
  fiber 0.216 -0.064 2.56e-4 1
  fiber 0.216 -0.08 2.56e-4 1
  fiber 0.216 -0.94 1.92e-4 1

  fiber -0.216 0.016 2.56e-4 1
  fiber -0.216 0.032 2.56e-4 1
  fiber -0.216 0.048 2.56e-4 1
  fiber -0.216 0.064 2.56e-4 1
  fiber -0.216 0.08 2.56e-4 1
  fiber -0.216 0.94 1.92e-4 1

  fiber -0.216 -0.016 2.56e-4 1
  fiber -0.216 -0.032 2.56e-4 1
  fiber -0.216 -0.048 2.56e-4 1
  fiber -0.216 -0.064 2.56e-4 1
  fiber -0.216 -0.08 2.56e-4 1
  fiber -0.216 -0.94 1.92e-4 1
}

geomTransf PDelta 1 1 0 0
geomTransf PDelta 2 0 1 0

element dispBeamColumn 1 1 2 10 3 1
element dispBeamColumn 2 2 3 10 3 1
element dispBeamColumn 3 3 4 10 3 1
element dispBeamColumn 5 5 6 10 5 1
element dispBeamColumn 6 6 7 10 5 1
element dispBeamColumn 7 7 8 10 5 1
element dispBeamColumn 9 9 10 10 5 1
element dispBeamColumn 10 10 11 10 5 1
element dispBeamColumn 11 11 12 10 5 1
element dispBeamColumn 13 13 14 10 5 1
element dispBeamColumn 14 14 15 10 5 1
element dispBeamColumn 15 15 16 10 5 1
element dispBeamColumn 17 17 18 10 5 1
element dispBeamColumn 18 18 19 10 5 1
element dispBeamColumn 19 19 20 10 5 1
element dispBeamColumn 21 21 22 10 5 1
element dispBeamColumn 22 22 23 10 5 1
element dispBeamColumn 23 23 24 10 5 1
element dispBeamColumn 25 25 26 10 5 1
element dispBeamColumn 26 26 27 10 5 1
element dispBeamColumn 27 27 28 10 5 1
element dispBeamColumn 29 29 30 10 5 1
element dispBeamColumn 30 30 31 10 5 1
element dispBeamColumn 31 31 32 10 5 1
element dispBeamColumn 33 33 34 10 5 1
element dispBeamColumn 34 34 35 10 5 1
element dispBeamColumn 35 35 36 10 5 1
element dispBeamColumn 37 37 38 10 5 1
element dispBeamColumn 38 38 39 10 5 1
element dispBeamColumn 39 39 40 10 5 1
element dispBeamColumn 41 41 42 10 5 1
element dispBeamColumn 42 42 43 10 5 1
element dispBeamColumn 43 43 44 10 5 1
element dispBeamColumn 45 45 46 10 5 1
element dispBeamColumn 46 46 47 10 5 1
element dispBeamColumn 47 47 48 10 5 1
element dispBeamColumn 49 49 50 10 5 1
element dispBeamColumn 50 50 51 10 5 1
element dispBeamColumn 51 51 52 10 5 1
element dispBeamColumn 53 53 54 10 5 1
element dispBeamColumn 54 54 55 10 5 1
element dispBeamColumn 55 55 56 10 5 1
element dispBeamColumn 57 57 58 10 5 1
element dispBeamColumn 58 58 59 10 5 1
element dispBeamColumn 59 59 60 10 5 1
element dispBeamColumn 61 61 62 10 5 1
element dispBeamColumn 62 62 63 10 5 1
element dispBeamColumn 63 63 64 10 5 1
element dispBeamColumn 65 65 66 10 5 1
element dispBeamColumn 66 66 67 10 5 1
element dispBeamColumn 67 67 68 10 5 1
element dispBeamColumn 69 69 70 10 5 1
element dispBeamColumn 70 70 71 10 5 1
element dispBeamColumn 71 71 72 10 5 1
element dispBeamColumn 73 73 74 10 5 1
element dispBeamColumn 74 74 75 10 5 1
element dispBeamColumn 75 75 76 10 5 1
element dispBeamColumn 81 81 82 10 3 1
element dispBeamColumn 82 82 83 10 3 1
element dispBeamColumn 83 83 84 10 3 1
element dispBeamColumn 101 1 5 10 6 2
element dispBeamColumn 102 2 6 10 6 2
element dispBeamColumn 103 3 7 10 6 2
element dispBeamColumn 104 4 8 10 6 2
element dispBeamColumn 105 5 9 10 6 2
element dispBeamColumn 106 6 10 10 6 2
element dispBeamColumn 107 7 11 10 6 2
element dispBeamColumn 108 8 12 10 6 2
element dispBeamColumn 109 9 13 10 6 2
element dispBeamColumn 110 10 14 10 6 2
element dispBeamColumn 111 11 15 10 6 2
element dispBeamColumn 112 12 16 10 6 2
element dispBeamColumn 113 13 17 10 6 2
element dispBeamColumn 114 14 18 10 6 2
element dispBeamColumn 115 15 19 10 6 2
element dispBeamColumn 116 16 20 10 6 2
element dispBeamColumn 117 17 21 10 6 2
element dispBeamColumn 118 18 22 10 6 2
element dispBeamColumn 119 19 23 10 6 2
element dispBeamColumn 120 20 24 10 6 2
element dispBeamColumn 121 21 25 10 6 2
element dispBeamColumn 122 22 26 10 6 2
element dispBeamColumn 123 23 27 10 6 2
element dispBeamColumn 124 24 28 10 6 2
element dispBeamColumn 125 25 29 10 6 2
element dispBeamColumn 126 26 30 10 6 2
element dispBeamColumn 127 27 31 10 6 2
element dispBeamColumn 128 28 32 10 6 2
element dispBeamColumn 129 29 33 10 6 2
element dispBeamColumn 130 30 34 10 6 2
element dispBeamColumn 131 31 35 10 6 2
element dispBeamColumn 132 32 36 10 6 2
element dispBeamColumn 133 33 37 10 6 2
element dispBeamColumn 134 34 38 10 6 2
element dispBeamColumn 135 35 39 10 6 2
element dispBeamColumn 136 36 40 10 6 2
element dispBeamColumn 137 37 41 10 6 2
element dispBeamColumn 138 38 42 10 6 2
element dispBeamColumn 139 39 43 10 6 2
element dispBeamColumn 140 40 44 10 6 2
element dispBeamColumn 141 41 45 10 6 2
element dispBeamColumn 142 42 46 10 6 2
element dispBeamColumn 143 43 47 10 6 2
element dispBeamColumn 144 44 48 10 6 2
element dispBeamColumn 145 45 49 10 6 2
element dispBeamColumn 146 46 50 10 6 2
element dispBeamColumn 147 47 51 10 6 2
element dispBeamColumn 148 48 52 10 6 2
element dispBeamColumn 149 49 53 10 6 2
element dispBeamColumn 150 50 54 10 6 2
element dispBeamColumn 151 51 55 10 6 2
element dispBeamColumn 152 52 56 10 6 2
element dispBeamColumn 153 53 57 10 6 2
element dispBeamColumn 154 54 58 10 6 2
element dispBeamColumn 155 55 59 10 6 2
element dispBeamColumn 156 56 60 10 6 2
element dispBeamColumn 157 57 61 10 6 2
element dispBeamColumn 158 58 62 10 6 2
element dispBeamColumn 159 59 63 10 6 2
element dispBeamColumn 160 60 64 10 6 2
element dispBeamColumn 161 61 65 10 6 2
element dispBeamColumn 162 62 66 10 6 2
element dispBeamColumn 163 63 67 10 6 2
element dispBeamColumn 164 64 68 10 6 2
element dispBeamColumn 165 65 69 10 6 2
element dispBeamColumn 166 66 70 10 6 2
element dispBeamColumn 167 67 71 10 6 2
element dispBeamColumn 168 68 72 10 6 2
element dispBeamColumn 169 69 73 10 6 2
element dispBeamColumn 170 70 74 10 6 2
element dispBeamColumn 171 71 75 10 6 2
element dispBeamColumn 172 72 76 10 6 2
element dispBeamColumn 173 73 77 10 6 2
element dispBeamColumn 174 74 78 10 6 2
element dispBeamColumn 175 75 79 10 6 2
element dispBeamColumn 176 76 80 10 6 2
element dispBeamColumn 177 77 81 10 6 2
element dispBeamColumn 178 78 82 10 6 2
element dispBeamColumn 179 79 83 10 6 2
element dispBeamColumn 180 80 84 10 6 2
element dispBeamColumn 89 89 90 10 2 1
element dispBeamColumn 90 109 110 10 2 1
element dispBeamColumn 201 89 91 10 2 2
element dispBeamColumn 202 90 92 10 2 2
element dispBeamColumn 204 91 93 10 2 2
element dispBeamColumn 203 92 94 10 2 2
element dispBeamColumn 205 93 95 10 2 2
element dispBeamColumn 206 94 96 10 2 2
element dispBeamColumn 207 95 97 10 2 2
element dispBeamColumn 208 96 98 10 2 2
element dispBeamColumn 209 97 99 10 2 2
element dispBeamColumn 210 98 100 10 2 2
element dispBeamColumn 211 99 101 10 2 2
element dispBeamColumn 212 100 102 10 2 2
element dispBeamColumn 213 101 103 10 2 2
element dispBeamColumn 214 102 104 10 2 2
element dispBeamColumn 215 103 105 10 2 2
element dispBeamColumn 216 104 106 10 2 2
element dispBeamColumn 217 105 107 10 2 2
element dispBeamColumn 218 106 108 10 2 2
element dispBeamColumn 219 107 109 10 2 2
element dispBeamColumn 220 108 110 10 2 2
element dispBeamColumn 301 1 89 10 1 2
element dispBeamColumn 302 4 90 10 1 2
element dispBeamColumn 303 9 91 10 1 2
element dispBeamColumn 304 12 92 10 1 2
element dispBeamColumn 305 17 93 10 1 2
element dispBeamColumn 306 20 94 10 1 2
element dispBeamColumn 307 25 95 10 1 2
element dispBeamColumn 308 28 96 10 1 2
element dispBeamColumn 309 33 97 10 1 2
element dispBeamColumn 310 36 98 10 1 2
element dispBeamColumn 311 41 99 10 1 2
element dispBeamColumn 312 44 100 10 1 2
element dispBeamColumn 313 49 101 10 1 2
element dispBeamColumn 314 52 102 10 1 2
element dispBeamColumn 315 57 103 10 1 2
element dispBeamColumn 316 60 104 10 1 2
element dispBeamColumn 317 65 105 10 1 2
element dispBeamColumn 318 68 106 10 1 2
element dispBeamColumn 319 73 107 10 1 2
element dispBeamColumn 320 76 108 10 1 2
element dispBeamColumn 321 81 109 10 1 2
element dispBeamColumn 322 84 110 10 1 2
element dispBeamColumn 323 89 9 10 1 2
element dispBeamColumn 324 90 12 10 1 2
element dispBeamColumn 325 9 93 10 1 2
element dispBeamColumn 326 12 94 10 1 2
element dispBeamColumn 327 93 25 10 1 2
element dispBeamColumn 328 94 28 10 1 2
element dispBeamColumn 329 57 105 10 1 2
element dispBeamColumn 330 60 106 10 1 2
element dispBeamColumn 331 105 73 10 1 2
element dispBeamColumn 332 106 76 10 1 2
element dispBeamColumn 333 73 109 10 1 2
element dispBeamColumn 334 76 110 10 1 2
element dispBeamColumn 335 10 91 10 4 2
element dispBeamColumn 336 11 92 10 4 2
element dispBeamColumn 337 18 93 10 4 2
element dispBeamColumn 338 19 94 10 4 2
element dispBeamColumn 339 26 95 10 4 2
element dispBeamColumn 340 27 96 10 4 2
element dispBeamColumn 341 34 97 10 4 2
element dispBeamColumn 342 35 98 10 4 2
element dispBeamColumn 343 42 99 10 4 2
element dispBeamColumn 344 43 100 10 4 2
element dispBeamColumn 345 50 101 10 4 2
element dispBeamColumn 346 51 102 10 4 2
element dispBeamColumn 347 58 103 10 4 2
element dispBeamColumn 348 59 104 10 4 2
element dispBeamColumn 349 66 105 10 4 2
element dispBeamColumn 350 67 106 10 4 2
element dispBeamColumn 351 74 107 10 4 2
element dispBeamColumn 352 75 108 10 4 2