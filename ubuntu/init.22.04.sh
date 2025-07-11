set -x
sudo cp /etc/apt/sources.list /etc/apt/sources.list.bk
sudo cp config/sources.list /etc/apt/sources.list
sudo apt update
sudo dpkg-reconfigure unattended-upgrades
sudo systemctl set-default multi-user.target
touch ~/.ssh/authorized_keys

#ssh server
sudo apt-get install openssh-server
sudo apt-get install vim
sudo apt install net-tools
sudo apt install plocate
ssh-keygen

#data 
mkdir ~/data
mkdir ~/data/docker_data  ~/data/go_path  ~/data/proj

#go
tar zxf config/go1.21.6.linux-amd64.tar.gz -C ~/data/
cat config/bashrc >> ~/.bashrc
source ~/.bashrc

#docker
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
curl -fsSL https://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
sudo cp config/docker_gpg /etc/apt/trusted.gpg.d/docker_gpg
# Step 3: 写入软件源信息
#sudo chmod a+r /etc/apt/keyrings/docker.gpg
sudo add-apt-repository "deb [arch=amd64] https://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 7EA0A9C3F273FCD8


# Add the repository to Apt sources:
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo cp config/daemon.json /etc/docker/
sudo systemctl restart docker.service
sudo docker info
sudo docker run hello-world


#msql docker
#mysql gui:https://www.heidisql.com/?place=lnklblWebpage
mkdir -p ~/data/docker_data/mysql/conf ~/data/docker_data/mysql/data ~/data/docker_data/mysql/log
sudo docker run --name mysql -d -p 3306:3306 --restart unless-stopped -v ~/data/docker_data/mysql/log:/var/log/mysql -v ~/data/docker_data/mysql/data:/var/lib/mysql -v ~/data/docker_data/mysql/conf:/etc/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7

#redis docker
#redis gui:https://gitee.com/qishibo/AnotherRedisDesktopManager/releases
sudo docker run --restart=always -p 6379:6379 --name redis -d redis:7.0.12  --requirepass 123456


#gf install and kitex,hertz
chmod +x config/gf_linux_amd64
./config/gf_linux_amd64
go install github.com/cloudwego/hertz/cmd/hz@latest
go install github.com/cloudwego/kitex/tool/cmd/kitex@latest
go install github.com/kitex-contrib/kitexcall@latest
go install go.uber.org/mock/mockgen@latest
go install -v github.com/cloudwego/thriftgo@latest
go install github.com/cloudwego/thrift-gen-validator@latest
go install github.com/google/gnostic/cmd/protoc-gen-openapi@latest
go install github.com/google/wire/cmd/wire
sudo apt install graphviz


#docker-compose install
sudo cp config/docker-compose /usr/local/bin/docker-compose

#pip config
sudo mkdir ~/.pip
sudo cp config/pip.conf ~/.pip


# dev essential
sudo apt install build-essential linux-source

#done
echo "init env done"
echo "should config nat rule if use vbox"

#no gui
sudo systemctl set-default multi-user.target
#sudo systemctl start gdm3.service
#sudo systemctl set-default graphical.target


#with dev need


# with gui
#sudo dpkg -i config/code_1.92.2-1723660989_amd64.deb
#with guid
#sudo apt install gcc-12 g++-12
#
#fanqiang wendang https://note.youdao.com/s/P2osjLQe
#sudo apt install chromium-browser
