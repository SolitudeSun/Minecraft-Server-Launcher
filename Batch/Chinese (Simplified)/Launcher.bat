@echo off
set ReTimes=0
:start
title 正在启动服务器...
@echo                             服务器启动软件v5.2.0
@echo                               Golden_Godsun制作
@echo -----------------------------------------------------------------------------------
@echo.
@echo                                   免责声明：
@echo                     用户若因使用本软件而导致的任何智力问题
@echo                     及后果均由自己负责，本软件不负任何责任
@echo                     使用本软件即代表用户已知晓以上内容！！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo                                正在启动服务器
@echo                                  请耐心等待！
@echo.
@echo -----------------------------------------------------------------------------------
if not exist "%~dp0设置.ini" (goto :1)
for /f "tokens=1,* delims==" %%a in ('findstr "软件版本=" "设置.ini"') do (set Version=%%~b)
if not "%Version%"=="v5.2.0" (goto :2)
if not exist "%~dp0*.jar" (goto :4)
for /f "tokens=1,* delims==" %%a in ('findstr "检测端口号=" "设置.ini"') do (set AutoPort=%%~b)
if not "%AutoPort%"=="开" (if not "%AutoPort%"=="关" (goto :3))
if "%AutoPort%"=="关" (goto :nport)
if exist "%~dp0server.properties" (for /f "tokens=1,* delims==" %%a in ('findstr "server-port=" "server.properties"') do (set Port=%%b)) else (set Port=25565)
:nport
for /f "tokens=1,* delims==" %%a in ('findstr "自动重启=" "设置.ini"') do (set AutoRestart=%%~b)
if not "%AutoRestart%"=="开" (if not "%AutoRestart%"=="关" (goto :3))
if "%AutoRestart%"=="关" (goto :nrestart)
for /f "tokens=1,* delims==" %%a in ('findstr "最后重启时间=" "设置.ini"') do (set LaSeconds=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "重启时间=" "设置.ini"') do (set ReSeconds=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "重启次数=" "设置.ini"') do (set ReLimits=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "自动备份=" "设置.ini"') do (set AutoBackup=%%~b)
if not "%LaSeconds%"=="开" (if not "%LaSeconds%"=="关" (goto :3))
if not "%AutoBackup%"=="开" (if not "%AutoBackup%"=="关" (goto :3))
if "%AutoBackup%"=="关" (goto :nrestart)
for /f "tokens=1,* delims==" %%a in ('findstr "备份等级=" "设置.ini"') do (set BackupLevel=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "备份路径=" "设置.ini"') do (set BackupWay=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "备份名称=" "设置.ini"') do (set BackupName=%%~b)
if "%BackupWay%"=="" (goto :8)
if not "%BackupLevel%"=="1" (if not "%BackupLevel%"=="9" (if not "%BackupLevel%"=="2" (if not "%BackupLevel%"=="8" (if not "%BackupLevel%"=="3" (if not "%BackupLevel%"=="7" (if not "%BackupLevel%"=="4" (if not "%BackupLevel%"=="6" (if not "%BackupLevel%"=="5" (goto :9)))))))))
:nrestart
for /f "tokens=1,* delims==" %%a in ('findstr "使用默认Java=" "设置.ini"') do (set MainJava=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "自动选择JVM" "设置.ini"') do (set AutoJVM=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "自定义JVM参数=" "设置.ini"') do (set JVM=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "自定义额外参数=" "设置.ini"') do (set OJVM=%%~b)
if not "%MainJava%"=="开" (if not "%MainJava%"=="关" (goto :3))
if not "%AutoJVM%"=="开" (if not "%AutoJVM%"=="关" (goto :3))
if "%MainJava%"=="开" (goto :yjava)
for /f "tokens=1,* delims==" %%a in ('findstr "Java路径=" "设置.ini"') do (set Java=%%~b)
if not exist "%Java%" (goto :6)
:yjava
for /f "tokens=1,* delims==" %%a in ('findstr "自动检测核心=" "设置.ini"') do (set AutoCore=%%~b)
if not "%AutoCore%"=="开" (if not "%AutoCore%"=="关" (goto :3))
if "%AutoCore%"=="开" (goto :ycore)
for /f "tokens=1,* delims==" %%a in ('findstr "核心名称=" "设置.ini"') do (set Core=%%~b)
if not exist "%~dp0%Core%" (goto :5)
:ycore
for /f %%a in ('dir /b *.jar') do (set Core=%%a)
for /f "tokens=1,* delims==" %%a in ('findstr "标题=" "设置.ini"') do (set Title=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "最大内存=" "设置.ini"') do (set MaxRAM=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "最小内存=" "设置.ini"') do (set MinRAM=%%~b)
set /a Thour=%time:~0,2%
if %Thour% LSS 10 (set Ttime=%date:~5,2%.%date:~8,2%-%time:~1,1%:%time:~3,2%) else (set Ttime=%date:~5,2%.%date:~8,2%-%time:~0,2%:%time:~3,2%)
if "%LaSeconds%"=="开" (if "%AutoRestart%"=="开" (if "%AutoPort%"=="开" (title [%Title%]--重启[%ReTimes%]次--端口=[%Port%]--最后重启时间[%Ttime%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.2.0) else (title [%Title%]--重启[%ReTimes%]次--最后重启时间[%Ttime%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.2.0)) else (if "%AutoPort%"=="开" (title [%Title%]--端口=[%Port%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.2.0) else (title [%Title%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.2.0))) else (if "%AutoRestart%"=="开" (if "%AutoPort%"=="开" (title [%Title%]--重启[%ReTimes%]次--端口=[%Port%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.2.0) else (title [%Title%]--重启[%ReTimes%]次--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.2.0)) else (if "%AutoPort%"=="开" (title [%Title%]--端口=[%Port%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.2.0) else (title [%Title%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.2.0)))
if exist "%~dp0eula.txt" (goto :yeula)
if exist "%~dp0modules.yml" (goto :yeula)
if exist "%~dp0velocity.toml" (goto :yeula)
echo #This End User License Agreement has been automatically written and agreed to using the startup software!>>eula.txt
echo (https://account.mojang.com/documents/minecraft_eula).>>eula.txt
echo #Golden_Godsun production, software version v5.2.0>>eula.txt
echo eula=true>>eula.txt
@echo.
@echo                   未检测到'eula.txt'文件，已自动写入并同意！
@echo.
@echo -----------------------------------------------------------------------------------
:yeula
set Fdate=%date:~0,4%%date:~5,2%%date:~8,2%&set Ftime=%time:~0,2%%time:~3,2%%time:~6,2%
if "%AutoJVM%"=="关" (goto :njvm)
if "%MainJava%"=="关" (goto :njava)
if not exist "%~dp0server.properties" (goto :B&V)
java %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %Core% %OJVM% nogui
goto :stop
:B&V
java %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar %Core% %OJVM%
goto :stop
:njava
if not exist "%~dp0server.properties" (goto :JavaB&V)
"%Java%" %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar %Core% %OJVM% nogui
goto :stop
:JavaB&V
"%Java%" %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -jar %Core% %OJVM%
goto :stop
:njvm
if "%MainJava%"=="关" (goto :njvmjava)
java %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -jar %Core% %OJVM% nogui
goto :stop
:njvmjava
"%Java%" %JVM% -Xms%MinRAM% -Xmx%MaxRAM% -jar %Core% %OJVM% nogui
goto :stop
:stop
set /a Stime=%time:~0,2%%time:~3,2%%time:~6,2%-%Ftime%&set Sdate=%date:~0,4%%date:~5,2%%date:~8,2%
if %Stime% LEQ 2 (if %Fdate% == %Sdate% (goto :10))
set /a ReTimes=%ReTimes%+1
if "%AutoRestart%"=="关" (goto :exit)
if "%ReTimes%"=="%ReLimits%" (goto :7)
if "%AutoBackup%"=="开" (goto :backup)
:end
@echo -----------------------------------------------------------------------------------
@echo.
@echo                             服务器将在%ReSeconds%秒后重启
@echo.
@echo -----------------------------------------------------------------------------------
timeout -t %ReSeconds% >nul
goto :start
:backup
title 服务器备份中...
@echo -----------------------------------------------------------------------------------
@echo.
@echo                              服务器正在进行备份
@echo.
@echo -----------------------------------------------------------------------------------
set /a Bhour=%time:~0,2%
if %Bhour% LSS 10 (set Btime=%time:~1,1%.%time:~3,2%.%time:~6,2%) else (set Btime=%time:~0,2%.%time:~3,2%.%time:~6,2%)
"%AppData%\Server Components\7-Zip\7z.exe" a -t7z "%BackupWay%\%BackupName%-[%date:~0,4%.%date:~5,2%.%date:~8,2%]-[%Btime%].7z" "%~dp0*" -r -mf -mmt -mhc -mhcf -mx%BackupLevel% -ms=200m
title 服务器备份已完成，正在重启...
@echo -----------------------------------------------------------------------------------
@echo.
@echo                          服务器备份已完成，正在重启...
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
goto :end
:config
echo #服务器软件的标题名称>>设置.ini
echo #检测服务器端口号并显示在标题上，输入（开或关）>>设置.ini
echo #检测服务器最后重启的时间并显示在标题上，输入（开或关）>>设置.ini
echo 标题="服务器">>设置.ini
echo 检测端口号="开">>设置.ini
echo 最后重启时间="开">>设置.ini
echo.>>设置.ini
echo #是否指定使用某个路径的Java>>设置.ini
echo #适用于不同版本的服务器用不同版本的Java，如果想切换模式，请输入（开或关）（开启时无视Java位置）>>设置.ini
echo #如果不使用默认Java，请手动输入Java路径（例如: "C:\Program Files\Zulu\zulu-8\bin\java.exe"）>>设置.ini
echo 使用默认Java="开">>设置.ini
echo Java路径="">>设置.ini
echo.>>设置.ini
echo #本软件内置优化的aikars参数和BC参数（注意: 如果设定了自定义的参数会自动合并在内置优化的参数后面）>>设置.ini
echo #关闭自动选择JVM则会使用默认启动服务器所必备的JVM，其他优化参数请自行考虑并添加在下面两个选项中！>>设置.ini
echo #自定义JVM参数为启动Minecraft时使用的额外JVM参数，在没有确定把握的情况下请不要尝试修改>>设置.ini
echo #自定义额外参数的文本框中的内容将会被直接拼合在启动参数的末尾（例如: "--forceUpgrade"）>>设置.ini
echo 自动选择JVM="开">>设置.ini
echo 自定义JVM参数="">>设置.ini
echo 自定义额外参数="">>设置.ini
echo.>>设置.ini
echo #最大内存及最小内存（请填写单位M或G）>>设置.ini
echo 最大内存="2G">>设置.ini
echo 最小内存="2G">>设置.ini
echo.>>设置.ini
echo #服务器核心自动检测及手动输入>>设置.ini
echo #是否自动识别核心，如果想切换模式，请输入（开或关）（开启时无视核心名称）>>设置.ini
echo #检测核心仅限于当前路径只有一个jar文件，否则可能出错！（核心名称不能带空格）>>设置.ini
echo #如果关闭自动检测，请手动输入核心名称（例如: Server.jar）>>设置.ini
echo 自动检测核心="开">>设置.ini
echo 核心名称="">>设置.ini
echo.>>设置.ini
echo #服务器重启模式及时间次数>>设置.ini
echo #服务器关闭后是否重启，如果想切换模式，请输入（开或关）（关闭时无视后两个参数，并关闭自动备份）>>设置.ini
echo #如果想延迟重启时间，那么请填写数字（单位: 秒）>>设置.ini
echo #重启次数顾名思义重启几次，如果想关闭，在重启次数填写0即可>>设置.ini
echo 自动重启="开">>设置.ini
echo 重启时间="0">>设置.ini
echo 重启次数="0">>设置.ini
echo.>>设置.ini
echo #服务器重启后自动备份>>设置.ini
echo #是否在服务器重启后进行备份，请输入（开或关）（关闭时无视后两个参数）>>设置.ini
echo #备份等级指备份速度及大小，数字越小压缩速度越快，但体积越大，可使用范围: （1~9）！>>设置.ini
echo #备份名称指服务器备份文件的文件名，可以自定义名称>>设置.ini
echo #如果开启自动备份，请输入备份路径（例如: "C:\Users\Administrator\Desktop\Server\备份"）>>设置.ini
echo 自动备份="关">>设置.ini
echo 备份等级="1">>设置.ini
echo 备份名称="服务器备份">>设置.ini
echo 备份路径="">>设置.ini
echo.>>设置.ini
echo #注：软件更新下载地址为：https://github.com/SolitudeSun/Minecraft-Server-Launcher>>设置.ini
echo #注：每个参数请严格按照注释进行设置，检查名字或选项是否设置正确，否则报错概不负责！>>设置.ini
echo.>>设置.ini
echo #免责声明：>>设置.ini
echo #用户若因使用本软件而导致的任何智力问题及后果，均由自己负责，本软件不负任何责任！>>设置.ini
echo #使用本软件即代表用户已知晓以上内容！>>设置.ini
echo #Golden_Godsun制作（请勿修改版本号）>>设置.ini
echo 软件版本="v5.2.0">>设置.ini
goto :exit
:1
title 提示：未检测到'设置.ini'文件，已自动创建新的配置文件，请前往'设置.ini'设置启动参数！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 提示：未检测到'设置.ini'文件，已自动创建新的配置文件，请前往'设置.ini'设置启动参数！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("提示：未检测到'设置.ini'文件，已自动创建新的配置文件，请前往'设置.ini'设置启动参数！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :config
:2
title 警告：设置文件版本错误，无法正常运行，已自动创建新的配置文件，请前往重设启动参数！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 警告：设置文件版本错误，无法正常运行，已自动创建新的配置文件，请前往重设启动参数！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("警告：设置文件版本错误，无法正常运行，已自动创建新的配置文件，请前往重设启动参数！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
del /q 设置.ini >nul
goto :config
:3
title 警告：自动检测设置参数错误，请检查是否为开或关！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo                警告：自动检测设置参数错误，请检查是否为开或关！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("警告：自动检测设置参数错误，请检查是否为开或关！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :exit
:4
title 提示：未检测到开服核心jar，请将核心复制到此软件所在目录！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo           提示：未检测到开服核心jar，请将核心复制到此软件所在目录！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("提示：未检测到开服核心jar，请将核心复制到此软件所在目录！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :exit
:5
title 警告：'%Core%'核心名称设置错误，请在'设置.ini'中重新设置名称！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo         警告：'%Core%'核心名称设置错误，请在'设置.ini'中重新设置名称！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("警告：'%Core%'核心名称设置错误，请在'设置.ini'中重新设置名称！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :exit
:6
title 警告：未检测到%Java%路径下的Java，请在'设置.ini'中重新设置Java路径！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 警告：未检测到%Java%路径下的Java，请在'设置.ini'中重新设置Java路径！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("警告：未检测到%Java%路径下的Java，请在'设置.ini'中重新设置Java路径！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :exit
:7
title 提示：设置的重启次数限制已达到%ReLimits%次，已自动关闭服务器！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo               提示：设置的重启次数限制已达到%ReLimits%次，已自动关闭服务器！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("提示：设置的重启次数限制已达到%ReLimits%次，已自动关闭服务器！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :exit
:8
title 警告：您开启了自动备份，但未设置自动备份的路径，请前往'设置.ini'中设置路径！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 警告：您开启了自动备份，但未设置自动备份的路径，请前往'设置.ini'中设置路径！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("警告：您开启了自动备份，但未设置自动备份的路径，请前往'设置.ini'中设置路径！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :exit
:9
title 警告：您设置的备份等级有错误，不在1-9的范围中，请前往'设置.ini'中设置路径！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 警告：您设置的备份等级有错误，不在1-9的范围中，请前往'设置.ini'中设置路径！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("警告：您设置的备份等级有错误，不在1-9的范围中，请前往'设置.ini'中设置路径！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :exit
:10
title 警告：检测到服务器启动异常，请检查启动参数，Java配置环境，或者咨询其他人！
@echo -----------------------------------------------------------------------------------
@echo.
@echo                 警告：检测到服务器启动异常，已自动停止服务器！
@echo              请检查启动参数，Java版本，Java配置环境，或者咨询其他人！
@echo.
@echo -----------------------------------------------------------------------------------
mshta vbscript:msgbox("警告：检测到服务器启动异常，已自动停止服务器！请检查启动参数，Java版本，Java配置环境，或者咨询其他人！",vbSystemModal,"服务器启动软件v5.2.0    Golden_Godsun制作")(window.close)
goto :exit
:exit
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo                                  服务器已关闭
@echo                                按任意键退出....
@echo.
@echo -----------------------------------------------------------------------------------
pause >nul
exit