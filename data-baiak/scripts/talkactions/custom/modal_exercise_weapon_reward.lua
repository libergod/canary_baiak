local config = {
	items = {
		{id = 35284, charges = 8000},
		{id = 35279, charges = 8000},
		{id = 35281, charges = 8000},
		{id = 35283, charges = 8000},
		{id = 35282, charges = 8000},
		{id = 35280, charges = 8000},
	},
	storage = 3327712, -- storage key, player can only win once
}

local function sendExerciseRewardModal(player)
	local window = ModalWindow {
		title = "Exercise Reward",
		message = 'choose a item'
	}
	for _, it in pairs(config.items) do
		local iType = ItemType(it.id)
		if iType then
			local choice = window:addChoice(iType:getName())
			choice.itemId = it.id
			choice.charges = it.charges
		end
	end
	window:addButton('Ok',
		function(button, choice)
			local iType = ItemType(choice.itemId)
			
			local inbox = player:getSlotItem(CONST_SLOT_STORE_INBOX)
			if inbox and inbox:getEmptySlots() > 0 then
				local item = inbox:addItem(choice.itemId, choice.charges)
				if item then
					item:setActionId(NOT_MOVEABLE_ACTION)
				else
					player:sendTextMessage(MESSAGE_INFO_DESCR, "You need to have capacity and empty slots to receive.")
					return
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, "Congratulations, you just received a ".. iType:getName() .." [".. choice.charges .."] charges.")
				player:setStorageValue(config.storage, 1)
			else
				player:sendTextMessage(MESSAGE_INFO_DESCR, "You need to have capacity and empty slots to receive.")
			end
		end
	)
	window:addButton('Close',
		function(button, choice)
		end
	)
	window:setDefaultEnterButton('Close')
	window:setDefaultEscapeButton('Close')
	window:sendToPlayer(player)
end

local exercise_reward_modal = TalkAction("!reward")
function exercise_reward_modal.onSay(player, words, param)
	if player:getStorageValue(config.storage) > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, "You already received your exercise weapon reward!")
		return false
	end
	sendExerciseRewardModal(player)
	return false
end
exercise_reward_modal:separator(" ")
exercise_reward_modal:register()
