local function chargerSpawns(pos)
	Game.createMonster("charger", pos, false, true)
	spawningCharge = false
	return true
end

local chargerSpawn = CreatureEvent("ChargerSpawn")
function chargerSpawn.onDeath(creature)
	local positions = {
		{x = 1120, y = 799, z = 8},
		{x = 1122, y = 804, z = 8},
		{x = 1127, y = 805, z = 8},
		{x = 1130, y = 803, z = 8},
		{x = 1125, y = 800, z = 8},
		{x = 1132, y = 799, z = 8},
		{x = 1123, y = 796, z = 8},
		{x = 1128, y = 797, z = 8},
		{x = 1131, y = 795, z = 8},
		{x = 1127, y = 793, z = 8},
	}

	local pos = positions[math.random(1, #positions)]
	addEvent(chargerSpawns, 6000, pos)
	spawningCharge = true
	return true
end

chargerSpawn:register()
