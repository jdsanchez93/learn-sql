if not exists (select * from sys.databases where name='LeagueOfLegends')
    CREATE DATABASE [LeagueOfLegends];
go

Use [LeagueOfLegends];

if not exists (select 1 from sys.tables where name='Champion')
begin
    CREATE TABLE [Champion](
        [ChampionId] INT IDENTITY(1,1) PRIMARY KEY,
        [Name] NVARCHAR(100),
    );

    INSERT INTO Champion (Name)
    Values ('Tahm Kench');

End

go

if not exists (select 1 from sys.tables where name='AbilityType')
begin
    CREATE TABLE [AbilityType](
        [AbilityTypeId] INT IDENTITY(1,1) PRIMARY KEY,
        [Name] NVARCHAR(100),
    );

    INSERT INTO AbilityType (Name)
    VALUES
        ('Passive'),
        ('Q'),
        ('W'),
        ('E'),
        ('R');
End
go

if not exists (select 1 from sys.tables where name='ChampionAbility')
begin
    CREATE TABLE [ChampionAbility](
        [ChampionId] INT FOREIGN KEY REFERENCES Champion(ChampionId),
        [AbilityTypeId] INT FOREIGN KEY REFERENCES AbilityType(AbilityTypeId),
        [Name] NVARCHAR(100),
        PRIMARY KEY (ChampionId, AbilityTypeId)
    );

    DECLARE @TahmKenchChampionId AS INT
    SET @TahmKenchChampionId = (SELECT Top 1 ChampionId FROM Champion WHERE Name = 'Tahm Kench')

    INSERT INTO ChampionAbility (ChampionId, AbilityTypeId, Name)
    VALUES
        (@TahmKenchChampionId, 1, 'An Acquired Taste'),
        (@TahmKenchChampionId, 2, 'Tongue Lash'),
        (@TahmKenchChampionId, 3, 'Abyssal Dive'),
        (@TahmKenchChampionId, 4, 'Thick Skin'),
        (@TahmKenchChampionId, 5, 'Devour');
end
go


INSERT INTO Champion (Name)
Select *
from (
    Values ('Aatrox'), ('Akali'), ('Ahri'), ('Apple')
) x(NewChampionName)
where not exists (select 1 from Champion c where c.Name = x.NewChampionName);