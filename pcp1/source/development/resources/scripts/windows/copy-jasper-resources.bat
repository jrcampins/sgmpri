@echo off
@echo %~dpn0
@echo.
cd /d "%~dp0"
setlocal
call variables
if not defined robocopy-log set robocopy-log="%~dpn0.robocopy.log"
if exist %robocopy-log% if %robocopy-log% == "%~dpn0.robocopy.log" del %robocopy-log%
echo %~f0>>%robocopy-log%

call:xc1 custom-made
call:xc1 custom-made\subreports
call:xc1 entity-list
call:xc1 entity-list\subreports

if %robocopy-log% == "%~dpn0.robocopy.log" pause
goto:eof

:xc1
set source=%project_source_dir%\development\resources\reporting\jasper\templates
set target=%project_source_dir%\management\resources\reporting\jasper\reports\%1
set source
set target
call:xc2 jrtx
call:xc2 jpg
echo.
goto:eof

:xc2
robocopy "%source%" "%target%" *.%1 /s /nfl /ndl /log+:%robocopy-log%
goto:eof
