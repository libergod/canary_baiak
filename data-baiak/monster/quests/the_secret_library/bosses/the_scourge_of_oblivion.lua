local mType = Game.createMonsterType("The Scourge Of Oblivion")
local monster = {}

monster.name = "The Scourge Of Oblivion"
monster.description = "The Scourge Of Oblivion"
monster.experience = 75000
monster.outfit = {
	lookType = 875,
	lookHead = 79,
	lookBody = 3,
	lookLegs = 4,
	lookFeet = 2,
	lookAddons = 3,
	lookMount = 0
}

monster.events = {
	"dodgeCriticalThree",
	"dodgeCriticalOne",
	"dodgeCriticalTwo",
	"transformScourge",
	"noDamageSourceOfOblivion"
}

monster.health = 650000
monster.maxHealth = 650000
monster.race = "venom"
monster.corpse = 23561
monster.speed = 225
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 25
}

monster.bosstiary = {
	bossRaceId = 1642,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Quest.U11_80.TheSecretLibrary.ScourgeOfOblivionTimer
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "I AM DEVOURER!", yell = true}
}

monster.loot = {
	{name = "platinum coin", chance = 100000, maxCount = 15},
	{name = "crystal coin", chance = 100000, maxCount = 7},
	{name = "green crystal shard", chance = 100000, maxCount = 3},
	{name = "violet crystal shard", chance = 100000, maxCount = 3},
	{name = "spark sphere", chance = 100000},
	{name = "plasmatic lightning", chance = 100000},
	{name = "emerald bangle", chance = 100000},
	{name = "royal star", chance = 66666, maxCount = 100},
	{name = "small amethyst", chance = 66666, maxCount = 12},
	{name = "silver token", chance = 66666, maxCount = 12},
	{name = "mastermind potion", chance = 66666, maxCount = 10},
	{name = "ultimate mana potion", chance = 66666, maxCount = 6},
	{name = "giant emerald", chance = 66666},
	{id= 3039, chance = 66666}, -- red gem
	{name = "small ruby", chance = 33333, maxCount = 12},
	{name = "bullseye potion", chance = 33333, maxCount = 10},
	{name = "gold token", chance = 33333, maxCount = 8},
	{name = "supreme health potion", chance = 33333, maxCount = 6},
	{name = "blue crystal shard", chance = 33333, maxCount = 3},
	{name = "giant sapphire", chance = 33333},
	{name = "green gem", chance = 33333},
	{id = 23542, chance = 33333}, -- collar of blue plasma
	{name = "huge chunk of crude iron", chance = 33333},
	{name = "magic sulphur", chance = 33333},
	{name = "ring of the sky", chance = 33333},
	{name = "ultimate spirit potion", chance = 15000, maxCount = 20},
	{name = "small diamond", chance = 15000, maxCount = 12},
	{name = "small emerald", chance = 15000, maxCount = 12},
	{name = "rift shield", chance = 5000},
	{id = 281, chance = 5000}, -- giant shimmering pearl (green)
	{id = 3341, chance = 5000}, -- arcane staff
	{name = "skullcracker armor", chance = 5000},
	{name = "chaos mace", chance = 5000},
	{name = "cat's paw", chance = 5000},
	{name = "piggy bank", chance = 5000},
	{name = "mysterious remains", chance = 5000},
	{name = "energy bar", chance = 5000},
	{name = "library ticket", chance = 500, unique = true},
	{name = "calamity", chance = 500, unique = true}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, skill = 250, attack = 350}
}

monster.defenses = {
	defense = 40,
	armor = 30,
	{name ="combat", interval = 6000, chance = 25, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 5000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000}
}

monster.reflects = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
