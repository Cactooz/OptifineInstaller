@echo off

echo. >> InitLog.txt
echo [START] %date% %time% >> InitLog.txt
echo Optifine install with Minecraft built in Java >> InitLog.txt

echo OptiFine install with Minecraft built in Java
echo.

set javapath=C:\Program Files (x86)\Minecraft\runtime\jre-x64\bin\java
set /p optifinefile="OptiFine filename without file ending (.jar): "

echo Defined default java.exe path: "%javapath%" >> InitLog.txt
echo Defined OptiFine filename: %optifinefile%.jar >> InitLog.txt

echo.
echo Executing installation

"%javapath%" -jar %optifinefile%.jar

echo.

:errorcheck

	if %errorlevel% equ 0 (
		echo [SUCCESS] Executed installation successfully with %optifinefile%.jar file
		echo [SUCCESS] Executed installation successfully with %optifinefile%.jar file >> InitLog.txt

		goto exit
	)

	if %errorlevel% equ 1 (
		echo [FAILED] Failed to find %optifinefile%.jar file
		echo [FAILED] Error code: %errorlevel%
		
		echo [FAILED] Failed to find %optifinefile%.jar file  >> InitLog.txt
		echo [FAILED] Error code: %errorlevel% >> InitLog.txt

		goto newfilename
	)

	if "%customjavapathcheck%" equ "true" (
		echo [FAILED] Failed to find java.exe path
		echo [FAILED] Custom java.exe path: "%javapath%"
		echo [FAILED] Error code: %errorlevel%
		
		echo [FAILED] Failed to find java.exe path >> InitLog.txt
		echo [FAILED] Custom java.exe path: "%javapath%" >> InitLog.txt
		echo [FAILED] Error code: %errorlevel% >> InitLog.txt
		
		goto customjavapath
	)
	
	if %errorlevel% equ 3 (
		echo [FAILED] Failed to find java.exe path
		echo [FAILED] Default java.exe path: "%javapath%"
		echo [FAILED] Error code: %errorlevel%
		
		echo [FAILED] Failed to find java.exe path >> InitLog.txt
		echo [FAILED] Default java.exe path: "%javapath%" >> InitLog.txt
		echo [FAILED] Error code: %errorlevel% >> InitLog.txt

		goto customjavapath
	)

	if %errorlevel% neq 0 (
		echo [FAILED] Failed to install %optifinefile%.jar file
		echo [FAILED] Error code: %errorlevel%
		
		echo [FAILED] Failed to install %optifinefile%.jar file  >> InitLog.txt
		echo [FAILED] Error code: %errorlevel% >> InitLog.txt

		goto exit
	)

:customjavapath
	echo.
	
	set /p javapath="Define custom path to java.exe file: "
	set customjavapathcheck=true
	
	echo Defined custom java.exe path: "%javapath%" >> InitLog.txt
	
	echo.
	echo Executing installation with custom Java path
	"%javapath%" -jar %optifinefile%.jar
	
	goto errorcheck

:newfilename
	echo.
	
	set /p optifinefile="OptiFine filename without file ending (.jar): "
	
	echo Defined OptiFine filename: %optifinefile%.jar >> InitLog.txt
	
	echo.
	echo Executing installation
	"%javapath%" -jar %optifinefile%.jar
	
	goto errorcheck

:exit
	echo.
	echo Logged installation in log file InitLog.txt
	
	echo [END] %date% %time% >> InitLog.txt
	
	pause