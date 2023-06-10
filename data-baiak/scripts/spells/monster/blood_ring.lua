local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_LIFEDRAIN)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_DRAWBLOOD)
arr = {
{0, 0, 1, 1, 1, 0, 0},
{0, 1, 0, 0, 0, 1, 0},
{1, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 2, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 1},
{0, 1, 0, 0, 0, 1, 0},
{0, 0, 1, 1, 1, 0, 0},
}


local area = createCombatArea(arr)
combat:setArea(area)

local spell = Spell("instant")

function spell.onCastSpell(creature, var)
	return combat:execute(creature, var)
end

spell:name("brainsteller blood ring")
spell:words("###806")
spell:needLearn(true)
spell:cooldown("2000")
spell:isSelfTarget(true)
spell:register()