local ruptureResonance = CreatureEvent("RuptureResonance")
function ruptureResonance.onThink(creature)
	if not creature or not creature:isMonster() then
		return false
	end

	local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
	if hp <= 80 and ruptureResonanceStage == 0 and resonanceActive == false then
		Game.createMonster("spark of destruction", {x = 1273, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1272, y = 666, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 666, z = 7}, false, true)
		Game.createMonster("damage resonance", {x = 1274, y = 666, z = 7}, false, true)
		ruptureResonanceStage = 1
		resonanceActive = true
	elseif hp <= 60 and ruptureResonanceStage == 1 and resonanceActive == false then
		Game.createMonster("spark of destruction", {x = 1273, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1272, y = 666, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 666, z = 7}, false, true)
		Game.createMonster("damage resonance", {x = 1274, y = 666, z = 7}, false, true)
		ruptureResonanceStage = 2
		resonanceActive = true
	elseif hp <= 40 and ruptureResonanceStage == 2 and resonanceActive == false then
		Game.createMonster("spark of destruction", {x = 1273, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1272, y = 666, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 666, z = 7}, false, true)
		Game.createMonster("damage resonance", {x = 1274, y = 666, z = 7}, false, true)
		ruptureResonanceStage = 3
		resonanceActive = true
	elseif hp <= 25 and ruptureResonanceStage == 3 and resonanceActive == false then
		Game.createMonster("spark of destruction", {x = 1273, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1272, y = 666, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 666, z = 7}, false, true)
		Game.createMonster("damage resonance", {x = 1274, y = 666, z = 7}, false, true)
		ruptureResonanceStage = 4
		resonanceActive = true
	elseif hp <= 10 and ruptureResonanceStage == 4 and resonanceActive == false then
		Game.createMonster("spark of destruction", {x = 1273, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 670, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1272, y = 666, z = 7}, false, true)
		Game.createMonster("spark of destruction", {x = 1280, y = 666, z = 7}, false, true)
		Game.createMonster("damage resonance", {x = 1274, y = 666, z = 7}, false, true)
		ruptureResonanceStage = -1
		resonanceActive = true
	end

	return true
end

ruptureResonance:register()
