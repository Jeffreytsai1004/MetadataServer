<h1 align="center">
  <br>
    MetadataServer For UnrealGameSync
  <br>
</h1>

![screenshot](https://docs.unrealengine.com/4.26/Images/ProductionPipelines/DeployingTheEngine/UnrealGameSync/QuickStart/UGSQS_Step1_EndResult-2.webp)

This is a custom version of the metadata server (a component of [UnrealGameSync](https://docs.unrealGameSync.com/en-US/ProductionPipelines/DeployingTheEngine/UnrealGameSync/index.html) ), updated to ASP.Net Core 3.1, with async/await

这是元数据服务器（[UnrealGameSync](https://docs.unrealengine.com/en-US/ProductionPipelines/DeployingTheEngine/UnrealGameSync/index.html)的组件）的自定义版本，更新到 .Net 8.0，具有异步/等待功能, 

更新了MySQL `utf8mb4` 编码格式

![image](https://github.com/Jeffreytsai1004/MetadataServer/assets/109943015/1f89bd0c-0bf0-4947-beb1-e2110a8c7b29)

Requirements
要求
---------------------------
.NET Runtime 8.0 Hosting Bundle or higher.

.NET Runtime 8.0 托管捆绑包或更高版本。

Deploy Steps
部署步骤
---------------------------

1 Clone this project to the local

1 Clone此工程到本地

2 Install [.NET 8.0 SDK](https://dotnet.microsoft.com/zh-cn/download/dotnet/8.0),Install the SDK on the development PC and the Hosting Bundle on the web server

2 安装 [.NET 8.0 SDK](https://dotnet.microsoft.com/zh-cn/download/dotnet/8.0),在开发PC上安装SDK,在网页服务器上安装 Hosting Bundle 

3 Modify appsettings.json, and change MySqlConnection to the connection information of your own Mysql database

3 修改appsettings.json,将MySqlConnection字符串修改为你自己的Mysql数据库的连接信息

4 Publish the image to Dockerhub or IIS

4 发布到 Docker 或者 IIS

6 在Linux中部署与构建镜像 
  安装 .NET 8.0 的 SDK 和 Runtime
  ```
  mkdir dotnet
  cd dotnet
  wegt https://download.visualstudio.microsoft.com/download/pr/d6d79cc3-df2f-4680-96ff-a7198f461139/df025000eaf5beb85d9137274a8c53ea/aspnetcore-runtime-8.0.2-linux-x64.tar.gz
  mkdir -p $HOME/dotnet && tar zxf aspnetcore-runtime-8.0.2-linux-x64.tar.gz -C $HOME/dotnet
  export DOTNET_ROOT=$HOME/dotnet
  export PATH=$PATH:$HOME/dotnet
  rm aspnetcore-runtime-8.0.2-linux-x64.tar.gz
  wget https://download.visualstudio.microsoft.com/download/pr/85bcc525-4e9c-471e-9c1d-96259aa1a315/930833ef34f66fe9ee2643b0ba21621a/dotnet-sdk-8.0.201-linux-x64.tar.gz
  mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-8.0.201-linux-x64.tar.gz -C $HOME/dotnet
  export DOTNET_ROOT=$HOME/dotnet
  export PATH=$PATH:$HOME/dotnet
  rm dotnet-sdk-8.0.201-linux-x64.tar.gz
  ```
  查看 .NET 的SDK和RUNTIME
  ```
  dotnet --info
  ```
  拉取 ASP .NET 8.0 镜像 
  ```
  docker pull mcr.microsoft.com/dotnet/aspnet:8.0
  ```
  返回用户根目录
  ```
  cd ~
  ```
  先新建一个目录
  ```
  mkdir MetadataServer
  cd MetadataServer
  ```
  拉取该仓库
  ```
  git clone https://github.com/Jeffreytsai1004/MetadataServer ./
  ```
  修改./MetadataServer/MetadataServer/appsettings.json 按i键编辑修改 "MySqlConnection": 为你的MySQL的服务器ID和端口号，以及用户名和密码. Exit键退出编辑， ：wq 保存并退出
  ```
  vi ./MetadataServer/MetadataServer/appsettings.json
  ```
  修改./MetadataServer/Properties/launchSettings.json 按i键编辑修改 "applicationUrl":为启动的端口号如：
  ```
  "applicationUrl": "http://localhost:8080"
  ```
  构建镜像（这里$DOCKERHUBUSERNAME为你的Dockerhub账号）
  ```
  sudo docker build -t $DOCKERHUBUSERNAME/metadataserver:latest .
  ```
  查看构建的镜像：
  ```
  docker images
  ```
  登录DokerHub（用$DOCKERHUBUSERNAME账号登录）
  ```
  docker login
  ```
  启动镜像（这里$DOCKERHUBUSERNAME为你的Dockerhub账号,并且可以修改你的MYSQL的对应的MySqlConnection字符串
  ```
  docker run -d --name metadataserver --restart always -p 8080:8080 -e MySqlConnection:"server=MYSQLSERVERID;port=PORT;UserId=USERNAME;password=PASSWORD;" $DOCKERHUBUSERNAME/latest:latest
  ```
  进入容器
  ```
  sudo docker exec -it metadataserver /bin/bash
  ```
  退出容器
  ```
  exit
  ```

Licensing
许可
---------------------------
The source code is governed by the Unreal Engine End User License Agreement. If you don't agree to those terms, as amended from time to time, you are not permitted to access or use the source code.

此源代码受 [虚幻引擎最终用户许可协议](https://www.unrealengine.com/eula)的约束. 如果您不同意这些条款（经不时修订），则不允许访问或使用源代码。
