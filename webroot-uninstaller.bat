@ECHO off
ECHO ##########################
ECHO    Keith Patton Feb 2018
ECHO:
ECHO ##########################
ECHO:
 
:: Check Admin permissions
ECHO:
ECHO ## Administrative permissions required. Checking permissions...
 
GOTO :PERMS
 
:PERMS
    openfiles > NUL 2>&1
    IF %errorLevel% == 0 (
        ECHO PERMISSIONS OK
        ECHO:
        GOTO :PERMSGOOD
    ) ELSE (
        ECHO PERMISSIONS DENIED
        ECHO !Please run as administrator!
        ECHO:
        GOTO :PERMSBAD
    )
 
:PERMSGOOD
 
SET @webroot="%PROGRAMFILES(X86)%\Webroot\WRSA.exe"
 
:: Check for Webroot executable
ECHO:
ECHO:
ECHO ## CHECKING FOR WRSA.EXE
ECHO ## YOU HAVE 10 SECONDS TO CANCEL...
TIMEOUT /T 10 /NOBREAK
 
IF EXIST %@webroot% (
    ECHO:
    ECHO:
    ECHO ## WRSA.EXE FOUND!
    ECHO ## UNINSTALLING WEBROOT...
    ECHO:
    %@webroot% -uninstall
) ELSE (
    ECHO:
    ECHO:
    ECHO ## WRSA.EXE NOT FOUND - IS THE PROGRAM ACTUALLY INSTALLED?
    ECHO ## Path should be %@webroot%
    ECHO:
)
 
:PERMSBAD
 
PAUSE
