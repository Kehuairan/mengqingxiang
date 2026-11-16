@echo off
rem Start a local web server for this folder, then open it in the browser.
rem Useful when you want to view the site from a phone or another PC on the same LAN.
cd /d "%~dp0"

where python >nul 2>nul
if errorlevel 1 (
  echo.
  echo Python was not found. Opening index.html directly instead...
  start "" "%~dp0index.html"
  pause
  exit /b
)

echo.
echo   Local:  http://127.0.0.1:8000
echo   LAN:    http://%COMPUTERNAME%:8000
echo.
echo   Press Ctrl+C in this window to stop the server.
echo.
start "" "http://127.0.0.1:8000/"
python -m http.server 8000 --bind 0.0.0.0
