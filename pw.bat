@echo off
where /q pwsh
IF ERRORLEVEL 1 (
  where /q powershell
  IF ERRORLEVEL 1 (
    echo "Please install Powershell! Falling back to Cmd..."
    cmd /c cd %CD% %*
  ) ELSE (
  powershell -NoLogo -WorkingDirectory %CD% %*
  )
) ELSE (
  pwsh -NoLogo -WorkingDirectory %CD% %*
)
