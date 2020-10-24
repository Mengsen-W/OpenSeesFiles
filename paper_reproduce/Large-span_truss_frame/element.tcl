# * @Author: Mengsen.Wang
# * @Date: 2020-10-24 11:47:38

# 下旋平面竖杆
element trussSection 1 1 2 3
element trussSection 2 2 3 3
element trussSection 3 3 4 3

for { set index 1 } { $index <= 19 } { incr index } {
  element trussSection [expr $index * 4 + 1] [expr $index * 4 + 1] [expr $index * 4 + 2] 5
  element trussSection [expr $index * 4 + 2] [expr $index * 4 + 2] [expr $index * 4 + 3] 5
  element trussSection [expr $index * 4 + 3] [expr $index * 4 + 3] [expr $index * 4 + 4] 5
}

element trussSection 81 81 82 3
element trussSection 82 82 83 3
element trussSection 83 83 84 3

# 下旋平面横杆
for { set index 0 } { $index <= 19 } { incr index } {
  element trussSection [expr 100 + $index * 4 + 1] [expr $index * 4 + 1] [expr $index * 4 + 1 + 4] 6
  element trussSection [expr 100 + $index * 4 + 2] [expr $index * 4 + 2] [expr $index * 4 + 2 + 4] 6
  element trussSection [expr 100 + $index * 4 + 3] [expr $index * 4 + 3] [expr $index * 4 + 3 + 4] 6
  element trussSection [expr 100 + $index * 4 + 4] [expr $index * 4 + 4] [expr $index * 4 + 4 + 4] 6
}

# 上旋平面
element trussSection 89 89 90 2
element trussSection 90 109 110 2
for { set index 0 } { $index <= 18 } { incr index } {
  element trussSection [expr 200 + $index + 1] [expr 89 + $index] [expr 89 + $index + 2] 2
  element trussSection [expr 200 + $index + 2] [expr 89 + $index + 1] [expr 89 + $index + 3] 2
  incr index
}

# 中层竖杆
element trussSection 301 1 89 1
element trussSection 302 4 90 1
element trussSection 303 9 91 1
element trussSection 304 12 92 1
element trussSection 305 17 93 1
element trussSection 306 20 94 1
element trussSection 307 25 95 1
element trussSection 308 28 96 1
element trussSection 309 33 97 1
element trussSection 310 36 98 1
element trussSection 311 41 99 1
element trussSection 312 44 100 1
element trussSection 313 49 101 1
element trussSection 314 52 102 1
element trussSection 315 57 103 1
element trussSection 316 60 104 1
element trussSection 317 65 105 1
element trussSection 318 68 106 1
element trussSection 319 73 107 1
element trussSection 320 76 108 1
element trussSection 321 81 109 1
element trussSection 322 84 110 1

# 中层斜杆
element trussSection 323 89 9 1
element trussSection 324 90 12 1
element trussSection 325 9 93 1
element trussSection 326 12 94 1
element trussSection 327 93 25 1
element trussSection 328 94 28 1
element trussSection 329 57 105 1
element trussSection 330 60 106 1
element trussSection 331 105 73 1
element trussSection 332 105 76 1
element trussSection 333 73 109 1
element trussSection 334 76 110 1

element trussSection 335 10 91 4
element trussSection 336 11 92 4
element trussSection 337 18 93 4
element trussSection 338 19 94 4
element trussSection 339 26 95 4
element trussSection 340 27 96 4
element trussSection 341 34 97 4
element trussSection 342 35 98 4
element trussSection 343 42 99 4
element trussSection 344 43 100 4
element trussSection 345 50 101 4
element trussSection 346 51 102 4
element trussSection 347 58 103 4
element trussSection 348 59 104 4
element trussSection 349 66 105 4
element trussSection 350 67 106 4
element trussSection 351 74 107 4
element trussSection 352 75 108 4