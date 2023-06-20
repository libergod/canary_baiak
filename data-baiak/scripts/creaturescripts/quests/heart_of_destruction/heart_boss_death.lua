function clearDevourer()
	local upConer = {x = 1192, y = 761, z = 7} -- upLeftCorner
	local downConer = {x = 1215, y = 785, z = 7} -- downRightCorner
	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
			for k = upConer.z, downConer.z do
				local tile = Tile(i, j, k)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							if creature:isMonster() then -- éMonstro
								creature:remove()
							end
						end
					end
				end
			end
		end
	end
	stopEvent(areaDevourer4)
	stopEvent(areaDevourer5)
	stopEvent(areaDevourer6)
end

local function setStorageDevourer()
	local upConer = {x = 1192, y = 761, z = 7} -- upLeftCorner
	local downConer = {x = 1215, y = 785, z = 7} -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
			for k= upConer.z, downConer.z do
				local tile = Tile(i, j, k)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							if creature:isPlayer() then -- éPlayer
								creature:setStorageValue(60835, 1)
								creature:setStorageValue(60814, 1)
								creature:setStorageValue(60828, 1)
							end
						end
					end
				end
			end
		end
	end
end

local function setStorage(fromPos, toPos, storage)
	local upConer = fromPos -- upLeftCorner
	local downConer = toPos -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
			for k= upConer.z, downConer.z do
				local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							if creature:isPlayer() and creature:getStorageValue(storage) < 1 then
								creature:setStorageValue(storage, 1) -- Access to boss Anomaly
							end
						end
					end
				end
			end
		end
	end
end

local bosses = {
	["anomaly"] = {
		tile = {x = 1203, y = 666, z = 7},
		actionId = 14325,
		fromPos = {x = 1200, y = 653, z = 7},
		toPos = {x = 1226, y = 678, z = 7},
		storage = 14326
	},
	["rupture"] = {
		tile = {x = 1268, y = 666, z = 7},
		actionId = 14325,
		fromPos = {x = 1266, y = 655, z = 7},
		toPos = {x = 1289, y = 679, z = 7},
		storage = 14327
	},
	["realityquake"] = {
		tile = {x = 1141, y = 664, z = 7},
		actionId = 14325,
		fromPos = {x = 1139, y = 652, z = 7},
		toPos = {x = 1162, y = 676, z = 7},
		storage = 14328
	},
	["eradicator"] = {
		tile = {x = 1260, y = 700, z = 7},
		actionId = 14325,
		fromPos = {x = 1239, y = 688, z = 7},
		toPos = {x = 1263, y = 712, z = 7},
		storage = 14330
	},
	["outburst"] = {
		tile = {x = 1167, y = 701, z = 7},
		actionId = 14325,
		fromPos = {x = 1165, y = 689, z = 7},
		toPos = {x = 1188, y = 713, z = 7},
		storage = 14332
	}
}

local heartBossDeath = CreatureEvent("HeartBossDeath")

function heartBossDeath.onDeath(creature)
	if not creature or not creature:getMonster() then
		return true
	end

	local monsterName = creature:getName():lower()
	local bossName = bosses[monsterName]
	if bossName then
		local vortex = Tile(bossName.tile):getItemById(23483)
		if vortex then
			vortex:transform(23482)
			vortex:setActionId(bossName.actionId)
		end
		setStorage(bossName.fromPos, bossName.toPos, bossName.storage)
	elseif monsterName == "world devourer" then
		local vortex = Tile({x = 1213, y = 773, z = 7}):getItemById(23483)
		if vortex then
			vortex:transform(23482)
			vortex:setActionId(14354)
		end
		setStorageDevourer()
		clearDevourer()
	end
	return true
end

heartBossDeath:register()
