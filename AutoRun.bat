@ECHO OFF

:: SESSION ELEVATION
net session >nul 2>&1
IF %errorlevel% neq 0 (
    ECHO Requesting administrator privileges...
    :: Relaunch batch file with elevated rights
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    EXIT /b
)

:: INTRODUCTION
ECHO ============================
ECHO   AutoWinUpdater - AutoRun
ECHO ============================

cd %~dp0\bin

REM Querying Active Windows Session To Backup Currently Logged In User's Profile Path
FOR /F "tokens=2 delims= " %%u IN ('QUERY SESSION ^| FINDSTR "Active"') DO (
    SET activeUser=%%u
)

:: Copy files to C:\temp
MKDIR  "C:\Users\%activeuser%\bin" 2>nul
ROBOCOPY "%~dp0\bin" "C:\Users\%activeuser%\bin" "AutoWinUpdater.ps1"

TIMEOUT /T 5 /NOBREAK >NUL

ECHO Starting setup.exe...
TIMEOUT /T 2 /NOBREAK >NUL
.\setup.exe