@echo off
cd /d "%~dp0"
set source=%HOMEDRIVE%\%USERNAME%\jee1ap101\workspace\jee1\*.bat
set source
call set target=%CD%
set target
echo.
echo xcopy "%source%" "%target%"
echo.
pause
echo.
call xcopy "%source%" "%target%"
echo.
pause
goto:eof
