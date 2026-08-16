Config                            = {}
Config.DrawDistance               = 100.0
Config.DrawDistance2               = 20.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 2.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 }
Config.markerColor = {
    [1] = vec(255, 0, 0),
    [2] = vec(0, 255, 0),
    [3] = vec(0, 0, 255),
    [4] = vec(255, 255, 0),
    [5] = vec(255, 0, 255),
    [6] = vec(128, 0, 128),
    [7] = vec(128, 128, 0),
    [8] = vec(128, 128, 128),
    [9] = vec(0, 0, 0),
    [10] = vec(0, 128, 128),
}
Config.markerTypes = {
    locker = {
        type = 22,
        size = vector3(1.5, 1.5, 1.0),
    },
    armory = {
        type = 40,
        size = vector3(1.5, 1.5, 1.0),
    },
    veh = {
        type = 36,
        size = vector3(1.5, 1.5, 1.0),
    },
    vehdel = {
        type = 1,
        size = vector3(2.5, 2.5, 1.0),
    },
    heli = {
        type = 1,
        size = vector3(1.5, 1.5, 1.0),
    },
    helidel = {
        type = 34,
        size = vector3(3.5, 3.5, 2.0),
        radius = 5,
    },
    boss = {
        type = 31,
        size = vector3(1.5, 1.5, 1.0),
    },
    boat = {
        type = 35,
        size = vector3(1.5, 1.5, 1.0),
    },
    boatdel = {
        type = 35,
        size = vector3(3.5, 3.5, 2.0),
    },
}
Config.blipColor = {
    [1] = 46,
    [2] = 2,
    [3] = 4,
    [4] = 5,
    [5] = 48,
    [6] = 27,
    [7] = 16,
    [8] = 55,
    [9] = 85,
    [10] = 30,
}
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale                     = 'en'
Config.PVPCar = {
    {
        name = 'bf400',
        sc = 1,
    },
    {
        name = 'nwkuruma',
        sc = 3,
    },
    {
        name = 'vetir',
        sc = 1,
    },
    {
        name = 'kamacho',
        sc = 2,
    },
    {
        name = 'wastelander',
        sc = 5,
    },
    {
        name = 'monster',
        sc = 3,
    },
}

Config.PVPShop = {
    openTime = 90,
    openCount = 4,
    washCount = 3,
    shops = {
        { coords = vec(659.65,532.51,130.25)    },
        { coords = vec(216.02,-22.48,69.71)     },
        { coords = vec(198.67,-928.85,30.69)    },
        { coords = vec(1543.91,-2151.81,77.53)  },
        { coords = vec(1080.5,-692.2,57.79)     },
        { coords = vec(-52.09,-1784.88,27.85)   },
        { coords = vec(-1702.16,-1090.76,13.15) },
        { coords = vec(-530.22,-229.36,36.7)    },
        { coords = vec(-1034.02,-1071.3,4.1)    },
        { coords = vec(-1120.53,-2841.5,13.95)  },
    },
    weapons = {
        {-- loot 1
            { name = 'weapon_carbinerifle',     price = 5,  count = 7 },
            { name = 'weapon_advancedrifle',    price = 5,  count = 6 },
            { name = 'weapon_pumpshotgun_mk2',  price = 10, count = 6 },
            { name = 'weapon_carbinerifle_mk2', price = 12, count = 6 },
            { name = 'weapon_microsmg',         price = 20, count = 1 },
            { name = 'weapon_doubleaction',     price = 20, count = 1 },
        },
        {-- loot 2
            { name = 'weapon_bullpuprifle',     price = 7,  count = 7 },
            { name = 'weapon_assaultshotgun',   price = 7,  count = 6 },
            { name = 'weapon_specialcarbine',   price = 7,  count = 6 },
            { name = 'weapon_bullpuprifle_mk2', price = 10, count = 6 },
            { name = 'weapon_microsmg',         price = 20, count = 1 },
            { name = 'weapon_doubleaction',     price = 20, count = 1 },
        },
        {-- loot 3
            { name = 'weapon_pumpshotgun',      price = 7,  count = 7 },
            { name ='weapon_specialcarbine_mk2',price = 12, count = 6 },
            { name = 'weapon_bullpupshotgun',   price = 7,  count = 6 },
            { name = 'weapon_compactrifle',     price = 12, count = 6 },
            { name = 'weapon_microsmg',         price = 20, count = 1 },
            { name = 'weapon_doubleaction',     price = 20, count = 1 },
        },
        {-- loot 4
            { name = 'weapon_combatpdw',        price = 5,  count = 7 },
            { name = 'weapon_assaultrifle_mk2', price = 12, count = 6 },
            { name = 'weapon_gusenberg',        price = 8,  count = 6 },
            { name = 'weapon_sawnoffshotgun',   price = 7,  count = 6 },
            { name = 'weapon_microsmg',         price = 20, count = 1 },
            { name = 'weapon_doubleaction',     price = 20, count = 1 },
        },
    }
}



Config.PVPWash = {
    washTime = 30,
    coords = {
        { coords = vec(-1132.18,4924.06,219.71) },
        { coords = vec(124.41,6407.86,31.35)    },
        { coords = vec(1505.37,6326.61,24.08)   },
        { coords = vec(2489.38,4961.79,44.77)   },
        { coords = vec(464.33,3565.72,33.24)    },
        { coords = vec(-1090.58,2715.06,19.08)  },
        { coords = vec(-49.82,1892.68,195.36)   },
        { coords = vec(2474.66,1574.6,32.74)    },
        { coords = vec(2390.26,3340.68,47.34)   },
        { coords = vec(-2098.09,2830.45,32.81)  },
    },
    weapons = {
        { name = 'weapon_carbinerifle',      price = 220000 },
        { name = 'weapon_assaultrifle',      price = 220000 },
        { name = 'weapon_advancedrifle',     price = 220000 },
        { name = 'weapon_combatpdw',         price = 220000 },
        { name = 'weapon_bullpuprifle',      price = 240000 },
        { name = 'weapon_gusenberg',         price = 250000 },
        { name = 'weapon_assaultshotgun',    price = 240000 },
        { name = 'weapon_sawnoffshotgun',    price = 240000 },
        { name = 'weapon_pumpshotgun',       price = 240000 },
        { name = 'weapon_bullpupshotgun',    price = 240000 },
        { name = 'weapon_specialcarbine',    price = 240000 },
        { name = 'weapon_pumpshotgun_mk2',   price = 300000 },
        { name = 'weapon_bullpuprifle_mk2',  price = 300000 },
        { name = 'weapon_compactrifle',      price = 320000 },
        { name = 'weapon_specialcarbine_mk2',price = 320000 },
        { name = 'weapon_assaultrifle_mk2',  price = 320000 },
        { name = 'weapon_carbinerifle_mk2',  price = 320000 },
        { name = 'weapon_microsmg',          price = 400000 },
        { name = 'weapon_doubleaction',      price = 400000 },
    }
}

Config.vipVest = {
    {
        gang = {
            'Capone',
        },
        label = 'Capone VIP',
        num = {
            {119,0}, -- men
            nil,     -- {17,3}, women
        }
    },
    {
        gang = {
            'GroveStreet',
        },
        label = 'GroveStreet VIP',
        num = {
            {122,0}, -- men
            {56,16},  -- women
        }
    },
    {
        gang = {
            'Alghaede',
        },
        label = 'Alghaede VIP',
        num = {
            {122,1}, -- men
            {56,15},  -- women
        }
    },
    {
        gang = {
            'Raven',
        },
        label = 'Raven VIP',
        num = {
            {122,2}, -- men
            {56,1},  -- women
        }
    },
    {
        gang = {
            'Legend_Family',
        },
        label = 'Legend_Family VIP',
        num = {
            {122,3}, -- men
            nil,     -- {17,3}, women
        }
    },
    {
        gang = {
            'DISORDER',
        },
        label = 'DISORDER VIP',
        num = {
            {122,4}, -- men
            {56,2},  -- women
        }
    },
    {
        gang = {
            'Alpha',
        },
        label = 'Alpha VIP',
        num = {
            {122,5}, -- men
            {56,3},  -- women
        }
    },
    {
        gang = {
            'DIABLO',
        },
        label = 'DIABLO VIP',
        num = {
            {122,6}, -- men
            {56,4},  -- women
        }
    },
    {
        gang = {
            'ZAKHAR',
        },
        label = 'ZAKHAR VIP',
        num = {
            {122,7}, -- men
            {56,5},  -- women
        }
    },
    {
        gang = {
            'crips',
        },
        label = 'crips VIP',
        num = {
            {122,8}, -- men
            {56,6},  -- women
        }
    },
    {
        gang = {
            'Mandem',
        },
        label = 'Mandem VIP',
        num = {
            {124,0}, -- men
            {56,7},  -- women
        }
    },
    {
        gang = {
            'el_poder',
        },
        label = 'el_poder VIP',
        num = {
            {122,9}, -- men
            {56,9},  -- women
        }
    },
    {
        gang = {
            'Sopranos',
        },
        label = 'Sopranos VIP',
        num = {
            {124,1}, -- men
            {56,8},  -- women
        }
    },
    {
        gang = {
            'BUSHEHR',
        },
        label = 'BUSHEHR VIP',
        num = {
            {122,10}, -- men
            nil,     -- {17,3}, women
        }
    },
    {
        gang = {
            'FOX',
        },
        label = 'FOX VIP',
        num = {
            {124,2}, -- men
            {56,10},  -- women
        }
    },
    {
        gang = {
            'ULTRA',
        },
        label = 'ULTRA VIP',
        num = {
            {125,0}, -- men
            {56,11},  -- women
        }
    },
    {
        gang = {
            'GULAG_GANG',
        },
        label = 'GULAG GANG VIP',
        num = {
            {125,1}, -- men
            {56,12},  -- women
        }
    },
    {
        gang = {
            'Ballas',
        },
        label = 'Ballas VIP',
        num = {
            {122,11}, -- men
            {56,13},  -- women
        }
    },
    {
        gang = {
            'SAVAGE',
        },
        label = 'SAVAGE VIP',
        num = {
            {124,3}, -- men
            {56,14},  -- women
        }
    },
    {
        gang = {
            'Siege',
        },
        label = 'Siege VIP',
        num = {
            {124,4}, -- men
            {56,17},  -- women
        }
    },
    {
        gang = {
            'Alliance',
        },
        label = 'Alliance VIP',
        num = {
            {122,12}, -- men
            {56,18},  -- women
        }
    },
}
