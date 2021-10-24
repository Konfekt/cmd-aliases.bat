@echo off
IF EXIST "%COMMANDER_PATH%/totalcmd64.exe" (
  start /b "" "%COMMANDER_PATH%/totalcmd64.exe" /O /T /R="%CD%" %*
) ELSE (
  IF EXIST "%COMMANDER_PATH%/totalcmd.exe" (
    start /b "" "%COMMANDER_PATH%/totalcmd.exe" /O /T /R="%CD%" %*
  ) ELSE (
    start /b "%CD%"
  )
)
