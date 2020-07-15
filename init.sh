#!/bin/bash

# Check if user is root
if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use root to install lnmp"
    exit 1
fi

# [ $(yum repolist | awk '/repolist/{print$2}' | sed 's/,//') -eq 0 ] && echo 'your yum has problem' && exit 2 

# 更新yum
# yum update

# 移除docker旧版本(如果有已安装并正在使用的docker服务，请根据实际需要修改本文件)
yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine

# 安装系统依赖
yum install -y yum-utils device-mapper-persistent-data lvm2 

# 添加docker源信息（下载速度比较快）
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo 

# 更新yum缓存
yum makecache fast

# 安装docker-ce
yum -y install docker-ce

# 启动docker后台服务
sudo systemctl start docker

# 配置阿里云镜像加速器（必配, 这里加速器地址仅用于展示，无加速功能，请使用自己的阿里云加速器，教程见百度，加速器免费）
mkdir /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{"registry-mirrors": ["https://6y46612t.mirror.aliyuncs.com"]}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

# 安装docker-compose
cd /usr/local/src
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose  
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# 切换目录，如不是通过一键安装命令安装，请确保dockerfiles文件夹已经下载到服务器
cd /root/docker-env

# vim docker-compose.yml     
# 部署前，请修改 docker-compose.yml 中对应目录为你当前服务器目录
# 建议：不同服务器的 软件目录、配置文件、项目存放目录一致。

# 启动 docker 集群
docker-compose up -d

