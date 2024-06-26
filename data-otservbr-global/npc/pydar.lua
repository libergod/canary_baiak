local internalNpcName = "Pydar"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = { }

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 95,
	lookBody = 94,
	lookLegs = 132,
	lookFeet = 118,
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

-- Spark of the Phoenix
local blessKeyword = keywordHandler:addKeyword({'spark of the phoenix'}, StdModule.say, {npcHandler = npcHandler, text = 'The Spark of the Phoenix is given by me and by the great geomancer of the local earth temple. Do you wish to receive my part of the Spark of the Phoenix for |BLESSCOST| gold?'})
	blessKeyword:addChildKeyword({'yes'}, StdModule.bless, {npcHandler = npcHandler, text = 'So receive the spark of the phoenix, pilgrim.', cost = '|BLESSCOST|', bless = 3})
	blessKeyword:addChildKeyword({''}, StdModule.say, {npcHandler = npcHandler, text = 'Maybe another time.', reset = true})
	keywordHandler:addAliasKeyword({'spark'})
	keywordHandler:addAliasKeyword({'phoenix'})

-- Basic
keywordHandler:addKeyword({'gods'}, StdModule.say, {npcHandler = npcHandler, text = 'The ways of the gods are imprehensible to mortals. On the other hand, the elements are raw forces and can be understood and tamed.'})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, text = 'I am the head pyromancer of Kazordoon.'})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, text = 'My name is Pydar Firefist, Son of Fire, from the Savage Axes.'})
keywordHandler:addKeyword({'quest'}, StdModule.say, {npcHandler = npcHandler, text = 'Ask around. There\'s a lot to do, jawoll.'})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, text = 'That is our world.'})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, text = 'It\'s the fourth age of the yellow flame.'})
keywordHandler:addKeyword({'monsters'}, StdModule.say, {npcHandler = npcHandler, text = 'May the great flame devour them all!'})
keywordHandler:addKeyword({'life'}, StdModule.say, {npcHandler = npcHandler, text = 'Life feeds on fire and ultimately fire will feed on life.'})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, text = 'A weapon too powerful to be wielded by mortals. It has to be returned to the fire which gave birth to it.'})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, text = 'If he ever dares enter Kazordoon I will gladly dump him into the lava. Tthe sacred flame shall bring justice upon him.'})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, text = 'Our city was founded in ancient times. Abandoned by the gods we once fought for, we created a secure haven for our people.'})
keywordHandler:addKeyword({'the big old one'}, StdModule.say, {npcHandler = npcHandler, text = 'This mountain is said to be the oldest in the world. It is the place where fire and earth meet and separate at the same time.'})
keywordHandler:addKeyword({'bezil'}, StdModule.say, {npcHandler = npcHandler, text = 'Bezil and Nezil are buying and selling equipment of all kinds.'})
keywordHandler:addKeyword({'nezil'}, StdModule.say, {npcHandler = npcHandler, text = 'Bezil and Nezil are buying and selling equipment of all kinds.'})
keywordHandler:addKeyword({'duria'}, StdModule.say, {npcHandler = npcHandler, text = 'She is the first knight of Kazordoon. She is responsible for teaching our young warriors how to handle an axe.'})
keywordHandler:addKeyword({'etzel'}, StdModule.say, {npcHandler = npcHandler, text = 'Etzel is a true master of the elements. He is a role-model for our youngsters, jawoll.'})
keywordHandler:addKeyword({'jimbin'}, StdModule.say, {npcHandler = npcHandler, text = 'He and his wife are running the Jolly Axeman tavern.'})
keywordHandler:addKeyword({'kroox'}, StdModule.say, {npcHandler = npcHandler, text = 'He is a smith. If you are looking for exquisite weapons and armour just talk to him.'})
keywordHandler:addKeyword({'maryza'}, StdModule.say, {npcHandler = npcHandler, text = 'She and her husband are running the Jolly Axeman tavern.'})
keywordHandler:addKeyword({'uzgod'}, StdModule.say, {npcHandler = npcHandler, text = 'Uzgod is a weaponsmith just like those in the old legends.'})
keywordHandler:addKeyword({'durin'}, StdModule.say, {npcHandler = npcHandler, text = 'Though we are through with the so-called gods, Durin, the first dwarf to aquire divine powers of his own, is considered a protector of our race.'})
keywordHandler:addKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, text = 'Unlike the gods, the elements don\'t use mortals as toys, A skilled mind can understand and even control them to some extent.'})
keywordHandler:addKeyword({'keeper'}, StdModule.say, {npcHandler = npcHandler, text = 'The ways of the gods are imprehensible to mortals. On the other hand, the elements are raw forces and can be understood and tamed.'})
keywordHandler:addKeyword({'spiritual'}, StdModule.say, {npcHandler = npcHandler, text = 'You can receive the Spiritual Shielding in the Whiteflower Temple south of Thais.'})
keywordHandler:addKeyword({'suns'}, StdModule.say, {npcHandler = npcHandler, text = 'Ask for the Fire of the Suns in the Suntower near Ab\'Dendriel.'})
keywordHandler:addKeyword({'embrace'}, StdModule.say, {npcHandler = npcHandler, text = 'The druids north of Carlin can provide you with the Embrace of Tibia.'})
keywordHandler:addKeyword({'solitude'}, StdModule.say, {npcHandler = npcHandler, text = 'Talk to the hermit Eremo on the isle of Cormaya about this blessing.'})
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = text}, function(player) return player:getCondition(CONDITION_FIRE) ~= nil end)
keywordHandler:addKeyword({'heal'}, StdModule.say, {npcHandler = npcHandler, text = 'You aren\'t looking that bad. Sorry, I can\'t help you. But if you are looking for additional protection you should go on the {pilgrimage} of ashes.'})
keywordHandler:addKeyword({'pilgrimage'}, StdModule.say, {npcHandler = npcHandler, text = 'I\'m the head pyromancer of Kazordoon. I guess you are here for healing or looking for a blessing.'})
keywordHandler:addKeyword({'blessing'}, StdModule.say, {npcHandler = npcHandler, text = 'There are five different blessings available in five sacred places. These blessings are: the {spiritual} shielding, the spark of the {phoenix}, the {embrace} of Tibia, the fire of the {suns} and the wisdom of {solitude}.'})
keywordHandler:addKeyword({'pyromancer'}, StdModule.say, {npcHandler = npcHandler, text = 'We are the keepers and shepherds of the elemental force of {fire}.'})

npcHandler:setMessage(MESSAGE_GREET, 'Be greeted |PLAYERNAME|! I can smell the scent of a phoenix on you!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'May the fire in your heart never die, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'May the fire in your heart never die.')

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
