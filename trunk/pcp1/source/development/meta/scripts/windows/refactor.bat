@echo off
cd /d "%~dp0"
call variables

setlocal EnableDelayedExpansion

set log0="%~dpn0.log"
if exist %log0% del %log0%

set bat1="%~dpn0.rename-1.bat"
if exist %bat1% del %bat1%

set bat2="%~dpn0.rename-2.bat"
if exist %bat2% del %bat2%

set tok0="%~dpn0.unsorted.txt"
if exist %tok0% del %tok0%

set tok1="%~dpn0.tokens-1.txt"
if exist %tok1% del %tok1%

set tok2="%~dpn0.tokens-2.txt"
if exist %tok2% del %tok2%

set old_project_code=jee1
set old_project_code
set old_project_path=C:\workspace\
set old_project_path
call:setNewProjectCode
call:setNewProjectPath
echo.
if /i "%old_project_path%" == "%new_project_path%" (
    if /i "%old_project_code%" == "%new_project_code%" (
        echo old and new project code must be different
        echo.
        pause
        goto:eof
    )
)

echo.
call:checkVersionControlFolders
if /i "%yesOrNo%" == "Y" (
    echo.
    echo cannot refactor a workspace under version control
    echo export a clean directory tree from the repository
    echo.
    pause
    goto:eof
)
set replacer="%third_party_dir%\tools\fart\fart.exe"
if not exist %replacer% (
    set replacer
    echo.
    echo ERROR: file %replacer% NOT FOUND!
    echo Download SourceForge FART tool from http://sourceforge.net/projects/fart-it
    echo Then copy "fart.exe" file to "%third_party_dir%\tools\fart"
    echo.
    pause
    goto:eof
)

:refactor
set yesOrNo=Y
set /p yesOrNo="rename %old_project_code% to %new_project_code% ? (Y/N) [%yesOrNo%] "
if /i not "%yesOrNo%" == "Y" goto:eof
echo.
call:checkFiles
call:checkFolders
if %files% GTR 0 call %bat1%
if %folders% GTR 0 call %bat2%
call:replaceOldProjectCode
call:replaceOldProjectPath
echo.
set yesOrNo=N
set /p yesOrNo="open log file ? (Y/N) [%yesOrNo%] "
if /i "%yesOrNo%" == "Y" start /d %SystemRoot% notepad %log0%
echo.
if exist %bat1% del %bat1%
if exist %bat2% del %bat2%
if exist %tok0% del %tok0%
if exist %tok1% del %tok1%
if exist %tok2% del %tok2%
endlocal
goto:eof

:setNewProjectCode
call:lcase project new_project_code
set new_project_code
if not "%project%" == "%new_project_code%" (
    echo.
    echo *** warning: new project code got converted to lower case
)
goto:eof

:setNewProjectPath
set new_project_path=%workspace%\
set new_project_path
goto:eof

:checkVersionControlFolders
set yesOrNo=N
for /R "%project_dir%" %%d in (.) do (
    if "%%~nxd" ==  "CVS" call:checkVersionControlFolder %%d
    if "%%~nxd" == ".svn" call:checkVersionControlFolder %%d
)
goto:eof

:checkVersionControlFolder
set yesOrNo=Y
echo %~f1 is a version control directory
goto:eof

:checkFiles
set /a files=0
if exist %tok0% del %tok0%
for /R "%project_source_dir%" %%f in (*.*) do call:checkFile "%%f"
if %files% GTR 0 echo.
echo %files% files to rename
echo.
echo @echo off>>%bat1%
echo @echo %%~n0: %files% files to rename>>%bat1%
echo @echo.>>%bat1%
if %files% GTR 0 (
    echo rem pause>>%bat1%
    sort %tok0% /o %tok1%
    type %tok1%>>%bat1%
    echo rem pause>>%bat1%
    echo @echo.>>%bat1%
)
if exist %tok0% del %tok0%
goto:eof

:checkFile
set old=%~nx1
call set new=%%old:%old_project_code%=%new_project_code%%%
if /i not "%old%" == "%new%" (
    set /a files+=1
    echo ren %~f1 %new%
    echo ren %~f1 %new%>>%tok0%
)
goto:eof

:checkFolders
set /a folders=0
if exist %tok0% del %tok0%
for /R "%project_source_dir%" %%d in (.) do call:checkFolder "%%d"
if %folders% GTR 0 echo.
echo %folders% folders to rename
echo.
echo @echo off>>%bat2%
echo @echo %%~n0: %folders% folders to rename>>%bat2%
echo @echo.>>%bat2%
if %folders% GTR 0 (
    echo rem pause>>%bat2%
    sort /r %tok0% /o %tok2%
    type %tok2%>>%bat2%
    echo rem pause>>%bat2%
    echo @echo.>>%bat2%
)
if exist %tok0% del %tok0%
goto:eof

:checkFolder
set old=%~nx1
call set new=%%old:%old_project_code%=%new_project_code%%%
if /i not "%old%" == "%new%" (
    set /a folders+=1
    echo ren %~f1 %new%
    echo ren %~f1 %new%>>%tok0%
)
goto:eof

:replaceOldProjectCode
call:replace-old-project-code-1 bat
call:replace-old-project-code-1 cli
call:replace-old-project-code-1 css
call:replace-old-project-code-1 html
call:replace-old-project-code-1 java
call:replace-old-project-code-1 jrtx
call:replace-old-project-code-1 jrxml
call:replace-old-project-code-1 jspf
call:replace-old-project-code-1 jsp
call:replace-old-project-code-1 js
call:replace-old-project-code-1 osql
call:replace-old-project-code-1 password
call:replace-old-project-code-1 properties
call:replace-old-project-code-1 psql
call:replace-old-project-code-1 sh
call:replace-old-project-code-1 sql
call:replace-old-project-code-1 tld
call:replace-old-project-code-1 txt
call:replace-old-project-code-1 userlibraries
call:replace-old-project-code-1 vm
call:replace-old-project-code-1 xml
call:replace-old-project-code-1 classpath
call:replace-old-project-code-1 project
call:replace-old-project-code-2 org.eclipse
goto:eof

:replace-old-project-code-1
set old_string=meta-%old_project_code%
set new_string=meta-%new_project_code%
call:replace-old-project-code-1-1 %1
set old_string=meta.%old_project_code%
set new_string=meta.%new_project_code%
call:replace-old-project-code-1-1 %1
set old_string=%old_project_code%ap
set new_string=%new_project_code%ap
call:replace-old-project-code-1-1 %1
goto:eof

:replace-old-project-code-2
set old_string=meta-%old_project_code%
set new_string=meta-%new_project_code%
call:replace-old-project-code-2-1 %1
set old_string=meta.%old_project_code%
set new_string=meta.%new_project_code%
call:replace-old-project-code-2-1 %1
set old_string=%old_project_code%ap
set new_string=%new_project_code%ap
call:replace-old-project-code-2-1 %1
goto:eof

:replace-old-project-code-1-1
call:lcase old_string findstring
call:lcase new_string replacestring
call:file-suffix-replacer %1
call:ucase old_string findstring
call:ucase new_string replacestring
call:file-suffix-replacer %1
echo.
goto:eof

:replace-old-project-code-2-1
call:lcase old_string findstring
call:lcase new_string replacestring
call:file-prefix-replacer %1
call:ucase old_string findstring
call:ucase new_string replacestring
call:file-prefix-replacer %1
echo.
goto:eof

:replaceOldProjectPath
set findstring=%old_project_path:\=/%
set replacestring=%new_project_path:\=/%
if /i not "%findstring%" == "%replacestring%" (
    call:file-suffix-replacer bat
    call:file-suffix-replacer properties
    call:file-suffix-replacer userlibraries
    call:file-suffix-replacer xml
)
goto:eof

:lcase
rem Syntax: call :lcase name1 name2
rem name1 = NAME of variable whose VALUE is to be converted to lower case
rem name2 = NAME of variable to hold the converted value
rem Notice: Use variable NAMES in the call, not values (pass "by reference")
set lcab=a b c d e f g h i j k l m n o p q r s t u v w x y z
set lcst=!%1!
for %%x in (%lcab%) do set lcst=!lcst:%%x=%%x!
set %2=%lcst%
goto:eof

:ucase
rem Syntax: call :ucase name1 name2
rem name1 = NAME of variable whose VALUE is to be converted to upper case
rem name2 = NAME of variable to hold the converted value
rem Notice: Use variable NAMES in the call, not values (pass "by reference")
set UCAB=A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
set UCST=!%1!
for %%X in (%UCAB%) do set UCST=!UCST:%%X=%%X!
set %2=%UCST%
goto:eof

:file-suffix-replacer
set wildcard=%project_dir%\*.%1
call:wildcard-replacer
goto:eof

:file-prefix-replacer
set wildcard=%project_dir%\%1.*
call:wildcard-replacer
goto:eof

:wildcard-replacer
echo replace "%findstring%" with "%replacestring%" in "%wildcard%"
echo %replacer% -r "%wildcard%" "%findstring%" "%replacestring%" 1>>%log0% 2>nul
call %replacer% -r "%wildcard%" "%findstring%" "%replacestring%" 1>>%log0% 2>nul
echo.>>%log0%
goto:eof
