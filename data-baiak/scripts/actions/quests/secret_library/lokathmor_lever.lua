local config = {
	boss = {
		name = "Lokathmor",
		position = Position(1172, 395, 8)
	},
	requiredLevel = 250,
	timeToFightAgain = 20 * 60 * 60,
	timeToDefeatBoss = 20 * 60,
	playerPositions = {
		{pos = Position(1142, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1143, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1144, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1145, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT},
		{pos = Position(1146, 455, 8), teleport = Position(1172, 401, 8), effect = CONST_ME_TELEPORT}
	},
	specPos = {
		from = Position(1162, 385, 8),
		to = Position(1182, 405, 8)
	},
	exit = Position(1143, 452, 8),
	storage = Storage.Quest.U11_80.TheSecretLibrary.LokathmorTimer
}

local lokathmorLever = Action()
function lokathmorLever.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return CreateDefaultLeverBoss(player, config)
end

lokathmorLever:position({x = 1141, y = 455, z = 8})
lokathmorLever:register()