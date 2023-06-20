local chargingOutDeath = CreatureEvent("ChargingOutDeath")
function chargingOutDeath.onDeath(creature)
	if chargingOutKilled == false then
		local monster = Game.createMonster("outburst", {x = 1176, y = 701, z = 7}, false, true)
		monster:addHealth(-monster:getHealth() + outburstHealth, COMBAT_PHYSICALDAMAGE)
	end
	return true
end
chargingOutDeath:register()
