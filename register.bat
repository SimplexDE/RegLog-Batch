@echo off
title Register Batch - 1.0
color a

:Warn
echo.
echo.
echo Hierbei werden 3 Neue Ordner erstellt.
echo Die Ordner landen dort, wo die BATCH Datei ist.
echo.
echo.
pause >NUL

:UserReg
md Usernames
md Passwords
md Codes
cls
echo.
echo Bitte einen neuen Benutzernamen eingeben...
set /p username1=Neuer Benutzername:
echo.
(
echo set username1=%username1%
)>Usernames\%username1%.bat
goto PasswortReg

:PasswortReg
cls
echo.
echo Bitte ein neues Passwort eingeben...
set /p passwort1=Neues Passwort:
echo.
(
echo set passwort1=%passwort1%
)>Passwords\%passwort1%.bat
goto end

:end
cls
echo Dein Konto wurde Erstellt!
echo.
echo Kontodaten: %username1% , %passwort1%
echo Datum: %date%
echo Uhrzeit: %time%
timeout /t 10
start login.bat
exit
