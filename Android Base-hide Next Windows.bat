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

:: ���� GitHub �ֿ�������Ϣ
set "REPO_OWNER=WYing-CCC"
set "REPO_NAME=HideRootScript"
set "API_URL=https://api.github.com/repos/%REPO_OWNER%/%REPO_NAME%/releases/latest"

:: ���ýű�·�����ļ���
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_NAME=%~n0"
set "LOCAL_FILE_PATH=%SCRIPT_DIR%%SCRIPT_NAME%"
set "LOCAL_FILE_PATH=%LOCAL_FILE_PATH:\=/%"

:: ����Ƿ��и���
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
echo QQȺ��1039155145
echo ��ѡ�������
echo [1] ��������ģʽ       [5]KPM_Ƕ��(APatchר�ã���������)
echo [2] ��װģ��           
echo [3] ����Ӧ���б�       
echo [4] ��װ�������߰�     
echo [0] �˳�����           
echo.

set /p choice=

if "%choice%"=="1" goto Start_Debugging
if "%choice%"=="2" goto Install_Module
if "%choice%"=="3" goto Settings_HideMyAPPList
if "%choice%"=="4" call :CheckForUpdates
if "%choice%"=="5" call :KPM_Embedding

echo ��Ч�����룬������ѡ��
pause
goto menu

:: ������
:CheckForUpdates
echo ���ڼ�����...
for /f "tokens=2 delims=," %%i in ('curl -s %API_URL% ^| findstr "browser_download_url"') do (
    set "download_url=%%i"
    set "download_url=!download_url: =!"
    goto :DownloadUpdate
)

:DownloadUpdate
if not defined download_url (
    echo δ�ܻ�ȡ�����µ� Release ��Ϣ
    pause
    goto menu
)

echo ���°汾����������Ϊ: !download_url!

echo �����������°汾�Ľű�...
curl -s -L -o "%LOCAL_FILE_PATH%.new" "!download_url!"

if !errorlevel! neq 0 (
    echo ����ʧ�ܣ����������ֿ������Ƿ���ȷ��
    pause
    goto menu
)

echo �����滻�����ļ�...
del /f /q "%LOCAL_FILE_PATH%"

if !errorlevel! neq 0 (
    echo ɾ�����ļ�ʧ�ܣ�����Ȩ�ޣ�
    pause
    goto menu
)

move /y "%LOCAL_FILE_PATH%.new" "%LOCAL_FILE_PATH%"

if !errorlevel! neq 0 (
    echo �ļ��滻ʧ�ܣ�����Ȩ�ޣ�
    pause
    goto menu
)

echo ������ɣ�
echo ���������нű���ʹ�����°汾��
pause
exit /b

:: �����߹�������
:Start_Debugging
echo "���ڿ���..."
@echo off
echo ���������豸...

:: ���� adb.exe ��·��
set "data_folder=%cd%\Data"
set "adb_path=%data_folder%\adb.exe"

:: ��� adb.exe �Ƿ����
if not exist "%adb_path%" (
    echo ����adb.exe �ļ�δ�ҵ�������·����
    pause
    exit /b
)

:: ִ����������
"%adb_path%" shell su -c "settings put global development_settings_enabled 1"
"%adb_path%" shell su -c "settings put global adb_enabled 1"
"%adb_path%" shell su -c "settings put secure install_non_market_apps 1"
"%adb_path%" shell su -c "settings put global adb_wifi_enabled 1"

echo ��������ɡ�
pause
goto menu

:: ��װģ��
:Install_Module
@echo off
echo ����׼�������ļ�...

:: �����������Ӻ�Ŀ���ļ�·��
set "url=http://hk-proxy.gitwarp.com/https://github.com/Kdufse/ABNToolbox/blob/main/CoreDocuments/Modules.zip"
set "output_folder=%cd%\Download"
set "output_file=%output_folder%\Module.zip"

:: ��鲢����Ŀ���ļ���
if not exist "%output_folder%" (
    mkdir "%output_folder%"
    if %errorlevel% neq 0 (
        echo �����ļ���ʧ�ܣ�����Ȩ�ޡ�
        pause
        exit /b
    )
    echo �ļ��� "%output_folder%" �����ɹ���
) else (
    echo �ļ��� "%output_folder%" �Ѵ��ڡ�
)

:: ʹ�� curl �����ļ�
echo ���������ļ��� "%output_file%"...
curl -fsSL -o "%output_file%" "%url%"

:: ��������Ƿ�ɹ�
if %errorlevel% neq 0 (
    echo ����ʧ�ܣ��������ӻ��������ӡ�
) else (
    echo �ļ�������ɣ�����Ϊ "%output_file%"��
)

:: ���� adb.exe ��·��
set "data_folder=%cd%\Data"
set "adb_path=%data_folder%\adb.exe"

:: ��� adb.exe �Ƿ����
if not exist "%adb_path%" (
    echo ����adb.exe �ļ�δ�ҵ�������·����
    pause
    exit /b
)

:: �������ļ��Ƿ����
if not exist "%output_file%" (
    echo ����%output_file% �ļ�δ�ҵ�������·����
    pause
    exit /b
)

:: ����豸����
echo ���ڼ���豸����...
"%adb_path%" devices
if %errorlevel% neq 0 (
    echo �����豸δ���ӻ�δʶ�������豸���ӣ�
    pause
    exit /b
)

:: �����ļ����豸
echo ���ڽ��ļ����͵��豸...
"%adb_path%" push "%output_file%" /sdcard/HRS/Module.zip
if %errorlevel% neq 0 (
    echo ����ʧ�ܣ������豸���Ӻ�Ȩ�ޣ�
    pause
    exit /b
)

echo ���ڼ���豸�ϵ��ļ�...
"%adb_path%" shell ls /sdcard/HRS/Module.zip

:: ִ�� Magisk ģ�鰲װ
echo ����ִ�� Magisk ģ�鰲װ...
"%adb_path%" shell "su -c 'magisk --install-module /sdcard/HRS/Module.zip'"

:: ִ�� APatch ģ�鰲װ
echo ����ִ�� APatch ģ�鰲װ...
"%adb_path%" shell su -c "apd module install /sdcard/HRS/Module.zip"

:: ִ�� Kernelsu ģ�鰲װ
echo ����ִ�� Kernelsu ģ�鰲װ...
"%adb_path%" shell su -c "ksud module install /sdcard/HRS/Module.zip"

echo ���в�������ɡ�
%adb_path% shell su -c "rm -rf /sdcard/HRS"
pause
goto menu

:: ��������Ӧ���б�
:Settings_HideMyAPPList
@echo off
setlocal enabledelayedexpansion

:: �����������Ӻ�Ŀ���ļ�·��
set "url=http://gh.halonice.com/https://github.com/Kdufse/ABNToolbox/blob/main/CoreDocuments/HMAL_Config.zip"
set "output_folder=%cd%\Download"
set "output_file=%output_folder%\config.zip"

:: ��鲢����Ŀ���ļ���
if not exist "%output_folder%" (
    mkdir "%output_folder%"
    if %errorlevel% neq 0 (
        echo [����] �����ļ���ʧ�ܣ�����Ȩ�ޡ�
        pause
        exit /b
    )
    echo �ļ��� "%output_folder%" �����ɹ���
) else (
    echo �ļ��� "%output_folder%" �Ѵ��ڡ�
)

:: ʹ�� curl �����ļ�
echo ���������ļ��� "%output_file%"...
curl -o "%output_file%" "%url%"
if %errorlevel% neq 0 (
    echo [����] ����ʧ�ܣ��������ӻ��������ӡ�
    pause
    exit /b
)
echo �ļ�������ɣ�����Ϊ "%output_file%"��

:: ���� adb.exe ��·��
set "data_folder=%cd%\Data"
set "adb_path=%data_folder%\adb.exe"

:: ���ADB·���Ƿ�������
if not exist "%adb_path%" (
    echo [����] ADB·��δ���ã���ȷ������adb_path����ȷ���á�
    exit /b 1
)

:: ���ADB�Ƿ����
echo ���ADB�����Ƿ����...
%adb_path% version >nul 2>&1
if %errorlevel% neq 0 (
    echo [����] ADB�����޷����У�����ADB·���Ƿ���ȷ��
    exit /b 1
)

:: ����豸�Ƿ�����
echo ����豸����״̬...
%adb_path% devices >nul 2>&1
if %errorlevel% neq 0 (
    echo [����] �޷���⵽�豸����ȷ���豸�����Ӳ���������ģʽ��
    exit /b 1
)

:: ��config.zip�������ֻ���/sdcard/HRS/Ŀ¼
%adb_path% shell mkdir -p /sdcard/HRS
echo ���ڽ��ļ��������豸...
%adb_path% push "%output_file%" /sdcard/HRS/config.zip
if %errorlevel% neq 0 (
    echo [����] �ļ�����ʧ�ܣ������ļ�·�����豸Ȩ�ޡ�
    exit /b 1
)

:: ��ѹconfig.zip��/sdcard/HRS/Ŀ¼���в���
echo ���ڽ�ѹ�ļ����豸...
%adb_path% shell su -c "unzip -o /sdcard/HRS/config.zip -d /data/user/0/com.google.android.hmal/"
%adb_path% shell su -c "unzip -o /sdcard/HRS/config.zip -d /data/user/0/com.tsng.hidemyapplist/"
%adb_path% shell su -c "rm -rf /sdcard/HRS"

if %errorlevel% neq 0 (
    echo [����] ��ѹʧ�ܣ������豸Ȩ�ޡ�
    exit /b 1
)

pause
goto menu

endlocal