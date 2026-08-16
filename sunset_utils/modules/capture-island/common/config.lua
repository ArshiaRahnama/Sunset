configCapIs = {
    zones = {
        {
            coords = vec(4945.34, -4945.37, 13.28, 1100.01),
            label = 'Jazire',
            blip = true,
            blipColor = 1,
            blipOpacity = 50,
            zombieConfig = 101,
            safeZone = {
                vec(4890.52, -5736.66, 26.35, 50.52),   -- Safe 1
                vec(5479.87, -5852.72, 20.33, 50.39),   -- Safe 2
                vec(5587.27, -5222.8, 14.35, 50.01),    -- Safe 3
                vec(4820.23, -4306.22, 5.38, 50.07),    -- Safe 4
                vec(3906.31, -4693.1, 4.2, 50.88),      -- Safe 5
            },
            outdoorSafeRange = 100,
            weaponsLocation = {
                {
                    name = 'weapon_marksmanrifle_mk2',
                    coords = vec(5032.81, -4630.78, 21.68, 5.0)
                },
                {
                    name = 'weapon_marksmanrifle_mk2',
                    coords = vec(5107.82, -4581.2, 29.72, 5.0)
                },
                {
                    name = 'weapon_marksmanrifle_mk2',
                    coords = vec(4877.84, -4488.8, 26.93, 5.0)
                },
                {
                    name = 'weapon_marksmanrifle_mk2',
                    coords = vec(4901.82, -5336.31, 35.61, 5.0)
                },
                {
                    name = 'weapon_marksmanrifle_mk2',
                    coords = vec(5125.18, -5526.13, 70.97, 5.0)
                },
                {
                    name = 'weapon_marksmanrifle_mk2',
                    coords = vec(5043.78, -5114.89, 22.94, 5.0)
                },
                {
                    name = 'weapon_marksmanrifle_mk2',
                    coords = vec(5266.43, -5427.52, 141.05, 5.0)
                },
            },
            teleporter = {
                {
                    from = vec(3913.57, -4707.14, 4.23, 2.0),   -- Safe 1
                    to = vec(607.35, -3057.4, 6.07, 359.8),     -- Sahel gun sazi
                    time = 10,
                },
                {
                    from = vec(4819.7, -4306.93, 5.41, 2.0),    -- Safe 2
                    to = vec(607.35, -3057.4, 6.07, 359.8),     -- Sahel gun sazi
                    time = 10,
                },
                {
                    from = vec(5587.24, -5230.02, 14.86, 2.0),  -- Safe 3
                    to = vec(607.35, -3057.4, 6.07, 359.8),     -- Sahel gun sazi
                    time = 10,
                },
                {
                    from = vec(5484.58, -5852.8, 20.09, 2.0),   -- Safe 4
                    to = vec(607.35, -3057.4, 6.07, 359.8),     -- Sahel gun sazi
                    time = 10,
                },
                {
                    from = vec(4899.59, -5765.91, 26.1, 2.0),   -- Safe 5
                    to = vec(607.35, -3057.4, 6.07, 359.8),     -- Sahel gun sazi
                    time = 10,
                },
            },
            flags = {
                {   --flag 1
                    coords = vec(4479.5, -4590.65, 5.56, 3.01),
                    label = 'Flag 1',
                    drawRange = 100,
                    captureTime = 120,
                    nearPerks = {
                        radius = 20,
                        time = 5,
                        vest = true,
                        add = 10,
                        headDisable = true,
                        uav = true,
                        uavRadius = 100,
                    },
                    reward = {
                        type = 1,
                        config = {
                            {'plan_give', 5}, -- {'WEAPON_SMG', 2}
                        },
                        salary = 1000,
                        time = 30.0,
                        deleteAfter = 2.0,
                    }
                },
                {   --flag 2
                    coords = vec(4995.74, -5166.95, 2.7, 3.01),
                    label = 'Flag 2',
                    drawRange = 100,
                    captureTime = 120,
                    nearPerks = {
                        radius = 20,
                        time = 5,
                        vest = true,
                        add = 10,
                        headDisable = true,
                        uav = true,
                        uavRadius = 100,
                    },
                    reward = {
                        type = 1,
                        config = {
                            {'plan_give', 5},
                        },
                        time = 30.0,
                        salary = 1000,
                        deleteAfter = 2.0,
                    }
                },
                {   --flag 3
                    coords = vec(5104.77, -4676.54, 2.29, 3.01),
                    label = 'Flag 3',
                    drawRange = 100,
                    captureTime = 120,
                    nearPerks = {
                        radius = 20,
                        time = 5,
                        vest = true,
                        add = 10,
                        headDisable = true,
                        uav = true,
                        uavRadius = 100,
                    },
                    reward = {
                        type = 1,
                        config = {
                            {'plan_give', 5},
                        },
                        time = 30.0,
                        salary = 1000,
                        deleteAfter = 2.0,
                    }
                },
                {   --flag 4
                    coords = vec(5263.34, -5432.39, 65.6, 3.01),
                    label = 'Flag 4',
                    drawRange = 100,
                    captureTime = 120,
                    nearPerks = {
                        radius = 20,
                        time = 5,
                        vest = true,
                        add = 10,
                        headDisable = true,
                        uav = true,
                        uavRadius = 100,
                    },
                    reward = {
                        type = 1,
                        config = {
                            {'plan_give', 5},
                        },
                        time = 30.0,
                        salary = 1000,
                        deleteAfter = 2.0,
                    }
                },
            },
        }
    }
}