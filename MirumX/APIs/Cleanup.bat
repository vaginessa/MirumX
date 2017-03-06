@echo off%@%
goto :MirumX.API

This API cleans temporary files generated by MirumX

USAGE:
	
	Cleanup

:MirumX.API
:: Delete temporary files generated by API.FileSegment
	(for /f "tokens=*" %%a in ('dir /s/b *.tmp') do (del %%a))>nul 2>&1
	set "subst="
	for /f "tokens=*" %%a in ('subst^|findstr ff393560') do (set "subst=%%a")
	if defined subst (subst /d %subst:~0,2%)
:: Delete temporary file generated by API.FileSegment
	if exist "APIs\timer.txt" (del APIs\timer.txt >nul 2>&1)