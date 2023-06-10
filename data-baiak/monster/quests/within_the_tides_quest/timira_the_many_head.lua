local mType = Game.createMonsterType("Timira the Many-Headed")
local monster = {}

monster.description = "Timira the Many-Headed"
monster.description = "a timira the many headed"
monster.experience = 45500
monster.outfit = {
	lookType = 1542,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
	lookMount = 0
}

monster.events = {
	"dodgeCriticalThree",
	"dodgeCriticalOne",
	"dodgeCriticalTwo"
}

monster.health = 75000  
monster.maxHealth = 75000  
monster.race = "blood"
monster.corpse = 31302
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2250,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Quest.U12_90.WithinTheTides.TimiraTheManyHeads
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "You won't lead me astray!", yell = false},
	{text = "Harmony is just a vain illusion!", yell = false}
}

monster.loot = {
	{id = 39755, chance = 100000, unique = true}, -- naga basin 
	{id = 3043, chance = 100000, maxCount = 6}, -- crystal coin
	
	{id = 7643, chance = 50000, maxCount = 9}, -- ultimate health potion
	{id = 23373, chance = 40000, minCount = 3, maxCount = 19}, -- ultimate mana potion
	{id = 7440, chance = 30000, maxCount = 9}, -- mastermind potion
	{id = 7443, chance = 20000, maxCount = 9}, -- bullseye potion
	
	{id = 30060, chance = 7000, minCount = 1, maxCount = 2}, -- giant emerald
	{id = 30061, chance = 6000, minCount = 1, maxCount = 2}, -- giant sapphire
	{id = 32623, chance = 5000, minCount = 1, maxCount = 2}, -- giant topaz
	
	
	{id = 39400, chance = 500}, -- piece of timira sensor's
	{id = 39399, chance = 300}, -- one of timira's many heads
	
	{id = 39160, chance = 180}, -- naga quiver
	{id = 39165, chance = 170}, -- midnight tunic
	{id = 39167, chance = 150}, -- midnight sarong
	{id = 39155, chance = 130}, -- naga sword
	{id = 39156, chance = 120}, -- naga axe
	{id = 39157, chance = 110}, -- naga club
	{id = 39159, chance = 100}, -- naga crossbow
	{id = 39163, chance = 90}, -- naga rod
	{id = 39162, chance = 80}, -- naga wand
	{id = 39164, chance = 70}, -- dawnfire sherwani
	{id = 39166, chance = 60}, -- dawnfire pantaloons
	{id = 39235, chance = 50}, -- enchanted turtle amulet
	{id = 39161, chance = 50}, -- Feverbloom boots
	{id = 39158, chance = 50} -- Frostflower Boots
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -150, maxDamage = -230},
	
	{name ="timira fire mas", interval = 2000, chance = 30, minDamage = -560, maxDamage = -580, target = false},
	
	{name ="timira fire ring", interval = 2000, chance = 40, minDamage = -200, maxDamage = -250, target = false},
	
	{name ="timira fire bomb", interval = 2000, chance = 30, minDamage = -200, maxDamage = -350, target = false}, 
	
	{name ="timira death chain", interval = 2000, chance = 40, minDamage = -200, maxDamage = -550, target = true},
	
	{name ="timira energy ball", interval = 2000, chance = 30, minDamage = -100, maxDamage = -650, target = true},
	
	{name ="timira energy chain", interval = 2000, chance = 20, minDamage = -200, maxDamage = -450, target = true},
	
	{name ="timira energy wave", interval = 2000, chance = 10, minDamage = -300, maxDamage = -650, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 82,
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_HEALING, minDamage = 1000, maxDamage = 3000, effect = CONST_ME_INSECTS, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 10},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 10}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)