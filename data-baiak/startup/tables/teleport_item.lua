-- Look README.md for see the reserved action/unique numbers
-- This file is only for teleports items (miscellaneous) not for magic forcefields

TeleportItemAction = {
	-- Feyrist shrines entrance
	-- Path: data\scripts\actions\other\gems.lua
	--[[
	[15001] = {
		itemId = false,
		itemPos = {
			{x = 32194, y = 31418, z = 2},
			{x = 32194, y = 31419, z = 2},
			{x = 32195, y = 31418, z = 2},
			{x = 32195, y = 31419, z = 2}
		},
	},
	]]--
}

TeleportItemUnique = {
--[[

	[15001] = {
		itemId = 31673,
		itemPos = {x = 33315, y = 32647, z = 6},
		destination = {x = 33384, y = 32627, z = 7},
		effect = CONST_ME_TELEPORT
	}
	]]--
}
