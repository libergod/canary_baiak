local autoloot = TalkAction("!autoloot")

function autoloot.onSay(player, words, param)

	--if param == "" then
	--	player:sendCancelMessage("Error! Missing parameter.")
	--	-- Distro log
	--	Spdlog.error("[autoloot.onSay] - Missing Parameter.")
	--	return false
	--end
	
	local split = param:split(",")
	local command = split[1]
	local paramt = nil
	
	if command == "add" then
	
	local item = split[2]:gsub("%s+", "", 1)
        local itemType = ItemType(item)
        if itemType:getId() == 0 then
            itemType = ItemType(tonumber(item))
            if itemType:getId() == 0 then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There is no item with that id or name.")
                return false
            end
        end
		
		local itemName = tonumber(split[2]) and itemType:getName() or item
        local size = 0
        for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            local storage = player:getStorageValue(i)
            if size == AUTO_LOOT_MAX_ITEMS then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The list is full, please remove from the list to make some room.")
                break
            end

            if storage == itemType:getId() then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, itemName .." is already in the list.")
                break
            end

            if storage <= 0 then
                player:setStorageValue(i, itemType:getId())
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, itemName .." has been added to the list.")
                break
            end

            size = size + 1
        end
	
	elseif command == "remove" then
	
	
		local item = split[2]:gsub("%s+", "", 1)
        local itemType = ItemType(item)
			if itemType:getId() == 0 then
				itemType = ItemType(tonumber(item))
				if itemType:getId() == 0 then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There is no item with that id or name.")
					return false
				end
			end

        local itemName = tonumber(split[2]) and itemType:getName() or item
			for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
				if player:getStorageValue(i) == itemType:getId() then
					player:sendTextMessage(MESSAGE_EVENT_ADVANCE, itemName .." has been removed from the list.")
					player:setStorageValue(i, 0)
					return false
				end
			end
			
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, itemName .." was not founded in the list.")
	elseif command == "show" then
	
		local text = "------------- Auto Loot List -------------\n"
        local count = 1
			for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
				local storage = player:getStorageValue(i)
				if storage > 0 then
					text = string.format("%s%d. %s\n", text, count, ItemType(storage):getName())
					count = count + 1
				end
			end

			if text == "" then
				text = "Empty"
			end
   
        player:showTextDialog(1950, text, false)
		
		
		
    elseif command == "clear" then
	
        for i = AUTOLOOT_STORAGE_START, AUTOLOOT_STORAGE_END do
            player:setStorageValue(i, 0)
        end
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The autoloot list has been cleared.")
    else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Use the commands: !autoloot {add, remove, show, clear}")
    end	
	
end

autoloot:separator(" ")
autoloot:register()