local addCoins = TalkAction("/addcoins")

function addCoins.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end
	
	if param == "" then
		player:sendCancelMessage("Player name param required")
		-- Distro log
		Spdlog.error("TALKACTION: [addCoins.onSay] - Player name param not found. (add_remove_coins.lua)")
		return false
	end
	
	local split = param:split(",")
	local name = split[1]
	local money = nil
	if split[2] then
		money = tonumber(split[2])
	end
	
		-- Check if player is online
	local targetPlayer = Player(name)
	if not targetPlayer then
		player:sendCancelMessage("Player ".. string.titleCase(name) .." is not online.")
		-- Distro log
		Spdlog.error("TALKACTION: [addCoins.onSay] - Player ".. string.titleCase(name) .." is not online. (add_remove_coins.lua)")
		return false
	end

	if targetPlayer:addTibiaCoins(money) then
		player:sendCancelMessage("You successfully added " .. money .. " Tibia Coins to " .. targetPlayer:getName() .. ".")	
		return true
	end
	return true
end

addCoins:separator(" ")
addCoins:register()


local removeCoins = TalkAction("/removecoins")

function removeCoins.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		return true
	end
	
	if param == "" then
		player:sendCancelMessage("Player name param required")
		-- Distro log
		Spdlog.error("TALKACTION: [removeCoins.onSay] - Player name param not found. (add_remove_coins.lua)")
		return false
	end

	local split = param:split(",")
	local name = split[1]
	local money = nil
	if split[2] then
		money = tonumber(split[2])
	end
	
		-- Check if player is online
	local targetPlayer = Player(name)
	if not targetPlayer then
		player:sendCancelMessage("Player ".. string.titleCase(name) .." is not online.")
		-- Distro log
		Spdlog.error("TALKACTION: [removeCoins.onSay] - Player ".. string.titleCase(name) .." is not online. (add_remove_coins.lua)")
		return false
	end

	if targetPlayer:removeTibiaCoins(money) then
		player:sendCancelMessage("You successfully removed " .. money .. " Tibia Coins from " .. targetPlayer:getName() .. ".")	
		return true
	end
	return true
end

removeCoins:separator(" ")
removeCoins:register()
