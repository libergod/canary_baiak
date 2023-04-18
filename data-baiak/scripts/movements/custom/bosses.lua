local bossess = MoveEvent()

function bossess.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

--[[
    if player:getGroup():getAccess() then
        player:teleportTo(Bosses.posDestino)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Boss] Voc� est� participando apenas como espectador.")
        return true
    end
]]--

    if player:getLevel() < Bosses.level.levelMin and Bosses.level.active then
        player:sendCancelMessage("[Boss] Voc� precisa ser level " .. Bosses.level.levelMin .. " ou maior para entrar no evento.")
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if player:getItemCount(2165) >= 1 then
        player:sendCancelMessage("[Boss] Voc� n�o pode entrar com um stealth ring no evento.")
        player:teleportTo(fromPosition, true)
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local ring = player:getSlotItem(CONST_SLOT_RING)
    if ring then
        if ring:getId() == 2202 then
            player:sendCancelMessage("[Boss] Voc� n�o pode entrar no evento com um stealth ring.")
            player:teleportTo(fromPosition, true)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end

--[[
    for _, check in ipairs(Game.getPlayers()) do
        if player:getIp() == check:getIp() and check:getStorageValue(STORAGEVALUE_EVENTS) > 0 then
            player:sendCancelMessage("[Boss] Voc� j� possui um outro player dentro do evento.")
            player:teleportTo(fromPosition, true)
            player:getPosition():sendMagicEffect(CONST_ME_POFF)
            return true
        end
    end
]]--

    player:teleportTo(Bosses.posDestino)
    player:sendCancelMessage("[Boss] Boa sorte.")
    player:setStorageValue(STORAGEVALUE_EVENTS, 1)
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)

    return true
end

bossess:type("stepin")
bossess:aid(4247)
bossess:register()