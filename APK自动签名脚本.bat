@echo off
color e0
SETLOCAL EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
rem echo say the name of the colors, don't read
:start

echo ***************************************************************************
echo ***************************************************************************
echo ********************** APK �Զ���ǩ������ BY cy v1.0 **********************
echo ***************************************************************************
echo ***************************************************************************
echo.
echo 1.�뽫����ǩ���ļ��Ϸŵ������ں�س���
set /p key_path=
echo.
echo 2.�뽫��Ҫǩ����APK�Ϸŵ������ں�س���
set /p apk_path=
set signed_path=%apk_path:.apk=_signed.apk%
echo.
echo 3.����������ǩ��alias(���磺ebuy)��س���
set /p alias=
echo.
echo ##################### ��ʼǩ�� #####################
jarsigner -verbose -keystore %key_path% -signedjar %signed_path% %apk_path% %alias%
if %errorlevel%==0 (
    call :ColorText e2 "##################### ǩ���ɹ� #######################"
    echo.
    call :ColorText e2 "ǩ�����APK�ļ�λ�ڣ�"
    echo %signed_path%
    call :ColorText e2 "######################################################"
) else (
    call :ColorText e4 "############## ǩ��ʧ�ܣ�����ԭ��������ʾ��###############"
)
echo.
echo ***************************************************************************
echo ******************************** ������� *********************************
echo ***************************************************************************

pause

goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof