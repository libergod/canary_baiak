local internalNpcName = "Towncryer"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = { }

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 131,
	lookHead = 95,
	lookBody = 86,
	lookLegs = 10,
	lookFeet = 114,
	lookAddons = 1
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Hear me! Hear me! The mage Wyrdin in the Edron academy is looking for brave adventurers to undertake a task!" },
	{ text = "Hear me! Hear me! The postmaster\'s guild has open spots for aspiring postmen! Contact Kevin Postner at the post office in the plains south of Kazordoon!" },
	{ text = "Hear me! Hear me! The inquisition is looking for daring people to fight evil! Apply at the inquisition headquarters next to the Thaian jail!" }
}

local worldChanges = {
	{
		storage = GlobalStorage.FuryGates, 
		text = "Hear ye! Hear ye! A fiery gate has opened, threatening a city! Guard the people frightened, their death would be a pity!"
	},
	{
		storage = GlobalStorage.Yasir, 
		text = "Hear ye! Hear ye! What a lucky and beautiful day! Visit Carlin, Ankrahmun, or Liberty Bay. Yasir, the oriental trader might be there. Gather your creature products, for this chance is rare."
	},
	{
		storage = GlobalStorage.NightmareIsle, 
		text = "Hear me! Hear me! A river is flooding, south of the outlaw base. Explore a new isle, an unknown place. Don\'t be afraid, but ready your blade."
	}
}

for i = 1, #worldChanges do
	if getGlobalStorageValue(worldChanges[i].storage) > 0 then
		table.insert(npcConfig.voices, {text = worldChanges[i].text})
	end
end

npcType:register(npcConfig)
