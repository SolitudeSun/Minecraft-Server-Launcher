@echo off
set ReTimes=0
:start
title is starting the server...
@echo server startup software v5.1.6
@echo Created by Golden_Godsun
@echo -----------------------------------------------------------------------------------
@echo.
@echo disclaimer.
@echo users are responsible for any intellectual problems caused by the use of this software
@echo users are responsible for any intellectual problems and consequences caused by the use of this software, and the software is not responsible for them.
@echo use of this software means that the user is aware of the above!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Starting the server now!
@echo Please be patient!
@echo.
@echo -----------------------------------------------------------------------------------
if not exist "%~dp0Config.ini" (goto :1)
for /f "tokens=1,* delims==" %%a in ('findstr "Version=" "Config.ini"') do (set Version=%%~b)
if not "%Version%"=="v5.1.6" (goto :2)
if not exist "%~dp0*.jar" (goto :4)
for /f "tokens=1,* delims==" %%a in ('findstr "Port=" "Config.ini"') do (set AutoPort=%%~b)
if not "%AutoPort%"=="On" (if not "%AutoPort%"=="Off" (goto :3))
if "%AutoPort%"=="Off" (goto :nport)
if exist "%~dp0server.properties" (for /f "tokens=1,* delims==" %%a in ('findstr "server-port=" "server.properties"') do (set Port=%%b)) else (set Port=25565)
:nport
for /f "tokens=1,* delims==" %%a in ('findstr "AutoRestart=" "Config.ini"') do (set AutoRestart=%%~b)
if not "%AutoRestart%"=="On" (if not "%AutoRestart%"=="Off" (goto :3))
if "%AutoRestart%"=="Off" (goto :nrestart)
for /f "tokens=1,* delims==" %%a in ('findstr "LastRestartTime=" "Config.ini"') do (set LaSeconds=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "RestartTime=" "Config.ini"') do (set ReSeconds=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "RestartTimes=" "Config.ini"') do (set ReLimits=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "AutoBackup=" "Config.ini"') do (set AutoBackup=%%~b)
if not "%LaSeconds%"=="On" (if not "%LaSeconds%"=="Off" (goto :3))
if not "%AutoBackup%"=="On" (if not "%AutoBackup%"=="Off" (goto :3))
if "%AutoBackup%"=="Off" (goto :nrestart)
for /f "tokens=1,* delims==" %%a in ('findstr "BackupLevel=" "Config.ini"') do (set BackupLevel=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "BackupPath=" "Config.ini"') do (set BackupWay=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "BackupName=" "Config.ini"') do (set BackupName=%%~b)
if "%BackupWay%"=="" (goto :8)
if not "%BackupLevel%"=="1" (if not "%BackupLevel%"=="9" (if not "%BackupLevel%"=="2" (if not "%BackupLevel%"=="8" (if not "%BackupLevel%"=="3" (if not "%BackupLevel%"=="7" (if not "%BackupLevel%"=="4" (if not "%BackupLevel%"=="6" (if not "%BackupLevel%"=="5" (goto :9)))))))))
:nrestart
for /f "tokens=1,* delims==" %%a in ('findstr "DefaultJava=" "Config.ini"') do (set MainJava=%%~b)
if not "%MainJava%"=="On" (if not "%MainJava%"=="Off" (goto :3))
if "%MainJava%"=="On" (goto :yjava)
for /f "tokens=1,* delims==" %%a in ('findstr "JavaPath=" "Config.ini"') do (set Java=%%~b)
if not exist "%Java%" (goto :6)
:yjava
for /f "tokens=1,* delims==" %%a in ('findstr "AutoCore=" "Config.ini"') do (set AutoCore=%%~b)
if not "%AutoCore%"=="On" (if not "%AutoCore%"=="Off" (goto :3))
if "%AutoCore%"=="On" (goto :ycore)
for /f "tokens=1,* delims==" %%a in ('findstr "CoreName=" "Config.ini"') do (set Core=%%~b)
if not exist "%~dp0%Core%" (goto :5)
:ycore
for /f %%a in ('dir /b *.jar') do (set Core=%%a)
for /f "tokens=1,* delims==" %%a in ('findstr "JVM=" "Config.ini"') do (set JVM=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "Title=" "Config.ini"') do (set Title=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "MaxMemory=" "Config.ini"') do (set MaxRAM=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "MinMemory=" "Config.ini"') do (set MinRAM=%%~b)
set /a Thour=%time:~0,2%
if %Thour% LSS 10 (set Ttime=%date:~5,2%.%date:~8,2%-%time:~1,1%:%time:~3,2%) else (set Ttime=%date:~5,2%.%date:~8,2%-%time:~0,2%:%time:~3,2%)
if "%LaSeconds%"=="On" (if "%AutoRestart%"=="On" (if "%AutoPort%"=="On" (title [%Title%]--RestartTimes=[%ReTimes%]--Port=[%Port%]--LastRestartTime[%Ttime%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Made v5.1.6) else (title [%Title%]--RestartTimes=[%ReTimes%]--LastRestartTime[%Ttime%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Made v5.1.6)) else (if "%AutoPort%"=="On" (title [%Title%]--Port=[%Port%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Made v5.1.6) else (title [%Title%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Made v5.1.6))) else (if "%AutoRestart%"=="On" (if "%AutoPort%"=="On" (title [%Title%]--RestartTimes=[%ReTimes%]--Port=[%Port%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Made v5.1.6) else (title [%Title%]--RestartTimes=[%ReTimes%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Made v5.1.6)) else (if "%AutoPort%"=="On" (title [%Title%]--Port=[%Port%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Made v5.1.6) else (title [%Title%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Made v5.1.6)))
if exist "%~dp0eula.txt" (goto :yeula)
if exist "%~dp0modules.yml" (goto :yeula)
if exist "%~dp0velocity.toml" (goto :yeula)
echo #This End User License Agreement has been automatically written and agreed to using the startup software!>>eula.txt
echo (https://account.mojang.com/documents/minecraft_eula).>>eula.txt
echo #Golden_Godsun production, software version v5.1.6>>eula.txt
echo eula=true>>eula.txt
@echo.
@echo The file "eula.txt" was not detected, it was automatically written and agreed!
@echo.
@echo -----------------------------------------------------------------------------------
:yeula
set Fdate=%date:~0,4%%date:~5,2%%date:~8,2%&set Ftime=%time:~0,2%%time:~3,2%%time:~6,2%
if "%MainJava%"=="Off" (goto :njava)
if exist "%~dp0modules.yml" (goto :B&V)&if exist "%~dp0velocity.toml" (goto :B&V)
java %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %Core% nogui
goto :stop
:B&V
java %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar %Core% nogui
goto :stop
:njava
if exist "%~dp0modules.yml" (goto :JavaB&V)&if exist "%~dp0velocity.toml" (goto :JavaB&V)
"%Java%" %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %Core% nogui
goto :stop
:JavaB&V
"%Java%" %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar %Core% nogui
goto :stop
:stop
set /a Stime=%time:~0,2%%time:~3,2%%time:~6,2%-%Ftime%&set Sdate=%date:~0,4%%date:~5,2%%date:~8,2%
if %Stime% LEQ 2 (if %Fdate% == %Sdate% (goto :10))
set /a ReTimes=%ReTimes%+1
if "%AutoRestart%"=="Off" (goto :exit)
if "%ReTimes%"=="%ReLimits%" (goto :7)
if "%AutoBackup%"=="On" (goto :backup)
:end
@echo -----------------------------------------------------------------------------------
@echo.
@echo Server will restart in %ReSeconds% seconds
@echo.
@echo -----------------------------------------------------------------------------------
timeout -t %ReSeconds% >nul
goto :start
:backup
title Server backup in...
@echo -----------------------------------------------------------------------------------
@echo.
@echo Server is backing up
@echo.
@echo -----------------------------------------------------------------------------------
set /a Bhour=%time:~0,2%
if %Bhour% LSS 10 (set Btime=%time:~1,1%.%time:~3,2%.%time:~6,2%) else (set Btime=%time:~0,2%.%time:~3,2%.%time:~6,2%)
"%AppData%\Server Components\7-Zip\7z.exe" a -t7z "%BackupWay%\%BackupName%-[%date:~0,4%.%date:~5,2%.%date:~8,2%]-[%Btime%].7z" "%~dp0*" -r -mf -mmt -mhc -mhcf -mx%BackupLevel% -ms=200m
title Server backup is complete, restarting...
@echo -----------------------------------------------------------------------------------
@echo.
@echo Server backup completed, restarting...
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
goto :end
:config
echo #The title name of the server software>>Config.ini
echo #Detect the server port number and display it on the header, enter (on or off) >>Config.ini
echo #Detect the server last reboot time and display it on the header, enter (on or off)>>Config.ini
echo Title="Server">>Config.ini
echo Port="On">>Config.ini
echo LastRestartTime="On">>Config.ini
echo.>>Config.ini
echo #Whether to specify the use of a certain path of Java>>Config.ini
echo #For different versions of Java for different versions of servers, if you want to switch the mode, please enter (on or off) (ignore the Java location when on) >>Config.ini
echo #If you don't use the default Java, please enter the Java path manually (e.g.: "C:\Program Files\Zulu\zulu-8\bin\java.exe") >>Config.ini
echo #Whether to add additional JVM parameters for startup (e.g.: "-Dusing.aikars.flags=https://mcflags.emc.gs")>>Config.ini
echo #This software already partially uses aikar's script parameters, please don't add them repeatedly (please leave it blank if you don't understand) >>Config.ini
echo DefaultJava="On">>Config.ini
echo JavaPath="">>Config.ini
echo JVM="">>Config.ini
echo.>>Config.ini
echo #Maximum memory and minimum memory (please fill in the unit M or G) >>Config.ini
echo MaxMemory="2G">>Config.ini
echo MinMemory="2G">>Config.ini
echo.>>Config.ini
echo #Server core auto-detection and manual input>>Config.ini
echo #Whether to automatically identify the core, if you want to switch the mode, please enter (on or off) (ignore the core name when on) >>Config.ini
echo #Detect the core is limited to the current path only a jar file, otherwise it may be an error! (core name can not be with spaces) >>Config.ini
echo #If auto-detection is turned off, please enter the core name manually (e.g.: Server.jar) >>Config.ini
echo AutoCore="On">>Config.ini
echo CoreName="">>Config.ini
echo.>>Config.ini
echo #Server restart mode and time times>>Config.ini
echo #Whether to restart the server after shutdown, if you want to switch the mode, please enter (on or off) (ignore the last two parameters when shutting down and turn off automatic backups) >>Config.ini
echo #If you want to delay the reboot time, then please fill in the number (unit: seconds) >>Config.ini
echo #Reboot times as the name implies reboot several times, if you want to close, fill in the number of reboots 0 can be >>Config.ini
echo AutoRestart="On">>Config.ini
echo RestartTime="0">>Config.ini
echo RestartTimes="0">>Config.ini
echo.>>Config.ini
echo #Automatic backup after server reboot>>Config.ini
echo #Whether to backup after server reboot, please enter (on or off) (ignore the last two parameters when off)>>Config.ini
echo #The backup level refers to the backup speed and size, the smaller the number the faster the compression speed, but the larger the size, available range: (1~9)! >>Config.ini
echo #Backup name refers to the file name of the server backup file, you can customize the name>>Config.ini
echo #If automatic backup is enabled, please enter the backup path (for example: "C:\Users\Administrator\Desktop\Server\Backup") >>Config.ini
echo AutoBackup="Off">>Config.ini
echo BackupLevel="1">>Config.ini
echo BackupName="Server Backup">>Config.ini
echo BackupPath="">>Config.ini
echo.>>Config.ini
echo # Note: The first time you open a service may not have updated the server file, which will lead to errors in detecting port numbers and so on, and then you can run perfectly! >>Config.ini
echo # Note: Each parameter should be set strictly in accordance with the comments, check whether the name or options are set correctly, otherwise the error is not responsible! >>Config.ini
echo.>>Config.ini
echo #Disclaimer: >>Config.ini
echo #The user is responsible for any intellectual problems and consequences caused by the use of this software, and the software is not responsible for any of them! >>Config.ini
echo #The use of this software means that the user is aware of the above content! >>Config.ini
echo #Made by Golden_Godsun (please do not modify the version number) >>Config.ini
echo Version="v5.1.6">>Config.ini
goto :exit
:1
title Tip: The "Config.ini" file is not detected, a new configuration file has been created automatically, please go to "Config.ini" to set the startup parameters!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Tip: The "Config.ini" file is not detected, a new configuration file has been created automatically, please go to "Config.ini" to set the startup parameters!
@echo.
@echo -----------------------------------------------------------------------------------
goto :config
:2
title Warning: Wrong version of settings file, not working properly, new configuration file has been created automatically, please go to reset startup parameters!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: Setup file version error, not working properly, new configuration file created automatically, please go to reset startup parameters!
@echo.
@echo -----------------------------------------------------------------------------------
del /q Config.ini >nul
goto :config
:3
title Warning: Auto-detect setting parameter is wrong, please check if it is on or off!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: Auto-detect setting parameter error, please check if it is on or off!
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:4
title Tip: No open service core jar detected, please copy the core to the directory where this software is located!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Tip: No open service core jar detected, please copy the core to the directory where this software is located!
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:5
title Warning: "%Core%" core name is set incorrectly, please reset the name in "Config.ini"!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: "%Core%" core name is set incorrectly, please reset the name in "Config.ini"!
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:6
title Warning: Java in %Java% path not detected, please reset Java path in "Config.ini"!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: Java in %Java% path not detected, please reset Java path in "Config.ini"!
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:7
title Tip: The set restart limit has reached %ReLimits% and the server has been automatically shut down!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Tip: The set reboot limit has reached %ReLimits% and the server has been automatically shut down!
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:8
title Warning: You have enabled automatic backup, but have not set the path to the automatic backup, please go to "Config.ini" to set the path!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: You have enabled automatic backups, but have not set the path to the automatic backups, please go to "Config.ini" and set the path!
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:9
title Warning: You have set the wrong backup level, it is not in the range of 1-9, please go to "Config.ini" and set the path!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: The backup level you have set is wrong, it is not in the range 1-9, please go to "Config.ini" and set the path!
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:10
title Warning: Server startup exception detected, please check startup parameters, Java configuration environment, or consult others!
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: Server start-up exception detected, server has been stopped automatically!
@echo Please check startup parameters, Java version, Java configuration environment, or ask someone else!
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:exit
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Server is down
@echo Press any key to exit ....
@echo.
@echo -----------------------------------------------------------------------------------
pause >nul
exit