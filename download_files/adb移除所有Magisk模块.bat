@echo off
title by ����
set Path=%~dp0tools;%Path%
echo �����˹���ֻ�ǰ���һЩ����ˢģ�鵼�¿�2����3���������ģ��id�����
echo.
adb --version >nul
if not %errorlevel% == 0 ( echo δ�ҵ�adb����&goto end )
echo �鿴�������豸
adb devices
echo ��ȷ��Ҫ�Ƴ�����Magiskģ����ִ�к���޷��ָ�Ŷ?
pause
adb wait-for-device shell magisk --remove-modules
exit

:end
pause
exit
