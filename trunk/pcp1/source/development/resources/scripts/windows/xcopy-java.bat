@echo off
cd /d "%~dp0"
setlocal
call variables
set source=%project_source_dir%
set source
call set target=%%source:%project%=%project%ap101%%
set target
echo.
echo xcopy "%source%" "%target%" /s
set xf=/xf
set xf=%xf% *.lnk
set xf=%xf% *.log
set xf=%xf% Thumbs.db
set xd=/xd
set xd=%xd% meta
robocopy "%source%" "%target%" *.java /s %xf% %xd% /np /nfl /ndl
echo.
pause
goto:eof
