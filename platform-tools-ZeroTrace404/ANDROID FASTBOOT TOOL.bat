@echo off
title ZeroTrace404 - Fastboot Launcher
color 0a
cd /d "%~dp0"

echo ==================================================
echo   [ ZeroTrace404 ]  Fastboot Tool
echo ==================================================
echo.

:: Check if adb.exe exists
if not exist adb.exe (
    echo [!] ERROR: adb.exe not found in this folder!
    echo [!] Place this script in your platform-tools directory.
    pause
    exit /b
)

:: Detect devices
echo [*] Scanning for connected devices...
adb devices
echo.

set /p proceed="[*] Is your device listed above? (Y/N): "
if /i not "%proceed%"=="Y" (
    echo [!] Operation aborted.
    pause
    exit /b
)

:: Reboot to bootloader
echo [*] Rebooting into FASTBOOT mode...
adb reboot bootloader

:: Wait before checking
timeout /t 5 /nobreak >nul
echo.
echo [*] Checking Fastboot connection...
fastboot devices

echo.
echo [+] Done. If you see your device listed, you are in FASTBOOT mode.
echo [+] Powered by ZeroTrace404.
pause