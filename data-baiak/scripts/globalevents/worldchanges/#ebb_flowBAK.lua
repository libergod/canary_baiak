local function cleanMMap(frompos, topos)
	for _x= frompos.x, topos.x, 1 do
		for _y= frompos.y, topos.y, 1 do
			for _z= frompos.z, topos.z, 1 do
				local newpos = Position(_x, _y, _z)
				local tile = Tile(newpos)
				if tile and tile:getItemCount() > 0 then
					for _, it in pairs(tile:getItems()) do
						if it then
							local itemType = ItemType(it:getId())
							if itemType and not itemType:isCorpse() and not itemType:isContainer() and itemType:getWeaponType() <= WEAPON_NONE then
								it:remove()
							end
						end
					end
				end
			end
		end
	end
end


local function cleanMMapWater(frompos, topos)
	for _x= frompos.x, topos.x, 1 do
		for _y= frompos.y, topos.y, 1 do
			for _z= frompos.z, topos.z, 1 do
				local newpos = Position(_x, _y, _z)
				local tile = Tile(newpos)
				if tile then
					getGround = tile:getGround()
					--FLUID TYPE = WATER
					if getGround and ItemType(getGround:getId()):getFluidSource() == 1 then
						getGround:remove()
					end
				end
			end
		end
	end
end

local function cleanMMapRaft(frompos, topos)	
	for _x= frompos.x, topos.x, 1 do
		for _y= frompos.y, topos.y, 1 do
			for _z= frompos.z, topos.z, 1 do
				local newpos = Position(_x, _y, _z)
				local tile = Tile(newpos)
				if tile then
					getGround = tile:getGround()
					--FLUID TYPE = WATER
					local items = Item(tile:getTopVisibleThing())
					if items ~= nil then
						if getGround and ItemType(getGround:getId()):getFluidSource() == 1 and items:getName():lower() == "raft" then
							getGround:remove()
							items:remove()
						end
					end
				end
			end
		end
	end
end


local function downingUser(frompos, topos)
	for _x= frompos.x, topos.x, 1 do
		for _y= frompos.y, topos.y, 1 do
			for _z= frompos.z, topos.z, 1 do
				local newpos = Position(_x, _y, _z)
				local tile = Tile(newpos)
				if tile and  tile:getTopCreature() > 0 and tile:getTopCreature():isPlayer() then
					local player = Player(tile:getTopCreature())
					if player ~= nil then
						player:getPosition():sendMagicEffect(CONST_ME_POFF)
						player:teleportTo(Position(1192,725,8))
						player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
					end
				end
			end
		end
	end
end

--CLEAN RAFTS POSITION
local Positions = {
	[1] = {frompos = Position(1163, 632, 9), topos = Position(1169, 637, 9)},
	[2] = {frompos = Position(1162, 658, 9), topos = Position(1169, 663, 9)},
	[3] = {frompos = Position(1136, 671, 9), topos = Position(1144, 676, 9)},
	[4] = {frompos = Position(1180, 671, 9), topos = Position(1186, 677, 9)},
	[5] = {frompos = Position(1176, 703, 9), topos = Position(1183, 710, 9)},
	[6] = {frompos = Position(1140, 716, 9), topos = Position(1147, 721, 9)},
	[7] = {frompos = Position(1157, 726, 9), topos = Position(1161, 731, 9)},
	[8] = {frompos = Position(1178, 721, 9), topos = Position(1184, 727, 9)}
}

local Rafts = {
	pos = { -- CENTRO DO FLOATING RAFT, DIREÇÕES X E Y
		[1] = {center = Position(1166, 635, 8), x = 3, y = 2,},
		[2] = {center = Position(1166, 661, 8), x = 3, y = 2,},
		[3] = {center = Position(1141, 674, 8), x = 3, y = 2,},
		[4] = {center = Position(1184, 674, 8), x = 3, y = 2,},
		[5] = {center = Position(1181, 707, 8), x = 3, y = 3,},
		[6] = {center = Position(1144, 718, 8), x = 3, y = 2,},
		[7] = {center = Position(1159, 729, 8), x = 1, y = 2,},
		[8] = {center = Position(1182, 725, 8), x = 3, y = 2,}
	}
}

local RaftsGoingUp = {
	pos = { -- CENTRO DO GOING UP RAFT, DIREÇÕES X E Y
		[1] = {center = Position(1166, 635, 8), x = 3, y = 2,},
		[2] = {center = Position(1166, 661, 8), x = 3, y = 2,},
		[3] = {center = Position(1141, 674, 8), x = 3, y = 2,},
		[4] = {center = Position(1184, 674, 8), x = 3, y = 2,},
		[5] = {center = Position(1181, 707, 8), x = 3, y = 3,},
		[6] = {center = Position(1144, 718, 8), x = 3, y = 2,},
		[7] = {center = Position(1159, 729, 8), x = 1, y = 2,},
		[8] = {center = Position(1182, 725, 8), x = 3, y = 2,}
	}
}

--CLEAN RAFTS POSITION
local RaftsUp = {
	pos = { -- CENTRO DO GOING UP RAFT, DIREÇÕES X E Y
		[1] = {frompos = Position(1163, 632, 9), topos = Position(1169, 637, 9)},
		[2] = {frompos = Position(1162, 658, 9), topos = Position(1169, 663, 9)},
		[3] = {frompos = Position(1136, 671, 9), topos = Position(1144, 676, 9)},
		[4] = {frompos = Position(1180, 671, 9), topos = Position(1186, 677, 9)},
		[5] = {frompos = Position(1176, 703, 9), topos = Position(1183, 710, 9)},
		[6] = {frompos = Position(1140, 716, 9), topos = Position(1147, 721, 9)},
		[7] = {frompos = Position(1157, 726, 9), topos = Position(1161, 731, 9)},
		[8] = {frompos = Position(1178, 721, 9), topos = Position(1184, 727, 9)}
	}
}
	
local changeEbbFlow = GlobalEvent("changeEbbFlow")

function changeEbbFlow.onTime(interval)

	-- 1 = empty
	-- 2 = inundate
	
	--local actualFase = getGlobalStorageValue(STORAGEVALUE_EBB_FLOW)
	local actualFase = Game.getStorageValue(STORAGEVALUE_EBB_FLOW)
	
	if actualFase ~= 1 and actualFase ~= 2 then
		--FAZER LOAD DO EMPTY
		cleanMMap(Position(1123, 623, 8), Position(1203, 751, 8))
		cleanMMapWater(Position(1123, 623, 8), Position(1203, 751, 8))
		--cleanMMapRaft(Position(1123, 623, 8), Position(1203, 751, 9))
		Game.loadMap(DATA_DIRECTORY.. '/world/quests/soul_war/ebb_and_flow/empty.otbm')
		Spdlog.info("[changeEbbFlow] - Map Changed to Empty")
		Game.setStorageValue(STORAGEVALUE_EBB_FLOW, 1)
		return true
	elseif actualFase == 1 then
		--FAZER LOAD DO inundate
		cleanMMap(Position(1123, 623, 8), Position(1203, 751, 8))
		cleanMMapWater(Position(1123, 623, 8), Position(1203, 751, 8))
		--cleanMMap(Position(1163, 632, 9), Position(1169, 637, 9))
		--for _, position in pairs(Positions) do
		for i = 1, #Positions do
			--Call Function to move Player up
					
			--Clean Map
			cleanMMap(Positions[i].frompos, Positions[i].topos)
		end
		
		Game.loadMap(DATA_DIRECTORY.. '/world/quests/soul_war/ebb_and_flow/inundate.otbm')
		Spdlog.info("[changeEbbFlow] - Map Changed to Inundate")
		Game.setStorageValue(STORAGEVALUE_EBB_FLOW, 2)
		return true
	elseif actualFase == 2 then
		--Call Function to move Player to Entrance
		--[[
		for i = 1, #Positions do
			local squareRafts = Rafts.pos[i]
			spectators = Game.getSpectators(squareRafts.center, false, false, 0, squareRafts.x, 0, squareRafts.y)
			if #spectators >= 1 then
				for a, b in ipairs(spectators) do
					local player = Player(b)
					if player ~= nil then 
						if player:isPlayer() then
							player:getPosition():sendMagicEffect(CONST_ME_POFF)
							player:teleportTo(Position(1192,725,8))
							player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
						 end
					end
				 end
			end
		end
		]]--
		
		for i = 1, #Positions do
			local squareRaftsUp = RaftsUp.pos[i]
			downingUser(squareRaftsUp.frompos, squareRaftsUp.topos)
		end
		
		cleanMMap(Position(1123, 623, 8), Position(1203, 751, 8))
		cleanMMapWater(Position(1123, 623, 8), Position(1203, 751, 8))
		--FAZER LOAD DO EMPTY
		Game.loadMap(DATA_DIRECTORY.. '/world/quests/soul_war/ebb_and_flow/empty.otbm')
		Spdlog.info("[changeEbbFlow] - Map Changed to Empty")
		Game.setStorageValue(STORAGEVALUE_EBB_FLOW, 1)
		return true
	end
	return true
end


--changeEbbFlow:interval(1000*60*2) -- 2 minutos
changeEbbFlow:interval(1000*60) 
changeEbbFlow:register()