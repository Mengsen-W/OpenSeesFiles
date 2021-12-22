'''
Date: 2021-04-21 15:47:06
Author: Mengsen Wang
LastEditors: Mengsen Wang
LastEditTime: 2021-04-21 19:22:23
'''

from concurrent.futures import ThreadPoolExecutor, as_completed
from multiprocessing import Pool
import os
import time
import shutil
from main import ops_main


# def main():
#     with ThreadPoolExecutor(max_workers=16) as t:
#         obj_list = []
#         for page in range(1, 1000, 50):
#             obj = t.submit(ops_main, page/1000)
#             print(f"main: {page}")
#             obj_list.append(obj)

#         for future in as_completed(obj_list):
#             data = future.result()
#             print(f"main: {data}")

# def main():
#     pool = Pool(16)
#     for page in range(1, 5):
#         time.sleep(1)
#         pool.apply_async(ops_main, page/1000)
#     pool.close()
#     pool.join()

for page in range(1, 1000, 50):
    ops_main(page/1000)

# main()
