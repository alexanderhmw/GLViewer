@echo off

set TMPSDKNAME=GLViewer

set TMPCURPATH=%cd%

cd /D %~dp0

if not exist .\Build\include\NUL mkdir Build\include
if not exist .\Build\lib\NUL mkdir Build\lib
if not exist .\VS\NUL mkdir VS
cd VS

qmake -tp vc ../Src/%TMPSDKNAME%.pro "CONFIG+=build_all"
devenv %TMPSDKNAME%.vcxproj /build Release
devenv %TMPSDKNAME%.vcxproj /build Debug

xcopy ..\Src\*.h ..\Build\include\ /s /e /y

echo Building Completed!

set INSTALLPATH=C:\SDK\%TMPSDKNAME%
if not "%1"=="" set INSTALLPATH=%1:\SDK\%TMPSDKNAME%

if not exist %INSTALLPATH%\NUL mkdir %INSTALLPATH%
xcopy .\Build\* %INSTALLPATH% /s /e /y

echo Installation Completed!

cd /D %TMPCURPATH%

pause

@echo on
