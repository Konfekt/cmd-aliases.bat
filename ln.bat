@echo off
setlocal

rem strip surrounding double quotation marks
SET target=%~1
SET link=%~2

rem strip trailing slash
IF "%target:~-1%"=="\" set "target=%target:~0,-1%"
IF "%target:~-1%"=="/" set "target=%target:~0,-1%"

rem extract file or directory name of link from path of target
IF "%link%" == "" (
  call :setfilename %target%
)

rem add back surrounding double quotation marks
set target="%target%"
set link="%link%"

rem MKLINK expects target and link in order inverse to that of LN
IF EXIST %target%\* (
  mklink /J %link% %target%
) ELSE (
  mklink /H %link% %target%
)

:setfilename
SET link=%~nx1
goto :eof

