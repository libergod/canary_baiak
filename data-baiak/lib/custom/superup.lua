SUPERUP = {
	msg = {
		naoDisponivel = "This cave is currently occupied by %s until %s.",
		disponivel = "Congratulations! You successfully bought the Super UP Cave with a duration of %d %s!",
		naoItem = "You need a %s to buy an Super UP Cave.",
		tempoAcabou = "Your time at the Super UP Cave finished!",
		possuiCave = "You already own a Super UP Cave!",
	},
	areas = {
		[20000] = {nome = "Demon", entrada = Position(2283, 824, 7), from = Position(2264, 775, 7), to = Position(2356, 846, 7)},
		[20001] = {nome = "Grim Reaper", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20002] = {nome = "Rotten Golem", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20003] = {nome = "Dark Torturer", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20004] = {nome = "Vexclaw", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20005] = {nome = "True Dawnfire Asura", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20006] = {nome = "Brachiodemon", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20007] = {nome = "Floating Savant", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20008] = {nome = "Infernal Demon", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20009] = {nome = "Frost Dragon", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20010] = {nome = "Hydra", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20011] = {nome = "Ghastly Dragon", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20012] = {nome = "Lava Lurker", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20013] = {nome = "Sparkion", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20014] = {nome = "Behemoth", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20016] = {nome = "Cyclops Drone", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20017] = {nome = "Warlock", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20018] = {nome = "Hero", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20019] = {nome = "Cobra Vizier", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
		[20020] = {nome = "Werelion", entrada = Position(548, 1249, 7), from = Position(1008, 889, 7), to = Position(1030, 903, 7)},
	},
	setTime = 1, -- Em horas
	itemID = 12305,
}

function SUPERUP:getCave(id)
	local resultCave = db.storeQuery("SELECT guid_player, to_time FROM exclusive_hunts WHERE `hunt_id` = " .. id)
	if not resultCave then
		return false
	end

	local caveOwner = result.getNumber(resultCave, "guid_player")
	local caveTime = result.getDataLong(resultCave, "to_time")
	result.free(resultCave)

	return {dono = caveOwner, tempo = caveTime}
end

function SUPERUP:freeCave()
	freeCaves = { }
	local db = db.storeQuery("SELECT `hunt_id`, `to_time`, `guid_player` FROM exclusive_hunts")
	if not db then
		return
	end

	repeat
		local idHunt = result.getNumber(db, "hunt_id")
		local tempoFinal = result.getDataLong(db, "to_time")
		local guidPlayer = result.getNumber(db, "guid_player")
		result.free(db)

		table.insert(freeCaves, {idHunt, tempoFinal, guidPlayer})

	until not result.next(db)
	return freeCaves
end
