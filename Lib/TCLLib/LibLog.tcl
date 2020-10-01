# @Author: Mengsen.Wang
# @Date: 2020-09-15 16:54:33
# @Last Modified by: Mengsen.Wang
# @Last Modified time: 2020-09-15 17:37:33

############################################
# ATTENTION PLEASE                         #
# This lib with GNU General Public License #
# Author mail: mengsen_wang@163.com        #
############################################

proc ModelInfo_Proc { FileName } {
  # FileNme：File name
  # 文件名
  if { [file exists output] == 0 } {
      file mkdir log
  }
  logFile output/$FileName

  puts [getTime]
  puts [clock seconds]

  # printA -file output/$FileName
  print -node
  print -ele
  return 0
}