@echo off
REM ###############################################################################
REM file:        buildDist.bat                                                   
REM description: distribution build script for Windows                           
REM source:      https://github.com/zendrael/create_pas2js_app                  
REM ###############################################################################

REM Set paths to pas2js executables (adjust these paths to your installation)
set PAS2JS="%LOCALAPPDATA%\pas2js\bin\pas2js.exe"

REM Check if dist directory exists, if not create it
if not exist dist (
    mkdir dist
)

echo Cleaning dist dir...
if exist dist\* (
    del /Q dist\*
    for /D %%p in (dist\*) do rmdir "%%p" /S /Q
)

echo Copying files...
copy index.html dist\ >nul
if exist public (
    xcopy /E /I /Y public dist >nul
)

echo Compiling to dist...
REM (frontend) using browser as a target
%PAS2JS% -Jc -Jirtl.js -JRjs -Tbrowser src\main.pas -Fu"src\*" -Fu"src\*\*" -Fu"src\*\*\*" -O2 -B

REM (backend) using nodejs/bun as a target
REM %PAS2JS% -Jc -Jirtl.js -JRjs -Tnodejs src\main.pas -Fu"src\*" -Fu"src\*\*" -Fu"src\*\*\*" -O2 -B

if errorlevel 1 (
    echo Compilation error! Check your source code!
    exit /b 1
)

echo Moving JS file to dist...
if exist src\main.js (
    move /Y src\main.js dist\ >nul
)

REM Add here your compression / uglify / minify code to run on top of the main.js file

echo.
echo Done!

REM eof