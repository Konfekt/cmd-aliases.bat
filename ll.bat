@echo off
where /q less
IF ERRORLEVEL 1 (
  dir %*
) ELSE (
  dir %* | less -Q -iRXF
)
