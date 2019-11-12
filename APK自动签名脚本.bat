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
echo ********************** APK 自动化签名工具 BY cy v1.0 **********************
echo ***************************************************************************
echo ***************************************************************************
echo.
echo 1.请将您的签名文件拖放到本窗口后回车：
set /p key_path=
echo.
echo 2.请将您要签名的APK拖放到本窗口后回车：
set /p apk_path=
set signed_path=%apk_path:.apk=_signed.apk%
echo.
echo 3.请输入您的签名alias(比如：ebuy)后回车：
set /p alias=
echo.
echo ##################### 开始签名 #####################
jarsigner -verbose -keystore %key_path% -signedjar %signed_path% %apk_path% %alias%
if %errorlevel%==0 (
    call :ColorText e2 "##################### 签名成功 #######################"
    echo.
    call :ColorText e2 "签名后的APK文件位于："
    echo %signed_path%
    call :ColorText e2 "######################################################"
) else (
    call :ColorText e4 "############## 签名失败，错误原因如上所示！###############"
)
echo.
echo ***************************************************************************
echo ******************************** 程序结束 *********************************
echo ***************************************************************************

pause

goto :eof

:ColorText
echo off
<nul set /p ".=%DEL%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1
goto :eof