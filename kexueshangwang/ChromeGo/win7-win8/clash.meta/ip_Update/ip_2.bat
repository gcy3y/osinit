@Echo Off
Title ip2云端更新 clash 最新配置
cd /d %~dp0
..\..\wget -t 2 --no-check-certificate https://www.gitlabip.xyz/Alvin9999/PAC/master/backup/img/1/2/ip/clash.meta2/2/config.yaml

if exist config.yaml goto startcopy

..\..\wget -t 2 --no-check-certificate https://fastly.jsdelivr.net/gh/Alvin9999/PAC@latest/backup/img/1/2/ip/clash.meta2/2/config.yaml

if exist config.yaml goto startcopy

echo ip更新失败，请试试其它ip更新
pause
exit
:startcopy

del "..\config.yaml_backup"
ren "..\config.yaml"  config.yaml_backup
copy /y "%~dp0config.yaml" ..\config.yaml
del "%~dp0config.yaml"
ECHO.&ECHO.已更新完成最新clash.meta配置,请按回车键或空格键启动程序！ &PAUSE >NUL 2>NUL
exit