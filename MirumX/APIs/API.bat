@echo off%@%
goto :MirumXAPI

This API allows easier debugging of MirumX

:MirumXAPI
if "%~1"=="" goto :EOF
set "echo=<nul set /p ="
:: Below runs before the API has executed

if "%debug%"=="on" (
	:: Set the window size big enough to read text
	mode|findstr 9988>nul||mode con: cols=9988 lines=9988
	if "%helpDebug%"=="off" (
		%echo% [API: Loading '%~1']&echo.
	) else (
		%echo% [API: Press any key to load '%~1'] &pause >nul&%echo%[LOADING]&echo.
	)
)

call "%~dp0"%*

:: Below runs after the API has been successfully executed
if "%debug%"=="on" (
	:: Set the window size big enough to read text
	mode|findstr 9988>nul||mode con: cols=9988 lines=9988
	if "%helpDebug%"=="off" (
		%echo% [API: Unloaded '%~1' successfully]&echo.
	) else (
		%echo% [API: Unloaded '%~1' successfully, press any key] &pause >nul&%echo%[LOADING]&echo.
	)
)