@echo off
setlocal

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
  set fd="fd --type directory --hidden --no-ignore --exclude .git/ --color never --fixed-strings"
) ELSE (
  set fd="dir . /s/b/a:d-h"
)

for /f "delims=" %%i in ('%fd% ^| %F%') do (
  cd /D %%i
  break
)

