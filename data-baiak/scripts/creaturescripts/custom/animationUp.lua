local addLevelUpAnimation = CreatureEvent("addLevelUpAnimation")

function addLevelUpAnimation.onAdvance(player, skill, oldLevel, newLevel)

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	local position = player:getPosition()
	local positions = {
		[1] = Position(position.x + 2, position.y, position.z),
		[2] = Position(position.x + 2, position.y + 2, position.z),
		[3] = Position(position.x, position.y + 2, position.z),
		[4] = Position(position.x - 2, position.y + 2, position.z),
		[5] = Position(position.x - 2, position.y, position.z),
		[6] = Position(position.x - 2, position.y - 2, position.z),
		[7] = Position(position.x, position.y - 2, position.z),
		[8] = Position(position.x + 2, position.y - 2, position.z)
	}
	
	local efeito = 50
	local shot = 31
	
	if newLevel > oldLevel then
		for _, pos in ipairs(positions) do
			position:sendDistanceEffect(pos, shot)
			pos:sendMagicEffect(efeito)
		end
		player:say("[LEVEL UP]", TALKTYPE_MONSTER_SAY)
		position:sendMagicEffect(40)
		
		-- RESET RESTORE EXP TO PREVENT BUGS
		
		-- RESTORE EXP SYSTEM
		local usrExist = db.storeQuery("SELECT `id` FROM `player_exp_restore` WHERE `id_player` = " .. player:getGuid() .. " LIMIT 1")
		if usrExist ~= false then
			local iduser = result.getDataInt(usrExist, 'id')
			result.free(usrExist)
			-- iduser (Id do user ja existente na tabela)
			-- DIED FOR PLAYER, SO CANT RESTORE EXP
			db.query('UPDATE `player_exp_restore` SET `expAfter` = -1 where `id_player`='..player:getGuid())
			db.query('UPDATE `player_exp_restore` SET `expBefore` = -1 where `id_player`='..player:getGuid())
			db.query('UPDATE `player_exp_restore` SET `canRestore` = -1 where `id_player`='..player:getGuid())
		else	
			db.query(string.format("INSERT INTO `player_exp_restore`(`id_player`, `expBefore`, `expAfter`, `canRestore`) VALUES (%s, %s, %s, %s)", player:getGuid(), "-1", "-1", "-1"))
		end
		
	end

	return true
end

addLevelUpAnimation:register()