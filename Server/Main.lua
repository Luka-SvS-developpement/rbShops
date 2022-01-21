---@author ${RevengeBack_}
ESX = nil TriggerEvent('esx:getSharedObject', function(lib) ESX = lib end)

RegisterServerEvent("RevengeShops:BuyThisItem")
AddEventHandler("RevengeShops:BuyThisItem", function(_src, xItem, xCount, xPrice, ChoixPaiement)
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local xLiquide = xPlayer.getMoney()
    local xBank = xPlayer.getAccount('bank').money

    if xPlayer ~= nil then
        --@ Checks
        if tonumber(xPrice) ~= 0 and tonumber(xCount) < 100 then
            if ChoixPaiement == 'Liquide' then
                if xLiquide >= xPrice then
                    xPlayer.removeMoney(math.floor(xPrice))
                    xPlayer.addInventoryItem(xItem, xCount)
                    TriggerClientEvent("RevengeShops:ShopResult", _src, true, xPrice, xLiquide)
                else
                    TriggerClientEvent("RevengeShops:ShopResult", _src, false, xPrice, xLiquide)
                end
            elseif ChoixPaiement == 'Banque' then
                if xBank >= xPrice then
                    xPlayer.removeAccountMoney('bank', math.floor(xPrice))
                    xPlayer.addInventoryItem(xItem, xCount)
                    TriggerClientEvent("RevengeShops:ShopResult", _src, true, xPrice, xBank)
                else
                    TriggerClientEvent("RevengeShops:ShopResult", _src, false, xPrice, xBank)
                end
            end
        else
            DropPlayer("Cheater n'est pas bon ^_^")
            return
        end
    end
end)
