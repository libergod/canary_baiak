local monsterTable = {
	[1] = 72500,
	[2] = 145000,
	[3] = 217500,
	[4] = 275500
}

local chargedAnomalyDeath = CreatureEvent("ChargedAnomalyDeath")

function chargedAnomalyDeath.onDeath(creature)
	for storageValue, health in pairs(monsterTable) do
		if Game.getStorageValue(14322) == storageValue then
			local monster = Game.createMonster("anomaly", {x = 1213, y = 665, z = 7}, false, true)
			monster:addHealth(-health)
		end
	end
	return true
end

chargedAnomalyDeath:register()
