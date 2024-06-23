@echo off
:: biaiyao
:: Created:August 23 years 19th  December 13th
:: Revision History 23 years December 18th
title 安装面具模块 by白杳 ver2.3
color 6F
chcp 936 > nul
adb --version >nul
if not %errorlevel% == 0 ( echo 未找到adb命令&goto end )
echo.=----------------------------------------------------------=
echo.
echo  该脚本由白杳制作，通过shell面具模块安装命令安装模块
echo               该版本（2.3）可能是最终版本
echo.
echo.=----------------------------------------------------------=
echo 正在等待设备连接
adb wait-for-device
echo 请确认您的设备符合以下要求
echo shell有超级用户（自动响应-允许）
echo magisk版本在23.0及以上
pause
set /a num=%random%%%100+1
set /p var= 请输入面具模块地址或把模块拖到此窗口：
echo 正在传入手表..
title 正在安装magisk模块..
echo.
adb push %var% /sdcard/Android/modules/%num%.zip
echo.
echo 正在尝试安装..
echo.
adb wait-for-device shell su -c magisk --install-module /sdcard/Android/modules/%num%.zip
adb wait-for-device shell rm /sdcard/Android/modules/%num%.zip
echo.
title 安装完成
echo 已删除缓存
echo 模块安装完成.是否重启设备以加载模块?
echo. 1.重启   2.暂不重启
set /p choice= 
if "%choice%"=="1" echo.重启... & adb wait-for-device reboot system
timeout /t 1 /nobreak > nul
cls 
%0

:end
pause
exit