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
ren Rahasia "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder telah dirahasiakan
goto End
:UNLOCK
echo Masukkan password
set/p "pass=>"
if NOT %pass%== (MASUKAN PASSWORD DISINI) goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Rahasia
echo Folder Unlocked successfully
goto End
:FAIL
echo Password salah
goto end
:MDLOCKER
md Rahasia
echo Folder telah dibuat
goto End
:End