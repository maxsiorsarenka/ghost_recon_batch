@echo off
title GHOST_RECON v3.7 - System Multi-Tool
color 05
mode con: cols=120 lines=40

:banner
cls
echo.
echo.
echo.
echo.
echo.
echo                    _____ _    _  ____   _____ _______   _____  ______ _____ ____  _   _ 
echo                   / ____^| ^|  ^| ^|/ __ \ / __^|__   __^| ^|  __ \^|  ____/ ____/ __ \^| \ ^| ^|
echo                  ^| ^|  __^| ^|__^| ^| ^|  ^| ^| (___   ^| ^|    ^| ^|__) ^| ^|__ ^| ^|   ^| ^|  ^| ^|  \^| ^|
echo                  ^| ^| ^|_ ^|  __  ^| ^|  ^| ^|\___ \  ^| ^|    ^|  _  /^|  __^|^| ^|   ^| ^|  ^| ^| . ` ^|
echo                  ^| ^|__^| ^| ^|  ^| ^| ^|__^| ^|____) ^| ^| ^|    ^| ^| \ \^| ^|___^| ^|___^| ^|__^| ^| ^\  ^|
echo                   \_____^|_^|  ^|_^|\____/^|_____/  ^|_^|    ^|_^|  \_\______\_____\____/^|_^| \_^|
echo.
echo           ============================================================================================
echo                                     SYSTEM RECONNAISSANCE MULTI-TOOL v3.7
echo           ============================================================================================
echo.
echo                    [1]  SYSINFO      - System Information Report        [13] NETSTAT     - Active Connections
echo                    [2]  DISKINFO     - Disk Analysis                    [14] IPCONFIG    - Network Config
echo                    [3]  NETINFO      - Network Diagnostics              [15] TASKLIST    - Running Processes
echo                    [4]  PROCMON      - Process Monitor                  [16] SERVICES    - System Services
echo                    [5]  CLEANTEMP    - Clean Temporary Files            [17] DRIVERS     - Driver Information
echo                    [6]  SPEEDTEST    - Network Speed Test               [18] FIREWALL    - Firewall Status
echo                    [7]  PINGTEST     - Ping Multiple Hosts              [19] UPDATES     - Windows Updates
echo                    [8]  TRACERT      - Trace Route                      [20] STARTUP     - Startup Programs
echo                    [9]  PORTCHECK    - Check Open Ports                 [21] EVENTLOG    - System Event Logs
echo                    [10] WIFI         - WiFi Networks Scan               [22] BATTERY     - Battery Report
echo                    [11] SYSCHECK     - System Health Check              [23] POWERSHELL  - PowerShell Tools
echo                    [12] OPTIMIZE     - System Optimization              [24] FULLREPORT  - Complete System Report
echo.
echo                    [0]  EXIT         - Close GHOST_RECON
echo.
echo           ============================================================================================
set /p choice="           [GHOST_RECON] Enter Option: "

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto diskinfo
if "%choice%"=="3" goto netinfo
if "%choice%"=="4" goto procmon
if "%choice%"=="5" goto cleantemp
if "%choice%"=="6" goto speedtest
if "%choice%"=="7" goto pingtest
if "%choice%"=="8" goto tracert
if "%choice%"=="9" goto portcheck
if "%choice%"=="10" goto wifi
if "%choice%"=="11" goto syscheck
if "%choice%"=="12" goto optimize
if "%choice%"=="13" goto netstat
if "%choice%"=="14" goto ipconfig
if "%choice%"=="15" goto tasklist
if "%choice%"=="16" goto services
if "%choice%"=="17" goto drivers
if "%choice%"=="18" goto firewall
if "%choice%"=="19" goto updates
if "%choice%"=="20" goto startup
if "%choice%"=="21" goto eventlog
if "%choice%"=="22" goto battery
if "%choice%"=="23" goto powershell
if "%choice%"=="24" goto fullreport
if "%choice%"=="0" goto exit
goto banner

:sysinfo
cls
echo [*] Gathering System Information...
echo ================================================================================================
systeminfo
echo ================================================================================================
pause
goto banner

:diskinfo
cls
echo [*] Analyzing Disk Information...
echo ================================================================================================
wmic diskdrive get model,size,status
echo.
echo --- Disk Volumes ---
wmic logicaldisk get name,size,freespace,filesystem
echo ================================================================================================
pause
goto banner

:netinfo
cls
echo [*] Network Diagnostics...
echo ================================================================================================
ipconfig /all
echo.
echo --- DNS Cache ---
ipconfig /displaydns
echo ================================================================================================
pause
goto banner

:procmon
cls
echo [*] Process Monitor - Top Processes by Memory...
echo ================================================================================================
tasklist /v | findstr /i "chrome edge firefox explorer"
echo.
echo --- All Running Processes ---
tasklist
echo ================================================================================================
pause
goto banner

:cleantemp
cls
echo [*] Cleaning Temporary Files...
echo ================================================================================================
echo Deleting Temp files...
del /q /f /s %temp%\* 2>nul
echo Deleting Windows Temp files...
del /q /f /s C:\Windows\Temp\* 2>nul
echo Deleting Prefetch files...
del /q /f /s C:\Windows\Prefetch\* 2>nul
echo.
echo [+] Cleanup Complete!
echo ================================================================================================
pause
goto banner

:speedtest
cls
echo [*] Network Speed Test...
echo ================================================================================================
ping -n 10 8.8.8.8 | find "Average"
echo.
echo Testing connection to multiple servers...
ping -n 4 google.com
ping -n 4 cloudflare.com
ping -n 4 microsoft.com
echo ================================================================================================
pause
goto banner

:pingtest
cls
echo [*] Ping Test - Multiple Hosts...
echo ================================================================================================
set /p target="Enter hostname or IP to ping (or press Enter for default): "
if "%target%"=="" set target=8.8.8.8
echo Testing connection to %target%...
ping -n 10 %target%
echo ================================================================================================
pause
goto banner

:tracert
cls
echo [*] Trace Route...
echo ================================================================================================
set /p target="Enter hostname or IP to trace: "
if "%target%"=="" set target=google.com
tracert %target%
echo ================================================================================================
pause
goto banner

:portcheck
cls
echo [*] Checking Open Ports...
echo ================================================================================================
netstat -an | findstr LISTENING
echo ================================================================================================
pause
goto banner

:wifi
cls
echo [*] WiFi Networks Scan...
echo ================================================================================================
netsh wlan show networks mode=bssid
echo.
echo --- Saved WiFi Profiles ---
netsh wlan show profiles
echo ================================================================================================
pause
goto banner

:syscheck
cls
echo [*] System Health Check...
echo ================================================================================================
echo Running System File Checker...
sfc /scannow
echo.
echo Running DISM Health Check...
DISM /Online /Cleanup-Image /CheckHealth
echo ================================================================================================
pause
goto banner

:optimize
cls
echo [*] System Optimization...
echo ================================================================================================
echo Flushing DNS...
ipconfig /flushdns
echo.
echo Releasing and Renewing IP...
ipconfig /release
ipconfig /renew
echo.
echo Resetting Winsock...
netsh winsock reset
echo.
echo Defragmenting C: drive...
defrag C: /U /V
echo.
echo [+] Optimization Complete! Restart recommended.
echo ================================================================================================
pause
goto banner

:netstat
cls
echo [*] Active Network Connections...
echo ================================================================================================
netstat -ano
echo ================================================================================================
pause
goto banner

:ipconfig
cls
echo [*] Network Configuration...
echo ================================================================================================
ipconfig /all
echo ================================================================================================
pause
goto banner

:tasklist
cls
echo [*] Running Processes...
echo ================================================================================================
tasklist /v
echo ================================================================================================
pause
goto banner

:services
cls
echo [*] System Services...
echo ================================================================================================
net start
echo.
echo --- Service Details ---
sc query type= service state= all
echo ================================================================================================
pause
goto banner

:drivers
cls
echo [*] Driver Information...
echo ================================================================================================
driverquery /v
echo ================================================================================================
pause
goto banner

:firewall
cls
echo [*] Firewall Status...
echo ================================================================================================
netsh advfirewall show allprofiles
echo ================================================================================================
pause
goto banner

:updates
cls
echo [*] Windows Update Information...
echo ================================================================================================
wmic qfe list brief /format:table
echo ================================================================================================
pause
goto banner

:startup
cls
echo [*] Startup Programs...
echo ================================================================================================
wmic startup list full
echo ================================================================================================
pause
goto banner

:eventlog
cls
echo [*] Recent System Event Logs...
echo ================================================================================================
wevtutil qe System /c:20 /rd:true /f:text
echo ================================================================================================
pause
goto banner

:battery
cls
echo [*] Generating Battery Report...
echo ================================================================================================
powercfg /batteryreport /output "%userprofile%\Desktop\battery-report.html"
echo.
echo [+] Battery report saved to Desktop!
start "" "%userprofile%\Desktop\battery-report.html"
echo ================================================================================================
pause
goto banner

:powershell
cls
echo [*] PowerShell Quick Tools...
echo ================================================================================================
echo [1] Get-ComputerInfo
echo [2] Get-Process
echo [3] Get-Service
echo [4] Get-NetAdapter
echo [5] Get-Disk
echo [0] Back to Main Menu
echo ================================================================================================
set /p pschoice="Select PowerShell Command: "
if "%pschoice%"=="1" powershell Get-ComputerInfo
if "%pschoice%"=="2" powershell Get-Process
if "%pschoice%"=="3" powershell Get-Service
if "%pschoice%"=="4" powershell Get-NetAdapter
if "%pschoice%"=="5" powershell Get-Disk
if "%pschoice%"=="0" goto banner
pause
goto powershell

:fullreport
cls
echo [*] Generating Complete System Report...
echo ================================================================================================
set reportfile=%userprofile%\Desktop\GHOST_RECON_Report_%date:~-4%%date:~3,2%%date:~0,2%_%time:~0,2%%time:~3,2%.txt
echo GHOST_RECON FULL SYSTEM REPORT > "%reportfile%"
echo Generated: %date% %time% >> "%reportfile%"
echo ================================================================================================ >> "%reportfile%"
echo. >> "%reportfile%"
echo === SYSTEM INFORMATION === >> "%reportfile%"
systeminfo >> "%reportfile%"
echo. >> "%reportfile%"
echo === DISK INFORMATION === >> "%reportfile%"
wmic diskdrive get model,size,status >> "%reportfile%"
echo. >> "%reportfile%"
echo === NETWORK CONFIGURATION === >> "%reportfile%"
ipconfig /all >> "%reportfile%"
echo. >> "%reportfile%"
echo === RUNNING PROCESSES === >> "%reportfile%"
tasklist >> "%reportfile%"
echo. >> "%reportfile%"
echo === ACTIVE CONNECTIONS === >> "%reportfile%"
netstat -ano >> "%reportfile%"
echo.
echo [+] Full report saved to Desktop: %reportfile%
start "" "%reportfile%"
echo ================================================================================================
pause
goto banner

:exit
cls
echo.
echo   _____ _    _  ____   _____ _______   _____  ______ _____ ____  _   _ 
echo  / ____^| ^|  ^| ^|/ __ \ / __^|__   __^| ^|  __ \^|  ____/ ____/ __ \^| \ ^| ^|
echo ^| ^|  __^| ^|__^| ^| ^|  ^| ^| (___   ^| ^|    ^| ^|__) ^| ^|__ ^| ^|   ^| ^|  ^| ^|  \^| ^|
echo ^| ^| ^|_ ^|  __  ^| ^|  ^| ^|\___ \  ^| ^|    ^|  _  /^|  __^|^| ^|   ^| ^|  ^| ^| . ` ^|
echo ^| ^|__^| ^| ^|  ^| ^| ^|__^| ^|____) ^| ^| ^|    ^| ^| \ \^| ^|___^| ^|___^| ^|__^| ^| ^\  ^|
echo  \_____^|_^|  ^|_^|\____/^|_____/  ^|_^|    ^|_^|  \_\______\_____\____/^|_^| \_^|
echo.
echo ================================================================================================
echo                              [*] GHOST_RECON TERMINATED [*]
echo ================================================================================================
timeout /t 2 >nul
exit
