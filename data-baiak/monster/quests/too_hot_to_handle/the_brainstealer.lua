local mType = Game.createMonsterType("The Brainstealer")
local monster = {}

monster.description = "The Brainstealer"
monster.description = "a brainstealer"
monster.experience = 72000
monster.outfit = {
	lookType = 1412,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.events = {
	"dodgeCriticalThree",
	"dodgeCriticalOne",
	"dodgeCriticalTwo"
}

monster.health = 300000  
monster.maxHealth = 300000  
monster.race = "blood"
monster.corpse = 36843
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2055,
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Quest.U12_70.TooHotToHandle.TheBrainstealerTimer
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

monster.summon = {
	maxSummons = 2,
	summons = {
		{name = "Blasting Flame", chance = 30, interval = 3000},
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{id = 3043, chance = 100000, maxCount = 3}, -- crystal coin
	{id = 3035, chance = 70000, maxCount = 29}, -- platinum coin
	{id = 23374, chance = 55000, maxCount = 19}, -- great spirit potion
	{id = 7643, chance = 50000, maxCount = 9}, -- ultimate health potion
	{id = 239, chance = 45000, maxCount = 19}, -- great health potion
	{id = 238, chance = 40000, maxCount = 19}, -- great mana potion
	{id = 23373, chance = 40000, minCount = 3, maxCount = 19}, -- ultimate mana potion
	{id = 7440, chance = 30000, maxCount = 9}, -- mastermind potion
	{id = 7443, chance = 30000, maxCount = 9}, -- bullseye potion
	{id = 36794, chance = 19000}, -- brainstealer tissue
	{id = 3036, chance = 18000, minCount = 1, maxCount = 2}, -- violet gem
	{id = 36795, chance = 17000}, -- brainstealer's brain
	{id = 36835, chance = 16000}, -- eldritch crystal
	{id = 30059, chance = 15000, minCount = 1, maxCount = 2}, -- giant ruby
	{id = 30061, chance = 15000, minCount = 1, maxCount = 2}, -- giant sapphire
	{id = 36796, chance = 9000}, -- brainstealer's brainwave
	{id = 34025, chance = 5000}, -- diabolic skull
	{id = 36659, chance = 1000}, -- eldritch warmace
	{id = 36668, chance = 300}, -- eldritch wand
	{id = 36674, chance = 270}, -- eldritch rod
	{id = 36661, chance = 250}, -- eldritch axe
	{id = 36657, chance = 230}, -- eldritch claymore
	{id = 36664, chance = 210}, -- eldritch bow
	{id = 36663, chance = 200}, -- eldritch cuirass
	{id = 36671, chance = 190}, -- eldritch hood
	{id = 36670, chance = 180}, -- eldritch cowl
	{id = 36667, chance = 170}, -- eldritch breeches
	{id = 36666, chance = 150}, -- eldritch quiver
	{id = 36656, chance = 130}, -- eldritch shield
	{id = 36672, chance = 120}, -- eldritch folio
	{id = 36673, chance = 110}, -- eldritch tome
	{id = 36660, chance = 100}, -- gilded eldritch warmace
	{id = 36669, chance = 90}, -- gilded eldritch wand
	{id = 36675, chance = 80}, -- gilded eldritch rod
	{id = 36662, chance = 70}, -- gilded eldritch axe
	{id = 36658, chance = 60}, -- gilded eldritch claymore
	{id = 36665, chance = 50} -- gilded eldritch bow
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -550},
	
	{name ="brainsteler death", interval = 2000, chance = 50, minDamage = -1000, maxDamage = -1550, target = true},
	
	{name ="brainstealer spark beam", interval = 2000, chance = 30, minDamage = -1000, maxDamage = -1200, target = false},
	
	{name ="brainsteller blood ring", interval = 2000, chance = 40, minDamage = -600, maxDamage = -885, target = false}
}

monster.defenses = {
	defense = 60,
	armor = 82,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 100}
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