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
				if tile then
					local player = Player(tile:getTopCreature())
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
	end
end

local function uppingUser(frompos, topos)
	for _x= frompos.x, topos.x, 1 do
		for _y= frompos.y, topos.y, 1 do
			for _z= frompos.z, topos.z, 1 do
				local newpos = Position(_x, _y, _z)
				local tile = Tile(newpos)
				if tile then
					local player = Player(tile:getTopCreature())
					if player ~= nil then
						if player:isPlayer() then
							player:getPosition():sendMagicEffect(CONST_ME_POFF)
							local positionz = player:getPosition()
							positionz.z = positionz.z - 1
							player:teleportTo(positionz)
							player:getPosition():sendMagicEffect(CONST_ME_WATERSPLASH)
						end
					end
				end
			end
		end
	end
end

--CLEAN RAFTS POSITION
local Positions = {
	[1] = {frompos = Position(1163, 633, 9), topos = Position(1169, 638, 9)}, -- OK
	[2] = {frompos = Position(1163, 659, 9), topos = Position(1169, 664, 9)}, -- OK
	[3] = {frompos = Position(1137, 672, 9), topos = Position(1145, 677, 9)}, -- OK
	[4] = {frompos = Position(1180, 672, 9), topos = Position(1187, 677, 9)}, -- OK
	[5] = {frompos = Position(1176, 703, 9), topos = Position(1183, 710, 9)}, --
	[6] = {frompos = Position(1140, 716, 9), topos = Position(1147, 721, 9)}, --
	[7] = {frompos = Position(1157, 726, 9), topos = Position(1161, 731, 9)}, --
	[8] = {frompos = Position(1178, 721, 9), topos = Position(1184, 727, 9)} --
}

local RaftsGoingUp = {
	pos = { -- CENTRO DO GOING UP RAFT, DIREÇÕES X E Y
		[1] = {frompos = Position(1164, 634, 9), topos = Position(1168, 637, 9)}, -- OK
		[2] = {frompos = Position(1164, 660, 9), topos = Position(1168, 663, 9)}, -- OK
		[3] = {frompos = Position(1138, 673, 9), topos = Position(1143, 676, 9)}, -- OK
		[4] = {frompos = Position(1181, 673, 9), topos = Position(1186, 676, 9)}, -- OK
		[5] = {frompos = Position(1177, 704, 9), topos = Position(1182, 709, 9)}, -- 
		[6] = {frompos = Position(1141, 717, 9), topos = Position(1146, 720, 9)}, -- 
		[7] = {frompos = Position(1158, 727, 9), topos = Position(1160, 730, 9)}, -- 
		[8] = {frompos = Position(1179, 723, 9), topos = Position(1183, 726, 9)} -- 
	}
}

--CLEAN RAFTS POSITION
local RaftsUp = {
	pos = { -- CENTRO DO GOING UP RAFT, DIREÇÕES X E Y
		[1] = {frompos = Position(1163, 633, 8), topos = Position(1169, 638, 8)},
		[2] = {frompos = Position(1163, 659, 8), topos = Position(1169, 664, 8)},
		[3] = {frompos = Position(1137, 672, 8), topos = Position(1144, 677, 8)},
		[4] = {frompos = Position(1180, 672, 8), topos = Position(1187, 677, 8)},
		[5] = {frompos = Position(1177, 704, 8), topos = Position(1184, 711, 8)},
		[6] = {frompos = Position(1140, 716, 8), topos = Position(1148, 721, 8)},
		[7] = {frompos = Position(1157, 726, 8), topos = Position(1161, 732, 8)},
		[8] = {frompos = Position(1178, 722, 8), topos = Position(1185, 728, 8)}
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
			local squareRaftsUp = RaftsGoingUp.pos[i]
			uppingUser(squareRaftsUp.frompos, squareRaftsUp.topos)
		end
		for i = 1, #Positions do
			--Clean Map
			cleanMMap(Positions[i].frompos, Positions[i].topos)
		end
		
		Game.loadMap(DATA_DIRECTORY.. '/world/quests/soul_war/ebb_and_flow/inundate.otbm')
		Spdlog.info("[changeEbbFlow] - Map Changed to Inundate")
		Game.setStorageValue(STORAGEVALUE_EBB_FLOW, 2)
		return true
	elseif actualFase == 2 then
		--Call Function to move Player to Entrance		
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