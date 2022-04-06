::[Bat To Exe Converter]
::
::fBE1pAF6MU+EWH3eyE85Jh5XXgWEKFc8+liZAil+FiK7J73S0Qj3eo7P5jFg32blDcE/o6oe02hMndlMLxRVbh2lawEgug4=
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJFSN+kczOhpSWDgEwIY/7HSZESDHahpIJ6fVVuMrRAcGFjJj4mXqInlhjkirFp1mHQ/Licu39s9lIAY3pg4=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF25
::ZR41oxFsdFKZSTk=
::eBoioBt6dFKZSTk=
::cRo6pxp7LAbNWATEpSI=
::egkzugNsPRvcWATEpSI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJlZkoaHErUXA==
::ZQ05rAF9IBncCkqN+0xwdVtCGUrTcj3a
::ZQ05rAF9IAHYFVzEqQIdIRVRTxaDOn/6NbAO/u3pr8aGt0MeXOctGA==
::eg0/rx1wNQPfEVWB+kM9LVsJDCmLMm65FLQa/KjI6viRp19deOMqdozT36bAJfgWig==
::fBEirQZwNQPfEVWB+kM9LVsJDCmLMm65FLQa/KjI6viRp19deOMqdozT36bAJfgWig==
::cRolqwZ3JBvQF1fEqQIdIRVRTxaDOn/6gEnxbQI6ahNPJ73S0Qj3/XYTug==
::dhA7uBVwLU+EWHSN+kczOhpSWGQ=
::YQ03rBFzNR3SWATE0008LB5acyONOHivCNU=
::dhAmsQZ3MwfNWATE100gMQldSwyWfCO5T/VOuLqpr82IrkkYWt0Yd4vIz7ru
::ZQ0/vhVqMQ3MEVWAtB9wDxRYSAGMA0y1AqYJ5og=
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRmp/Uw1KwlVShDCupdXg1/dbREzahpIJ6fV0Rv3OMdeMmIK/RxJzUrocZMj6V1VnNgZAlI4
::Zh4grVQjdCuDJFSN+kczOhpSWDgEwIY/7HSZESDHahpIJ6fVVuMrRAoVNjJm0GXgC3lhhVmoPLIajp5CXVUOMBeza28=
::YB416Ek+Zm8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
set ReTimes=0
:start
title 正在启动服务器...
@echo                             服务器启动软件v5.1.6
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
if not "%Version%"=="v5.1.6" (goto :2)
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
if not "%MainJava%"=="开" (if not "%MainJava%"=="关" (goto :3))
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
for /f "tokens=1,* delims==" %%a in ('findstr "额外JVM=" "设置.ini"') do (set JVM=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "标题=" "设置.ini"') do (set Title=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "最大内存=" "设置.ini"') do (set MaxRAM=%%~b)
for /f "tokens=1,* delims==" %%a in ('findstr "最小内存=" "设置.ini"') do (set MinRAM=%%~b)
set /a Thour=%time:~0,2%
if %Thour% LSS 10 (set Ttime=%date:~5,2%.%date:~8,2%-%time:~1,1%:%time:~3,2%) else (set Ttime=%date:~5,2%.%date:~8,2%-%time:~0,2%:%time:~3,2%)
if "%LaSeconds%"=="开" (if "%AutoRestart%"=="开" (if "%AutoPort%"=="开" (title [%Title%]--重启[%ReTimes%]次--端口=[%Port%]--最后重启时间[%Ttime%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.1.6) else (title [%Title%]--重启[%ReTimes%]次--最后重启时间[%Ttime%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.1.6)) else (if "%AutoPort%"=="开" (title [%Title%]--端口=[%Port%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.1.6) else (title [%Title%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.1.6))) else (if "%AutoRestart%"=="开" (if "%AutoPort%"=="开" (title [%Title%]--重启[%ReTimes%]次--端口=[%Port%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.1.6) else (title [%Title%]--重启[%ReTimes%]次--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.1.6)) else (if "%AutoPort%"=="开" (title [%Title%]--端口=[%Port%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.1.6) else (title [%Title%]--内存=[%MinRAM%/%MaxRAM%]--Golden_Godsun制作v5.1.6)))
if exist "%~dp0eula.txt" (goto :yeula)
if exist "%~dp0modules.yml" (goto :yeula)
if exist "%~dp0velocity.toml" (goto :yeula)
echo #This End User License Agreement has been automatically written and agreed to using the startup software!>>eula.txt
echo (https://account.mojang.com/documents/minecraft_eula).>>eula.txt
echo #Golden_Godsun production, software version v5.1.6>>eula.txt
echo eula=true>>eula.txt
@echo.
@echo                   未检测到"eula.txt"文件，已自动写入并同意！
@echo.
@echo -----------------------------------------------------------------------------------
:yeula
set Fdate=%date:~0,4%%date:~5,2%%date:~8,2%&set Ftime=%time:~0,2%%time:~3,2%%time:~6,2%
if "%MainJava%"=="关" (goto :njava)
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
echo #是否添加启动的额外JVM参数（例如: "-Dusing.aikars.flags=https://mcflags.emc.gs"）>>设置.ini
echo #本软件已部分使用aikar的脚本参数，请勿重复添加（不懂请留空）>>设置.ini
echo 使用默认Java="开">>设置.ini
echo Java路径="">>设置.ini
echo 额外JVM="">>设置.ini
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
echo #注：第一次开服可能服务器文件尚未更新，会导致检测端口号等出错，后续即可完美运行！>>设置.ini
echo #注：每个参数请严格按照注释进行设置，检查名字或选项是否设置正确，否则报错概不负责！>>设置.ini
echo.>>设置.ini
echo #免责声明：>>设置.ini
echo #用户若因使用本软件而导致的任何智力问题及后果，均由自己负责，本软件不负任何责任！>>设置.ini
echo #使用本软件即代表用户已知晓以上内容！>>设置.ini
echo #Golden_Godsun制作（请勿修改版本号）>>设置.ini
echo 软件版本="v5.1.6">>设置.ini
goto :exit
:1
title 提示：未检测到"设置.ini"文件，已自动创建新的配置文件，请前往"设置.ini"设置启动参数！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 提示：未检测到"设置.ini"文件，已自动创建新的配置文件，请前往"设置.ini"设置启动参数！
@echo.
@echo -----------------------------------------------------------------------------------
goto :config
:2
title 警告：设置文件版本错误，无法正常运行，已自动创建新的配置文件，请前往重设启动参数！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 警告：设置文件版本错误，无法正常运行，已自动创建新的配置文件，请前往重设启动参数！
@echo.
@echo -----------------------------------------------------------------------------------
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
goto :exit
:4
title 提示：未检测到开服核心jar，请将核心复制到此软件所在目录！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo           提示：未检测到开服核心jar，请将核心复制到此软件所在目录！
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:5
title 警告："%Core%"核心名称设置错误，请在"设置.ini"中重新设置名称！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo         警告："%Core%"核心名称设置错误，请在"设置.ini"中重新设置名称！
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:6
title 警告：未检测到%Java%路径下的Java，请在"设置.ini"中重新设置Java路径！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 警告：未检测到%Java%路径下的Java，请在"设置.ini"中重新设置Java路径！
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:7
title 提示：设置的重启次数限制已达到%ReLimits%次，已自动关闭服务器！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo               提示：设置的重启次数限制已达到%ReLimits%次，已自动关闭服务器！
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:8
title 警告：您开启了自动备份，但未设置自动备份的路径，请前往"设置.ini"中设置路径！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 警告：您开启了自动备份，但未设置自动备份的路径，请前往"设置.ini"中设置路径！
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:9
title 警告：您设置的备份等级有错误，不在1-9的范围中，请前往"设置.ini"中设置路径！
@echo.
@echo -----------------------------------------------------------------------------------
@echo.
@echo 警告：您设置的备份等级有错误，不在1-9的范围中，请前往"设置.ini"中设置路径！
@echo.
@echo -----------------------------------------------------------------------------------
goto :exit
:10
title 警告：检测到服务器启动异常，请检查启动参数，Java配置环境，或者咨询其他人！
@echo -----------------------------------------------------------------------------------
@echo.
@echo                 警告：检测到服务器启动异常，已自动停止服务器！
@echo              请检查启动参数，Java版本，Java配置环境，或者咨询其他人！
@echo.
@echo -----------------------------------------------------------------------------------
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