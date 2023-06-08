 -- HERE TRAINER ONLINE
local staminaBonus = {
    target ='Training Machine',
    period = 60000, -- Period in milliseconds
    bonus = 1, -- gain stamina
    events = { }
}

local function addStamina(name)
    local player = Player(name)
    if not player then
        staminaBonus.events[name] = nil
    else
        local target = player:getTarget()
        if not target or target:getName() ~= staminaBonus.target then
            staminaBonus.events[name] = nil
        else
            player:setStamina(player:getStamina() + staminaBonus.bonus)
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "Received stamina for being training online.")
            staminaBonus.events[name] = addEvent(addStamina, staminaBonus.period, name)
        end
    end
end

function Creature:onChangeOutfit(outfit)
	for k, functionCallback in pairs(EventCallback) do
		if type(functionCallback) == "function" and k:sub(1, #("onChangeOutfit")) == "onChangeOutfit" then
			functionCallback(self, outfit)
		end
	end
	if self:isPlayer() then
		local familiarLookType = self:getFamiliarLooktype()
		if familiarLookType ~= 0 then
			for _, summon in pairs(self:getSummons()) do
				if summon:getType():familiar() then
						if summon:getOutfit().lookType ~= familiarLookType then
							summon:setOutfit({lookType = familiarLookType})
						end
					break
				end
			end
		end
	end
	return true
end

function Creature:onHear(speaker, words, type)
	for k, functionCallback in pairs(EventCallback) do
		if type(functionCallback) == "function" and k:sub(1, #("onHear")) == "onHear" then
			functionCallback(self, speaker, words, type)
		end
	end
end

function Creature:onAreaCombat(tile, isAggressive)
	for k, functionCallback in pairs(EventCallback) do
		if type(functionCallback) == "function" and k:sub(1, #("onAreaCombat")) == "onAreaCombat" then
			functionCallback(self, tile, isAggressive)
		end
	end
	return true
end

local function removeCombatProtection(cid)
	local player = Player(cid)
	if not player then
		return true
	end

	local time = 0
	if player:isMage() then
		time = 10
	elseif player:isPaladin() then
		time = 20
	else
		time = 30
	end

	player:setStorageValue(Global.Storage.CombatProtectionStorage, 2)
	addEvent(function(cid)
		local player = Player(cid)
		if not player then
			return
		end

		player:setStorageValue(Global.Storage.CombatProtectionStorage, 0)
		player:remove()
	end, time * 1000, cid)
end

picIf = { }
function Creature:onTargetCombat(target)
	if not self then
		return true
	end
	
	for k, functionCallback in pairs(EventCallback) do
		if type(functionCallback) == "function" and k:sub(1, #("onTargetCombat")) == "onTargetCombat" then
			functionCallback(self, target)
		end
	end

	if not picIf[target.uid] then
		if target:isMonster() then
			target:registerEvent("RewardSystemSlogan")
			picIf[target.uid] = { }
		end
	end
	
	if self:isPlayer() then
        if target and target:getName() == staminaBonus.target then
            local name = self:getName()
            if not staminaBonus.events[name] then
                staminaBonus.events[name] = addEvent(addStamina, staminaBonus.period, name)
            end
        end
       end

	if target:isPlayer() then
		if self:isMonster() then
			local protectionStorage = target:getStorageValue(Global.Storage.CombatProtectionStorage)

			if target:getIp() == 0 then -- If player is disconnected, monster shall ignore to attack the player
				if target:isPzLocked() then return true end
				if protectionStorage <= 0 then
					addEvent(removeCombatProtection, 30 * 1000, target.uid)
					target:setStorageValue(Global.Storage.CombatProtectionStorage, 1)
				elseif protectionStorage == 1 then
					self:searchTarget()
					return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
				end

				return true
			end

			if protectionStorage >= os.time() then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
	end

	if ((target:isMonster() and self:isPlayer() and target:getMaster() == self)
	or (self:isMonster() and target:isPlayer() and self:getMaster() == target)) then
		return RETURNVALUE_YOUMAYNOTATTACKTHISCREATURE
	end

	if not IsRetroPVP() or PARTY_PROTECTION ~= 0 then
		if self:isPlayer() and target:isPlayer() then
			local party = self:getParty()
			if party then
				local targetParty = target:getParty()
				if targetParty and targetParty == party then
					return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
				end
			end
		end
	end

	if not IsRetroPVP() or ADVANCED_SECURE_MODE ~= 0 then
		if self:isPlayer() and target:isPlayer() then
			if self:hasSecureMode() then
				return RETURNVALUE_YOUMAYNOTATTACKTHISPLAYER
			end
		end
	end

	self:addEventStamina(target)
	return true
end

function Creature:onDrainHealth(attacker, typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary)
	for k, functionCallback in pairs(EventCallback) do
		if type(functionCallback) == "function" and k:sub(1, #("onDrainHealth")) == "onDrainHealth" then
			functionCallback(self, attacker, typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary)
		end
	end
	if (not self) then
		return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
	end

	if (not attacker) then
		return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
	end

	return typePrimary, damagePrimary, typeSecondary, damageSecondary, colorPrimary, colorSecondary
end
