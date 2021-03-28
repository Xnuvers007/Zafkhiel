@ECHO OFF
title Folder
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Rahasia goto MDLOCKER
:CONFIRM
echo Anda ingin merahasiakan folder....?(Y/N)
set/p "cho=>"
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==n goto END
if %cho%==N goto END
echo Invalid choice.
goto CONFIRM
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