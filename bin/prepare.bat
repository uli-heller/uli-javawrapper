@echo off
set D=%~pd0
set TPD=%D%\..\3rd-party
set GROOVY_VERSION=2.1.3
set GROOVY_ZIP_BASENAME=groovy-binary-%GROOVY_VERSION%.zip
set GROOVY_ZIP_ABSOLUTE_PATH=%TPD%\%GROOVY_ZIP_BASENAME%
set GROOVY_ZIP_DOWNLOAD_URL=http://dist.groovy.codehaus.org/distributions/%GROOVY_ZIP_BASENAME%

if not exist "%TPD%" mkdir "%TPD%"

if exist "%D%\groovy" goto end_groovy
  if exist "%GROOVY_ZIP_ABSOLUTE_PATH%" goto end_groovy_download
    call "%D%\httpcat.bat" "%GROOVY_ZIP_DOWNLOAD_URL%" >"%GROOVY_ZIP_ABSOLUTE_PATH%"
:end_groovy_download
  call "%D%\myjar.bat" -xf "%GROOVY_ZIP_ABSOLUTE_PATH%"
  move "groovy-%GROOVY_VERSION%" "%D%\groovy" >NUL
  del "%D%\groovy\bin\groovy" >NUL
:end_groovy
exit /B 0
