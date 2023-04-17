local mType = Game.createMonsterType("Parrot")
local monster = { }

monster.description = "a parrot"
monster.experience = 0
monster.outfit = {
	lookType = 217,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 217
monster.Bestiary = {
	class = "Bird",
	race = BESTY_RACE_BIRD,
	toKill = 250,
	FirstUnlock = 10,
	SecondUnlock = 100,
	CharmsPoints = 5,
	Stars = 1,
	Occurrence = 0,
	Locations = "In the jungle of Tiquanda, Liberty Bay, the Shattered Isles, and as a house pet in Meriana."
	}

monster.health = 25
monster.maxHealth = 25
monster.race = "blood"
monster.corpse = 6056
monster.speed = 160
monster.manaCost = 250

monster.changeTarget = {
	interval = 5000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = false,
	convinceable = true,
	pushable = true,
	rewardBoss = false,
	illusionable = true,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 25,
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
	{text = "BR? PL? SWE?", yell = false},
	{text = "Screeech!", yell = false},
	{text = "Neeewbiiieee!", yell = false},
	{text = "You advanshed, you advanshed!", yell = false},
	{text = "Hope you die and loooosh it!", yell = false},
	{text = "Hunterrr ish PK!", yell = false},
	{text = "Shhtop whining! Rraaah!", yell = false},
	{text = "I'm heeerrre! Screeeech!", yell = false},
	{text = "Leeave orrr hunted!!", yell = false},
	{text = "Blesshhh my stake! Screeech!", yell = false},
	{text = "Tarrrrp?", yell = false},
	{text = "You are corrrrupt! Corrrrupt!", yell = false},
	{text = "You powerrrrrrabuserrrrr!", yell = false},
	{text = "You advanshed, you advanshed!", yell = false}
}

monster.loot = {
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -5}
}

monster.defenses = {
	defense = 5,
	armor = 2
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
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = false},
	{type = "bleed", condition = false}
}

mType:register(monster)
