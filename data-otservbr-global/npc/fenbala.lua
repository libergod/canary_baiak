local internalNpcName = "Fenbala"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = { }

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 139,
	lookHead = 77,
	lookBody = 71,
	lookLegs = 100,
	lookFeet = 115,
	lookAddons = 0
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

keywordHandler:addKeyword({'hi'}, StdModule.say, {npcHandler = npcHandler, onlyUnfocus = true, text = "MIND YOUR MANNERS COMMONER! To address the queen greet with her title!"})
keywordHandler:addKeyword({'hello'}, StdModule.say, {npcHandler = npcHandler, onlyUnfocus = true, text = "MIND YOUR MANNERS COMMONER! To address the queen greet with her title!"})

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if isInArray({'fuck', 'idiot', 'asshole', 'ass', 'fag', 'stupid', 'tyrant', 'shit', 'lunatic'}, message) then
		local player = Player(creature)
		local conditions = { CONDITION_POISON, CONDITION_FIRE, CONDITION_ENERGY, CONDITION_BLEEDING, CONDITION_PARALYZE, CONDITION_DROWN, CONDITION_FREEZING, CONDITION_DAZZLED, CONDITION_CURSED }
		for i = 1, #conditions do
			if player:getCondition(conditions[i]) then
				player:removeCondition(conditions[i])
			end
		end
		player:getPosition():sendMagicEffect(CONST_ME_EXPLOSIONAREA)
		player:addHealth(1 - player:getHealth())
		npcHandler:say('Take this!', npc, creature)
		npc:getPosition():sendMagicEffect(CONST_ME_YELLOW_RINGS)
	end
	return true
end

-- Greeting
keywordHandler:addGreetKeyword({'hail queen'}, {npcHandler = npcHandler, text = 'HAIL TO THE QUEEN!'})
keywordHandler:addGreetKeyword({'salutations queen'}, {npcHandler = npcHandler, text = 'HAIL TO THE QUEEN!'})

npcHandler:setMessage(MESSAGE_WALKAWAY, 'LONG LIVE THE QUEEN!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'LONG LIVE THE QUEEN! You may leave now!')

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
