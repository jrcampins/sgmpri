@echo off
cd /d "%~dp0"
setlocal
call variables
set source=%project_source_dir%\management\resources\database
set source
call set target=%%source:%project%=%project%ap101%%
set target
echo.
echo xcopy "%source%" "%target%" /s
set xf=/xf
set xf=%xf% *.lnk
set xf=%xf% *.log
set xf=%xf% Thumbs.db
rem xd=/xd
rem xd=%xd% resources
robocopy "%source%" "%target%" /s %xf% %xd% /np /nfl /ndl
echo.
pause
goto:eof
