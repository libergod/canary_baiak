Bosses ={
	bosses = {
		["Merlin"] = {dia = "06/27/20", horario = 01, tempoMatar = 1}, -- mes/dia/ano - somente a hora - em horas
	},
	posNasceBoss = Position(1646, 975, 9),
	posTpOpen = Position(1003, 1217, 7),
	posDestino = Position(1646, 960, 8),
	level = {
		active = true,
		levelMin = 150,
	},
	tempoTpAberto = 20, -- Em minutos
	mensagemUm = "[Boss] Trov�es, raios e terremotos nas profundezas do continente ... O portal m�gico est� entrando em colapso!",  -- 15 min
	mensagemDois = "[Boss] N�o h� mais magia capaz de parar o que est� por vir. O portal est� completamente aberto!", -- 10 min
	mensagemTres = "[Boss] Cidad�os, cuidado! Uma criatura do mal acaba de escapar do portal.", -- 5 min
	mensagemTpFechar = "[Boss] O teleport ir� fechar em 5 minutos e n�o ser� poss�vel entrar mais na sala do boss.",
	actionIdTp = 4247,
}

function Bosses:getBossName()
	for index, v in pairs(Bosses.bosses) do
		if v.dia == os.date("%x") and v.horario  == tonumber(os.date("%H")) then
			return index
		end
	end
	return nil
end

function Bosses:openTp()
	local tile = Tile(Bosses.posTpOpen)
	if tile then
		local item = tile:getItemById(1949)
		if item then
			item:getPosition():sendMagicEffect(CONST_ME_POFF)
			item:remove()
		else
			local teleport = Game.createItem(1949, 1, Bosses.posTpOpen)
			if teleport then
				teleport:setActionId(Bosses.actionIdTp)
			end
			addEvent(function()
				Bosses:openTp()
			end, Bosses.tempoTpAberto * 60 * 1000)
			addEvent(Game.broadcastMessage, (Bosses.tempoTpAberto - 5) * 60 * 1000, (Bosses.mensagemTpFechar))
		end
	end
end

function Bosses:checkTime()
	for index, v in pairs(Bosses.bosses) do
		if v.dia == os.date("%x") and v.horario  == tonumber(os.date("%H")) then
			addEvent(function()
				local monster = Game.createMonster(index, Bosses.posNasceBoss)
				monster:setEmblem(GUILDEMBLEM_ENEMY)
				local idMonster = monster:getId()
			end, 10 * 60 * 1000)
			addEvent(function()
				Bosses:removeMonster(idMonster)
			end, v.tempoMatar * 60 * 60 * 1000)
			Bosses:sendMessages()
			Bosses:openTp()
		end
	end
end

function Bosses:sendMessages()
	Game.broadcastMessage(Bosses.mensagemUm)
	addEvent(Game.broadcastMessage, 5 * 60 * 1000, Bosses.mensagemDois)
	addEvent(Game.broadcastMessage, 10 * 60 * 1000, Bosses.mensagemTres)
end

function Bosses:removeMonster(id)
	monstro = Monster(id)
	if monstro then
		monstro:getPosition():sendMagicEffect(CONST_ME_POFF)
		monstro:remove()
	end
end
