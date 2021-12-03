---@author ${RevengeBack_}
fx_version('cerulean')
game('gta5')
author('${RevengeBack_}')

shared_script("Configuration.lua")
client_scripts({
    -- RageUI
    "shared/RageUI/RMenu.lua",
    "shared/RageUI/menu/RageUI.lua",
    "shared/RageUI/menu/Menu.lua",
    "shared/RageUI/menu/MenuController.lua",
    "shared/RageUI/components/*.lua",
    "shared/RageUI/menu/elements/*.lua",
    "shared/RageUI/menu/items/*.lua",
    "shared/RageUI/menu/panels/*.lua",
    "shared/RageUI/menu/windows/*.lua",

    "shared/_utils.lua",

    -- Main
    "Client/Main.lua",
    "Client/Menus.lua",
})

server_scripts({
    -- Main
    "Server/Main.lua",
})