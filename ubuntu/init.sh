sudo cp /etc/apt/sources.list /etc/apt/sources.list.bk
sudo cp config/sources.list /etc/apt/sources.list
sudo apt update
sudo dpkg-reconfigure unattended-upgrades
sudo systemctl set-default multi-user.target

#ssh server
sudo apt-get install openssh-server
ssh-keygen

#data 
mkdir ~/data
mkdir ~/data/docker_data  ~/data/go_path  ~/data/proj

#go
tar zxf config/go1.21.6.linux-amd64.tar.gz -C ~/data/
cat config/bashrc >> ~/.bashrc

#docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world


#msql docker
#mysql gui:https://www.heidisql.com/?place=lnklblWebpage
mkdir -p ~/data/docker_data/mysql/conf ~/data/docker_data/mysql/data ~/data/docker_data/mysql/log
docker run --name mysql -d -p 3306:3306 --restart unless-stopped -v ~/data/docker_data/mysql/log:/var/log/mysql -v ~/data/docker_data/mysql/data:/var/lib/mysql -v ~/data/docker_data/mysql/conf:/etc/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7

#redis docker
#redis gui:https://gitee.com/qishibo/AnotherRedisDesktopManager/releases
docker run --restart=always -p 6379:6379 --name redis -d redis:7.0.12  --requirepass 123456


#gf install
chmod +x config/gf_linux_amd64
./config/gf_linux_amd64

#done
echo "init env done"
echo "should config nat rule if use vbox"



