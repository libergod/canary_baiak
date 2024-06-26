local bomberman = MoveEvent()

function bomberman.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end
		
	if item:getActionId() == 19001 then
		if player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SIZE) == 10 then	
			player:sendCancelMessage("[BOMBERMAN] - Sua bomba atinge o m�ximo (+10) de sqms.")
			return true
		end
		player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SIZE, player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SIZE) + 1)
		player:sendCancelMessage("[BOMBERMAN] - Agora sua bomba atinge at� "..player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SIZE).." sqm.")
		item:remove()
	elseif item:getActionId() == 19002 then
		if player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_MAXBOMB) == 10 then
			player:sendCancelMessage("[BOMBERMAN] - Voc� pode soltar o n�mero m�ximo (+10) de bombas.")
			return true
		end
		player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_MAXBOMB, player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_MAXBOMB) + 1)
		player:sendTextMessage(MESSAGE_INFO_DESCR, "Agora voc� pode soltar at� "..player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_MAXBOMB).." bombas.")
		item:remove()	
	elseif item:getActionId() == 19003 then
		if player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SPEED) == 10 then
			player:sendCancelMessage("[BOMBERMAN] - Voc� est� com a velocidade (+10) maxima.")
			return true
		end
	
		local speed = player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SPEED)
		if speed >= 0 and speed < 11 then
			player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SPEED, player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SPEED) + 1)
			player:sendCancelMessage("[BOMBERMAN] - Agora sua velocidade est� +("..player:getStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SPEED)..") pontos.")
			doChangeSpeed(creature, getCreatureBaseSpeed(creature))
		end
		item:remove()	
	elseif item:getActionId() == 19004 then
		exitPosition = Position(1721, 942, 7)
		local team1, team2 = #BomberTeam1, #BomberTeam2
		if team1 == 0 or team2 == 0 then
			stopEvent(bombermanEnd)
			if team1 > team2 then
				for i = 1, #BomberTeam1 do
					if isPlayer(BomberTeam1[i]) then
					resetplayerbomberman(BomberTeam1[i])
					BomberTeam1[i]:sendCancelMessage("[BOMBERMAN] - Seu time venceu. Parab�ns!")
					BomberTeam1[i]:addItem(9058,3) --TIME A: Exemplo de recompensa que cada ganhador ganharia
					BomberTeam1[i]:setOutfit(BombermanOutfit[BomberTeam1[i]:getGuid()])
					db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", BomberTeam1[i]:getAccountId(), "0", db.escapeString("[Bomberman] - Winner"), "2", "100", os.time()))
					BomberTeam1[i]:addTournamentsCoins(100)
					end
					BomberTeam1[i]:teleportTo(Position(exitPosition))
				end
			else
				for i = 1, #BomberTeam2 do
					if isPlayer(BomberTeam2[i]) then
					resetplayerbomberman(BomberTeam2[i])
					BomberTeam2[i]:setOutfit(BombermanOutfit[BomberTeam2[i]:getGuid()])
					BomberTeam2[i]:sendCancelMessage("[BOMBERMAN] - Seu time venceu. Parab�ns!")
					BomberTeam2[i]:addItem(9058,3) --TIME B: Exemplo de recompensa que cada ganhador ganharia
					db.query(string.format("INSERT INTO `store_history`(`account_id`, `mode`, `description`, `coin_type`, `coin_amount`, `time`) VALUES (%s, %s, %s, %s, %s, %s)", BomberTeam2[i]:getAccountId(), "0", db.escapeString("[Bomberman] - Winner"), "2", "100", os.time()))
					BomberTeam2[i]:addTournamentsCoins(100)
					end
					BomberTeam2[i]:teleportTo(Position(exitPosition))
				end
			end
			BomberTeam1, BomberTeam2 = { }, { } 
			for i = 1, #BlockListBomberman do
				local powerItens = {32115, 32116, 32117}
				for pointer = 1, 3 do
					if Tile(BlockListBomberman[i]):getItemById(powerItens[pointer]) then
						remover = Tile(BlockListBomberman[i]):getItemById(powerItens[pointer])
						remover:remove()
					end
				end
				if not Tile(BlockListBomberman[i]):getItemById(8505) then
				Game.createItem(8505, 1, BlockListBomberman[i])
				end 
			end
		BlockListBomberman = { }
		BombermanPortal = 0
		item:remove()
		else
			player:sendCancelMessage("[BOMBERMAN] - Restam integrantes do time advers�rio.")
		end
	end
	return true
end

function resetplayerbomberman(player)
	local player = Player(player)
		player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_ACTIVEBOMB, -1)
		player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_MAXBOMB, -1)
		player:setStorageValue(STORAGEVALUE_MINIGAME_BOMBERMAN_SPEED, -1)
		doChangeSpeed(player, getCreatureBaseSpeed(player)-player:getSpeed())
end


bomberman:type("stepin")

for actionRange = 19001, 19004 do
	bomberman:aid(actionRange)
end
bomberman:register()