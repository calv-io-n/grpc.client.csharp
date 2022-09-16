FROM  mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim AS build
WORKDIR /src
COPY ["../Portal/Portal.csproj", "Portal/"]
RUN dotnet restore "Portal/Portal.csproj"
COPY .. .
WORKDIR "/src/Portal"
RUN dotnet build "Portal.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Portal.csproj" -c Release -o /app/publish


FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Portal.dll"]