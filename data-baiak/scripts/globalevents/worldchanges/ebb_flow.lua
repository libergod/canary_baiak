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
				if tile ~= nil then
					getGround = tile:getGround()
					if getGround ~= nil then
						--FLUID TYPE = WATER
						--local itemTyp = ItemType(getGround:getId())
						local itemTyp = Item(getGround:getTopVisibleThing())
						if getGround and ItemType(getGround:getId()):getFluidSource() == 1 and itemTyp:getName():lower() == "raft" then
							itemTyp:remove()
						end
					end
				end
			end
		end
	end
end

--cleanMMap(frompos, topos)
--cleanMMap(Position(32512, 32364, 10), Position(32526, 32474, 10))



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
		cleanMMapRaft(Position(1123, 623, 8), Position(1203, 751, 9))
		Game.loadMap(DATA_DIRECTORY.. '/world/quests/soul_war/ebb_and_flow/inundate.otbm')
		Spdlog.info("[changeEbbFlow] - Map Changed to Inundate")
		Game.setStorageValue(STORAGEVALUE_EBB_FLOW, 2)
		return true
	elseif actualFase == 2 then
		--FAZER LOAD DO EMPTY
		cleanMMap(Position(1123, 623, 8), Position(1203, 751, 8))
		cleanMMapWater(Position(1123, 623, 8), Position(1203, 751, 8))
		cleanMMapRaft(Position(1123, 623, 8), Position(1203, 751, 9))
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