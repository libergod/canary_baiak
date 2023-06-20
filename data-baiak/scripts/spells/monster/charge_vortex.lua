local mathCount = 0

local positions = { }

local function createVortex()
	local storedPositions = {
		{x = 1206, y = 661, z = 7},
		{x = 1206, y = 669, z = 7},
		{x = 1208, y = 665, z = 7},
		{x = 1212, y = 656, z = 7},
		{x = 1213, y = 664, z = 7},
		{x = 1211, y = 669, z = 7},
		{x = 1211, y = 674, z = 7},
		{x = 1217, y = 661, z = 7},
		{x = 1218, y = 666, z = 7},
		{x = 1217, y = 671, z = 7},
		{x = 1222, y = 669, z = 7},
	}

	if mathCount == 0 then
		positions = storedPositions
	end

	local r1 = math.random(#positions)

	local tile = Tile(positions[r1])

	if tile then
		local ground = tile:getGround()
		if ground then
			ground:transform(22894)
		    addEvent(function(pos)
				local tile = Tile(pos)
				if tile then
					local ground = tile:getGround()
					if ground then
						ground:transform(23049)
					end	
				end
			end, 10*1000, tile:getPosition()) -- 10*1000 = 10 SECONDS
			mathCount = mathCount + 1
			table.remove(positions, r1)
		end
	end

	if mathCount == 11 then
		mathCount = 0
	end
end

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	createVortex()
end

spell:name("charge vortex")
spell:words("###451")
spell:blockWalls(true)
spell:needLearn(true)

spell:register()