@echo off

where /q aria2c
IF ERRORLEVEL 1 (
    where /q curl
    IF ERRORLEVEL 1 (
        curl -L -O -# %*
    ) ELSE (
        ECHO Please install either aria2c or curl! Exiting...
        EXIT /B
    )
) ELSE (
    aria2c %*
)
