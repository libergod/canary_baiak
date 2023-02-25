local restoreExpEnabled = true

local playerDeathRestoreExp = CreatureEvent("playerDeathRestoreExp")
function playerDeathRestoreExp.onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)

	if not restoreExpEnabled then
		return
	end

	local byPlayer = 0
	local killerName
	if killer ~= nil then
		if killer:isPlayer() then
			byPlayer = 1
		else
			local master = killer:getMaster()
			if master and master ~= killer and master:isPlayer() then
				killer = master
				byPlayer = 1
			end
		end
		killerName = killer:isMonster() and killer:getType():getNameDescription() or killer:getName()
	else
		killerName = 'field item'
	end

	local byPlayerMostDamage = 0
	local mostDamageKillerName
	if mostDamageKiller ~= nil then
		if mostDamageKiller:isPlayer() then
			byPlayerMostDamage = 1
		else
			local master = mostDamageKiller:getMaster()
			if master and master ~= mostDamageKiller and master:isPlayer() then
				mostDamageKiller = master
				byPlayerMostDamage = 1
			end
		end
		mostDamageName = mostDamageKiller:isMonster() and mostDamageKiller:getType():getNameDescription() or mostDamageKiller:getName()
	else
		mostDamageName = 'field item'
	end


	if byPlayer ~= 1 then
		Spdlog.info("Death %: " ..player:getDeathPenalty() )
		player:setStorageValue(RestoreExp.xpBefore, player:getExperience())
		player:setStorageValue(RestoreExp.canRestore, 1)
	else
		-- DIED FOR PLAYER, SO CANT RESTORE EXP
		player:setStorageValue(RestoreExp.xpBefore, -1)
		player:setStorageValue(RestoreExp.xpAfter, -1)
		player:setStorageValue(RestoreExp.canRestore, -1)
	end
end
playerDeathRestoreExp:register()
--player:addExperience(1000, true)