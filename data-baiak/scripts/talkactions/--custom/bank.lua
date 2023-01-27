function playerExists(name)
    local resultId = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
    if resultId then
        result.free(resultId)
        return true
    end
    return false
end
function Player.deposit(self, amount)
    if not self:removeMoney(amount) then
            player:sendCancelMessage("[Bank System] Voc� n�o tem dinheiro com voc�.")
        return false
    end
    self:setBankBalance(self:getBankBalance() + amount)
    return true
end
function Player.withdraw(self, amount)
    local balance = self:getBankBalance()
    if amount > balance or not self:addMoney(amount) then
        player:sendCancelMessage("[Bank System] Voc� n�o tem dinheiro na sua conta banc�ria.")
        return false
    end
    self:setBankBalance(balance - amount)
    return true
end
function Player.depositMoney(self, amount)
    if not self:removeMoney(amount) then
        return false
    end
    self:setBankBalance(self:getBankBalance() + amount)
    return true
end
function onSay(player, words, param)
    local split = param:split(",")
	
    local balance = player:getBankBalance()
    if split[1] == nil then
		player:popupFYI("----- [Bank System] -----\n\n Os comandos s�o:\n\n!bank balance.\n!bank withdraw, amount\n!bank withdrawall\n!bank deposit, amount.\n!bank depositall.\n!bank transfer, amount, toPlayer.\n!bank transferall, toPlayer")
        return
    end
	
    --------------------------- Balance ---------------------------
    if split[1] == 'balance' then
        player:sendCancelMessage("[Bank System] O saldo da sua conta � " .. balance .. ".")
	--------------------------- Depositall ---------------------------
    elseif split[1] == 'depositall' then
        local amount = player:getMoney()
        local amount = math.abs(amount)
        if amount > 0 and amount == player:getMoney() then
            player:deposit(amount)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bank System] Voc� adicionou " .. amount .. " na sua conta, voc� pode sacar seu dinheiro a qualquer momento.\nO saldo da sua conta � " .. player:getBankBalance() .. ".")
            player:save()
        else
            player:sendCancelMessage("[Bank System] Voc� n�o tem dinheiro suficiente para depositar.")
        end
--------------------------- Deposit ---------------------------
    elseif split[1] == 'deposit' then
        local amount = tonumber(split[2])
        if not amount then
            player:sendCancelMessage("[Bank System] Voc� precisa colocar a quantidade de dinheiro a adicionar.")
            return false
        end
        local amount = math.abs(amount)
        if amount > 0 and amount <= player:getMoney() then
            player:deposit(amount)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bank System] Voc� adicionou " .. amount .. " na sua conta, voc� pode sacar seu dinheiro a qualquer momento.\nO saldo da sua conta � " .. player:getBankBalance() .. ".")
            player:save()
        else
            player:sendCancelMessage("[Bank System] Voc� n�o tem dinheiro suficiente para depositar.")
        end
	--------------------------- Withdraw all ---------------------------
    elseif split[1] == 'withdrawall' then
        local amount = player:getBankBalance()
        local amount = math.abs(amount)
        if amount > 0 and amount <= player:getBankBalance() then
            player:withdraw(amount)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bank System] Aqui est� todo o seu dinheiro na sua conta. Voc� pode depositar seu dinheiro a qualquer momento.\nO saldo da sua conta � " .. player:getBankBalance() .. ".")
            player:save()
        else
            player:sendCancelMessage("[Bank System] Voc� n�o tem dinheiro suficiente na sua conta banc�ria.")
        end
    --------------------------- Withdraw ---------------------------
    elseif split[1] == 'withdraw' then
        local amount = tonumber(split[2])
        if not amount then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bank System] Voc� precisa colocar a quantia em dinheiro para sacar.")
            return false
        end
        local amount = math.abs(amount)
        if amount > 0 and amount <= player:getBankBalance() then
            player:withdraw(amount)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bank System] Aqui est� " .. amount .. " gold coins da sua conta, voc� pode depositar seu dinheiro a qualquer momento.\nO saldo da sua conta � " .. player:getBankBalance() .. ".")
            player:save()
        else
            player:sendCancelMessage("[Bank System] Voc� n�o tem dinheiro suficiente na sua conta banc�ria.")
        end
	--------------------------- Transfer All ---------------------------
	elseif split[1] == 'transferall' then
        if split[2] == nil or split[2] == "" then
            player:sendCancelMessage("[Bank System] Voc� precisa colocar o nome do jogador.")
            return false
        end
		local amount = player:getBankBalance()
        local getPlayer = Player(split[2])
		if amount <= 0 then
			player:sendCancelMessage("[Bank System] Voc� precisa ter mais de 0 gold coins em sua conta banc�ria.")
            return false
		end
        if getPlayer then
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bank System] Voc� transferiu com sucesso " .. amount .. " para " .. split[2] .. ".")
            player:transferMoneyTo(split[2], amount)
            player:save()
        else
            if not playerExists(split[2]) then
                player:sendCancelMessage("[Bank System] Um jogador com nome " .. split[2] .. " n�o existe.")
                return false
            end
            if playerExists(split[2]) and player:transferMoneyTo(split[2], amount) then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bank System] Voc� transferiu com sucesso " .. amount .. " para " .. split[2] .. ".")
                player:save()
            end
        end
    --------------------------- Transfer ---------------------------
    elseif split[1] == 'transfer' then
        local data = param
        local s = data:split(",")
		local bankTotal = player:getBankBalance()
        if s[2] == nil then
            player:sendCancelMessage("[Bank System] Voc� precisa colocar a quantidade de dinheiro.")
            return false
        else
			if s[3] == nil then
				player:sendCancelMessage("[Bank System] Voc� precisa colocar o nome do jogador.")
				return false
			end
		end
        local a = tonumber(s[2])
        local amount = math.abs(a)
        local getPlayer = Player(s[3])
		if amount <= bankTotal then
			if getPlayer then
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "[Bank System] Voc� transferiu com sucesso " .. s[2] .. " para " .. s[3] .. ".")
				player:transferMoneyTo(s[3], amount)
                player:save()
			else
				if not playerExists(s[3]) then
					player:sendCancelMessage("[Bank System] Um jogador com nome " .. s[3] .. " n�o existe.")
					return false
				end
				if playerExists(s[3]) and player:transferMoneyTo(s[3], amount) then
					player:sendCancelMessage("[Bank System] Voc� transferiu com sucesso " .. s[2] .. " para " .. s[3] .. ".")
                    player:save()
				end
			end
		else
			player:sendCancelMessage("[Bank System] Voc� n�o tem todo esse dinheiro.")
			return false
		end
    else
        player:sendCancelMessage("[Bank System] Par�metro inv�lido.")
    end
    return false
end