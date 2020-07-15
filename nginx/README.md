###   nginx 目录说明

- conf目录， 用于存放容器中 nginx 服务的配置文件

- Dockerfile文件，  用于镜像不存在时，构建 基于 alpine 的 nginx1.17 镜像

- Dockerfile_old文件， v1.1.0 版本的Dockerfile 文件，基于centOS 构建 nginx1.17  

- html目录，  nginx 默认静态文件存放目录，比如存放 404.html,500.html 等页面

- logs目录，  nginx 日志存放目录

- www目录，   自定义的 nginx目录，目前仅用于存放 docker 测试的 index.php文件，通过8081端口可访问phpinfo页面

### 配置说明

- 域名配置，参考/root/dockerfiles/nginx/conf/conf.d/domain-test.conf文件，启动后，向本地添加hosts，即可直接通过该文件内的域名进行访问测试。
