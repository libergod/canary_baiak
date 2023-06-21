local addIcon = TalkAction("/addicon")

function addIcon.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end
	
	if param == "" then
		player:sendCancelMessage("Player name param required")
		-- Distro log
		Spdlog.error("[addMoney.onSay] - Player name param not found")
		return false
	end
	
	local split = param:split(",")
	local icon = split[1]
	local number = nil
	if split[2] then
		number = tonumber(split[2])
	end

	Karin:setCreatureIcon(player:getId(), icon, number)
	
	
	--addEvent(function()
	--		Karin:setCreatureIcon(player:getId(), 5, 10)
	--		Game.createMonster("Greed Worm", {x = 1111, y = 348, z = 8}, false, true)
	--	end, 10 * 1000)
	
	return true
end

addIcon:separator(" ")
addIcon:register()


local removeIcon = TalkAction("/removeicon")

function removeIcon.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end

	Karin:setCreatureIcon(player:getId(), 0, 0)
	return true
end

removeIcon:separator(" ")
removeIcon:register()
