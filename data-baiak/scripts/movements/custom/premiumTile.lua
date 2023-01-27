local lista = {"Movie"}

local premiumTile = MoveEvent()
function premiumTile.onStepIn(creature, item, position, fromPosition)

	local player = creature:getPlayer()
    if not player then
        return true
    end
	
	if isInArray(lista, player:getName()) then
		return true
	end

	if not player:isPremium() then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
		player:sendCancelMessage("Voc� precisa ser um jogador premium para passar aqui.")
		return true
	end

    player:getPosition():sendMagicEffect(32)

	return true
end

premiumTile:type("stepin")
premiumTile:aid(9168)
premiumTile:register()
