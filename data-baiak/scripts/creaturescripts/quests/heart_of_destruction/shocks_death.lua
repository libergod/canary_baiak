local shocksDeath = CreatureEvent("ShocksDeath")
function shocksDeath.onDeath(creature)
	if not creature or not creature:isMonster() then
		return true
	end

	local name = creature:getName():lower()
	if name == "foreshock" and realityQuakeStage == 0 then
		if realityQuakeStage == 0 then
			local monster = Game.createMonster("aftershock", {x = 1150, y = 664, z = 7}, false, true)
			monster:addHealth(-monster:getHealth() + aftershockHealth, COMBAT_PHYSICALDAMAGE)
			Game.createMonster("spark of destruction", {x = 1145, y = 662, z = 7}, false, true)
			Game.createMonster("spark of destruction", {x = 1147, y = 667, z = 7}, false, true)
			Game.createMonster("spark of destruction", {x = 1152, y = 667, z = 7}, false, true)
			Game.createMonster("spark of destruction", {x = 1154, y = 662, z = 7}, false, true)
		end
	elseif name == "aftershock" and realityQuakeStage == 0 then
		local monster = Game.createMonster("foreshock", {x = 1150, y = 664, z = 7}, false, true)
		monster:addHealth(-monster:getHealth() + aftershockHealth, COMBAT_PHYSICALDAMAGE)
		Game.createMonster("spark of destruction", {x = 1145, y = 662, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1147, y = 667, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1152, y = 667, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1154, y = 662, z = 7}, false, true)
	end
	realityQuakeStage = realityQuakeStage + 1

	if realityQuakeStage == 2 then
		local pos = creature:getPosition()
		local monster = Game.createMonster("realityquake", pos, false, true)
		Game.createMonster("spark of destruction", {x = 1145, y = 662, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1147, y = 667, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1152, y = 667, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1154, y = 662, z = 7}, false, true)
	end

	return true
end

shocksDeath:register()
