$i = 1
Do {
Write-Host "`n`n*****Windows Tweaker Flash Drive***** `n `n 1.Computer Info `n 2.System Info`n 3.Check the licensed key expiration `n 4.Check the licensed key if retailed `n 5.Wipass `n 6.Debloater by Chris Titus `n 7.Activate word`n 8.exit"
$user_inp = Read-Host "Select a task"

Switch ($user_inp)
{
   1 {Get-ComputerInfo}
   2 {systeminfo}
   3 {slmgr /xpr}
   4 {slmgr -dli}
   5 {netsh wlan show profile
$wifi_name = READ-HOST "ENTER YOUR WIFI SSID"
netsh wlan show profile $wifi_name key = clear
   }
   6 {iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/artcabby44/MINI-TOOLBOX/main/Systemcheck.ps1'))
   }
   7 {.\Activator.cmd}
   8 {exit}
}

}

Until($i -eq 0)


