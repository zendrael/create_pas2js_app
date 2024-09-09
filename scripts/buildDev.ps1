###############################################################################
# file:        buildDev.ps1                                                   #
# description: dev build script                                               #
# source:      https://github.com/zendrael/create_pas2js_app                  #
###############################################################################

# Set Pas2JS path
$PAS2JSPATH = "%LocalAppData%\Programs\pas2js\bin\i386-win32"
# "$env:LOCALAPPDATA\New Application\Folder" 

# Set script aliases
Set-Alias -Name pas2js -Value "$PAS2JSPATH\pas2js.exe"
Set-Alias -Name server -Value "$PAS2JSPATH\compileserver.exe"

# Create dev directory if it doesn't exist
if (-not (Test-Path dev)) {
  New-Item -ItemType Directory -Name dev | Out-Null
}

Write-Host "Cleaning dev dir..."
Remove-Item -Path dev\* -Recurse -Force

Write-Host "Copying files..."
Copy-Item -Path index.html -Destination dev\
Copy-Item -Path public\* -Destination dev\ -Recurse

Write-Host "Compiling to dev..."
# (frontend) using browser as a target
pas2js -Jc -Ji"rtl.js" -Tbrowser src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -vewhl -B -Jm -Jminclude -JRjs

# (backend) using nodejs/bun as a target
# pas2js -Jc -Ji"rtl.js" -Tnodejs src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -vewhl -B -Jm -Jminclude -JRjs

if ($LastExitCode -ne 0) {
  Write-Host "Compilation error! Check your source code!"
  exit 0
}

Write-Host "Copying JS file to dev..."
Move-Item -Path src\*.js -Destination dev\
Move-Item -Path src\*.js.map -Destination dev\

# REMOVE SERVER CALL IF BUILDING FOR NODEJS!!!
# OR ADD A CALL TO "node main.js"
# Start local server
Write-Host " "
Write-Host "Starting local server at http://localhost:3000"
Write-Host "(CTRL+C to quit server)"
server -p 3000 -s -d .\dev\

#eof