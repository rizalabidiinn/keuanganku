@echo off
title KeuanganKu iOS App Server
echo Memulai server aplikasi KeuanganKu...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
pause
