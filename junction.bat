@echo off
cd /d "%~dp0"
setlocal
set does_not_exist=
set already_exists=
set junction=%HOMEDRIVE%%HOMEPATH%\workspace\third-party\tools\junction\junction.exe
set source_workspace=%HOMEDRIVE%%HOMEPATH%\workspace
set target_workspace=%CD%
set source_workspace
set target_workspace
call:check-exist junction executable file "%junction%"
call:check-exist source workspace "%source_workspace%"
call:check-exist target workspace "%target_workspace%"
if defined does_not_exist goto:eof
call:junction adalid
if defined does_not_exist goto:eof
if defined already_exists goto:eof
call:junction third-party
if defined does_not_exist goto:eof
if defined already_exists goto:eof
echo.
pause
goto:eof

:junction
set does_not_exist=
set already_exists=
set source="%source_workspace%\%1"
set target="%target_workspace%\%1"
call:check-junction %1
call:check-exist source directory %source%
if not defined junction_token call:check-not-exist target directory %target%
if defined does_not_exist goto:eof
if defined already_exists goto:eof
if defined junction_token "%junction%" -d %1
echo.
"%junction%" %1 %source%
echo.
goto:eof

:check-exist
call:echo-checking %*
call:set-last-parameter %*
if exist %last_parameter% (
    call:echo-does-exist %*
) else (
    call:echo-does-not-exist %*
    goto:eof
)
goto:eof

:check-not-exist
call:echo-checking %*
call:set-last-parameter %*
if exist %last_parameter% (
    call:echo-already-exists %*
    goto:eof
)
goto:eof

:set-last-parameter
set last_parameter=
:loop
if not "%1" == "" (
    set last_parameter=%1
    shift
    goto :loop
)
call:set-last-parameter-in-quotes %last_parameter%
goto:eof

:set-last-parameter-in-quotes
set last_parameter="%~f1"
rem echo check %last_parameter%
goto:eof

:check-junction
"%junction%" %1>junction.log
set junction_token=
for /f "tokens=1*" %%t in (junction.log) do set junction_token=%%t
del junction.log
if defined junction_token (
    if /i not "%junction_token%" == "Substitute" set junction_token=
)
goto:eof

:echo-checking
goto:eof
echo checking %*
goto:eof

:echo-does-exist
goto:eof
echo %* does exist
echo.
goto:eof

:echo-does-not-exist
set does_not_exist=true
echo ***ERROR*** %* does not exist!
echo.
pause
echo.
goto:eof

:echo-already-exists
set already_exists=true
echo ***ERROR*** %* already exists!
echo.
pause
goto:eof
