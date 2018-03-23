 $arrayDIO = @()
 $arrayPf = @()
 $cmdProcess = start-process cmd -passthru
   while (-not $cmdProcess.HasExited) {
        $arrayDIO += %{ (Get-WmiObject Win32_PerfFormattedData_PerfProc_Process).IOWriteOperationsPerSec }
        $arrayPf += %{ (Get-WmiObject Win32_PerfFormattedData_PerfOS_memory).PageFaultsPerSec }
    sleep 2
  }
 $arrayPf | Measure-Object -Average -Maximum -Minimum | Out-File  -Filepath C:\Details.txt
 $arrayDIO | Measure-Object -Average -Maximum -Minimum | Out-File  -Filepath C:\Details.txt -append