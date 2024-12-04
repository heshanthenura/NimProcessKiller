import winim, strutils



proc WCHARArrayToString(arr: array[0..259, WCHAR]): string =
  var resultStr = ""
  for i in 0..<arr.len:
    if arr[i] == 0'u16: 
      break
    resultStr.add(cast[char](arr[i]))
  return resultStr

proc killprocess(process:string):bool =
    let snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
    if snapshot == INVALID_HANDLE_VALUE:
        echo "Failed to get process snapshot."
        return false

    var procEntry: PROCESSENTRY32
    procEntry.dwSize = int32(sizeof(PROCESSENTRY32))  

    if Process32First(snapshot, addr procEntry):
        while Process32Next(snapshot, addr procEntry) != 0:
            if WCHARArrayToString(procEntry.szExeFile) == process:
                let hProcess = OpenProcess(PROCESS_TERMINATE, false, procEntry.th32ProcessID)
                if hProcess != INVALID_HANDLE_VALUE:
                    let success = TerminateProcess(hProcess, 1)
                    echo hProcess
                    CloseHandle(hProcess)
                    CloseHandle(snapshot)
                    echo "Process terminated."
                    return true
                else:
                    echo "Failed to open process."
                    return false
    CloseHandle(snapshot)
    echo "something went wrong"

var processName: string = "test.exe" #process you want to kill ex "test.exe"
discard killprocess(processName)