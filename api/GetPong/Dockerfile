FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build 
WORKDIR /src
COPY ["/proto", "/"]
COPY ["api/GetPong/GetPong.Api/GetPong.Api.csproj", "api/GetPong.Api/"]
COPY ["api/GetPong/GetPong.Core/GetPong.Core.csproj", "api/GetPong.Core/"]
COPY ["api/GetPong/GetPong.Infrastructure/GetPong.Infrastructure.csproj", "api/GetPong.Infrastructure/"]
COPY ["api/GetPong/GetPong.Application/GetPong.Application.csproj", "api/GetPong.Application/"]
RUN dotnet restore "api/GetPong.Api/GetPong.Api.csproj"
COPY . .
WORKDIR "/src/api/GetPong.Api"
RUN dotnet build "GetPong.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "GetPong.Api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_URLS="http://+:5000"
EXPOSE 5000
ENTRYPOINT ["dotnet", "GetPong.Api.dll"]