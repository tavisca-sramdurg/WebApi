FROM mcr.microsoft.com/dotnet/core/aspnet:2.2 AS runtime

WORKDIR app 

COPY BasicApi/out .

ENTRYPOINT ["dotnet", "BasicApi.dll"]
