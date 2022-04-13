@echo off

rem SETLOCAL ENABLEDELAYEDEXPANSION
rem From https://stackoverflow.com/questions/562038/escaping-double-quotes-in-batch-script/31413730#31413730
where /q trash.exe
IF ERRORLEVEL 1 (
  where /q pwsh.exe
  IF ERRORLEVEL 1 (
    powershell.exe -NoProfile -Command "Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile('%~f1','OnlyErrorDialogs','SendToRecycleBin')"
  ) ELSE (
    pwsh.exe -NoProfile -Command "Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile('%~f1','OnlyErrorDialogs','SendToRecycleBin')"
  )
) ELSE (
  trash.exe %*
)
