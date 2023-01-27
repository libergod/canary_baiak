local stamina_full = 42

local refillStamina = Action()
function refillStamina.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStamina() >= (stamina_full * 60) then
		player:sendCancelMessage("Sua stamina j� est� cheia.")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
	else
		player:setStamina(stamina_full * 60)
		player:sendCancelMessage("Sua stamina foi recarregada.")
		player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
		item:remove()
	end

	return true
end

refillStamina:id(9170)
refillStamina:register()