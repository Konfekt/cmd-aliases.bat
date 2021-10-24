@echo off
setlocal

mkdir %*

call :lastarg %*
cd %LAST_ARG%

goto :eof

  rem From https://stackoverflow.com/questions/5805181/get-last-command-line-argument-in-windows-batch-file
:lastarg
  set "LAST_ARG=%~1"
  shift
  if not "%~1"=="" goto lastarg
goto :eof
