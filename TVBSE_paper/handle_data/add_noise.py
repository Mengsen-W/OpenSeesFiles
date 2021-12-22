"""
Date: 2021-11-11 18:09:19
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-11-11 18:09:20
"""

from os import write
import random
import decimal

disp = """
2	127.081
4	151.589
6	175.48
8	198.473
10	220.027
12	240.461
14	260.022
16	278.655
18	296.521
20	313.686
22	330.237
24	346.241
26	361.803
28	376.947
30	391.723
32	406.171
34	420.308
36	434.158
38	447.739
40	461.073
42	474.183
44	487.081
46	499.799
48	512.355
50	524.759
52	537.024
54	549.146
56	561.133
58	572.982
60	584.672
62	595.879
64	606.188
66	615.884
68	625.011
70	633.739
72	642.147
70	564.822
68	505.516
66	454.61
64	410.874
62	373.052
60	340.005
58	310.792
56	284.679
54	261.082
52	239.577
50	219.872
48	201.784
46	185.159
44	169.68
42	155.129
40	141.294
38	128.106
36	115.465
34	103.258
32	91.4599
30	80.0494
28	68.9258
26	58.0243
24	47.2922
22	36.7044
20	26.1983
18	15.737
16	5.33354
14	-5.0537
12	-15.5517
10	-27.2515
8	-42.1331
6	-60.8755
4	-82.5663
2	-105.859
0	-129.528
-2	-152.703
-4	-174.74
-6	-195.537
-8	-215.129
-10	-233.632
-12	-251.275
-14	-268.112
-16	-284.305
-18	-299.996
-20	-315.272
-22	-330.153
-24	-344.651
-26	-358.861
-28	-372.93
-30	-386.875
-32	-400.681
-34	-414.361
-36	-427.907
-38	-441.321
-40	-454.586
-42	-467.703
-44	-480.664
-46	-493.489
-48	-506.165
-50	-518.749
-52	-531.192
-54	-543.513
-56	-555.719
-58	-567.806
-60	-579.773
-62	-591.619
-64	-602.368
-66	-612.181
-68	-621.413
-70	-630.197
-72	-638.559
-70	-560.716
-68	-501.738
-66	-451.406
-64	-408.16
-62	-370.719
-60	-337.99
-58	-309.111
-56	-283.363
-54	-260.213
-52	-239.346
-50	-220.581
-48	-203.37
-46	-187.185
-44	-171.916
-42	-157.494
-40	-143.793
-38	-130.704
-36	-118.186
-34	-106.111
-32	-94.4153
-30	-83.0693
-28	-71.9912
-26	-61.0576
-24	-50.5344
-22	-40.1524
-20	-29.9818
-18	-19.8818
-16	-9.79375
-14	0.3573
-12	10.6842
-10	21.2368
-8	32.4115
-6	46.6159
-4	63.6617
-2	82.5004
""".split(
    "\n"
)


def add_noise():
    with open("out.txt", 'a') as f:
        f.truncate(0)
        for i in disp:
            if len(i) == 0:
                continue
            i = i.split("\t")
            f.write(
                    str(i[0])
                    + " "
                    + str(
                        decimal.Decimal(
                            float(i[1]) + random.randint(-100, 100) / 1000
                        ).quantize(decimal.Decimal("0.00001"), rounding="ROUND_HALF_UP")
                    )
                    + "\n"
                )


def main():
    add_noise()


if __name__ == "__main__":
    main()