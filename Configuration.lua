Configuration = {
    --@ Config General
    General = {
        CategorieAlimentation = true,
        CategorieDivers = false,
    },
    Options = {
        PedModel = 0xCA56FA52, --@https://wiki.rage.mp/index.php?title=Peds (Hash)
        PedName = 'Rico',
        Marker = {Type = 22, Couleur = {r = 255, g = 255, b = 255}},
    },
    Superettes = {
        ["SANDY-SHORES1"]      = {Position = vector3(1961.464,  3740.672,  32.343), Ped = {pos = vector3(1959.39, 3741.09, 32.34),    heading = 301.41}},
        ["SANDY-SHORES2"]      = {Position = vector3(1392.562, 3604.684, 34.98),    Ped = {pos = vector3(1391.94, 3606.15, 34.98),    heading = 194.65}},
        ["SANDY-SHORES3"]      = {Position = vector3(547.431,   2671.710,  42.156), Ped = {pos = vector3(549.11, 2671.25, 42.15),     heading = 104.14}},
        ["SENORA-DESERT1"]     = {Position = vector3(2678.916, 3280.671,  55.24),   Ped = {pos = vector3(2677.604, 3279.57, 55.24),   heading = 331.63}},
        ["SENORA-DESERT2"]     = {Position = vector3(1166.024,  2708.930,  38.157), Ped = {pos = vector3(1165.43, 2710.86, 38.15),    heading = 183.65}},
        ["GRAPESEED"]          = {Position = vector3(1698.388,  4924.404,  42.063), Ped = {pos = vector3(1697.56, 4923.06, 42.06),    heading = 326.9}},
        ["CENTRE-VINEWOOD"]    = {Position = vector3(373.91,  326.420, 107.566),    Ped = {pos = vector3(372.56, 326.71, 103.56),     heading = 255.43}},
        ["MONTS-TATAVIAM"]     = {Position = vector3(2557.458, 382.282, 108.622),   Ped = {pos = vector3(2556.90, 380.75, 108.62),    heading = 0.47}},
        ["BANHAM-CANYON"]      = {Position = vector3(-3038.939, 585.954, 7.908),    Ped = {pos = vector3(-3038.88, 584.51, 7.90),     heading = 16.10}},
        ["MORNINGWOOD"]        = {Position = vector3(-1487.553, -379.107,  40.163), Ped = {pos = vector3(-1486.592, -377.64, 40.163), heading = 127.40}},
        ["BANHAM-CANYON2"]     = {Position = vector3(-2968.243, 390.910, 15.04),    Ped = {pos = vector3(-2966.388, 390.814, 15.04),  heading = 86.97}},
        ["BALLAS"]             = {Position = vector3(-48.519, -1757.514, 29.42),    Ped = {pos = vector3(-47.26, -1758.77, 29.42),    heading = 45.76}},
        ["MIRROR-PARK"]        = {Position = vector3(1163.373, -323.801, 69.20),    Ped = {pos = vector3(1164.98, -323.57, 69.20),    heading = 96.07}},
        ["LITTLE-SEOUL"]       = {Position = vector3(-707.501, -914.260, 19.215),   Ped = {pos = vector3(-705.99, -913.944, 19.215),  heading = 92.37}},
        ["RICHMAN-GLEN"]       = {Position = vector3(-1820.523, 792.518, 138.118),  Ped = {pos = vector3(-1819.65, 793.77, 138.08),   heading = 133.00}},
        ["MURRIETA-HEIGHTS"]   = {Position = vector3(1135.808, -982.281, 46.415),   Ped = {pos = vector3(1134.167, -982.73, 46.41),   heading = 276.79}},
        ["FAMILIES"]           = {Position = vector3(25.88, -1347.1, 29.5),         Ped = {pos = vector3(24.42, -1347.29, 29.49),     heading = 268.88}},
        ["AUTOROUTE-CHUMASH"]  = {Position = vector3(-3241.927, 1001.462,  12.830), Ped = {pos = vector3(-3242.19, 999.99, 12.83),    heading = 357.21}},
        ["MONT-CHILLIAD ROAD"] = {Position = vector3(1729.216,  6414.131,  35.037), Ped = {pos = vector3(1728.05, 6416.02, 35.03),    heading = 243.58}},
        ["CANAUX-VESPUCCI"]    = {Position = vector3(-1221.56,  -908.09, 38.18),    Ped = {pos = vector3(-1221.48,  -908.101, 12.32), heading = 28.74}}, 
    },


    --@ Items & Autre
    Menu = {
        Items = {
            --@ Categorie Alimentation
            Nourriture = {
                ["Pain"] = {Label = "Pain", Item = 'bread', Price = 5},
            },

            Boissons = {
                ["Eau"] = {Label = "Eau", Item = 'water', Price = 3},
            },

            --@ Categorie Divers
            Autres = {
                ["Phone"] = {Label = "Téléphone", Item = 'phone', Price = 500},
            },
        }
    }
}