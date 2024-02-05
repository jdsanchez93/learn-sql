Use [LeagueOfLegends];



select [ca].*, [at].[Name] as [Ability Type]
from
[ChampionAbility] as [ca]
join [AbilityType] as [at]
on [at].[AbilityTypeId] = [ca].[AbilityTypeId];



-- select c.Name as ChampionName, ca.Name as AbilityName, at.Name as AbilityType from 
-- Champion c
-- join ChampionAbility ca
-- on c.ChampionId = ca.ChampionId
-- join AbilityType at
-- on at.AbilityTypeId = ca.AbilityTypeId;



-- Select c.* from Champion c
-- left join ChampionAbility ca
-- on ca.ChampionId = c.ChampionId
-- where ca.ChampionId is null;