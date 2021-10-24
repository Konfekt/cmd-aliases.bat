@echo off
setlocal

    rem From https://superuser.com/questions/1118106/can-the-utf-8-code-page-identifier-65001-be-different-on-other-computers/1121076#1121076
    rem capture output of chcp after colon
for /F "tokens=2 delims=:" %%G in ('chcp') do set "_chcp=%%G"
    rem strip trailing dots
IF "%_chcp:~-1%"=="." set "_chcp=%_chcp:~0,-1%"

where /q rg
IF ERRORLEVEL 1 (
  where /q ag
  IF ERRORLEVEL 1 (
    set s=findstr /spn
  ) ELSE (
    set s=ag --color --heading --numbers --smart-case
  )
) ELSE (
  set s=rg --pretty --smart-case
)

set s=%s% ^%*

  rem change active code page to UTF-8 and back
where /q less
IF ERRORLEVEL 1 (
  cmd /U /D /c CHCP 65001>NUL & %s% & CHCP %_chcp%>NUL
) ELSE (
  cmd /U /D /c CHCP 65001>NUL & %s% | less -Q -iRXF & CHCP %_chcp%>NUL
)

