# @Author: Mengsen.Wang

proc ModelInfo_Proc { FileName } {
    if { [file exists output] == 0 } {
        file mkdir output
    }
    logFile output/$FileName
    print -node
    print -ele
    getTime
}