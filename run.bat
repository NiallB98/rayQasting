@echo off
setlocal

set OLDDIR="%cd%"
cd "%~dp0\src\q"

for /F "tokens=*" %%i in ('type ..\..\config.cfg') do set %%i
set Q_CMD=%Q_CMD:"=%

if not defined Q_CMD set Q_CMD=q

%Q_CMD% main.q

pause
cd "%OLDDIR%"

endlocal
@echo on
