local chests = {
	[1006] = {itemid = 3341, count = 1},
	[1007] = {itemid = 6527, count = 1},
	[1008] = {itemid = 5803, count = 1}
}

local pitsOfInfernoChest = Action()
function pitsOfInfernoChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if chests[item.uid] then
		if player:getStorageValue(Storage.Quest.PitsOfInferno) == 1 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'It\'s empty.')
			return true
		end

		local chest = chests[item.uid]
		local itemType = ItemType(chest.itemid)
		if itemType then
			local article = itemType:getArticle()
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You have found ' .. (#article > 0 and article .. ' ' or '') .. itemType:getName() .. '.')
		end

		player:addItem(chest.itemid, chest.count)
		player:setStorageValue(Storage.Quest.PitsOfInferno, 1)
	end
	return true
end

for unique, itemInfo in pairs(chests) do
	pitsOfInfernoChest:uid(unique)
end

pitsOfInfernoChest:register()
