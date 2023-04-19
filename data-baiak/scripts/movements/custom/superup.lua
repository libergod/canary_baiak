local superup = MoveEvent()

function superup.onStepIn(creature, item, position, fromPosition)

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


	local player = creature:getPlayer()
    if not player then
        return false
    end
		
    local tempo = SUPERUP.setTime * 60 * 60

		local superUpVariavel = SUPERUP.areas[item.actionid]
		if not superUpVariavel then
			player:teleportTo(fromPosition, true)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			return true
		end

		if player:getStorageValue(STORAGEVALUE_SUPERUP_INDEX) == item.actionid then
			player:sendTextMessage(MESSAGE_LOGIN, string.format("You still have %s of time remaining to your exp cave!", minimalTimers(player:getStorageValue(STORAGEVALUE_SUPERUP_TEMPO) - os.time())))
			return true
		end

		local value = SUPERUP:getCave(item.actionid)
		if not value then
			return false
		end

		local playerName = db.storeQuery(string.format("SELECT name FROM players WHERE id = %d", value.dono))
		local nome = result.getDataString(playerName, "name")

		if value.dono > 0 and value.tempo > 0 then
			player:sendTextMessage(MESSAGE_LOGIN, string.format(SUPERUP.msg.naoDisponivel, nome, os.date("%c", value.tempo)))
			player:teleportTo(fromPosition, true)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		elseif player:getStorageValue(STORAGEVALUE_SUPERUP_INDEX) >= 1 then
			player:sendCancelMessage(SUPERUP.msg.possuiCave)
			player:teleportTo(fromPosition, true)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		else
			if player:removeItem(SUPERUP.itemID, 1) then
				player:sendTextMessage(MESSAGE_LOGIN, string.format(SUPERUP.msg.disponivel, SUPERUP.setTime, SUPERUP.setTime > 1 and "hours" or "hour"))
				player:getPosition():sendMagicEffect(31)
				player:setStorageValue(STORAGEVALUE_SUPERUP_TEMPO, (os.time() + tempo))
				player:setStorageValue(STORAGEVALUE_SUPERUP_INDEX, item.actionid)
				local guid = player:getGuid()
				db.query(string.format("UPDATE exclusive_hunts SET `guid_player` = %d, `time` = %s, `to_time` = %s WHERE `hunt_id` = %d", guid, os.time(), (os.time() + tempo), item.actionid))
			else
				player:sendCancelMessage(string.format(SUPERUP.msg.naoItem, ItemType(SUPERUP.itemID):getName()))
				player:teleportTo(fromPosition, true)
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
			end
		end
		return true
end

superup:type("stepin")

for actionRange = 20000, 20020 do
	superup:aid(actionRange)
end
superup:register()
