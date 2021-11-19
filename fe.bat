@echo off
setlocal

  rem From https://superuser.com/questions/1118106/can-the-utf-8-code-page-identifier-65001-be-different-on-other-computers/1121076#1121076
  rem capture output of chcp after colon
for /F "tokens=2 delims=:" %%G in ('chcp') do set "_chcp=%%G"
rem strip trailing dots
IF "%_chcp:~-1%"=="." set "_chcp=%_chcp:~0,-1%"

where /q peco
IF ERRORLEVEL 1 (
  where /q fzf
  IF ERRORLEVEL 1 (
    echo "please install either peco or fzf"
    exit 1
  ) ELSE (
    set F=fzf
  )
) ELSE (
  set F=peco
)

where /q fd
IF ERRORLEVEL 1 (
  where /q rg
  IF ERRORLEVEL 1 (
    where /q ag
    IF ERRORLEVEL 1 (
      set fd="dir . /s/b/a:-d-h"
    ) ELSE (
      set fd="ag --files-with-matches --unrestricted --ignore .git/ --nocolor --silent"
    )
  ) ELSE (
    set fd="rg --files --hidden --no-ignore --iglob !.git/ --color never"
  )
) ELSE (
  set fd="fd --type file --hidden --no-ignore --exclude .git/ --color never --fixed-strings"
)

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


for /f "delims=" %%i in ('%fd% ^| %F%') do (
      rem change active code page to UTF-8 and back
  cmd /U /D /c CHCP 65001>NUL & %E% %%i & CHCP %_chcp%>NUL
  break
)

