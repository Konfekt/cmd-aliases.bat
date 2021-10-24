@echo off
where /q less
IF ERRORLEVEL 1 (
  dir /w %*
) ELSE (
  dir /w %* | less -Q -iRXF
)
