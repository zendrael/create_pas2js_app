###############################################################################
# buildDev.ps1                                                                #
# Dev build script                                                            #
###############################################################################

# Set Pas2JS path
$PAS2JSPATH = "C:\Users\$Env:UserName\Downloads\pas2js-windows-2.2.0\bin\i386-win32"

# Set script aliases
Set-Alias -Name pas2js -Value "$PAS2JSPATH\pas2js.exe"

# Create dev directory if it doesn't exist
if (-not (Test-Path dist)) {
  New-Item -ItemType Directory -Name dist | Out-Null
}

Write-Host "Cleaning dev dir..."
Remove-Item -Path dist\* -Recurse -Force

Write-Host "Copying files..."
Copy-Item -Path index.html -Destination dist\
Copy-Item -Path public\* -Destination dist\ -Recurse

Write-Host "Compiling to dist..."
# (frontend) using browser as a target
pas2js -Jc -Ji"rtl.js" -Tbrowser src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -O2 -B

# (backend) using nodejs/bun as a target
# pas2js -Jc -Jirtl.js -Tnodejs src/main.pas -Fu"src/*" -Fu"src/*/*" -Fu"src/*/*/*" -vewhl -B -Jm -Jminclude

if ($LastExitCode -ne 0) {
  Write-Host "Compilation error! Check your source code!"
  exit 0
}

Write-Host "Moving JS file to dist..."
Move-Item -Path src\main.js -Destination dist\

#eof