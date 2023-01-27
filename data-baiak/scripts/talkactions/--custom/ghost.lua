function onSay(player, words, param)
	if not player:getGroup():getAccess() then
		return true
	end

	if player:getAccountType() < ACCOUNT_TYPE_GOD then
		return false
	end

	local position = player:getPosition()
	local isGhost = not player:isInGhostMode()

	player:setGhostMode(isGhost)
	if isGhost then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Agora voc� est� invis�vel.")
		position:sendMagicEffect(CONST_ME_POFF)
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Agora voc� est� vis�vel.")
		position:sendMagicEffect(50)
	end
	return false
end
