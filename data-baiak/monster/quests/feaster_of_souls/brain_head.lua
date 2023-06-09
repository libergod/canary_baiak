local mType = Game.createMonsterType("Brain Head")
local monster = {}

monster.name = "Brain Head"
monster.description = "Brain Head"
monster.experience = 50000
monster.outfit = {
	lookTypeEx = 32418,
	lookType = 0,
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
	"dodgeCriticalTwo",
	"brainHeadHeal"
}

monster.health = 230000
monster.maxHealth = 230000
monster.race = "blood"
monster.corpse = 32272
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 0

monster.bosstiary = {
	bossRaceId = 1862, -- 
	bossRace = RARITY_ARCHFOE,
	storageCooldown = Storage.Quest.U12_30.FeasterOfSouls.BrainHeadTimer
}

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 5,
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

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -200, maxDamage = -550},
	
	{name ="combat", interval = 3000, chance = 30, type = COMBAT_FIREDAMAGE, minDamage = -680, maxDamage = -860, range = 7, radius = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	
	{name ="brainhead firewave", interval = 1800, chance = 30, minDamage = -515, maxDamage = -665, target = false},
	
	{name ="brainhead wave energy", interval = 2000, chance = 20, minDamage = -400, maxDamage = -550, target = false}
}

monster.defenses = {
	defense = 70,
	armor = 70
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -70},
	{type = COMBAT_ENERGYDAMAGE, percent = 90},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = -30},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
	{type = COMBAT_DEATHDAMAGE , percent = -40}
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
