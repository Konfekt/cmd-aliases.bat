@ECHO OFF
SETLOCAL

CALL :SKIPLASTTWOARGS ALLBUTLASTTWO_ARGS %*
IF "%ALLBUTLASTTWO_ARGS%"=="~1" SET ALLBUTLASTTWO_ARGS=

call :PENULTIMATE_ARG %*
SET FROM_FOLDER=%PENULTIMATE_ARG%
call :ULTIMATE_ARG %*
SET TO_FOLDER=%ULTIMATE_ARG%

call :DOS2UNIX %FROM_FOLDER% FROM_FOLDER_UNIX
call :DOS2UNIX %TO_FOLDER% TO_FOLDER_UNIX

SET RSYNC_ARGS=--archive --hard-links --executability --one-file-system --compress --delete --modify-window=1 --human-readable --info=stats1,progress2
rsync %RSYNC_ARGS% %ALLBUTLASTTWO_ARGS% %FROM_FOLDER_UNIX% %TO_FOLDER_UNIX%

rem {{{ HELPER FUNCTIONS

:PENULTIMATE_ARG
set "PENULTIMATE_ARG=%~f1"
shift
if not "%~2"=="" goto PENULTIMATE_ARG
goto :EOF

:ULTIMATE_ARG
set "ULTIMATE_ARG=%~f1"
shift
if not "%~1"=="" goto ULTIMATE_ARG
goto :EOF

:DOS2UNIX
SET DIR=%~1

SET UNIXSLASHDIR=%DIR:\=/%
SET UNIXDIR=/cygdrive/%UNIXSLASHDIR::=%

SET %~2=%UNIXDIR%
goto :EOF

rem From https://stackoverflow.com/a/5807218/7485823
rem Return all but last two args in variable given in %1
:SKIPLASTTWOARGS returnvar args ...
    SETLOCAL
        SET $return=%1
        SET SKIP_LAST_ARG=
        SHIFT
    :skiplasttwoargs_2
        IF NOT "%~3"=="" SET "SKIP_LAST_ARG=%SKIP_LAST_ARG% %1"
        SHIFT
        IF NOT "%~2"=="" GOTO skiplasttwoargs_2
    ENDLOCAL&CALL SET "%$return%=%SKIP_LAST_ARG:~1%"
GOTO :EOF

rem }}}

:: ex: set foldmethod=marker: 
