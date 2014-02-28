@echo off
cd /d "%~dp0"
call xcopy-management
echo.
call dataload
echo.
goto:eof
