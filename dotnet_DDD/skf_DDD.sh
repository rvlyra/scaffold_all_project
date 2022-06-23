dotnet new sln

mkdir app.Domain app.Api app.Infra app.Shared

# Criar depends
cd app.Api/
    dotnet new web
        cd ..

cd app.Domain/
    dotnet new classlib
        cd ..

cd app.Shared/
    dotnet new classlib
        cd ..

cd app.Infra/
    dotnet new classlib
        cd ..

# Criar references
cd app.Domain
    dotnet add reference ../app.Shared/app.Shared.csproj
        cd ..
cd app.Infra
    dotnet add reference ../app.Shared/app.Shared.csproj
    dotnet add reference ../app.Domain/app.Domain.csproj
        cd ..
cd app.Api
    dotnet add reference ../app.Shared/app.Shared.csproj
    dotnet add reference ../app.Domain/app.Domain.csproj
    dotnet add reference ../app.Infra/app.Infra.csproj
        cd ..


# Adicionar projetos referenciados no arquivo .sln
dotnet sln add ./app.Shared/app.Shared.csproj
dotnet sln add ./app.Domain/app.Domain.csproj
dotnet sln add ./app.Infra/app.Infra.csproj


