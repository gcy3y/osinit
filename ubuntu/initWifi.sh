echo "是否需要初始化随身WiFi"
read -p "enter y/n" flag
echo $flag
sleep 5 
echo "使用config中的/rtl8821CU_DesktopCompiled_5.15.0-25-generic.tar.gz"
sleep 3
tar zxf config/rtl8821CU_DesktopCompiled_5.15.0-25-generic.tar.gz -C /tmp/rtl8821CU
sudo cp /tmp/rtl8821CU/8821cu.ko /usr/lib/modules/5.15.0-25-generic/kernel/drivers/net/wireless/realtek/rtw88/
sudo depmod
sudo modprobe 8821
#then can see wifi config in right top.