function Item.getType(self)
	return ItemType(self:getId())
end

function Item.isContainer(self)
	return false
end

function Item.isCreature(self)
	return false
end

function Item.isMonster(self)
	return false
end

function Item.isNpc(self)
	return false
end

function Item.isPlayer(self)
	return false
end

function Item.isTeleport(self)
	return false
end

function Item.isTile(self)
	return false
end

function Item.setDescription(self, description)
	if description ~= '' then
		self:setAttribute(ItemAttribute_t::DESCRIPTION, description)
	else
		self:removeAttribute(ItemAttribute_t::DESCRIPTION)
	end
end

function Item.setText(self, text)
	if text ~= '' then
		self:setAttribute(ItemAttribute_t::TEXT, text)
	else
		self:removeAttribute(ItemAttribute_t::TEXT)
	end
end

function Item.setName(self, name)
	if name ~= '' then
		self:setAttribute(ItemAttribute_t::NAME, name)
	else
		self:removeAttribute(ItemAttribute_t::NAME)
	end
end

function Item.setUniqueId(self, uniqueId)
	if type(uniqueId) ~= 'number' or uniqueId < 0 or uniqueId > 65535 then
		return false
	end

	self:setAttribute(ItemAttribute_t::UNIQUEID, uniqueId)
end
