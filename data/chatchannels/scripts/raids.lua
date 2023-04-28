local CHANNEL_RAIDS = 12

function canJoin(player)
	--return player:getAccountType() >= ACCOUNT_TYPE_TUTOR
	return true
end

function onSpeak(player, type, message)
	local playerAccountType = player:getAccountType()
	if playerAccountType == ACCOUNT_TYPE_NORMAL then
		player:sendCancelMessage("You may not speak in this channel.")
		return false
	end
	
	if type == TALKTYPE_CHANNEL_Y then
		if playerAccountType >= ACCOUNT_TYPE_TUTOR or player:hasFlag(PlayerFlag_TalkOrangeHelpChannel) then
			type = TALKTYPE_CHANNEL_O
		end
	elseif type == TALKTYPE_CHANNEL_O then
		if playerAccountType < ACCOUNT_TYPE_TUTOR and not player:hasFlag(PlayerFlag_TalkOrangeHelpChannel) then
			type = TALKTYPE_CHANNEL_Y
		end
	elseif type == TALKTYPE_CHANNEL_R1 then
		if playerAccountType < ACCOUNT_TYPE_GAMEMASTER and not player:hasFlag(PlayerFlag_CanTalkRedChannel) then
			if playerAccountType >= ACCOUNT_TYPE_TUTOR or player:hasFlag(PlayerFlag_TalkOrangeHelpChannel) then
				type = TALKTYPE_CHANNEL_O
			else
				type = TALKTYPE_CHANNEL_Y
			end
		end
	end
	return type
end

function onJoin(player)
	player:sendTextMessage(TALKTYPE_CHANNEL_O, "Welcome, here you'll receive information about raids.", CHANNEL_RAIDS)
	return true
end
