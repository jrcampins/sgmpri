@echo off
cd /d "%~dp0"
call xcopy-database
setlocal
call variables
set psql=
set psql=%workspace%\%project%ap101\source\management\resources\scripts\windows\postgresql
if not exist "%psql%" set psql=
set psql
echo.
if defined psql (
    call "%psql%\makedb"
) else (
    pause
)
goto:eof
