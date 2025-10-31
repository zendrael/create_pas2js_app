@echo off
REM ###############################################################################
REM # file:        setup.bat                                                      #
REM # description: development environment setup script                           #
REM # source:      https://github.com/zendrael/create_pas2js_app                  #
REM ###############################################################################

echo Setup Pas2JS...

SET "PAS2JSDIR=%LOCALAPPDATA%"
SET "PAS2JSZIP=https://getpas2js.freepascal.org/downloads/windows/pas2js-win64-x86_64-current.zip"

echo Checking installation...
IF NOT EXIST "%PAS2JSDIR%\pas2js\" (
  echo Downloading Pas2JS...

  REM Create the parent directory if it doesn't exist
  IF NOT EXIST "%PAS2JSDIR%" (
    echo Creating directory: "%PAS2JSDIR%"
    MKDIR "%PAS2JSDIR%"
    IF ERRORLEVEL 1 (
      ECHO Error: Failed to create directory "%PAS2JSDIR%".
      EXIT /B 1
    )
  )

  REM Change to the target directory for download and extraction
  CD "%PAS2JSDIR%"
  IF ERRORLEVEL 1 (
    ECHO Error: Failed to change directory to "%PAS2JSDIR%".
    EXIT /B 1
  )

  REM Use curl for downloading (available in modern Windows versions like Windows 10/11)
  echo Downloading pas2js.zip from "%PAS2JSZIP%"...
  curl -L -o pas2js.zip "%PAS2JSZIP%"
  IF ERRORLEVEL 1 (
    ECHO Error: Failed to download pas2js.zip.
    ECHO Please ensure 'curl' is available in your PATH or check the download URL.
    EXIT /B 1
  )

  REM Use tar for unzipping (available in modern Windows versions like Windows 10/11)
  echo Unzipping pas2js.zip...
  tar -xf pas2js.zip
  IF ERRORLEVEL 1 (
    ECHO Error: Failed to unzip pas2js.zip.
    ECHO Please ensure 'tar' is available in your PATH.
    EXIT /B 1
  )

  echo Deleting temporary zip file...
  DEL pas2js.zip
  IF ERRORLEVEL 1 (
    ECHO Warning: Failed to delete pas2js.zip. Continuing anyway.
    REM This is not a critical error, so we don't exit
  )

  REM Find the extracted directory (e.g., pas2js-linux-x86_64-current) and rename it to pas2js
  SET "EXTRACTED_DIR="
  FOR /D %%D IN ("%PAS2JSDIR%\pas2js-*") DO (
      REM Ensure we don't accidentally pick up an already existing 'pas2js' directory
      IF NOT "%%D"=="%PAS2JSDIR%\pas2js" (
          SET "EXTRACTED_DIR=%%D"
          GOTO :FOUND_EXTRACTED_DIR
      )
  )
  :FOUND_EXTRACTED_DIR
  IF DEFINED EXTRACTED_DIR (
      echo Renaming "%EXTRACTED_DIR%" to "pas2js"...
      MOVE "%EXTRACTED_DIR%" "%PAS2JSDIR%\pas2js"
      IF ERRORLEVEL 1 (
          ECHO Error: Failed to rename extracted directory "%EXTRACTED_DIR%" to "%PAS2JSDIR%\pas2js".
          EXIT /B 1
      )
  ) ELSE (
      ECHO Error: Could not find an extracted directory starting with "pas2js-" to rename.
      ECHO This might indicate an issue with the zip file content or extraction.
      EXIT /B 1
  )

) ELSE (
  echo Pas2JS is already installed in "%PAS2JSDIR%\pas2js".
)

echo Done.
echo You can now use the build script to run your project.
echo.
EXIT /B 0
