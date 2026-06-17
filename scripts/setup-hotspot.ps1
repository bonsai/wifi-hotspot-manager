# WiFi Hotspot Setup Script
# Run as Administrator

param(
    [string]$SSID = "BYO",
    [string]$Password = "password123"
)

Write-Host "WiFi Hotspot Setup" -ForegroundColor Cyan
Write-Host "===================" -ForegroundColor Cyan

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "This script requires administrator privileges." -ForegroundColor Red
    Write-Host "Please run PowerShell as Administrator." -ForegroundColor Yellow
    exit 1
}

# Configure hosted network
Write-Host "`nConfiguring hosted network..." -ForegroundColor Yellow
netsh wlan set hostednetwork mode=allow ssid=$SSID key=$Password

if ($LASTEXITCODE -eq 0) {
    Write-Host "Hosted network configured successfully!" -ForegroundColor Green
    Write-Host "SSID: $SSID" -ForegroundColor Cyan
    Write-Host "Password: $Password" -ForegroundColor Cyan
} else {
    Write-Host "Failed to configure hosted network." -ForegroundColor Red
    exit 1
}

# Start hosted network
Write-Host "`nStarting hosted network..." -ForegroundColor Yellow
netsh wlan start hostednetwork

if ($LASTEXITCODE -eq 0) {
    Write-Host "WiFi Hotspot started successfully!" -ForegroundColor Green
    Write-Host "`nYou can now connect your smartphone to: $SSID" -ForegroundColor Cyan
} else {
    Write-Host "Failed to start WiFi Hotspot." -ForegroundColor Red
    exit 1
}

# Show status
Write-Host "`nCurrent status:" -ForegroundColor Yellow
netsh wlan show hostednetwork

Write-Host "`nSetup complete!" -ForegroundColor Green
