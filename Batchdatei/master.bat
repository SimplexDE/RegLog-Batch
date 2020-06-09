@echo off
title Master Batch - 1.0 - BETA
color a
md Usernames
md Passwords
md Codes
cls
echo  --- BITTE WARTEN ---
echo PROGRAMM WIRD GESTARTET.
echo  --- BITTE WARTEN ---
timeout 5>nul
cls
echo  --- BITTE WARTEN ---
echo PROGRAMM WIRD GESTARTET..
echo  --- BITTE WARTEN ---
timeout 5>nul
cls
echo  --- BITTE WARTEN ---
echo PROGRAMM WIRD GESTARTET...
echo  --- BITTE WARTEN ---
timeout 5>nul
cls
echo  --- BITTE WARTEN ---
echo PROGRAMM WIRD GESTARTET.
echo  --- BITTE WARTEN ---
timeout 5>nul
cls
echo  --- BITTE WARTEN ---
echo PROGRAMM WIRD GESTARTET..
echo  --- BITTE WARTEN ---
timeout 5>nul
cls
echo  --- BITTE WARTEN ---
echo PROGRAMM WIRD GESTARTET...
echo  --- BITTE WARTEN ---
timeout 5>nul

:Start
cls
echo.
echo ################################
echo                                #
echo 1) Login...                    #
echo 2) Benutzerkonto Loeschen...   #
echo 3) Registrieren...             # 
echo 4) Oeffne Accounts...          #
echo                                #
echo ################################
echo.
set /p start=">>>"
if %start%==1 goto User
if %start%==2 goto delete_W
if %start%==3 goto UserReg
if %start%==4 goto oeffneaccs
goto Start

:User
cls
echo.
echo ################################
echo                                #
echo         Gebe nun dein          #
echo        Benutzername ein        #
echo                                #
echo ################################
echo.
set /p user1=Benutzername:
if exist "Usernames\%user1%.bat" goto Password
if not exist "Usernames\%user1%.bat" goto User

:Password
cls
echo.
echo ################################
echo                                #
echo         Gebe nun dein          #
echo          Passwort ein          #
echo                                #
echo ################################
echo.
set /p pass1=Passwort:
if exist "Passwords\%pass1%.bat" goto logged-in
if not exist "Passwords\%pass1%.bat" goto Password

:delete_W
cls
del Codes /q
echo.
echo ################################
echo                                #
echo            Warnung.            #
echo      Du bist dabei, einen      #
echo       Account zu loeschen      #
echo         [JA/ABBRECHEN]         #
echo                                #
echo ################################
echo.
set /p accept=">>>"
if %accept%==JA goto delete
if %accept%==ABBRECHEN goto restart
goto restart

:delete
cls
echo.
echo ################################
echo                                #
echo         Gebe nun dein          #
echo        Accountname ein,        #
echo     den du Loeschen willst     #
echo                                #
echo ################################
echo.
set /p delete=Account:
if exist "Usernames\%delete%.bat" goto delete_P
if not exist "Usernames\%delete%.bat" goto delete_W
if %delete%==exit goto Start
if not %delete%==exit goto delete

:delete_P

echo.
echo ################################
echo                                #
echo     Gebe nun das Passwort      #
echo      von dem Account ein       #
echo                                #
echo ################################
echo.
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
cls
echo.
echo Accountname: %delete%
echo Accountpasswort: %delete_2%
echo.
echo ################################
echo                                #
echo         Gebe nun den           #
echo       Bestaetigungscode        #
echo             ein                #   
echo                                #
echo ################################
echo.
start Codes\
set /p delete_confirm=Bestaetigungscode:
if %delete_confirm% equ %Code1% if exist "Codes\%Code1%_%delete%_%delete_2%.bat" goto deleteting
if not %delete_confirm% equ %Code1% if exist "Codes\%Code1%_%delete%_%delete_2%.bat" goto delete_W
if %delete_confirm%==exit goto Start
if not %delete_confirm%==exit goto delete

:deleteting
cls
echo.
echo ===========================
echo.            
echo        Kontodaten:        
echo.
echo   Benutzername: %delete% 
echo   Passwort: %delete_2%   
echo   Code: %delete_confirm% 
echo.
echo ===========================
echo.
timeout 10>nul
cls
del Usernames\%delete%.bat
echo.
echo ################################
echo                                #
echo      Konto wird Geloescht...   #
echo                                #
echo      Nutzername Geloescht      #
echo                                #
echo ################################
echo.
timeout 10>nul
cls
del Passwords\%delete_2%.bat
echo.
echo ################################
echo                                #
echo      Konto wird Geloescht...   #
echo                                #
echo      Nutzername Geloescht      #
echo       Passwort Geloescht       #
echo                                #
echo ################################
echo.
timeout 10>nul
cls
del Codes\%Code1%_%delete%_%delete_2%.bat
echo.
echo ################################
echo                                #
echo      Konto wird Geloescht...   #
echo                                #
echo      Nutzername Geloescht      #
echo       Passwort Geloescht       #
echo   Bestaetigungscode Geloescht  #
echo                                #
echo ################################
echo.
timeout 10>nul
cls
echo.
echo ################################
echo                                #
echo        Konto Geloescht!        #
echo                                #
echo ################################
echo.
timeout 10>nul
goto restart

:oeffneaccs
cls
start Usernames\
goto Start

:logged-in
cls
echo.
echo ===========================
echo.            
echo        Kontodaten:        
echo.
echo   Benutzername: %user1% 
echo   Passwort: %pass1%   
echo.
echo ===========================
echo.
timeout /t 2
goto menu

:menu
cls
echo.
echo ################################
echo                                #
echo             MENU               #
echo          Version 1.3           #
echo                                #
echo     1) Logout                  #
echo     2) Away from Keyboard      #
echo     3) Account Loeschen        #
echo     4) Credits                 #
echo     5) GitHub Seite            #
echo                                #
echo ################################
echo.
set /p cmd=Command:
if %cmd%==2 goto afk
if %cmd%==1 goto restart
if %cmd%==3 goto delete_W
if %cmd%==4 goto credits
if %cmd%==5 goto github
if %cmd%==" " goto menu
if %cmd%== goto menu
if not %cmd%==2 goto menu
if not %cmd%==1 goto menu
if not %cmd%==3 goto menu

:afk
cls
echo.
echo ################################
echo                                #
echo             MENU               #
echo          Version 1.3           #
echo                                #
echo      Away from Keyboard        #
echo                                #
echo ################################
echo.
pause > nul 
echo.
goto menu

:credits
cls
echo.
echo ################################
echo                                #
echo             MENU               #
echo          Version 1.3           #
echo                                #
echo        Masterbatch by:         #
echo          SimplexDE             #
echo                                #
echo                                #
echo ################################
pause > nul 
echo.
goto menu

:restart
cls
echo.
echo ################################
echo                                #
echo             MENU               #
echo          Version 1.3           #
echo                                #
echo           Restart              #
echo                                #
echo ################################
echo.
timeout 8>nul
start master.bat
exit

:github
echo.
echo ################################
echo                                #
echo             MENU               #
echo          Version 1.3           #
echo                                #
echo         GitHub-Seite           #
echo                                #
echo ################################
echo.
start https://github.com/SimplexDE/RegLog-Batch
timeout 10>nul
goto menu

:UserReg
cls
echo.
echo ################################
echo                                #
echo         Gebe dein neuen        #
echo         Benutzername ein       #
echo                                #
echo ################################
echo.
set /p username1=Neuer Benutzername:
(
echo set username1=%username1%
)>Usernames\%username1%.bat
goto PasswortReg

:PasswortReg
cls
echo.
echo ################################
echo                                #
echo         Gebe dein neues        #
echo          Passwort ein          #
echo                                #
echo ################################
echo.
set /p passwort1=Neues Passwort:
(
echo set passwort1=%passwort1%
)>Passwords\%passwort1%.bat
goto endReg

:endReg
cls
echo.
echo ################################
echo                                #
echo         Konto Erstellt!        #
echo                                #
echo ################################
echo.
echo ========================================
echo.
echo Kontodaten: %username1% , %passwort1%
echo Datum: %date%
echo Uhrzeit: %time%
echo.
echo ========================================
echo.
timeout 10>nul
goto restart
