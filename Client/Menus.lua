---@author ${RevengeBack_}
ChoixPaiement, CheckedLiquide, CheckedBanque = 'Liquide', true, false

local indexList = {
    Index1 = 1,
    myList = {"1", "3", "6", "Personnalisé"},
}

local clickButton = function(Cat)
    for _,v in pairs(Cat) do

        RageUI.List(("%s ~g~%s$~c~/u~s~"):format(v.Label, v.Price), indexList.myList, indexList.Index1, nil, {}, true, {
            onListChange = function(i, Item)
                local id = indexList.Index1
                indexList.Index1 = i
            end,
            onSelected = function(i, Item)
                local id = indexList.Index1
                if id == 1 then
                    TriggerServerEvent("RevengeShops:BuyThisItem", _src, v.Item, 1, v.Price, ChoixPaiement)
                elseif id == 2 then
                    TriggerServerEvent("RevengeShops:BuyThisItem", _src, v.Item, 3, v.Price*3, ChoixPaiement)
                elseif id == 3 then
                    TriggerServerEvent("RevengeShops:BuyThisItem", _src, v.Item, 6, v.Price*6, ChoixPaiement)
                elseif id == 4 then
                    local myAmount = _rbShopsClientUtils.KeyboardInput("Combien?", '', 2)
                    if myAmount ~= nil and myAmount ~= " " then
                        if myAmount then
                            TriggerServerEvent("RevengeShops:BuyThisItem", _src, v.Item, myAmount, v.Price*myAmount, ChoixPaiement)
                        else
                            _rbShopsClientUtils.Notif("~r~Erreur: Syntaxe incorrecte")
                            return
                        end
                    else
                        _rbShopsClientUtils.Notif("~r~Erreur: Syntaxe incorrecte")
                        return
                    end
                end
            end,
        });
    end
end

local drawPaiement = function()
    RageUI.Separator(("~y~Mode paiement:~s~ ~g~"):format(tostring(ChoixPaiement)))
end

function openShopMenu()
    local OpenedMenu = false
    local mainMenu = RageUI.CreateMenu("Superette", "BIENVENUE", 120, 200)
    local nourritureMenu = RageUI.CreateSubMenu(mainMenu, "Nourriture", "BIENVENUE", 120, 200)
    local boissonsMenu = RageUI.CreateSubMenu(mainMenu, "Boissons", "BIENVENUE", 120, 200)
    local divsMenu = RageUI.CreateSubMenu(mainMenu, "Divers", "BIENVENUE", 120, 200)
    mainMenu.Display.Header = true
    mainMenu:DisplayGlare(false)
    mainMenu:SetRectangleBanner(0, 58, 130, 140)
    --@ Cats
    nourritureMenu:DisplayGlare(false)
    nourritureMenu:SetRectangleBanner(0, 58, 130, 140)
    boissonsMenu:DisplayGlare(false)
    boissonsMenu:SetRectangleBanner(0, 58, 130, 140)
    divsMenu:DisplayGlare(false)
    divsMenu:SetRectangleBanner(0, 58, 130, 140)

    local Categories = {
        Alimentation = {
            ["Boissons"] = {Label = "Boissons", Desc = nil, Style = {RightLabel = "→"}, Enabled = true, Actions = {
            }, SubMenu = boissonsMenu},
            ["Nourriture"] = {Label = "Nourriture", Desc = nil, Style = {RightLabel = "→"}, Enabled = true, Actions = {
            }, SubMenu = nourritureMenu},
        },

        Autres = {
            ["Autres"] = {Label = "Autres", Desc = nil, Style = {RightLabel = "→"}, Enabled = true, Actions = {
            }, SubMenu = divsMenu},
        },
    }

    mainMenu.Closed = function()
        OpenedMenu = false
        MenuActive = false
    end

    if OpenedMenu then
        OpenedMenu = false
        RageUI.Visible(mainMenu, false)
        return
    else
        OpenedMenu = true
        MenuActive = true
        RageUI.Visible(mainMenu, true)
        CreateThread(function()
            while OpenedMenu do
                --@ Cats Menus
                RageUI.IsVisible(mainMenu, function()

                    --@ Check Choix paiement
                    if CheckedLiquide then
                        ChoixPaiement = 'Liquide'
                    elseif CheckedBanque then
                        ChoixPaiement = 'Banque'
                    end

                    if Configuration.General.CategorieAlimentation then
                        --@ Alimentation
                        RageUI.Separator("~g~Alimentation~s~")
                        for _,v in pairs(Categories.Alimentation) do
                            RageUI.Button(v.Label, v.Desc, v.Style, v.Enabled, v.Actions, v.SubMenu)
                        end
                    end

                    if Configuration.General.CategorieDivers then
                        --@ Other
                        RageUI.Separator("~b~Divers~s~")
                        for _,v in pairs(Categories.Autres) do
                            RageUI.Button(v.Label, v.Desc, v.Style, v.Enabled, v.Actions, v.SubMenu)
                        end
                    end

                    RageUI.Separator("~y~Moyens de paiement")
                    RageUI.Checkbox("Liquide", nil, CheckedLiquide, {}, {
                        onUnChecked = function ()
                            CheckedBanque = true
                            CheckedLiquide = false
                        end,
                        onChecked = function ()
                            CheckedBanque = false
                            CheckedLiquide = true
                        end,
                    })
                    RageUI.Checkbox("Banque", nil, CheckedBanque, {}, {
                        onUnChecked = function ()
                            CheckedBanque = false
                            CheckedLiquide = true
                        end,
                        onChecked = function ()
                            CheckedBanque = true
                            CheckedLiquide = false
                        end,
                    })

                end)

                --@ Alimentation Subs Menus
                if Configuration.General.CategorieAlimentation then
                    RageUI.IsVisible(boissonsMenu, function()
                        drawPaiement()
                        clickButton(Configuration.Menu.Items.Boissons)
                    end)

                    RageUI.IsVisible(nourritureMenu, function()
                        drawPaiement()
                        clickButton(Configuration.Menu.Items.Nourriture)
                    end)
                end

                --@ Divs Sub Menu
                if Configuration.General.CategorieDivers then
                    RageUI.IsVisible(divsMenu, function()
                        drawPaiement()
                        clickButton(Configuration.Menu.Items.Autres)
                    end)
                end


                Wait(1)
            end
        end)
    end
end