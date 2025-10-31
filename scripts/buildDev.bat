@echo off
REM ###############################################################################
REM file:        buildDev.bat                                                    
REM description: dev build script for Windows                                    
REM source:      https://github.com/zendrael/create_pas2js_app                  
REM ###############################################################################

echo Running on Windows...

REM Set paths to pas2js executables (adjust these paths to your installation)
set PAS2JS="%LOCALAPPDATA%\pas2js\bin\pas2js.exe"
set SERVER="%LOCALAPPDATA%\pas2js\bin\compileserver.exe"

REM Check if dev directory exists, if not create it
if not exist dev (
    mkdir dev
)

echo Cleaning dev dir...
if exist dev\* (
    del /Q dev\*
    for /D %%p in (dev\*) do rmdir "%%p" /S /Q
)

echo Copying files...
copy index.html dev\ >nul
if exist public (
    xcopy /E /I /Y public dev >nul
)

echo Compiling to dev...
REM (frontend) using browser as a target
%PAS2JS% -Jc -Jirtl.js -Tbrowser src\main.pas -Fu"src\*" -Fu"src\*\*" -Fu"src\*\*\*" -vewhl -B -Jm -Jminclude -JRjs

REM (backend) using nodejs/bun as a target
REM %PAS2JS% -Jc -Jirtl.js -Tnodejs src\main.pas -Fu"src\*" -Fu"src\*\*" -Fu"src\*\*\*" -vewhl -B -Jm -Jminclude -JRjs

if errorlevel 1 (
    echo.
    echo Compilation error! Check your source code!
    exit /b 1
)

echo Copying JS file to dev...
if exist src\*.js (
    move /Y src\*.js dev\ >nul
)
if exist src\*.js.map (
    move /Y src\*.js.map dev\ >nul
)

REM REMOVE SERVER CALL IF BUILDING FOR NODEJS!!!
REM OR ADD A CALL TO "node main.js"
echo.
echo  ------------------------------------------------
echo ^| Starting local server at http://localhost:3000 ^|
echo ^| (CTRL+C to quit server)                        ^|
echo  ------------------------------------------------
echo.
%SERVER% -p 8080 -d dev
REM enable watch
REM %SERVER% -p 3000 -w -c main.lpr -d dev

REM eof