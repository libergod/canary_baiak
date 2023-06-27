local function clearArea()
	--Room 1
	local upConer = {x = 1001, y = 378, z = 8}       -- upLeftCorner
	local downConer = {x = 1026, y = 400, z = 8}     -- downRightCorner

	for i=upConer.x, downConer.x do
		for j=upConer.y, downConer.y do
        	for k= upConer.z, downConer.z do
		        local room = {x=i, y=j, z=k}
				local tile = Tile(room)
				if tile then
					local creatures = tile:getCreatures()
					if creatures and #creatures > 0 then
						for _, c in pairs(creatures) do
							if isPlayer(c) then
								c:teleportTo({x = 1049, y = 387, z = 8})
							elseif isMonster(c) then
								c:remove()
							end
						end
					end
				end
			end
		end
	end
end


bossConfig = {
    [34000] = {  -- ActionID
        requiredLevel = 150,
        minPlayersRequired = 1,

        boss = "Brokul",
        bossGlobalStorage = 35000,
        playerStorage = 36000,
        teleportPosition = Position(1046, 432, 8),
        centerRoomPosition = Position(1047, 426, 8),
        northRange = 15, eastRange = 15, southRange = 15, westRange = 15,
        exit = Position(1015, 431, 8),
        bossPosition = Position(1047, 424, 8),
        time = 15,

        playerPositions = {
            [1] = Position(1013, 428, 8),
            [2] = Position(1014, 428, 8),
            [3] = Position(1015, 428, 8),
            [4] = Position(1016, 428, 8),
            [5] = Position(1017, 428, 8)
        }
    }
}

local function resetBoss(bossConfig, bossId)
    local monster = Monster(bossId)
    if monster then
        monster:remove()
    end
    local spectators = Game.getSpectators(bossConfig.centerRoomPosition, false, true, bossConfig.westRange, bossConfig.eastRange, bossConfig.northRange, bossConfig.southRange)
    for i = 1, #spectators do
        spectators[i]:teleportTo(bossConfig.exit)
    end
end

local secretBrokul = Action()
function secretBrokul.onUse(player, item, fromPosition, target, toPosition, isHotkey)
   
    if item.itemid == 2773 then
        local bossConfig = bossConfig[item:getActionId()]
        if not bossConfig then
            return false
        end
 
        if (getGlobalStorageValue(bossConfig.bossGlobalStorage) > 0) then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There is already a team inside. Please wait.")
            return true
        end
 
        local errorMsg
        local rPlayers = {}
        for index, ipos in pairs(bossConfig.playerPositions) do
            local playerTile = Tile(ipos):getTopCreature()
            if playerTile then
                if playerTile:isPlayer() then
                    if playerTile:getLevel() >= bossConfig.requiredLevel then
                        if playerTile:getStorageValue(bossConfig.playerStorage) <= os.time() then
                            table.insert(rPlayers, playerTile:getId())
                        else
                            errorMsg = 'One or more players have already entered in the last 20 hours.'
                        end
                    else
                        errorMsg = 'All the players need to be level '.. bossConfig.requiredLevel ..' or higher.'
                    end
                end
            end
        end
 
        if (#rPlayers >= bossConfig.minPlayersRequired) then
            for _, pid in pairs(rPlayers) do
                local rplayer = Player(pid)
                if rplayer:isPlayer() then
                    rplayer:sendTextMessage(MESSAGE_EVENT_ADVANCE, ('You have %o minutes before you get kicked out.'):format(bossConfig.time))
                    bossConfig.playerPositions[_]:sendMagicEffect(CONST_ME_POFF)
                    rplayer:teleportTo(bossConfig.teleportPosition)
                    rplayer:setStorageValue(bossConfig.playerStorage, os.time() + (20 * 60 * 60))
                    bossConfig.teleportPosition:sendMagicEffect(CONST_ME_ENERGYAREA)
                    rplayer:setDirection(DIRECTION_NORTH)
                end
            end
            setGlobalStorageValue(bossConfig.bossGlobalStorage, 1)
            addEvent(setGlobalStorageValue, bossConfig.time * 60 * 1000, bossConfig.bossGlobalStorage, 0)
            local monster = Game.createMonster(bossConfig.boss, bossConfig.bossPosition)
			Game.createMonster("Neutral Deepling Warrior", {x = 1043, y = 422, z = 8}, false, true)
			Game.createMonster("Neutral Deepling Warrior", {x = 1051, y = 422, z = 8}, false, true)
			Game.createMonster("Neutral Deepling Warrior", {x = 1043, y = 430, z = 8}, false, true)
			Game.createMonster("Neutral Deepling Warrior", {x = 1052, y = 430, z = 8}, false, true)
			
            addEvent(resetBoss, bossConfig.time * 60 * 1000, bossConfig, monster and monster.uid or 0)
        else
            if not errorMsg then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, ("You need %u players."):format(bossConfig.minPlayersRequired))
            else
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, errorMsg)
            end
            return true
        end
 
    end
    item:transform(item.itemid == 2773 and 2772 or 2773)
 
    return true
end

secretBrokul:aid(34000)
secretBrokul:register()