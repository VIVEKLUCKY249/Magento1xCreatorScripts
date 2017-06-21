@ECHO OFF
SET ROOTPATH=%~dp0
SET ORIGPATH=%~dp0
SET WWWROOT=%~dp0
SET CURSCRIPTNAME=%~nx0
SET \t=	
ECHO %CURSCRIPTNAME%
rem @Echo OFF
rem Echo Launch dir: "%~dp0"
rem Echo Launch filename: "%~nx0"
rem Echo Current dir: "%CD%"
rem Echo Full path to batch script: "%0"
rem remove final backslash: SET mypath=%~dp0 & echo %mypath:~0,-1!
rem Pause&Exit
SET /p COMPANY="Company Name: "
SET /p MODULE="Module Name: "
SET /p CODEPOOL="Code Pool: "
SET /p VERSION="Module Version: "
SET CODEPATH="%ROOTPATH%app\code"
SET MODCOREPATH="%CODEPATH%\%CODEPOOL%\%COMPANY%\%MODULE%"
(SET \n=^
%=DONT REMOVE THIS=%
)
MD %MODCOREPATH%
MD %MODCOREPATH%\etc
SETLOCAL ENABLEDELAYEDEXPANSION
ECHO ^<?xml version="1.0"?^>!\n!^<config^>!\n!%\t%^<modules^>!\n!%\t%%\t%^<%COMPANY%_%MODULE%^>!\n!%\t%%\t%%\t%^<active^>true^</active^>!\n!%\t%%\t%%\t%^<codePool^>local^</codePool^>!\n!%\t%%\t%^</%COMPANY%_%MODULE%^>!\n!%\t%^</modules^>!\n!^</config^>>%ROOTPATH%app\etc\modules\%COMPANY%_%MODULE%.xml
ECHO ^<?xml version="1.0"?^>!\n!^<config^>!\n!%\t%^<modules^>!\n!%\t%%\t%^<%COMPANY%_%MODULE%^>!\n!%\t%%\t%%\t%^<version^>%VERSION%^</version^>!\n!%\t%%\t%^</%COMPANY%_%MODULE%^>!\n!%\t%^</modules^>!\n!%\t%^<global^>!\n!%\t%^</global^>!\n!^</config^>>%MODCOREPATH%\etc\config.xml
ENDLOCAL
SET /P BLOCK=Block (Y/[N])?
IF /I "%BLOCK%" NEQ "N" MD %MODCOREPATH%\Block
SET /P MODEL=Model (Y/[N])?
IF /I "%MODEL%" NEQ "N" MD %MODCOREPATH%\Model
SET /P CONTLR=Controller (Y/[N])?
IF /I "%CONTLR%" NEQ "N" MD %MODCOREPATH%\controllers
SET /P HELPER=Helper (Y/[N])?
IF /I "%HELPER%" NEQ "N" MD %MODCOREPATH%\Helper
SET /P SQL=Data (Y/[N])?
IF /I "%SQL%" NEQ "N" MD %MODCOREPATH%\sql
PAUSE