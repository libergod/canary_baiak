local foreshockTransform = CreatureEvent("ForeshockTransform")
function foreshockTransform.onThink(creature)
	if not creature:isMonster() then
		return true
	end
	
	local monsterTable = {
		[80] = {fromStage = 0, toStage = 1},
		[60] = {fromStage = 1, toStage = 2},
		[40] = {fromStage = 2, toStage = 3},
		[25] = {fromStage = 3, toStage = 4},
		[10] = {fromStage = 4, toStage = 5}
	}
	
	for index, value in pairs(monsterTable) do
		local hp = (creature:getHealth() / creature:getMaxHealth()) * 100
		if realityQuakeStage == 0 then
			local foreshockHealth = creature:getHealth()
			if hp <= index and aftershockStage == value.fromStage then
				creature:remove()
				Game.createMonster("spark of destruction", {x = 1145, y = 662, z = 7}, false, true)
				Game.createMonster("spark of destruction", {x = 1147, y = 667, z = 7}, false, true)
				Game.createMonster("spark of destruction", {x = 1152, y = 667, z = 7}, false, true)
				Game.createMonster("spark of destruction", {x = 1154, y = 662, z = 7}, false, true)
				local monster = Game.createMonster("aftershock", {x = 1150, y = 664, z = 7}, false, true)
				monster:addHealth(-monster:getHealth() + foreshockHealth, COMBAT_PHYSICALDAMAGE)
				foreshockStage = value.toStage
			end
		end
	end
	return true
end

foreshockTransform:register()
