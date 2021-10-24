@echo off
setlocal

rem SET PATH=%ProgramFiles%\Git\usr\bin;%UserProfile%\scoop\apps\git\current\usr\bin;%PATH%
rem tig.exe %*

set CWD=%cd%

IF EXIST "%ProgramFiles%\Git\usr\bin\" (
  PUSHD %ProgramFiles%\Git\usr\bin
    tig.exe -C %CWD% %*
  POPD
) ELSE (
  IF EXIST "%UserProfile%\scoop\apps\git\current\usr\bin\" (
    PUSHD %UserProfile%\scoop\apps\git\current\usr\bin
      tig.exe -C %CWD% %*
    POPD
  ) ELSE (
    where /q tig.exe
    IF ERRORLEVEL 1 (
      echo "Could not find tig.exe!"
      EXIT 1
    ) ELSE (
      tig.exe -C %CWD% %*
    )
  )
)
