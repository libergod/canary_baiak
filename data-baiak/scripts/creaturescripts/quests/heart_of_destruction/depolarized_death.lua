local function setStorage()
	local upConer = {x = 1145, y = 724, z = 7} -- upLeftCorner
	local downConer = {x = 1178, y = 756, z = 7} -- downRightCorner
	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
			for k= upConer.z, downConer.z do
				local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								if c:getStorageValue(14322) < 1 then
									c:setStorageValue(14322, 1) -- Access to boss Anomaly
								end
							end
						end
					end
				end
			end
		end
	end
end

local depolarizedDeath = CreatureEvent("DepolarizedDeath")
function depolarizedDeath.onDeath(creature)

	Game.setStorageValue(14323, Game.getStorageValue(14323) + 1)
	if Game.getStorageValue(14323) == 10 then
		setStorage()
		creature:say("You have reached enough charges to pass further into the destruction!", TALKTYPE_MONSTER_YELL, isInGhostMode, pid, {x = 1162, y = 739, z = 7})
		Game.setStorageValue(14323, -1)
	end
	return true
end

depolarizedDeath:register()
