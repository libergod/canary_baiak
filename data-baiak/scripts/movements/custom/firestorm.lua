local firestorm = MoveEvent()

function firestorm.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

--[[
    if player:getGroup():getAccess() then
        player:teleportTo(FSE.teleport.destination)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Voc� est� participando apenas como espectador.")
        return true
    end
]]--

    if player:getLevel() < FSE.players.levelMin then
        player:sendCancelMessage(FSE.msg.prefix .."Voc� precisa ser level " .. FSE.players.levelMin .. " ou maior para entrar no evento.")
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if player:getItemCount(2165) >= 1 then
        player:sendCancelMessage(FSE.msg.prefix .."Voc� n�o pode entrar com um stealth ring no evento.")
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local ring = player:getSlotItem(CONST_SLOT_RING)
    if ring then
        if ring:getId() == 2202 then
            player:sendCancelMessage(FSE.msg.prefix .." Voc� n�o pode entrar no evento com um stealth ring.")
            player:teleportTo(fromPosition, true)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end

--[[
    for _, check in ipairs(Game.getPlayers()) do
        if player:getIp() == check:getIp() and check:getStorageValue(STORAGEVALUE_EVENTS) > 0 then
            player:sendCancelMessage(FSE.msg.prefix .. "Voc� j� possui um outro player dentro do evento.")
            player:teleportTo(fromPosition, true)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end
]]--

    if #FSE:GetPlayers() >= FSE.players.max then
        player:sendCancelMessage(FSE.msg.prefix .. "O evento j� atingiu o n�mero m�ximo de participantes.")
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, FSE.msg.prefix .. FSE.msg.entranceNew)
    player:teleportTo(FSE.teleport.destination)
    player:setStorageValue(STORAGEVALUE_EVENTS, 1)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

    return true
end

firestorm:type("stepin")
firestorm:aid(64500)
firestorm:register()