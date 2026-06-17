@echo off
:: WiFi Hotspot Stop Script

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Stopping WiFi Hotspot...
netsh wlan stop hostednetwork

if %errorlevel% equ 0 (
    echo WiFi Hotspot stopped successfully!
) else (
    echo Failed to stop WiFi Hotspot.
)

timeout /t 3 >nul
