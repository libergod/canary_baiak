local config = {
	boss = {
		name = "The Unwelcome",
		position = Position(1012, 385, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1041, 387, 8), teleport = Position(1014, 396, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1042, 387, 8), teleport = Position(1014, 396, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1043, 387, 8), teleport = Position(1014, 396, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1044, 387, 8), teleport = Position(1014, 396, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1045, 387, 8), teleport = Position(1014, 396, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1001, 379, 8),
		to = Position(1026, 399, 8)
	},
	exit = Position(1050, 387, 8),
	storage = Storage.Quest.U12_30.FeasterOfSouls.UnwelcomeTimer
}

local unwelcomeLever = Action()
function unwelcomeLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return CreateDefaultLeverBoss(player, config)
end

unwelcomeLever:position({x = 1040, y = 387, z = 8})
unwelcomeLever:register()