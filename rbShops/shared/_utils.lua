ShowAdvNotif = function(title, subject, msg, icon, iconType)
    SetNotificationTextEntry('STRING')
    AddTextComponentSubstringPlayerName(msg)
    SetNotificationMessage(icon, icon, false, iconType, title, subject)
    DrawNotification(false, false)
end

Notif = function(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentSubstringWebsite(msg)
	DrawNotification(false, true)
end

ShowHelpNotification = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

function CreateGamePed(model, pos, heading)
    RequestModel(model)
    while not HasModelLoaded(model) do 
        Wait(10)
    end
    
    local _Ped = CreatePed(1, model, pos+vector3(0.0, 0.0, -1.0), heading, false, false)
    
    SetEntityAsMissionEntity(_Ped, false, false)
    SetModelAsNoLongerNeeded(model)

    SetBlockingOfNonTemporaryEvents(_Ped, 1)
    SetEntityInvincible(_Ped, true)
    FreezeEntityPosition(_Ped, true)
end

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry)
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght)
    blockinput = true

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        local result = GetOnscreenKeyboardResult()
        Citizen.Wait(500)
        blockinput = false
        return result
    else
        Citizen.Wait(500)
        blockinput = false
        return nil
    end
end