::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFEMAHF3SAE+/Fb4I5/jHxsegnR9NBrdvId6C5eXZdbFGugvuZZFN
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSzk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFEMAHF3SAE+/Fb4I5/jHzuSDsEIUUKIdeZzel7yHJOVTxED8YdYa33Rel9wfMDpWegCkZwt0i29RsymNPsOZ8yHkUlzJ0UI+H2pjlC3VlC5b
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion

:: 设置 GitHub 仓库的相关信息
set "REPO_OWNER=WYing-CCC"
set "REPO_NAME=HideRootScript"
set "API_URL=https://api.github.com/repos/%REPO_OWNER%/%REPO_NAME%/releases/latest"

:: 设置脚本路径和文件名
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_NAME=%~n0"
set "LOCAL_FILE_PATH=%SCRIPT_DIR%%SCRIPT_NAME%"
set "LOCAL_FILE_PATH=%LOCAL_FILE_PATH:\=/%"

:: 检查是否有更新
call :CheckForUpdates

:menu
cls
echo ==================================================
echo.
echo           ABNToolbox Windows PC Terminal
echo              Powered by_Github@Kdufse
echo.
echo ==================================================
echo.
echo QQ群：1039155145
echo 请选择操作：
echo [1] 启动调试模式       [5]KPM_嵌入(APatch专用，其他勿用)
echo [2] 安装模块           
echo [3] 隐藏应用列表       
echo [4] 安装辅助工具包     
echo [0] 退出程序           
echo.

set /p choice=

if "%choice%"=="1" goto Start_Debugging
if "%choice%"=="2" goto Install_Module
if "%choice%"=="3" goto Settings_HideMyAPPList
if "%choice%"=="4" call :CheckForUpdates
if "%choice%"=="5" call :KPM_Embedding

echo 无效的输入，请重新选择。
pause
goto menu

:: 检查更新
:CheckForUpdates
echo 正在检查更新...
for /f "tokens=2 delims=," %%i in ('curl -s %API_URL% ^| findstr "browser_download_url"') do (
    set "download_url=%%i"
    set "download_url=!download_url: =!"
    goto :DownloadUpdate
)

:DownloadUpdate
if not defined download_url (
    echo 未能获取到最新的 Release 信息
    pause
    goto menu
)

echo 最新版本的下载链接为: !download_url!

echo 正在下载最新版本的脚本...
curl -s -L -o "%LOCAL_FILE_PATH%.new" "!download_url!"

if !errorlevel! neq 0 (
    echo 下载失败，请检查网络或仓库链接是否正确！
    pause
    goto menu
)

echo 正在替换本地文件...
del /f /q "%LOCAL_FILE_PATH%"

if !errorlevel! neq 0 (
    echo 删除旧文件失败，请检查权限！
    pause
    goto menu
)

move /y "%LOCAL_FILE_PATH%.new" "%LOCAL_FILE_PATH%"

if !errorlevel! neq 0 (
    echo 文件替换失败，请检查权限！
    pause
    goto menu
)

echo 更新完成！
echo 请重新运行脚本以使用最新版本。
pause
exit /b

:: 开发者功能设置
:Start_Debugging
echo "正在开启..."
@echo off
echo 正在设置设备...

:: 设置 adb.exe 的路径
set "data_folder=%cd%\Data"
set "adb_path=%data_folder%\adb.exe"

:: 检查 adb.exe 是否存在
if not exist "%adb_path%" (
    echo 错误：adb.exe 文件未找到，请检查路径！
    pause
    exit /b
)

:: 执行设置命令
"%adb_path%" shell su -c "settings put global development_settings_enabled 1"
"%adb_path%" shell su -c "settings put global adb_enabled 1"
"%adb_path%" shell su -c "settings put secure install_non_market_apps 1"
"%adb_path%" shell su -c "settings put global adb_wifi_enabled 1"

echo 设置已完成。
pause
goto menu

:: 安装模块
:Install_Module
@echo off
echo 正在准备下载文件...

:: 设置下载链接和目标文件路径
set "url=http://hk-proxy.gitwarp.com/https://github.com/Kdufse/ABNToolbox/blob/main/CoreDocuments/Modules.zip"
set "output_folder=%cd%\Download"
set "output_file=%output_folder%\Module.zip"

:: 检查并创建目标文件夹
if not exist "%output_folder%" (
    mkdir "%output_folder%"
    if %errorlevel% neq 0 (
        echo 创建文件夹失败，请检查权限。
        pause
        exit /b
    )
    echo 文件夹 "%output_folder%" 创建成功。
) else (
    echo 文件夹 "%output_folder%" 已存在。
)

:: 使用 curl 下载文件
echo 正在下载文件到 "%output_file%"...
curl -fsSL -o "%output_file%" "%url%"

:: 检查下载是否成功
if %errorlevel% neq 0 (
    echo 下载失败，请检查链接或网络连接。
) else (
    echo 文件下载完成，保存为 "%output_file%"。
)

:: 设置 adb.exe 的路径
set "data_folder=%cd%\Data"
set "adb_path=%data_folder%\adb.exe"

:: 检查 adb.exe 是否存在
if not exist "%adb_path%" (
    echo 错误：adb.exe 文件未找到，请检查路径！
    pause
    exit /b
)

:: 检查输出文件是否存在
if not exist "%output_file%" (
    echo 错误：%output_file% 文件未找到，请检查路径！
    pause
    exit /b
)

:: 检查设备连接
echo 正在检查设备连接...
"%adb_path%" devices
if %errorlevel% neq 0 (
    echo 错误：设备未连接或未识别，请检查设备连接！
    pause
    exit /b
)

:: 推送文件到设备
echo 正在将文件推送到设备...
"%adb_path%" push "%output_file%" /sdcard/HRS/Module.zip
if %errorlevel% neq 0 (
    echo 推送失败，请检查设备连接和权限！
    pause
    exit /b
)

echo 正在检查设备上的文件...
"%adb_path%" shell ls /sdcard/HRS/Module.zip

:: 执行 Magisk 模块安装
echo 正在执行 Magisk 模块安装...
"%adb_path%" shell "su -c 'magisk --install-module /sdcard/HRS/Module.zip'"

:: 执行 APatch 模块安装
echo 正在执行 APatch 模块安装...
"%adb_path%" shell su -c "apd module install /sdcard/HRS/Module.zip"

:: 执行 Kernelsu 模块安装
echo 正在执行 Kernelsu 模块安装...
"%adb_path%" shell su -c "ksud module install /sdcard/HRS/Module.zip"

echo 所有操作已完成。
%adb_path% shell su -c "rm -rf /sdcard/HRS"
pause
goto menu

:: 配置隐藏应用列表
:Settings_HideMyAPPList
@echo off
setlocal enabledelayedexpansion

:: 设置下载链接和目标文件路径
set "url=http://gh.halonice.com/https://github.com/Kdufse/ABNToolbox/blob/main/CoreDocuments/HMAL_Config.zip"
set "output_folder=%cd%\Download"
set "output_file=%output_folder%\config.zip"

:: 检查并创建目标文件夹
if not exist "%output_folder%" (
    mkdir "%output_folder%"
    if %errorlevel% neq 0 (
        echo [错误] 创建文件夹失败，请检查权限。
        pause
        exit /b
    )
    echo 文件夹 "%output_folder%" 创建成功。
) else (
    echo 文件夹 "%output_folder%" 已存在。
)

:: 使用 curl 下载文件
echo 正在下载文件到 "%output_file%"...
curl -o "%output_file%" "%url%"
if %errorlevel% neq 0 (
    echo [错误] 下载失败，请检查链接或网络连接。
    pause
    exit /b
)
echo 文件下载完成，保存为 "%output_file%"。

:: 设置 adb.exe 的路径
set "data_folder=%cd%\Data"
set "adb_path=%data_folder%\adb.exe"

:: 检查ADB路径是否已设置
if not exist "%adb_path%" (
    echo [错误] ADB路径未设置，请确保变量adb_path已正确配置。
    exit /b 1
)

:: 检查ADB是否可用
echo 检查ADB工具是否可用...
%adb_path% version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] ADB工具无法运行，请检查ADB路径是否正确。
    exit /b 1
)

:: 检查设备是否连接
echo 检查设备连接状态...
%adb_path% devices >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 无法检测到设备，请确保设备已连接并开启调试模式。
    exit /b 1
)

:: 将config.zip拷贝到手机的/sdcard/HRS/目录
%adb_path% shell mkdir -p /sdcard/HRS
echo 正在将文件拷贝到设备...
%adb_path% push "%output_file%" /sdcard/HRS/config.zip
if %errorlevel% neq 0 (
    echo [错误] 文件拷贝失败，请检查文件路径和设备权限。
    exit /b 1
)

:: 解压config.zip到/sdcard/HRS/目录进行测试
echo 正在解压文件到设备...
%adb_path% shell su -c "unzip -o /sdcard/HRS/config.zip -d /data/user/0/com.google.android.hmal/"
%adb_path% shell su -c "unzip -o /sdcard/HRS/config.zip -d /data/user/0/com.tsng.hidemyapplist/"
%adb_path% shell su -c "rm -rf /sdcard/HRS"

if %errorlevel% neq 0 (
    echo [错误] 解压失败，请检查设备权限。
    exit /b 1
)

pause
goto menu

endlocal