@ECHO OFF
title Folder Locker

SET pengguna=%USERNAME%
SET waktu=%TIME%
SET tanggal=%DATE%

@REM disini bebas kalian boleh menamakan folder apa saja
set "folder=Rahasia"

if not exist "%folder%" (
    echo "membuat folder"
    mkdir "%folder%"
)

@REM jika ada banyak folder dengan nama Rahasia, maka yang akan di lock adalah folder yang pertama kali ditemukan
for /f "delims=" %%F in ('dir /b /ad Rahasia') do (
    set "lockFile=%%F\Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
    goto :CONTINUE
)

:CONTINUE

set "lockFile=Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
set "password=1234"

:CHECK_UPDATE
set "update"

:START
cls
echo -------------------------------------
echo      Folder Locker by Xnuvers007
echo -------------------------------------
echo.
echo Pengguna: %pengguna%
echo Waktu: %waktu%
echo Tanggal: %tanggal%
echo.
echo Folder: %folder%
echo -------------------------------------
echo.

if EXIST "%lockFile%" (
    echo [1] Buka Folder
) else (
    echo [1] Rahasiakan Folder
)
echo [2] Keluar
echo.
set /p "choice=Masukkan pilihan (1/2): "
if "%choice%"=="1" (
    if EXIST "%lockFile%" (
        goto UNLOCK
    ) else (
        goto LOCK
    )
)
if "%choice%"=="2" exit /b

:LOCK
cls
echo -------------------------------------
echo      Folder Locker by Xnuvers007
echo -------------------------------------
echo.
echo Mengunci Folder...
ren "%folder%" "%lockFile%" >nul 2>&1
attrib +h +s "%lockFile%" >nul 2>&1
echo.
echo Folder telah dirahasiakan.
echo.
pause
goto START

:UNLOCK
cls
echo -------------------------------------
echo      Folder Locker by Xnuvers007
echo -------------------------------------
echo.
set /a "attempt=3"
:PASSWORD_PROMPT
set /p "pass=Masukkan password [%attempt% percobaan tersisa]: "
if "%pass%"=="%password%" (
    echo Membuka Folder...
    attrib -h -s "%lockFile%" >nul 2>&1
    ren "%lockFile%" "%folder%" >nul 2>&1
    echo.
    echo Folder berhasil dibuka.
) else (
    set /a "attempt-=1"
    if %attempt% gtr 0 (
        echo Password salah. Silakan coba lagi.
        goto PASSWORD_PROMPT
    ) else (
        echo Anda telah menggunakan semua percobaan. Keluar...
    )
)
echo.
pause
goto START
