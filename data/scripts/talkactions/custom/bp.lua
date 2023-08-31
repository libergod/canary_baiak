local bp = TalkAction("!bp")

function bp.onSay(player, words, param)
	-- create log
	logCommand(player, words, param)
	
    if player:removeMoneyBank(10) then
        player:getPosition():sendMagicEffect(CONST_ME_FIREWORK_YELLOW)
        player:addItem(2854, 1)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought a backpack!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
end

bp:groupType("normal")
bp:register()