FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["BasicApi/BasicApi.csproj", "BasicApi/"]
RUN dotnet restore "BasicApi/BasicApi.csproj"
COPY . .
WORKDIR "/src/BasicApi"
RUN dotnet build "BasicApi.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "BasicApi.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "BasicApi.dll"]