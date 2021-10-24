@echo off
SETLOCAL ENABLEEXTENSIONS

IF DEFINED PAGER (
  IF EXIST %PAGER% (
    SET P=%PAGER%
  ) ELSE (
    where /q %PAGER%
    IF NOT ERRORLEVEL 1 (
      SET P=%PAGER%
    )
  )
)
IF NOT DEFINED P (
  where /q less
  IF ERRORLEVEL 1 (
    SET P=more
  ) ELSE (
    SET P=less -Q -iRXF
  )
)

%P% %*

