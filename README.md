<h1 align="center">
  <br>
    MetadataServer For UnrealGameSync
  <br>
</h1>

![screenshot](https://docs.unrealengine.com/4.26/Images/ProductionPipelines/DeployingTheEngine/UnrealGameSync/QuickStart/UGSQS_Step1_EndResult-2.webp)

这是元数据服务器（[UnrealGameSync](https://docs.unrealengine.com/en-US/ProductionPipelines/DeployingTheEngine/UnrealGameSync/index.html)的组件）的自定义版本，更新到 ASP.Net Core 3.1，具有异步/等待功能

要求
---------------------------
ASP.NET Core Runtime 3.1 托管捆绑包或更高版本。

部署步骤
---------------------------
1 Clone此工程到本地

2 修改appsettings.json,将MySqlConnection修改为你自己的Mysql服务器

3 将镜像发布到Dockerhub

4 在Docker中部署镜像

部署参考：http://www.zoroot.com:3002/zh/DevOps/%E7%BE%A4%E6%99%96ASPDoNetCore


许可
---------------------------

此源代码受 [虚幻引擎最终用户许可协议](https://www.unrealengine.com/eula)的约束. 如果您不同意这些条款（经不时修订），则不允许访问或使用源代码。