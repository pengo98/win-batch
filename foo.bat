@echo off
setlocal enableextensions
set me=%~n0
set parent=%~dp0

cls
echo %date%
cd %~dp0
echo %me% 
echo %parent%
set foo=bar
echo %foo%
echo errorlevel=%errorlevel%

goto comment
whatever you type here will not be shown in stdout
works on multiline comments
:comment

if exist "fake.bat" ( 
    del "fake.bat"
)

if exist ".fake" ( 
    rmdir /s /q ".fake"
)
mkdir ".fake"


powershell -Command "Invoke-WebRequest https://dist.nuget.org/win-x86-commandline/v3.5.0/NuGet.exe -OutFile .fake\NuGet.exe"
".fake\NuGet.exe" "Install" "FAKE" "-Version" "4.50" "-OutputDirectory" ".fake\packages" "-ExcludeVersion"

@echo off
(
echo cls
echo cd %%~dp0
echo ".fake\packages\FAKE\tools\Fake.exe" %%* --nocache
) > fake.bat
@echo on

