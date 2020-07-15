###  dockerfiles 目录说明  

- 如果有已安装并正在使用的docker服务，请在执行前自行修改inin.sh文件

- 安装建议：建议安装在 /root 目录下， 即在 /root 目录下执行一键安装命令，并生成 /root/dockerfiles 目录。如安装到其他目录，请修改init.sh中的/root目录

- 本目录中包含  
    - docker-compose.yml	docker 容器编排文件  
    - init.sh			环境初始化文件  
    - nginx			nginx 配置目录  
    - php			php 配置目录
    - README.md  		说明文件

- 1、其中init.sh 为环境初始化脚本，运行后会安装 docker（如有旧版本docker会先删除），下载docker-compose，并构建镜像，启动容器，执行一次后无需再次使用。

- 2、如果你是通过一键安装命令安装， 则无需再次运行init.sh文件, 安装完成后，通过8081端口访问出现phpinfo页面，如正常访问则部署成功。一键安装命令如下：

    - cd /root && wget https://github.com/eternity-wdd/docker-env/archive/master.zip && unzip master.zip && mv docker-env-master docker-env && cd docker-env && /bin/bash init.sh

    - 建议在 /root 目录下执行此命令，另外需要在执行前按照unzip( yum install -y unzip)

- 3、docker-compose.yml 文件为docker容器编排文件，通过 docker-compose 工具一键启动容器集群，以及其他配置和管理，相关命令如下：
    
    - docker-compose up -d     		启动 docker-compose.yml 文件中编排的容器集群  参数：-d， 代表后台启动

    - docker-compose restart		重启编排的容器集群

    - docker-compose stop		停止相关容器集群
    
    - 以上命令均需在 docker-compose.yml 所在目录下执行，否则提示找不到 docker-compose.yml 文件

- 4、nginx 目录， 为nginx容器的配置文件，修改后动过 docker-compose restart 重启生效

- 5、php 目录， 为php容器的配置文件，修改后通过 docker-compose restart 重启生效



### 常用命令：
- docker exec -it 容器ID /bin/sh           进入容器
- docker ps -a   		 	   查询容器列表
- docker images				   查询镜像列表

### 更新说明：

- v1.1.0  ----  2019-06-14   DKG131

    - nginx容器为  centos:latest + nginx1.17 加上下载其他工具和依赖，镜像文件不小于522M

    - php容器为    alpine + php7.0   镜像文件大小 70.7M

- v1.2.0  ----  2019-06-18   DKG131
    
    - nginx容器的基础镜像不再使用centos，使用alpine + nginx1.17     镜像大小为20.5M，加快了镜像构建速度，减少镜像体积 

- v1.3.0  ---   2019-06-25   DKG131
    
    - nginx1.17 基于 alpine
    - php7.1.30 基于 alpine， 包括mysqlpdo、redis、memcache等必要扩展，如缺少你所需要的扩展，请自行修改 php 的 Dockerfile 文件，添加扩展，并重启容器集群。
    - memcache-1.15 基于 alpine
    - redis 基于 alpine






