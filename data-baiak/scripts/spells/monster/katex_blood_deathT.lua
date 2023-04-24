local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MORTAREA)

	arr = {
		{1, 1, 1},
		{0, 1, 0},
		{0, 3, 0}
	}

local area = createCombatArea(arr)
	setCombatArea(combat, area)

local spell = Spell("instant")

function spell.onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end

spell:name("katex deathT")
spell:words("###503")
spell:isAggressive(true)
spell:blockWalls(true)
spell:needLearn(true)
spell:needDirection(true)
spell:register()