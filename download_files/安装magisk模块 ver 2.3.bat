@echo off
:: biaiyao
:: Created:August 23 years 19th  December 13th
:: Revision History 23 years December 18th
title ��װ���ģ�� by���� ver2.3
color 6F
chcp 936 > nul
adb --version >nul
if not %errorlevel% == 0 ( echo δ�ҵ�adb����&goto end )
echo.=----------------------------------------------------------=
echo.
echo  �ýű��ɰ���������ͨ��shell���ģ�鰲װ���װģ��
echo               �ð汾��2.3�����������հ汾
echo.
echo.=----------------------------------------------------------=
echo ���ڵȴ��豸����
adb wait-for-device
echo ��ȷ�������豸��������Ҫ��
echo shell�г����û����Զ���Ӧ-����
echo magisk�汾��23.0������
pause
set /a num=%random%%%100+1
set /p var= ���������ģ���ַ���ģ���ϵ��˴��ڣ�
echo ���ڴ����ֱ�..
title ���ڰ�װmagiskģ��..
echo.
adb push %var% /sdcard/Android/modules/%num%.zip
echo.
echo ���ڳ��԰�װ..
echo.
adb wait-for-device shell su -c magisk --install-module /sdcard/Android/modules/%num%.zip
adb wait-for-device shell rm /sdcard/Android/modules/%num%.zip
echo.
title ��װ���
echo ��ɾ������
echo ģ�鰲װ���.�Ƿ������豸�Լ���ģ��?
echo. 1.����   2.�ݲ�����
set /p choice= 
if "%choice%"=="1" echo.����... & adb wait-for-device reboot system
timeout /t 1 /nobreak > nul
cls 
%0

:end
pause
exit