local outburstCharge = CreatureEvent("OutburstCharge")
function outburstCharge.onThink(creature)
	if not creature or not creature:isMonster() then
		return false
	end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
	if hp <= 80 and outburstStage == 0 then
		outburstHealth = creature:getHealth()
		creature:remove()
		Game.createMonster("spark of destruction", {x = 1171, y = 698, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1172, y = 703, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1179, y = 703, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1180, y = 798, z = 7}, false, true)
		Game.createMonster("charging outburst", {x = 1176, y = 700, z = 7}, false, true)
		outburstStage = 1
		chargingOutKilled = false
	elseif hp <= 60 and outburstStage == 1 then
		outburstHealth = creature:getHealth()
		creature:remove()
		Game.createMonster("spark of destruction", {x = 1171, y = 698, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1172, y = 703, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1179, y = 703, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1180, y = 798, z = 7}, false, true)
		Game.createMonster("charging outburst", {x = 1176, y = 700, z = 7}, false, true)
		outburstStage = 2
		chargingOutKilled = false
	elseif hp <= 40 and outburstStage == 2 then
		outburstHealth = creature:getHealth()
		creature:remove()
		Game.createMonster("spark of destruction", {x = 1171, y = 698, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1172, y = 703, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1179, y = 703, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1180, y = 798, z = 7}, false, true)
		Game.createMonster("charging outburst", {x = 1176, y = 700, z = 7}, false, true)
		outburstStage = 3
		chargingOutKilled = false
	elseif hp <= 20 and outburstStage == 3 then
		outburstHealth = creature:getHealth()
		creature:remove()
		Game.createMonster("spark of destruction", {x = 1171, y = 698, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1172, y = 703, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1179, y = 703, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1180, y = 798, z = 7}, false, true)
		Game.createMonster("charging outburst", {x = 1176, y = 700, z = 7}, false, true)
		outburstStage = 4
		chargingOutKilled = false
	end
	return true
end

outburstCharge:register()
