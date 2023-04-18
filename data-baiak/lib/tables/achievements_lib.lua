--[[

Achievements Lib Created By Eduardo Montilva (Darkhaos) for TFS 1.X

LAST UPDATE: 23 July 2019 (PRE-Tibia Update 12.20)

Functions:
	getAchievementInfoById(achievement_id)
	getAchievementInfoByName(achievement_name)
	getSecretAchievements()
	getPublicAchievements()
	getAchievements()
	Player:addAchievement(achievement_id/name[, showMsg])
	Player:removeAchievement(achievement_id/name)
	Player:hasAchievement(achievement_id/name)
	Player:addAllAchievements([showMsg])
	Player:removeAllAchievements()
	Player:getSecretAchievements()
	Player:getPublicAchievements()
	Player:getAchievements()
	isAchievementSecret(achievement_id/name)
	Player:getAchievementPoints()

Note: 	This lib was created following the data found in tibia.wikia.com.
		Achievements with no points (or points equal to 0) are achievements with no available info about points in tibia.wikia.com. These achievements should be updated
--]]

-- Updated by F@bio Jr
-- Reordered by Tibia Version and alphabetically
-- LAST UPDATE: 01 December 2019 (PRE-Tibia Update 12.30)

ACHIEVEMENTS_BASE = 300000 -- base storage
ACHIEVEMENTS_ACTION_BASE = 20000 	--this storage will be used to save the process to obtain the certain achievement
									--(Ex: this storage + the id of achievement 'Allowance Collector' to save...
									-- ...how many piggy banks has been broken

achievements =
{
	--8.6
	[1] = {name = "Demonize it's Better", grade = 1, points = 2, description = "Where able to achieve the priceless of held an Demon Helmet."},
	[2] = {name = "Evil Plant Reborn", grade = 1, points = 2, description = "An evil plant were faced and successfully killed."},
	[3] = {name = "Beautiful Mate", grade = 1, points = 2, description = "Found an Addon Doll and received some simple outfits."}
}

ACHIEVEMENT_FIRST = 1
ACHIEVEMENT_LAST = #achievements

function getAchievementInfoById(id)
	for k, v in pairs(achievements) do
		if k == id then
			local t = { }
			t.id = k
			t.actionStorage = ACHIEVEMENTS_ACTION_BASE + k
			for inf, it in pairs(v) do
				t[inf] = it
			end
			return t
		end
	end
	return false
end

function getAchievementInfoByName(name)
	for k, v in pairs(achievements) do
		if v.name:lower() == name:lower() then
			local t = { }
			t.id = k
			t.actionStorage = ACHIEVEMENTS_ACTION_BASE + k
			for inf, it in pairs(v) do
				t[inf] = it
			end
			return t
		end
	end
	return false
end

function getSecretAchievements()
	local t = { }
	for k, v in pairs(achievements) do
		if v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function getPublicAchievements()
	local t = { }
	for k, v in pairs(achivements) do
		if not v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function getAchievements()
	return achievements
end

function isAchievementSecret(ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then
				return Spdlog.error(string.format("[isAchievementSecret] - Invalid achievement '%s'",
					ach)) and false
	end

	return achievement.secret
end

function Player.hasAchievement(self, ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then
		return Spdlog.error("[Player.hasAchievement] - Invalid achievement \"" .. ach .. "\".") and false
	end

	return self:getStorageValue(ACHIEVEMENTS_BASE + achievement.id) > 0
end

function Player.getAchievements(self)
	local t = { }
	for k = 1, #achievements do
		if self:hasAchievement(k) then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.addAchievement(self, ach, denyMsg)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then
		return Spdlog.error("[Player.addAchievement] - Invalid achievement \"" .. ach .. "\".") and false
	end

	if not self:hasAchievement(achievement.id) then
		self:setStorageValue(ACHIEVEMENTS_BASE + achievement.id, 1)
		if not denyMsg then
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Congratulations! You earned the achievement \"" .. achievement.name .. "\".")
		end
	end
	return true
end

function Player.removeAchievement(self, ach)
	local achievement
	if isNumber(ach) then
		achievement = getAchievementInfoById(ach)
	else
		achievement = getAchievementInfoByName(ach)
	end
	if not achievement then
		return Spdlog.error("[Player.removeAchievement] - Invalid achievement \"" .. ach .. "\".") and false
	end

	if self:hasAchievement(achievement.id) then
		self:setStorageValue(ACHIEVEMENTS_BASE + achievement.id, -1)
	end
	return true
end

function Player.addAllAchievements(self, denyMsg)
	for i = ACHIEVEMENT_FIRST, ACHIEVEMENT_LAST do
		self:addAchievement(i, denyMsg)
	end
	return true
end

function Player.removeAllAchievements(self)
	for k = 1, #achievements do
		if self:hasAchievement(k) then
			self:removeAchievement(k)
		end
	end
	return true
end

function Player.getSecretAchievements(self)
	local t = { }
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) and v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.getPublicAchievements(self)
	local t = { }
	for k, v in pairs(achievements) do
		if self:hasAchievement(k) and not v.secret then
			t[#t + 1] = k
		end
	end
	return t
end

function Player.getAchievementPoints(self)
	local points = 0
	local list = self:getAchievements()
	if #list > 0 then --has achievements
		for i = 1, #list do
			local a = getAchievementInfoById(list[i])
			if a.points > 0 then --avoid achievements with unknow points
				points = points + a.points
			end
		end
	end
	return points
end

function Player.addAchievementProgress(self, ach, value)
	local achievement = isNumber(ach) and getAchievementInfoById(ach) or getAchievementInfoByName(ach)
	if not achievement then
		Spdlog.error('[Player.addAchievementProgress] - Invalid achievement "' .. ach .. '".')
		return true
	end

	local storage = ACHIEVEMENTS_ACTION_BASE + achievement.id
	local progress = self:getStorageValue(storage)
	if progress < value then
		self:setStorageValue(storage, math.max(1, progress) + 1)
	elseif progress == value then
		self:setStorageValue(storage, value + 1)
		self:addAchievement(achievement.id)
	end
	return true
end
