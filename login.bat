@echo off
title Login Batch - 1.0
color a

:Start
cls
echo Bitte Auswaehlen...
echo.
echo 1) Login...
echo 2) Benutzerkonto Loeschen...
echo 3) Benutzerkonto Erstellen...
echo 4) Oeffne Accounts [CLOSED]
echo.
set /p start=">>>"
if %start%==1 goto User
if %start%==2 goto delete_W
if %start%==3 goto registering
if %start%==4 goto closed

:registering
start register.bat
exit

:User
cls
set /p user1=Benutzername:
if exist "Usernames\%user1%.bat" goto Password
if not exist "Usernames\%user1%.bat" goto User

:Password
cls
set /p pass1=Passwort:
if exist "Passwords\%pass1%.bat" goto logged-in
if not exist "Passwords\%pass1%.bat" goto Password

:delete_W
cls
del Codes /q
echo.
echo - Warnung - Bitte Akzeptiere das du ein Konto Loeschen moechtest - Warnung -
echo.
pause > nul
goto delete

:delete
cls
echo.
echo.
echo Bitte waehle ein Konto die du loeschen moechtest.
echo.
echo.
set /p delete=Konto:
if exist "Usernames\%delete%.bat" goto delete_P
if not exist "Usernames\%delete%.bat" goto delete_W
if %delete%==exit goto Start
if not %delete%==exit goto delete

:delete_P

echo.
echo.
echo Bitte Gebe das Passwort des Kontos ein, um die Loeschung Fortzusetzen.
set /p delete_2=Passwort:
if exist "Passwords\%delete_2%.bat" goto delete_B
if not exist "Passwords\%delete_2%.bat" goto delete_W
if %delete_2%==exit goto Start
if not %delete_2%==exit goto delete_P

:delete_B
set /A "Code1=%random%"
(
echo set code2=%passwort1%
)>Codes\%Code1%_%delete%_%delete_2%.bat
echo.
echo.
start Codes\
echo Ein Bestaetigungscode wurde Erstellt, bitte gebe ihn hier ein:
echo.
echo.
set /p delete_confirm=Bestaetigung:
if %delete_confirm% equ %Code1% if exist "Codes\%Code1%_%delete%_%delete_2%.bat" goto deleteting
if not %delete_confirm% equ %Code1% if exist "Codes\%Code1%_%delete%_%delete_2%.bat" goto delete_W
if %delete_confirm%==exit goto Start
if not %delete_confirm%==exit goto delete

:deleteting
cls
echo.
echo ==============================
echo.
echo Kontodaten:
echo.
echo Benutzername: %delete%
echo Passwort: %delete_2%
echo Code: %delete_confirm%
echo.
echo ==============================
echo.
timeout /t 10
cls
echo.
echo Konto wird geloescht.....
echo.
del Usernames\%delete%.bat
echo ... Benutzername Geloescht ...
timeout /t 2
cls
del Passwords\%delete_2%.bat
echo.
echo Konto wird geloescht.....
echo.
echo ... Benutzername Geloescht ...
echo ... Passwort Geloescht ...
timeout /t 2
cls
del Codes\%Code1%_%delete%_%delete_2%.bat
echo.
echo Konto wird geloescht.....
echo.
echo ... Benutzername Geloescht ...
echo ... Passwort Geloescht ...
echo ... Bestaetigungscode Geloescht ...
echo.
timeout /t 10
cls
echo.
echo Konto Erfolgreich geloescht...
timeout /t 10
goto Start

:closed
cls
echo.
echo.
echo Tut mir Leid - Dein Commando konnte aus Unerklaerlichen Gruenden nicht ausgefuehrt werden,
echo Moegliche Gruende:
echo.
echo 1. Dein Commando ist noch nicht Fertig
echo 2. Dein Commando ist Geschlossen, heisst das Commando ist CLOSED
echo.
timeout /t 10
goto Start

:logged-in
cls
echo Konto Ausgewaehlt: %user1%
echo Passwort: %pass1%
echo.
echo.
timeout /t 2
goto menu

:menu
cls
echo.
echo.
echo.
echo Bitte Auswaehlen:
echo 1) Logout
echo 2) AFK
echo 3) Lock
echo 4) Delete
echo.
echo.
set /p cmd=Zentrale:
if %cmd%==2 goto afk
if %cmd%==1 goto Start
if %cmd%==4 goto delete_W
if %cmd%==" " goto menu
if %cmd%== goto menu
if not %cmd%==2 goto menu
if not %cmd%==1 goto menu
if not %cmd%==4 goto menu
if not %cmd%==3 goto menu

:afk
cls
echo.
echo Away From Keyboard
echo.
pause > nul 
echo.
goto menu
