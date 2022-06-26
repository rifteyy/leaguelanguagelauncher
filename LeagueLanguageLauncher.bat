@echo off
set "reset=[0m"
setlocal enabledelayedexpansion
title LeagueLanguageLauncher
:loop
cls
set /a num=0
echo.
echo  Change your language in League of Legends quick, fast, safe even to unavailable languages.
echo.
for %%a in (English Taiwanese Korean Japanese Chinese Spanish French German Italian Polish Romanian Greek Portugese Russian Turkish Czech) do (
	set /a num=num + 1
	echo      [38;5;129m[!reset!!num![38;5;129m]!reset! - [33m%%a!reset!
)
echo.
echo  [31mDISCLAIMER:!reset! I am not responsible for any damage this application caused. Use it at your own risk
echo  All languages reset to default after restarting your computer. Use this instead of shortcut to select languages.
echo.
set /a num=0
set /p "cho=> "
if "%cho%"=="1" call :setlang en_US
if "%cho%"=="2" call :setlang zh_TW
if "%cho%"=="3" call :setlang ko_KR
if "%cho%"=="4" call :setlang ja_JP
if "%cho%"=="5" call :setlang zh_CN
if "%cho%"=="6" call :setlang es_ES
if "%cho%"=="7" call :setlang fr_FR
if "%cho%"=="8" call :setlang de_DE
if "%cho%"=="9" call :setlang it_IT
if "%cho%"=="10" call :setlang pl_PL
if "%cho%"=="11" call :setlang ro_RO
if "%cho%"=="12" call :setlang el_GR
if "%cho%"=="13" call :setlang pt_BR
if "%cho%"=="14" call :setlang ru_RU
if "%cho%"=="15" call :setlang tr_TR
if "%cho%"=="16" call :setlang cs_CZ
goto loop

:setlang
echo  ^<[%time%]^> [38;2;0;100;255m[i]!reset! Setting League Path
set "leaguepath=!systemdrive!\Riot Games\League of Legends\LeagueClient.exe"

:repeat
if NOT exist "!leaguepath!" (
	echo  [31mERROR:!Reset! "!leaguepath!" not found.
	echo  Please specify the path of LeagueClient.exe without quotes:
	set /p "leaguepath="
	goto repeat
)
echo  ^<[%time%]^> [38;2;0;100;255m[i]!reset! Ending League processes
(
taskkill /F /IM "riot*"
taskkill /F /IM "league*"
) 2>nul >nul
echo  ^<[%time%]^> [38;2;0;100;255m[i]!reset! Ending Riot processes
echo  ^<[%time%]^> [38;2;0;100;255m[i]!reset! Launching...
"!leaguepath!" --locale=%1
if "%errorlevel%"=="0" (echo  ^<[%time%]^> [32m[s]!reset! Successfully launched) else (echo  ^<[%time%]^> [31m[e]!reset! Unknown error)
pause
goto loop
