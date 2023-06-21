local config = {
	boss = {
		name = "The Pale Worm",
		position = Position(1105, 350, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 25 * 60,
	playerPositions = {
		{pos = Position(1072, 350, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1073, 350, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1074, 350, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1075, 350, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1073, 349, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1074, 349, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1075, 349, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1073, 351, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1074, 351, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1075, 351, 8), teleport = Position(1109, 360, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1093, 339, 8),
		to = Position(1120, 365, 8)
	},
	exit = Position(1080, 350, 8),
	storage = Storage.Quest.U12_30.FeasterOfSouls.PaleWormTimer
}

local paleWormLever = Action()
function paleWormLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return CreateDefaultLeverBoss(player, config)
end

paleWormLever:position({x = 1071, y = 350, z = 8})
paleWormLever:register()