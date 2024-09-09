###############################################################################
# file:        setup.ps1                                                      #
# description: development environment setup script                           #
# source:      https://github.com/zendrael/create_pas2js_app                  #
###############################################################################

Write-Host "Setup Pas2JS..."

$PAS2JSDIR = Join-Path -Path $env:USERPROFILE -ChildPath ".local\share\applications"
$PAS2JSZIP = "https://getpas2js.freepascal.org/downloads/windows/pas2js-win64-x86_64-current.zip"

Write-Host "Checking installation..."
if (-not (Test-Path -Path (Join-Path -Path $PAS2JSDIR -ChildPath "pas2js"))) {
    Write-Host "Downloading..."

    Push-Location -Path $PAS2JSDIR
    try {
        Invoke-WebRequest -Uri $PAS2JSZIP -OutFile "pas2js.zip"
        Expand-Archive -Path "pas2js.zip" -DestinationPath $PAS2JSDIR
        Remove-Item -Path "pas2js.zip"
        Rename-Item -Path (Get-ChildItem -Path $PAS2JSDIR -Filter "pas2*" -Directory).FullName -NewName "pas2js"
    }
    finally {
        Pop-Location
    }
}

Write-Host "Done."
Write-Host "You can now use the build script to run your project."
Write-Host ""
exit 0
