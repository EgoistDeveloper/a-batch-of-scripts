:: get current folder name
for %%I in (.) do set currentFolder=%%~nxI

:: 7Zip.exe path
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"
:: compress ratio between 0-9
set compressRatio=9
:: fist exclude this file and previous.zip file
set excludeThisAssets=-x!zip.bat -x!%currentFolder%.zip
:: base compress command
set zipContents=%sevenZipPath% a -tzip %currentFolder%.zip -r -mx%compressRatio% %excludeThisAssets%

:: ask type
@echo off
set /p type="Compress Type: "

:: zip all contents
if %type%==all %zipContents%
:: zip contents with pre excluded laravel contents
if %type%==laravel %zipContents% -x!.env -x!config -x!vendor -x!public -x!storage -x!".*"

::pause
