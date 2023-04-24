local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)

	arr = {
		{1},
		{0},
		{1},
		{0},
		{1},
		{0},
		{3}
	}

local area = createCombatArea(arr)
	setCombatArea(combat, area)

local spell = Spell("instant")

function spell.onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end

spell:name("earth beamMY")
spell:words("###501")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:needDirection(true)
spell:register()