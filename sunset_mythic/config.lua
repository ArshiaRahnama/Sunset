Config = {}
Config.Location = vector3(2382.2,4937.77,43.09)
Config.LocationStart = vector3(2433.31,4960.8,46.82)
Config.BoxLocation = vector3(2433.31,4960.8,46.82)
Config.Heading = 310.0
Config.Radius = 250
Config.DeadLocation = vector3(2455.54,4998.02,46.17)
Config.DeadRadius = 85
Config.PartyNeed = 10
Config.PartyMax = 10
Config.AnimTime = 20
Config.SuccessTime = 45
Config.AlarmJob = {
    ["police"] = true,
    ["sheriff"] = true,
    ["mt"] = true,
    ["offpolice"] = true,
    ["offsheriff"] = true,
    ["offmt"] = true,
    ['weazel'] = true,
    ['detective'] = true,
    ['offdetective'] = true,
}
Config.Level = {
    [1] = {
        disableheadbox = true,
        armor = 100
    },
    [2] = {
        disableheadbox = true,
        armor = 200
    },
    [3] = {
        disableheadbox = true,
        armor = 500
    },
}

Config.Trinket = {
    [1] = {
        [1] = true,
    },
    [2] = {
        [1] = true,
        [2] = true,
    },
    [3] = {
        [1] = true,
        [2] = true,
        [3] = true,
    },
}

Config.RobPerksAccess = {
    ["police"] = true,
    ["sheriff"] = true,
    ["mt"] = true,
    ["offmt"] = true,
    ["offpolice"] = true,
    ["offsheriff"] = true,
}

Config.policeSalary = {  -- mythic
    max = 11,
    amount = {
		police  = {
			[1]  = 100000,
			[2]  = 100000,
			[3]  = 100000,
			[4]  = 100000,
			[5]  = 100000,
			[6]  = 100000,
			[7]  = 100000,
			[8]  = 100000,
			[9]  = 100000,
			[10] = 100000,
			[11] = 100000,
			['12:30'] = 5000,
		},
		-- -- sheriff  = 5000,
		mt  = {
			[1]  = 100000,
			[2]  = 101000,
			[3]  = 102000,
			[4]  = 103000,
			[5]  = 104000,
			[6]  = 105000,
			[7]  = 106000,
			[8]  = 107000,
			[9]  = 108000,
			[10] = 109000,
			[11] = 110000,
			['12:30'] = 5000,
		},
		-- fbi     = 5000,
	},
}

Config.Rewards = {

    [1] = {
        Items = {
        },
        Weapons = {
            {   ['name'] = 'WEAPON_CARBINERIFLE',       ['count'] = 1   },
            {   ['name'] = 'WEAPON_ADVANCEDRIFLE',      ['count'] = 1   },
            {   ['name'] = 'WEAPON_PUMPSHOTGUN_MK2',    ['count'] = 1   },
            {   ['name'] = 'WEAPON_CARBINERIFLE_MK2',   ['count'] = 1   },
            {   ['name'] = 'WEAPON_BULLPUPRIFLE',       ['count'] = 1   },
            {   ['name'] = 'WEAPON_ASSAULTSHOTGUN',     ['count'] = 1   },
            {   ['name'] = 'WEAPON_SPECIALCARBINE',     ['count'] = 1   },
            {   ['name'] = 'WEAPON_BULLPUPRIFLE_MK2',   ['count'] = 1   },
            {   ['name'] = 'WEAPON_PUMPSHOTGUN',        ['count'] = 1   },
            {   ['name'] = 'WEAPON_BULLPUPSHOTGUN',     ['count'] = 1   },
            {   ['name'] = 'WEAPON_COMPACTRIFLE',       ['count'] = 1   },
            {   ['name'] = 'WEAPON_COMBATPDW',          ['count'] = 1   },
            {   ['name'] = 'WEAPON_GUSENBERG',          ['count'] = 1   },
            {   ['name'] = 'WEAPON_SAWNOFFSHOTGUN',     ['count'] = 1   },
        }
    },

    [2] = {
        Items = {
        },
        Weapons = {
            {   ['name'] = 'WEAPON_CARBINERIFLE',       ['count'] = 2   },
            {   ['name'] = 'WEAPON_ADVANCEDRIFLE',      ['count'] = 2   },
            {   ['name'] = 'WEAPON_PUMPSHOTGUN_MK2',    ['count'] = 1   },
            {   ['name'] = 'WEAPON_CARBINERIFLE_MK2',   ['count'] = 1   },
            {   ['name'] = 'WEAPON_MICROSMG',           ['count'] = 1   },
            {   ['name'] = 'WEAPON_DOUBLEACTION',       ['count'] = 1   },
            {   ['name'] = 'WEAPON_BULLPUPRIFLE',       ['count'] = 2   },
            {   ['name'] = 'WEAPON_ASSAULTSHOTGUN',     ['count'] = 2   },
            {   ['name'] = 'WEAPON_SPECIALCARBINE',     ['count'] = 2   },
            {   ['name'] = 'WEAPON_BULLPUPRIFLE_MK2',   ['count'] = 1   },
            {   ['name'] = 'WEAPON_PUMPSHOTGUN',        ['count'] = 2   },
            {   ['name'] = 'WEAPON_SPECIALCARBINE_MK2', ['count'] = 1   },
            {   ['name'] = 'WEAPON_BULLPUPSHOTGUN',     ['count'] = 2   },
            {   ['name'] = 'WEAPON_COMPACTRIFLE',       ['count'] = 2   },
            {   ['name'] = 'WEAPON_COMBATPDW',          ['count'] = 2   },
            {   ['name'] = 'WEAPON_ASSAULTRIFLE_MK2',   ['count'] = 2   },
            {   ['name'] = 'WEAPON_GUSENBERG',          ['count'] = 2   },
            {   ['name'] = 'WEAPON_SAWNOFFSHOTGUN',     ['count'] = 2   },
        }
    },

    [3] = {
        Items = {
        },
        Weapons = {
            {   ['name'] = 'WEAPON_CARBINERIFLE',       ['count'] = 3   },
            {   ['name'] = 'WEAPON_ADVANCEDRIFLE',      ['count'] = 3   },
            {   ['name'] = 'WEAPON_PUMPSHOTGUN_MK2',    ['count'] = 2   },
            {   ['name'] = 'WEAPON_CARBINERIFLE_MK2',   ['count'] = 2   },
            {   ['name'] = 'WEAPON_MICROSMG',           ['count'] = 2   },
            {   ['name'] = 'WEAPON_DOUBLEACTION',       ['count'] = 1   },
            {   ['name'] = 'WEAPON_BULLPUPRIFLE',       ['count'] = 3   },
            {   ['name'] = 'WEAPON_ASSAULTSHOTGUN',     ['count'] = 3   },
            {   ['name'] = 'WEAPON_SPECIALCARBINE',     ['count'] = 3   },
            {   ['name'] = 'WEAPON_BULLPUPRIFLE_MK2',   ['count'] = 2   },
            {   ['name'] = 'WEAPON_PUMPSHOTGUN',        ['count'] = 3   },
            {   ['name'] = 'WEAPON_SPECIALCARBINE_MK2', ['count'] = 2   },
            {   ['name'] = 'WEAPON_BULLPUPSHOTGUN',     ['count'] = 3   },
            {   ['name'] = 'WEAPON_COMPACTRIFLE',       ['count'] = 2   },
            {   ['name'] = 'WEAPON_COMBATPDW',          ['count'] = 3   },
            {   ['name'] = 'WEAPON_ASSAULTRIFLE_MK2',   ['count'] = 2   },
            {   ['name'] = 'WEAPON_GUSENBERG',          ['count'] = 3   },
            {   ['name'] = 'WEAPON_SAWNOFFSHOTGUN',     ['count'] = 3,  },
        }
    },
}