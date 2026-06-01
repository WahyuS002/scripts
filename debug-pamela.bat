@echo off
setlocal

echo ==========================================
echo DEBUG JARINGAN KASIR - DEMPO
echo ==========================================
echo.

set SERVER_IP=172.29.0.2

echo [1] Menyimpan info jaringan...
ipconfig /all > "%USERPROFILE%\Desktop\debug-ipconfig.txt"

echo.
echo Cari Default Gateway dari file debug-ipconfig.txt
echo Lalu masukkan IP gateway/router Dempo.
echo Contoh: 192.168.1.1
echo.
set /p GATEWAY_IP=Masukkan IP Gateway: 

echo.
echo [2] Ping ke gateway/router Dempo...
ping %GATEWAY_IP% -n 100 > "%USERPROFILE%\Desktop\debug-ping-gateway.txt"

echo.
echo [3] Ping ke internet Google DNS...
ping 8.8.8.8 -n 100 > "%USERPROFILE%\Desktop\debug-ping-google.txt"

echo.
echo [4] Ping ke internet Cloudflare DNS...
ping 1.1.1.1 -n 100 > "%USERPROFILE%\Desktop\debug-ping-cloudflare.txt"

echo.
echo [5] Ping ke server kasir Pamela...
ping %SERVER_IP% -n 100 > "%USERPROFILE%\Desktop\debug-ping-server-kasir.txt"

echo.
echo [6] Cek jalur ke server kasir...
tracert %SERVER_IP% > "%USERPROFILE%\Desktop\debug-tracert-server-kasir.txt"

echo.
echo [7] Cek packet loss ke server kasir...
echo Ini mungkin agak lama, tunggu sampai selesai...
pathping %SERVER_IP% > "%USERPROFILE%\Desktop\debug-pathping-server-kasir.txt"

echo.
echo ==========================================
echo SELESAI
echo File hasil debug ada di Desktop:
echo - debug-ipconfig.txt
echo - debug-ping-gateway.txt
echo - debug-ping-google.txt
echo - debug-ping-cloudflare.txt
echo - debug-ping-server-kasir.txt
echo - debug-tracert-server-kasir.txt
echo - debug-pathping-server-kasir.txt
echo ==========================================
pause
