@Echo Off
Title ip2云端更新 hysteria 最新配置
cd /d %~dp0
..\..\wget -t 2 --no-check-certificate https://www.gitlabip.xyz/Alvin9999/PAC/master/backup/img/1/2/ipp/hysteria/2/config.json

if exist config.json goto startcopy

..\..\wget -t 2 --no-check-certificate https://fastly.jsdelivr.net/gh/Alvin9999/PAC@latest/backup/img/1/2/ipp/hysteria/2/config.json

if exist config.json goto startcopy

echo ip更新失败，请试试其它ip更新
pause
exit
:startcopy

del "..\config.json_backup"
ren "..\config.json"  config.json_backup
copy /y "%~dp0config.json" ..\config.json
del "%~dp0config.json"
ECHO.&ECHO.已更新完成最新hysteria配置,请按回车键或空格键启动程序！ &PAUSE >NUL 2>NUL
exit