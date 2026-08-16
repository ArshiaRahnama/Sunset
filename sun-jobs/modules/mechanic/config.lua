Shared.mechanic = {
    label = 'Mechanic'
}
Shared.mechanic.Locale = 'mechanic'

Shared.mechanic.config = {
	needUnit = false,
	customPlate = true,
	platePrefix = 'MC',
	decor = 'MC',
	billing = {
		customReason = false,
		reason = 'Mechanic',
		player = true,
		maxBillAmount = 50000,
	},
    objects = {
        { label = 'Roadcane',   model = 'prop_roadcone02a',     grade = 13 },
        { label = 'Toolbox',    model = 'prop_toolchest_01',    grade = 13 },
    },
    impound = {
        deleteTime = 15 * 60000,
        reward = 5000,
        policeReward = 5000,
    },
    towTrucks = {
        `towtruck`,
    }
}

Shared.mechanic.markers = {
    vehicleDeleterImpound = {
        type = 24,
        color = {255, 0, 0, 100},
        size = {2.5, 2.5, 2.5},
        upDown = true,
        range = 4.0,
        label = '~INPUT_CONTEXT~ Park Kardan(Flatbed)',
    },
}

Shared.mechanic.menu = {
	{label = function()
		local p = promise.new()
		ESX.TriggerServerCallback('mechanic:getlist', function(data)
			p:resolve('Request list('.. ESX.tableLength(data) ..')')
		end)
		return Citizen.Await(p)
	end, cb = openMechanicRequest},
	{label = 'Ghabz', cb = openBilling},
	{label = 'Repair', cb = mechanicRepairVehicle},
    {label = 'Ta\'amir engine', cb = mechanicFixEngine},
    {label = 'Flip', cb = mechanicFlip},
    {label = 'Flatbed', cb = mechanicFlatbed},
	{label = 'Extra Divisions', cb = divisionsMenu},
    {label = 'Check Insurance', cb = mechanicCheckVehicleInsurance},
	{label = 'Ghayegh badi', cb = function()
		exports['sunset_utils']:ghayeghBadi(true, {color1 = 126, color2 = 126})
	end},
    { label = 'Spawn Object', cb = openSpawnObject},

}


Shared.mechanic.zones = {
    bossAction = {
        vector3(1343.18,-777.54,71.29),	-- city 1
        vector3(597.08,605.5,135.12),   -- city 2
        vector3(1227.81,2734.44,38.22),	-- sandy
        vector3(152.81,-3009.2,10.7),   -- tune
        vector3(-1624.6,-912.55,18.73), -- car dealer
    },

    locker = {
        vec(597.23, 639.9, 128.93),     -- mc 1
        vec(1338.48, -776.51, 71.28),   -- mc old
        vec(1228.6, 2740.67, 38.22),    -- mc sandy
        vec(124.63, -3013.36, 7.04),    -- mc tune
        vec(-1628.13, -916.29, 18.73),  -- car dealer
    },
    cloakroom = {
        vector3(1339.12,-770.01,71.21),	-- city 1
        vector3(1232.14,2737.48,38.22), -- sandy
        vector3(103.03,6614.12,32.43),  -- paleto
        vector3(597.03,636.21,128.93),  -- city 2
        vector3(152.28,-3014.71,7.04),  -- tune
    },

    vehicles = {
        { -- city 1
            spawner    = vector3(1320.57,-736.03,65.67),
            spawnPoint = vector4(1301.99,-729.17,64.71,340.25),
        },
        { -- sandy
            spawner    = vector3(1223.82,2720.42,38.01),
            spawnPoint = vector4(1225.97,2710.94,38.01,177.96),
        },
        { -- paleto
            spawner    = vector3(115.08,6625.78,31.79),
            spawnPoint = vector4(118.93,6599.34,32.02,270.87),
        },
        { -- city 2
            spawner    = vector3(626.29,640.3,128.91),
            spawnPoint = vector4(619.98,650.02,128.91,283.91),
        },
        { -- tune
            spawner    = vector3(157.22,-3018.08,7.04),
            spawnPoint = vector4(165.56,-3005.97,5.89,359.42),
        },
    },

    vehicleDeleter = {
        vector3(1318.19,-724.77,65.37), -- city 1
        vector3(619.98,650.03,128.91),  -- city 2
        vector3(1225.98,2710.94,38.0),  -- sandy
        vector3(118.94,6599.34,32.01),  -- paleto
        vector3(165.56,-3005.97,5.89),  -- tune
        vector3(1339.46,-708.37,68.12), -- city 1
        vector3(676.76,614.4,130.81),   -- city 2
        vector3(1228.39,2734.09,42.06), -- sandy
        vector3(137.12,-3017.55,18.92), -- tune
    },

    helicopters = {
        {-- city 1
            spawner    = vector3(1344.5,-719.87,66.86),
            spawnPoint = vector4(1339.46,-708.37,68.12,347.31),
        },
        {-- city 2
            spawner    = vector3(687.4,612.35,128.91),
            spawnPoint = vector4(676.76,614.4,130.81,254.14),
        },
        {-- sandy
            spawner    = vector3(1223.68,2742.87,42.07),
            spawnPoint = vector4(1228.39,2734.09,42.06,178.37),
        },
        {-- tune
            spawner    = vector3(156.24,-3006.65,7.03),
            spawnPoint = vector4(137.12,-3017.55,18.92,277.5),
        },
    },

    vehicleDeleterImpound = {
        vec(1304.27, -729.09, 64.77), -- mc ghadim
        vec(40.23, -832.1, 30.81), -- parking markazi
        vec(691.91, 621.43, 128.91), -- mc 1
        vec(-1986.61, -325.19, 48.11), -- saheli
        vec(1026.26, 2664.88, 39.55), -- sandy
        vec(87.15, 6620.77, 31.49), -- paleto
        vec(-234.48, -1393.83, 31.27),
    },
}

Shared.mechanic.itemShop = {
	water = {count = 20, price = 17500},
	bread = {count = 20, price = 20000},
    radio = {count = 5, price = 25000},
}
