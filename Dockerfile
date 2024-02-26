#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["MetadataServer/MetadataServer.csproj", "MetadataServer/"]
RUN dotnet restore "MetadataServer/MetadataServer.csproj"
COPY . .
WORKDIR "/src/MetadataServer"
RUN dotnet build "MetadataServer.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MetadataServer.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MetadataServer.dll"]
