local restoreExpPot = Action()

function restoreExpPot.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	if player:getStorageValue(RestoreExp.canRestore) ~= 1 then
		player:sendCancelMessage("You don't have exp to restore.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		return false
	else
		if not item:remove() then
			player:sendCancelMessage("You don't have the Exp restore potion.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return false
		end
		local expcalc = math.floor(player:getStorageValue(RestoreExp.xpBefore) - player:getStorageValue(RestoreExp.xpAfter))
		player:addExperience(expcalc, true)
		player:sendCancelMessage("You restored some exp from last death.")
		player:getPosition():sendMagicEffect(31)
		player:setStorageValue(RestoreExp.xpBefore, -1)
		player:setStorageValue(RestoreExp.xpAfter, -1)
		player:setStorageValue(RestoreExp.canRestore, -1)
	end
	return true
end

restoreExpPot:id(21554)
restoreExpPot:register()
