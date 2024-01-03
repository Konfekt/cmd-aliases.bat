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
  where /q rg
  IF ERRORLEVEL 1 (
    where /q ugrep
    IF ERRORLEVEL 1 (
      set fd="dir . /s/b/a:-d-h"
    ) ELSE (
      set fd="ugrep -R --files --hidden --smart-case --exclude-dir=.git --no-messages --"
    )
  ) ELSE (
    set fd="rg --files --hidden --no-ignore --iglob !.git/ --color=never --no-messages --"
  )
) ELSE (
  set fd="fd --type file --hidden --no-ignore --exclude .git/ --color never --fixed-strings"
)

for /f "delims=" %%i in ('%fd% ^| %F%') do (
  start /b ./"%%i"
  break
)

