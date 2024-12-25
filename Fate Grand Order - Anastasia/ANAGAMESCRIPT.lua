-- script
-- Author: HaoJun0823
-- DateCreated: 11/14/2021 12:00:42 AM
--------------------------------------------------------------
--Broken!
--Broken!
--Broken!
--Broken!
--Broken!
--Because only after reloading can you see the changes in the terrain!
--Broken!
--Broken!
--Broken!
--Broken!
--Broken!
print('Anastasia Begin!')
local iTerrainsTypeSnow = GameInfo.Terrains["TERRAIN_TUNDRA"].Index
local iTerrainsTypeSnowHills = GameInfo.Terrains["TERRAIN_TUNDRA_HILLS"].Index
local iTerrainsTypeSnowMountain = GameInfo.Terrains["TERRAIN_TUNDRA_MOUNTAIN"].Index

print('Get Snow '..iTerrainsTypeSnow)
print('Get Snow Hills '..iTerrainsTypeSnowHills)
print('Get Snow Mountain '..iTerrainsTypeSnowMountain)

--Thanks for https://forums.civfanatics.com/threads/add-a-feature-to-a-plot-during-game-time-with-lua.645149/
--See #10
--Function by Lee S
function GetCityPlots(pCity)
	local tTempTable = {}
	if pCity ~= nil then
		local iCityRadius = 3
		local iTableCount = 1
		local iCityOwner = pCity:GetOwner()
		local iCityX, iCityY = pCity:GetX(), pCity:GetY()
		for dx = (iCityRadius * -1), iCityRadius do
			for dy = (iCityRadius * -1), iCityRadius do
				local pPlotNearCity = Map.GetPlotXYWithRangeCheck(iCityX, iCityY, dx, dy, iCityRadius);
				if pPlotNearCity and (pPlotNearCity:GetOwner() == iCityOwner) then
					local iPlotIndex, bAddToTable = pPlotNearCity:GetIndex(), false
					if ((Cities.GetPlotWorkingCity(iPlotIndex) ~= nil) and (pCity == Cities.GetPlotWorkingCity(iPlotIndex))) then
						bAddToTable = true
					elseif ((Cities.GetPlotWorkingCity(iPlotIndex) == nil) and (pCity == Cities.GetPlotPurchaseCity(iPlotIndex))) then
						bAddToTable = true
					end
					if (bAddToTable == true) then
						tTempTable[iTableCount] = pPlotNearCity
						iTableCount = iTableCount + 1
					end
				end
			end
		end
	end
	return tTempTable
end

function checkPlayer(mul)

	local playerIDS = PlayerManager.GetAliveIDs();
	
	for i, playerId in ipairs(playerIDS) do
		local pPlayer = Players[playerId];
		local playerConfig = PlayerConfigurations[playerId];		
		if Game.GetLocalPlayer() == playerId and pPlayer:IsMajor() and pPlayer:IsAlive() and playerConfig:GetLeaderTypeName() == "LEADER_FGO_ANASTASIA" then --LEADER_PETER_GREAT --LEADER_FGO_ANASTASIA
			snow(playerId,mul);
		end
	end

end

function snow(mul,playerId) --

	local player = Players[playerId];

	for i, pCity in player:GetCities():Members() do
		start(pCity)
	end
	print("Snow:Build Done.");	
	
end

--WorldBuilder.MapManager()?

function start(pCity)
	for i,pPlot in ipairs(GetCityPlots(pCity)) do
		print("Plot discovered with index # of " .. pPlot:GetIndex() .. " located at X" .. pPlot:GetX() .. ", Y" .. pPlot:GetY())
		if T(pPlot) or H(pPlot) or M(pPlot) then
		print('Maybe is snow.')
		end
	end
end

function M(pPlot)
	print('IsMountain?'..'WhichType? '..pPlot:GetTerrainType())
	if pPlot:IsMountain() and pPlot:GetTerrainType() ~= iTerrainsTypeSnowMountain then
			--TerrainBuilder.SetTerrainType(pPlot, iTerrainsTypeSnowMountain)
			WorldBuilder.MapManager():SetTerrainType(Map.GetPlotByIndex(pPlot), iTerrainsTypeSnowMountain)
			return false
	end
	return true
end

function H(pPlot)
	print('IsHills?'..'WhichType? '..pPlot:GetTerrainType())
	if pPlot:IsHills() and pPlot:GetTerrainType() ~= iTerrainsTypeSnowHills then
			--TerrainBuilder.SetTerrainType(pPlot, iTerrainsTypeSnowHills)
			WorldBuilder.MapManager():SetTerrainType(Map.GetPlotByIndex(pPlot), iTerrainsTypeSnowHills)
			return false
	end
	return true
end


function T(pPlot)
	print('IsOpenGround?'..'WhichType? '..pPlot:GetTerrainType())
	if pPlot:IsOpenGround() and pPlot:GetTerrainType() ~= iTerrainsTypeSnow then
			--TerrainBuilder.SetTerrainType(pPlot, iTerrainsTypeSnow)
			WorldBuilder.MapManager():SetTerrainType(Map.GetPlotByIndex(pPlot), iTerrainsTypeSnow)
			return false
	end
	return true
end


Events.TurnBegin.Add( checkPlayer );

