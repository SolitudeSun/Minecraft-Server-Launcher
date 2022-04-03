@echo off
set ReTimes=0
:1
title Starting up the server ......
@echo                        Server Launcher (English) v2.0.0
@echo                           Produced by Golden_Godsun
@echo -----------------------------------------------------------------------------------
@echo.
@echo                                   Disclaimer.
@echo                    Users are responsible for any legal disputes
@echo              and consequences resulting from the use of this software
@echo              and this software is not responsible for any of the above
@echo           use of this software means that the user is aware of the above!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo                             Starting up the server
@echo                             Please wait patiently!
@echo.
@echo -----------------------------------------------------------------------------------

if not exist "%~dp0Config.ini" (goto :2)
for /f "tokens=1,* delims==" %%a in ('findstr "Software version=" "Config.ini"') do (set Version=%%~b)
if not "%Version%"=="v2.0.0" (goto :1)
if not exist "%~dp0*.jar" (goto :4)

for /f "tokens=1,* delims==" %%a in ('findstr "Port=" "Config.ini"') do (set AutoPort=%%~b)
if not "%AutoPort%"=="On" (if not "%AutoPort%"=="Off" (goto :3))
if "%AutoPort%"=="Off" (goto :noport)
if exist "%~dp0server.properties" (for /f "tokens=1,* delims==" %%a in ('findstr "server-port=" "server.properties"') do (set Port=%%b)) else (set Port=25565)
:noport

for /f "tokens=1,* delims==" %%a in ('findstr "auto reboot=" "Config.ini"') do (set AutoRestart=%%~b)
if not "%AutoRestart%"=="On" (if not "%AutoRestart%"=="Off" (goto :3))
if "%AutoRestart%"=="Off" (goto :norestart)
for /f "tokens=1,* delims==" %%a in ('findstr "reboot time=" "Config.ini"') do (set ReSeconds=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "reboot times=" "Config.ini"') do (set ReLimits=%%~b)
:norestart

for /f "tokens=1,* delims==" %%a in ('findstr "Auto-detect Java=" "Config.ini"') do (set AutoJava=%%~b)
if not "%AutoJava%"=="On" (if not "%AutoJava%"=="Off" (goto :3))
if "%AutoJava%"=="On" (goto :havejava)
for /f "tokens=1,* delims==" %%a in ('findstr "Java location=" "Config.ini"') do (set Java=%%~b)
if not exist "%Java%" (goto :6)
:havejava

for /f "tokens=1,* delims==" %%a in ('findstr "auto-detect core=" "Config.ini"') do (set AutoCore=%%~b)
if not "%AutoCore%"=="On" (if not "%AutoCore%"=="Off" (goto :3))
if "%AutoCore%"=="On" (goto :havecore)
for /f "tokens=1,* delims==" %%a in ('findstr "core name=" "Config.ini"') do (set Core=%%~b)
if not exist "%~dp0%Core%" (goto :5)
:havecore

for /f %%a in ('dir /b *.jar') do (set Core=%%a)
for /f "tokens=1,* delims==" %%a in ('findstr "Title=" "Config.ini"') do (set Title=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "Max memory=" "Config.ini"') do (set MaxRAM=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "Min memory=" "Config.ini"') do (set MinRAM=%%~b)

if "%AutoPort%"=="Off" (goto :noptitle)
if "%AutoRestart%"=="On" (title [%Title%]--Restart[%ReTimes%]times--Port=[%Port%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Production v2.0.0) else (title [%Title%]--Port=[%Port%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Production v2.0.0)
goto :titleend
:noptitle
if "%AutoRestart%"=="On" (title [%Title%]--Restart[%ReTimes%]times--Memory=[%MinRAM%/%MaxRAM%]-- Golden_Godsun Production v2.0.0) else (title [%Title%]--Memory=[%MinRAM%/%MaxRAM%]--Golden_Godsun Production v2.0.0)
:titleend

if exist "%~dp0eula.txt" (goto :haveeula)
if exist "%~dp0modules.yml" (goto :haveeula)
echo #This End User License Agreement has been automatically written and agreed to using the startup software!>>eula.txt
echo (https://account.mojang.com/documents/minecraft_eula).>>eula.txt
echo #Golden_Godsun production, software version v2.0.0>>eula.txt
echo eula=true>>eula.txt
@echo.
@echo      The file "eula.txt" is not detected, it is automatically written and agreed!
@echo.
@echo -----------------------------------------------------------------------------------
:haveeula

if "%AutoJava%"=="on" (goto :noserverjava)
if exist "%~dp0modules.yml" (goto :bungee)
java -server -XX:+UseCompressedOops -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %Core% nogui
goto :stop
:bungee
java -server -XX:+UseCompressedOops -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar %Core% nogui
goto :stop
:noserverjava
if exist "%~dp0modules.yml" (goto :javabungee)
"%Java%" -server -XX:+UseCompressedOops -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %Core% nogui
goto :stop
:javabungee
"%Java%" -server -XX:+UseCompressedOops -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar %Core% nogui
goto :stop

:stop
set /A ReTimes=%ReTimes%+1
if "%AutoRestart%"=="Off" (goto :end)
if "%ReTimes%"=="%ReLimits%" (goto :7)
@echo -----------------------------------------------------------------------------------
@echo.
@echo                    The server will restart after %ReSeconds% seconds
@echo.
@echo -----------------------------------------------------------------------------------
timeout -t %ReSeconds% >nul
goto :start

:config
echo #The title name of the server software>>Config.ini
echo #Detect the server port number and display it on the title, enter it (on or off) >>Config.ini
echo Title="Server">>Config.ini
echo Port="On">>Config.ini
echo.>>Config.ini
echo #Whether to specify the use of a path to Java>>Config.ini
echo #Apply to different versions of Java for different versions of servers>>Config.ini
echo #If you want to switch the mode, enter (On or Off) (ignore Java location when off)>>Config.ini
echo #If you turn off auto-setup Java, please enter the Java location manually (e.g.: C:\Program Files\Zulu\zulu-8\bin\java.exe)>>Config.ini
echo Auto-detect Java="On">>Config.ini
echo Java location="">>Config.ini
echo.>>Config.ini
echo #Maximum memory and minimum memory (please fill in the unit M or G) >> Config.ini
echo Max memory="2G">>Config.ini
echo min memory="2G">>Config.ini
echo.>>Config.ini
echo #Server core auto-detection and manual input>>Config.ini
echo #Whether to automatically identify the core, if you want to switch the mode, please enter (On or Off) (ignore the core name when turned on)>>Config.ini
echo #Detect core is limited to the current path only a jar file, otherwise it may be an error! (core name can not be with spaces) >>Config.ini
echo #If auto-detection is turned off, please enter the core name manually (e.g.: Server.jar) >>Config.ini
echo auto-detect core="On">>Config.ini
echo core name="">>Config.ini
echo.>>Config.ini
echo #Server restart mode and time times>>Config.ini
echo #Whether to restart the server after shutdown, if you want to switch the mode, enter (On or Off) (ignore the last two parameters when shutting down)>>Config.ini
echo #If you want to delay restart time, then please fill in the number (unit: seconds) >> Config.ini
echo #Reboot times as the name implies reboot several times, if you want to turn off, fill in the number of reboots 0 can >> Config.ini
echo auto reboot="On">>Config.ini
echo reboot time="0">>Config.ini
echo reboot times="0">>Config.ini
echo.>>Config.ini
echo #Note: The first time you start the service may not have updated the server files, which will lead to errors in detecting port numbers and so on, and then you can run perfectly! >>Config.ini
echo #Note: Each parameter please set strictly in accordance with the comments, check whether the name or option is set correctly, otherwise the error is not responsible! >>Config.ini
echo.>>Config.ini
echo #Disclaimer: >>Config.ini
echo #The user is responsible for any legal disputes and consequences caused by the use of this software, the software is not responsible! >>Config.ini
echo #The use of this software means that the user is aware of the above content! >>Config.ini
echo #Golden_Godsun production (please do not modify the version number) >>Config.ini
echo Software version="v2.0.0">>Config.ini
goto :end
:1
title Warning: Wrong version of settings file, not working properly, new configuration file has been created automatically, please go to reset startup parameters!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: Setup file version error, not working properly, new configuration file created automatically, please go to reset startup parameters!
@echo.
@echo -----------------------------------------------------------------------------------
del /q Config.ini >nul
goto :config
:2
title Warning: "Config.ini" file not detected, new configuration file created automatically, please go to "Config.ini" to set startup parameters!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: No "Config.ini" file detected, new configuration file created automatically, please go to "Config.ini" to set startup parameters!
@echo.
@echo -----------------------------------------------------------------------------------
goto :config
:3
title Warning: Auto-detect setting parameter error, please check if it is On or Off!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: Auto-detect setting parameter error, please check if it is On or Off!
@echo.
@echo -----------------------------------------------------------------------------------
goto :end
:4
title Warning: no open service core jar detected, please copy the core to the directory where this software is located!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: No open service core jar detected, please copy the core to the directory where this software is located!
@echo.
@echo -----------------------------------------------------------------------------------
goto :end
:5
title Warning: "%Core%" core name is set incorrectly, please reset the name in "Config.ini"!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: "%Core%" core name is set incorrectly, please reset the name in "Config.ini"!
@echo.
@echo -----------------------------------------------------------------------------------
goto :end
:6
title Warning: Java in %Java% path is not detected, please reset the Java path in "Config.ini"!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Warning: Java in %Java% path is not detected, please reset Java path in "Config.ini"!
@echo.
@echo -----------------------------------------------------------------------------------
goto :end
:7
title Notification: The set restart limit has reached %ReLimits% and the server has been automatically shut down!
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo Notification: The set reboot limit has reached %ReLimits% and the server has been automatically shut down!
@echo.
@echo -----------------------------------------------------------------------------------
goto :end

Translated with www.DeepL.com/Translator (free version)

:end
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo                              The server is down
@echo                           Press any key to exit ....
@echo.
@echo -----------------------------------------------------------------------------------
pause>nul
exit