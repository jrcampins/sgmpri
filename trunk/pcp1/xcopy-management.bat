@echo off
cd /d "%~dp0"
call variables
set source=%project_source_dir%\management
set source
call set target=%%source:%project%=%project%ap101%%
set target
echo.
echo xcopy "%source%" "%target%" /s
call xcopy "%source%" "%target%" /s
echo.
pause
goto:eof
