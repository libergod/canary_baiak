local safeZone = MoveEvent()

function safeZone.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    --[[
	if player:getGroup():getAccess() then
        player:teleportTo(SAFEZONE.positionEnterEvent)
        return true
    end
]]--

    if player:getLevel() < SAFEZONE.levelMin then
        player:sendCancelMessage(SAFEZONE.messages.prefix .."Voc� precisa ser level " .. SAFEZONE.levelMin .. "ou maior para entrar no evento.")
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if player:getItemCount(2165) >= 1 then
        player:sendCancelMessage(SAFEZONE.messages.prefix .."Voc� n�o pode entrar com um stealth ring no evento.")
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local ring = player:getSlotItem(CONST_SLOT_RING)
    if ring then
        if ring:getId() == 2202 then
            player:sendCancelMessage(SAFEZONE.messages.prefix .." Voc� n�o pode entrar no evento com um stealth ring.")
            player:teleportTo(fromPosition, true)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end

--[[
    for a in pairs(SAFEZONE.players) do
        target = Player(a)
        if player:getIp() == target:getIp() then
            player:sendCancelMessage(SAFEZONE.messages.prefix .. "Voc� j� possui um outro player dentro do evento.")
            player:teleportTo(fromPosition, true)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end
	]]--

    if SAFEZONE:totalPlayers() >= SAFEZONE.maxPlayers then
        player:sendCancelMessage(SAFEZONE.messages.prefix .. "O evento j� atingiu o n�mero m�ximo de participantes.")
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local outfit = player:getSex() == 0 and 136 or 128
    local treeLifeColor = SAFEZONE.lifeColor[3]
    player:setOutfit({lookType = outfit, lookHead = treeLifeColor, lookBody = treeLifeColor, lookLegs = treeLifeColor, lookFeet = treeLifeColor})

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, SAFEZONE.messages.prefix .. SAFEZONE.messages.messageEntrou)
    player:teleportTo(SAFEZONE.positionEnterEvent)
    player:setStorageValue(STORAGEVALUE_EVENTS, 1)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    player:setStorageValue(SAFEZONE.storage, 3)
    SAFEZONE:insertPlayer(player:getId())

    return true
end
safeZone:type("stepin")
safeZone:aid(6412)
safeZone:register()
