@echo off
cd /d "%~dp0"
setlocal
call:set-variables
if defined data if defined psql (
    call "%psql%\maketestdb"
    call "%psql%\variables"
    if not defined variables goto:eof
    set SQLDDLXDIR=%data%
    set SQLHOMEDIR=%data%
    call "%psql%\psql" "%~dpn0.psql"
    call "%psql%\vacuumdb"
)
pause
goto:eof

:set-variables
set workspace=
set postgresql=
set psql=
set data=
set variables=
set skip_makedb_vacuumdb=true

:set-variables-loop
call:set-n1 "%CD%"
if /i "%n1%" == "workspace"  set workspace=%CD%
if /i "%n1%" == "postgresql" set postgresql=%CD%
if /i not "%n1%" == "workspace" if /i not "%CD%" == "%~d0\" (
    cd ..
    goto:set-variables-loop
)

if defined workspace  set psql=%workspace%\pcp1ap101\source\management\resources\scripts\windows\postgresql
if not exist "%psql%" set psql=
if defined postgresql set data=%postgresql%\data
if not exist "%data%" set data=
set workspace
set postgresql
set psql
set data
echo.
cd /d "%~dp0"
goto:eof

:set-n1
set n1=%~n1
goto:eof
