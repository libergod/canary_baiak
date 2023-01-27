local EventsList = {
    ["Sunday"] = {
  		{name = "SnowBall", time = "10:00"},
  		{name = "Battlefield", time = "15:00"},
  		{name = "SafeZone", time = "20:10"},
    },
    ["Monday"] = {
  		{name = "SnowBall", time = "10:00"},
  		{name = "Battlefield", time = "15:00"},
  		{name = "SafeZone", time = "20:10"},
    },
    ["Tuesday"] = {
  		{name = "SnowBall", time = "10:00"},
  		{name = "Battlefield", time = "15:00"},
  		{name = "SafeZone", time = "20:10"},
    },
    ["Wednesday"] = {
  		{name = "SnowBall", time = "10:00"},
  		{name = "Battlefield", time = "15:00"},
  		{name = "SafeZone", time = "20:10"},
    },
    ["Thursday"] = {
  		{name = "SnowBall", time = "10:00"},
  		{name = "Battlefield", time = "15:00"},
  		{name = "SafeZone", time = "20:00"},
    },
    ["Friday"] = {
  		{name = "SnowBall", time = "12:00"},
  		{name = "Battlefield", time = "15:00"},
  		{name = "SafeZone", time = "20:00"},
    },
    ["Saturday"] = {
  		{name = "SnowBall", time = "12:00"},
  		{name = "Battlefield", time = "15:00"},
  		{name = "SafeZone", time = "20:00"},
    },
}

local position = Position(1003, 1217, 7)

local eventsShow = GlobalEvent("eventsShow")
function eventsShow.onThink(interval, lastExecution)
	local spectators = Game.getSpectators(position, false, true, 7, 7, 5, 5)
	local event = EventsList[os.date("%A")]
	for a, b in pairs(event) do
		local eventTime = hourToNumber(b.time)
		local realTime = hourToNumber(os.date("%H:%M:%S"))
		if eventTime >= realTime then
			if #spectators > 0 then
				for i = 1, #spectators do
					local tile = Tile(position)
					if tile then
						local item = tile:getItemById(1949)
						if item then
							if item:getActionId() == Bosses.actionIdTp then
								spectators[i]:say("[BOSS] ".. Bosses:getBossName() .."!", TALKTYPE_MONSTER_SAY, false, spectators[i], position)
								position:sendMagicEffect(56)
								position:sendMagicEffect(57)
							else
								spectators[i]:say("Participe agora\ndo evento!", TALKTYPE_MONSTER_SAY, false, spectators[i], position)
								position:sendMagicEffect(56)
								position:sendMagicEffect(57)
							end
							return true
						else
							spectators[i]:say("Pr�ximo evento:\n"..b.name.." �s "..b.time..".", TALKTYPE_MONSTER_SAY, false, spectators[i], position)
							position:sendMagicEffect(40)
							return true
						end
					end
				end
        	end
	    end
 	end
	return true
end
eventsShow:interval(4000)
eventsShow:register()