@echo off
cd /d "%~dp0"
setlocal
call variables
set source="%HOMEDRIVE%%HOMEPATH%\workspace\adalid\source\development"
set source
echo checking source...
echo.
if not exist %source% pause & goto:eof
set target="%adalid_dir%\source"
set target
echo checking target...
echo.
if not exist %target% pause & goto:eof
cd /d %target%
echo checking development...
echo.
if exist development pause & goto:eof
set junction="%third_party_dir%\tools\junction\junction.exe"
set junction
echo checking junction...
echo.
if not exist %junction% pause & goto:eof
if exist development (
    echo %junction% -d development
    call %junction% -d development
    echo.
)
echo %junction% development %source%
call %junction% development %source%
echo.
pause
goto:eof

