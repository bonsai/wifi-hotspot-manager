@echo off
:: WiFi Hotspot Auto-Start Script
:: Requires Administrator privileges

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

echo Starting WiFi Hotspot...
netsh wlan start hostednetwork

if %errorlevel% equ 0 (
    echo WiFi Hotspot started successfully!
    echo SSID: BYO
) else (
    echo Failed to start WiFi Hotspot.
    echo Please check if the hosted network is configured.
)

timeout /t 3 >nul
