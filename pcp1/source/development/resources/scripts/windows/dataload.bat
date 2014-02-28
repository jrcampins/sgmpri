@echo off
cd /d "%~dp0"
setlocal
call variables
call:set-variables
if defined postgresql if defined data if defined scripts if defined psql (
    call "%psql%\maketestdb"
    call "%psql%\variables"
    if not defined variables goto:eof
    set SQLDDLXDIR=%data%
    set SQLHOMEDIR=%data%
    call "%psql%\psql" "%scripts%\%~n0.psql"
    call "%psql%\vacuumdb"
) else (
    pause
)
goto:eof

:set-variables
set variables=
set skip_makedb_vacuumdb=true
set postgresql=
set data=
set scripts=
set psql=
set postgresql=%project_source_dir%\development\resources\database\postgresql
if not exist "%postgresql%" set postgresql=
if not defined postgresql goto:set-variables-exit
set data=%postgresql%\data
if not exist "%data%" set data=
if not defined data goto:set-variables-exit
set scripts=%postgresql%\scripts
if not exist "%scripts%" set scripts=
if not defined scripts goto:set-variables-exit
set psql=%workspace%\%project%ap101\source\management\resources\scripts\windows\postgresql
if not exist "%psql%" set psql=
if not defined psql goto:set-variables-exit
:set-variables-exit
set postgresql
set data
set scripts
set psql
echo.
goto:eof
