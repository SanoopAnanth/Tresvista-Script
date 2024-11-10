Add-Type @"
using System;
using System.Runtime.InteropServices;
public class WinAPI {
    [DllImport("user32.dll")]
    public static extern bool MoveWindow(IntPtr hWnd, int X, int Y, int nWidth, int nHeight, bool bRepaint);

    [DllImport("user32.dll", SetLastError= true)]
    public static extern IntPtr FindWindowByHandle(IntPtr hWnd);

    [DllImport("user32.dll", SetLastError=true)]
    public static extern IntPtr GetForegroundWindow();
}
"@
(New-Object -ComObject Shell.Application).MinimizeAll()
Start-Process "windowsdefender:"
Start-Process "inetcpl.cpl"
Start-Process "cmd.exe" -ArgumentList "/k", "manage-bde -status && hostname"
Start-Process "control.exe"
# Using Get-Process to find the window title
$process = Get-Process | Where-Object { $_.MainWindowTitle -like "*Windows Security*" }
if ($process) {
    $hWnd = $process.MainWindowHandle
    Write-Host "Found window handle: $hWnd"
    $result = [WinAPI]::MoveWindow($hWnd, -10, -2, 1040, 600, $true)
    if ($result) {
        Write-Host "Window moved successfully."
    } else {
        Write-Host "Failed to move window."
    }
} else {
    Write-Host "Window not found."
}
$process = Get-Process | Where-Object { $_.MainWindowTitle -like "*cmd.exe*" }
if ($process) {
    $hWnd = $process.MainWindowHandle
    Write-Host "Found window handle: $hWnd"
    $result = [WinAPI]::MoveWindow($hWnd, 1650, 0, 770, 600, $true)
    if ($result) {
        Write-Host "Window moved successfully."
    } else {
        Write-Host "Failed to move window."
    }
} else {
    Write-Host "Window not found."
}
$process = Get-Process | Where-Object { $_.MainWindowTitle -like "*Control Panel*" }
if ($process) {
    $hWnd = $process.MainWindowHandle
    Write-Host "Found window handle: $hWnd"
    $result = [WinAPI]::MoveWindow($hWnd, -5, 630, 1000, 650, $true)
    if ($result) {
        Write-Host "Window moved successfully."
    } else {
        Write-Host "Failed to move window."
    }
} else {
    Write-Host "Window not found."
}
$process = Get-Process | Where-Object { $_.MainWindowTitle -like "*Internet Explorer*" }
if ($process) {
    $hWnd = $process.MainWindowHandle
    Write-Host "Found window handle: $hWnd"
    $result = [WinAPI]::MoveWindow($hWnd, 0, 0, 500, 600, $true)
    if ($result) {
        Write-Host "Window moved successfully."
    } else {
        Write-Host "Failed to move window."
    }
} else {
    Write-Host "Window not found."
}