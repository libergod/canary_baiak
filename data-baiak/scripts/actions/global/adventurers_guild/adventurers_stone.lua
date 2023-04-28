local setting = {
	{fromPos = Position(989, 1208, 7), toPos = Position(993, 1211, 7), townId = TOWNS_LIST.REAL_CITY},
	{fromPos = Position(724, 1387, 7), toPos = Position(726, 1389, 7), townId = TOWNS_LIST.JAH_ISLAND},
	{fromPos = Position(977, 1408, 8), toPos = Position(983, 1416, 8), townId = TOWNS_LIST.KRAVHZI},
	{fromPos = Position(1067, 1294, 7), toPos = Position(1073, 1300, 7), townId = TOWNS_LIST.AL_NAHF},
	{fromPos = Position(1234, 1308, 3), toPos = Position(1242, 1313, 3), townId = TOWNS_LIST.BKRIANZ},
	{fromPos = Position(811, 1088, 7), toPos = Position(818, 1094, 7), townId = TOWNS_LIST.ICELAND},
	{fromPos = Position(1311, 1011, 6), toPos = Position(1314, 1014, 6), townId = TOWNS_LIST.WOODZBROCK},
	{fromPos = Position(472, 1362, 7), toPos = Position(476, 1366, 7), townId = TOWNS_LIST.PREMIA_ISLAND}
}

local adventurersStone = Action()

function adventurersStone.onUse(player, item, fromPosition, target, toPosition, isHotkey)

	local playerPos, isInTemple, temple, townId = player:getPosition(), false
	for i = 1, #setting do
		temple = setting[i]
		if isInRange(playerPos, temple.fromPos, temple.toPos) then
			if Tile(playerPos):hasFlag(TILESTATE_PROTECTIONZONE) then
				isInTemple, townId = true, temple.townId
				break
			end
		end
	end

	if not isInTemple then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Try to move more to the center of a temple to use the spiritual energy for a teleport.')
		return true
	end

	player:setStorageValue(Storage.AdventurersGuild.Stone, townId)
	playerPos:sendMagicEffect(CONST_ME_TELEPORT)

	local destination = Position(1071, 1026, 6)
		player:teleportTo(destination)
		destination:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

adventurersStone:id(16277)
adventurersStone:register()
