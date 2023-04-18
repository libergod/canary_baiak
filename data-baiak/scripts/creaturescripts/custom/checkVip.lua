local checkVipTime = CreatureEvent("checkVipTime")
function checkVipTime.onLogin(player)
		--player:sendVipDaysMessage()
		
		
	function minimalTimers(seconds)
    local days = math.floor(seconds / 86400)
    seconds = seconds - days * 86400
    local hours = math.floor(seconds / 3600)
    seconds = seconds - hours * 3600
    local minutes = math.floor(seconds / 60)
    seconds = seconds - minutes * 60

    if days > 0 then
        return string.format("%d days, %d hours, %d minutes",days,hours,minutes)
    elseif hours > 0 then
        return string.format("%d hours, %d minutes",hours,minutes)
    elseif minutes > 0 then
        return string.format("%d minutes",minutes)
    elseif seconds > 0 then
        return string.format("%d seconds",seconds)
    end
end

	if player:getVipTime() > os.time() then
		player:sendTextMessage(MESSAGE_LOGIN, string.format("You have %s of vip account remaining!", minimalTimers(player:getVipTime() - os.time())))
		--player:sendTextMessage(MESSAGE_LOGIN, "You have "..player:getVipTime().." days of vip account remaining!")
		return true
	else
	
	player:sendTextMessage(MESSAGE_LOGIN, "You don't have Vip days. Please recharge at Store!")
	return true
	end
end

checkVipTime:register()
