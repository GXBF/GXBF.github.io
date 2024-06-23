@echo off
title by 白杳
set Path=%~dp0tools;%Path%
echo 制作此功能只是帮助一些萌新刷模块导致卡2屏和3屏，不清楚模块id的情况
echo.
adb --version >nul
if not %errorlevel% == 0 ( echo 未找到adb命令&goto end )
echo 查看已连接设备
adb devices
echo 您确定要移除所有Magisk模块吗，执行后会无法恢复哦?
pause
adb wait-for-device shell magisk --remove-modules
exit

:end
pause
exit
