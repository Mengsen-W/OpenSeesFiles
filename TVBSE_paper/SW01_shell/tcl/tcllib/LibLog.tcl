#FileNme：File name
#存储单元、节点信息的文件名
proc ModelInfo_Proc { FileName } {
    set now [clock seconds]
    set timestr [clock format $now -format "%y-%m-%d %H:%M:%S"]
    logFile $FileName
    print -node
    print -ele
    getTime
    puts $timestr
}
