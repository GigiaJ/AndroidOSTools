@echo off

:menu
cls
echo.
echo.
echo.
echo LineageInstallAssistant
echo.
echo.
set /p dir= Enter the directory of the OS and ADB/FastBoot:
cd %dir%
echo.
echo.
echo. Menu
echo  [1] Flash TWRP
echo  [2] Copy Partitions
echo  [3] Install LineageOS
echo  [4] Install GApps
echo  [5] Restore LineageOS BootLoader
echo  [6] Apply Magisk BootLoader
echo  [7] Reboot to BootLoader
echo  [8] Reboot to Recovery
echo  [9] Reboot to EDL
set /p select= Enter choice:
if '%select%'=='1' goto flashtwrp
if '%select%'=='2' goto copypartitions
if '%select%'=='3' goto installos
if '%select%'=='4' goto installgapps
if '%select%' == '5' goto restorelineagebl
if '%select%' == '6' goto magiskbl
if '%select%' == '7' goto rebootbl
if '%select%' == '8' goto rebootrc
if '%select%' == '9' goto rebooted


:flashtwrp
cls
pause>nul|set/p =Ensure you are in bootloader then press enter
cls
fastboot.exe flash boot twrp-3.3.1-2-river.img
pause
goto menu

:copypartitions
cls
pause>nul|set/p =Ensure you are in TWRP Recovery (Advanced then Sideload) then press enter
cls
adb.exe sideload copy-partitions.zip
pause
goto menu

:installos
cls
pause>nul|set/p =Ensure you are in TWRP Recovery (Advanced then Sideload) then press enter
cls
adb.exe sideload lineage-17.1-20200712-nightly-river-signed.zip
pause
goto menu


:installgapps
cls
pause>nul|set/p =Ensure you are in TWRP Recovery (Advanced then Sideload) and have installed LineageOS then press enter
cls
adb.exe reboot sideload
adb.exe sideload open_gapps-arm64-10.0-nano-20200530.zip
pause
goto menu

:restorelineagebl
cls
pause>nul|set/p =Ensure you are in bootloader then press enter
cls
fastboot.exe flash boot lineage-17.1-20200712-recovery-river.img
pause
goto menu

:magiskbl
cls
pause>nul|set/p =Ensure you are in bootloader then press enter
cls
fastboot.exe flash boot magisk_patched.img
pause
goto menu


:rebootbl
cls
echo Rebooting
echo.
adb.exe reboot bootloader
pause
goto menu

:rebootrc
cls
echo Rebooting
echo.
adb.exe reboot bootloader
pause
goto menu

:rebooted
cls
echo Rebooting
echo.
adb.exe reboot edl
pause
goto menu

