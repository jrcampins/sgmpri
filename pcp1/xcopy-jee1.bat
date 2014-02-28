@echo off
cd /d "%~dp0"
set source=%USERPROFILE%\Projects\adalid-jee1\workspace\jee1\*.*
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
