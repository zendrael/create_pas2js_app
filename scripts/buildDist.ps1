###############################################################################
# file:        buildDist.ps1                                                  #
# description: distribution build script                                      #
# source:      https://github.com/zendrael/create_pas2js_app                  #
###############################################################################

# Set Pas2JS path
$PAS2JSPATH = "C:\Users\$Env:UserName\Downloads\pas2js-windows-2.2.0\bin\i386-win32"
# "$env:LOCALAPPDATA\New Application\Folder" 

# Set script aliases
Set-Alias -Name pas2js -Value "$PAS2JSPATH\pas2js.exe"

# Create dev directory if it doesn't exist
if (-not (Test-Path dist)) {
  New-Item -ItemType Directory -Name dist | Out-Null
}

Write-Host "Cleaning dist dir..."
Remove-Item -Path dist\* -Recurse -Force

Write-Host "Copying files..."
Copy-Item -Path index.html -Destination dist\
Copy-Item -Path public\* -Destination dist\ -Recurse

Write-Host "Compiling to dist..."
# (frontend) using browser as a target
pas2js -Jc -Ji"rtl.js" -JRjs -Tbrowser src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -O2 -B

# (backend) using nodejs/bun as a target
# pas2js -Jc -Ji"rtl.js" -JRjs -Tnodejs src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -O2 -B

if ($LastExitCode -ne 0) {
  Write-Host "Compilation error! Check your source code!"
  exit 0
}

Write-Host "Moving JS file to dist..."
Move-Item -Path src\main.js -Destination dist\

# Add here your compression / uglify / mininfy code to run on top of the main.js file

Write-Host ""
Write-Host "Done!"

#eof