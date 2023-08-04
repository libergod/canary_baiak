local vipLoginCheck = CreatureEvent("VipLogin")

function vipLoginCheck.onLogin(player)
	if configManager.getBoolean(configKeys.VIP_SYSTEM_ENABLED) then
		local wasVip = player:getStorageValue(Storage.VipSystem.IsVip) == 1
		if wasVip and not player:isVip() then player:onRemoveVip() end
		if not wasVip and player:isVip() then player:onAddVip(player:getVipDays()) end
		local playerVipDays = player:getVipDays()
		if playerVipDays >= 1 then
		--if player:isVip() then
			player:say("[VIP]", TALKTYPE_MONSTER_SAY)
			player:getPosition():sendMagicEffect(73)
			player:sendTextMessage(MESSAGE_LOGIN, string.format('You have %s VIP day%s left.', (playerVipDays == 0xFFFF and 'infinite amount of' or playerVipDays), (playerVipDays == 1 and '' or 's')))
		end
	end
	return true
end

vipLoginCheck:register()