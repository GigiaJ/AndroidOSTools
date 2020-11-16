@echo off

:menu
@echo off
cls
echo.
echo.
echo.
echo Install new or restore old Moto G7 firmware
echo.
echo.
set /p dir= Enter the directory of the stock firmware: 
cd %dir%

echo.
echo.
echo. Menu
echo  [1] Restore Stock OS
echo  [2] Restore Bootloader
set /p select= Enter choice:
if '%select%'=='1' goto restorestock
if '%select%'=='2' goto restorebootloader
pause>nul


:restorestock
cls
echo.
echo Restoring to Stock OS
echo. 

pause
adb.exe reboot bootloader
::Display the commands for debug purposes
@echo on
fastboot.exe getvar max-sparse-size
fastboot.exe oem fb_mode_set
fastboot.exe flash partition gpt.bin
fastboot.exe flash bootloader bootloader.img
fastboot.exe flash modem NON-HLOS.bin
fastboot.exe flash fsg fsg.mbn
fastboot.exe erase modemst1
fastboot.exe erase modemst2
fastboot.exe flash dsp adspso.bin
fastboot.exe flash logo logo.bin
fastboot.exe flash boot boot.img
fastboot.exe flash dtbo dtbo.img
fastboot.exe flash system system.img_sparsechunk.0
fastboot.exe flash system system.img_sparsechunk.1
fastboot.exe flash system system.img_sparsechunk.2
fastboot.exe flash system system.img_sparsechunk.3
fastboot.exe flash system system.img_sparsechunk.4
fastboot.exe flash system system.img_sparsechunk.5
fastboot.exe flash system system.img_sparsechunk.6
fastboot.exe flash system system.img_sparsechunk.7
fastboot.exe flash system system.img_sparsechunk.8
fastboot.exe flash system system.img_sparsechunk.9
fastboot.exe flash system_b system_b.img_sparsechunk.0
fastboot.exe flash system_b system_b.img_sparsechunk.1
fastboot.exe flash system_b system_b.img_sparsechunk.2
fastboot.exe flash vendor vendor.img_sparsechunk.0
fastboot.exe flash vendor vendor.img_sparsechunk.1
fastboot.exe flash vendor vendor.img_sparsechunk.2
fastboot.exe flash oem oem.img
fastboot.exe flash oem_b oem_other.img
fastboot.exe erase DDR
fastboot.exe oem fb_mode_clear
pause
goto menu

:restorebootloader
cls
echo Restoring bootloader
echo.
pause

fastboot.exe oem lock
fastboot.exe oem lock
fastboot.exe oem lock
fastboot.exe flash boot boot.img
fastboot.exe oem lock

