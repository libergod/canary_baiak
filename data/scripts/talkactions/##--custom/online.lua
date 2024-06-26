local maxPlayersPerMessage = 10

function onSay(player, words, param)
	local hasAccess = player:getGroup():getAccess()
	local players = Game.getPlayers()
	local onlineList = { }

	for _, targetPlayer in ipairs(players) do
		if hasAccess or not targetPlayer:isInGhostMode() then
			table.insert(onlineList, ("%s [%d]"):format(targetPlayer:getName(), targetPlayer:getLevel()))
		end
	end

	local playersOnline = #onlineList
	player:sendTextMessage(MESSAGE_STATUS_BLUE_LIGHT, ("%d players online."):format(playersOnline))

	if player:getAccountType() >= ACCOUNT_TYPE_GOD then
		for i = 1, playersOnline, maxPlayersPerMessage do
			local j = math.min(i + maxPlayersPerMessage - 1, playersOnline)
			local msg = table.concat(onlineList, ", ", i, j) .. "."
			player:sendTextMessage(MESSAGE_STATUS_BLUE_LIGHT, msg)
		end
	end
	return false
end
