@echo off
SETLOCAL ENABLEEXTENSIONS

rem From https://superuser.com/questions/1118106/can-the-utf-8-code-page-identifier-65001-be-different-on-other-computers/1121076#1121076
rem capture output of chcp after colon
for /F "tokens=2 delims=:" %%G in ('chcp') do set "_chcp=%%G"
rem strip trailing dots
IF "%_chcp:~-1%"=="." set "_chcp=%_chcp:~0,-1%"

IF DEFINED EDITOR (
  IF EXIST "%EDITOR%" (
    SET E=%EDITOR%
  ) ELSE (
    where /q %EDITOR%
    IF NOT ERRORLEVEL 1 (
      SET E=%EDITOR%
    )
  )
)
IF NOT DEFINED E (
  where /q vim
  IF ERRORLEVEL 1 (
    SET E=start /b notepad
  ) ELSE (
    SET E=vim
  )
)

rem change active code page to UTF-8 and back
cmd /U /D /c CHCP 65001>NUL & %E% %* & CHCP %_chcp%>NUL
