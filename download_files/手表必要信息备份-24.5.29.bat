@echo off
:: by 白杳
::2024.5.29
color 6F
chcp 65001 > nul
adb --version >nul
if not %errorlevel% == 0 ( echo 未找到adb命令&goto end )
title 手表信息备份 by 白杳 -24.5.29
echo.-----------------------=版本号信息=-------------------------
adb wait-for-device &&echo 正在等待设备.....
echo "Device:"
adb wait-for-device shell getprop ro.product.innermodel
for /f "tokens=*" %%i in ('adb wait-for-device shell getprop ro.product.innermodel') do (
    set device=%%i
)
ECHO.
echo number:
adb wait-for-device shell getprop ro.product.jenkins.number
ECHO.
echo date.utc:
adb wait-for-device shell getprop ro.build.date.utc
ECHO.
echo date:
adb wait-for-device shell getprop ro.build.date
ECHO.
echo codebranch:
adb wait-for-device shell getprop ro.product.codebranch
ECHO.
echo.-----------------------=开始备份必要信息=-------------------------

for /f "tokens=*" %%i in ('adb wait-for-device shell getprop ro.boot.bindnumber') do (
    set bind=%%i
)
mkdir %bind% >nul
set vermo=ver_%device%.txt
(
    echo device:
    adb wait-for-device shell getprop ro.product.innermodel
    echo.
    echo number:
    adb wait-for-device shell getprop ro.product.jenkins.number
    echo.
    echo date.utc:
    adb wait-for-device shell getprop ro.build.date.utc
    echo.
    echo date:
    adb wait-for-device shell getprop ro.build.date
    echo.
    echo codebranch:
    adb wait-for-device shell getprop ro.product.codebranch
) > %bind%\%vermo%
set vermo=all_bak_%bind%.txt
(
    echo device:
    adb wait-for-device shell getprop ro.product.innermodel
    echo chipid:
    adb wait-for-device shell getprop ro.boot.xtc.chipid
    echo bind:
    adb wait-for-device shell getprop ro.boot.bindnumber
    echo.
    echo rsakey:
    adb wait-for-device shell content query --uri content://com.xtc.initservice/item
    echo 请自行检查rsakey是否未空,必要时采取提取xtcinfo分区来备份
    echo.
    echo imei:
    echo meid:
    echo SN:
) > %bind%\%vermo% >nul
echo 请自行备份imei meid 拨号盘输入 "*#06#" 获取
echo 请自行备份SN号,可以通过高通写号工具"QualcommTool-eMMC"来获取
start "" "%CD%\%bind%\"
start "" "%CD%\%bind%\all_bak_%bind%.txt"
echo 已打开备份文件与文件夹
echo 按任意键重新运行
pause >nul
%0
:end
pause
exit