<h1 align="center">
  <br>
    MetadataServer For UnrealGameSync
  <br>
</h1>

![screenshot](https://docs.unrealengine.com/4.26/Images/ProductionPipelines/DeployingTheEngine/UnrealGameSync/QuickStart/UGSQS_Step1_EndResult-2.webp)

This is a custom version of the metadata server (a component of [UnrealGameSync](https://docs.unrealGameSync.com/en-US/ProductionPipelines/DeployingTheEngine/UnrealGameSync/index.html) ), updated to ASP.Net Core 3.1, with async/await

这是元数据服务器（[UnrealGameSync](https://docs.unrealengine.com/en-US/ProductionPipelines/DeployingTheEngine/UnrealGameSync/index.html)的组件）的自定义版本，更新到 ASP.Net Core 3.1，具有异步/等待功能

Requirements
要求
---------------------------
ASP.NET Core Runtime 3.1 Hosting Bundle or higher.

ASP.NET Core Runtime 3.1 托管捆绑包或更高版本。

Deploy Steps
部署步骤
---------------------------
1 Clone this project to the local

1 Clone此工程到本地

2 Modify appsettings.json, and change MySqlConnection to the connection information of your own Mysql database

2 修改appsettings.json,将MySqlConnection修改为你自己的Mysql数据库的连接信息

3 Publish the image to Dockerhub

3 将镜像发布到Dockerhub

4 Deploy the image in Docker

4 在Docker中部署镜像

Licensing
许可
---------------------------
The source code is governed by the Unreal Engine End User License Agreement. If you don't agree to those terms, as amended from time to time, you are not permitted to access or use the source code.

此源代码受 [虚幻引擎最终用户许可协议](https://www.unrealengine.com/eula)的约束. 如果您不同意这些条款（经不时修订），则不允许访问或使用源代码。
