local function setStorage()
	local upConer = {x = 1098, y = 720, z = 7} -- upLeftCorner
	local downConer = {x = 1134, y = 749, z = 7} -- downRightCorner
	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
			for k= upConer.z, downConer.z do
				local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, creature in pairs(creatures) do
							if creature:isPlayer() and creature:getStorageValue(14324) < 1 then -- hardcoded storges
								creature:setStorageValue(14324, 1) -- Access to boss realityquake
							end
						end
					end
				end
			end
		end
	end
end

local sparkDeath = CreatureEvent("SparkDeath")
function sparkDeath.onDeath(creature)
	if unstableSparksCount < 10 then
		unstableSparksCount = unstableSparksCount + 1
		creature:say("The death of the spark charges the room!", TALKTYPE_MONSTER_YELL, isInGhostMode, pid, {x = 1114, y = 735, z = 7})
	elseif unstableSparksCount == 10 then
		setStorage()
		creature:say("The room is fully charged up! You are permeated with its power and can venture deeper into the heart of destruction now!", TALKTYPE_MONSTER_YELL, isInGhostMode, pid, {x = 1114, y = 735, z = 7})
		unstableSparksCount = 11
	end
	return true
end

sparkDeath:register()
