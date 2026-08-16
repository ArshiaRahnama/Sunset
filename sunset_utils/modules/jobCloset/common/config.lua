ConfigJobCloset = {
-- police
    {
        coords = {
            vec(447.37,-996.87,30.69),   -- pd 1
            vec(616.92,11.94,82.78),     -- pd 2
            vec(-63.05,-2512.46,7.39),   -- pd 3
            vec(-1096.02,-830.84,26.83), -- pd 5
            vec(845.38,-1284.34,28.24), -- Detective
            vec(1509.54,784.11,77.71),   -- pd 4 ist bazresi
            vec(1841.04,3683.43,34.19),  -- sheriff sandy
            vec(-449.63,5994.63,37.0),   -- sheriff paleto
            vec(-2355.97, 3260.16, 32.81), -- Army
        },
        job = 'police',
        limit = 20,
        maxWeight = 500,
    },
-- sheriff
    {
        coords = {
            vec(462.42,-999.66,30.69),  -- pd 1
            vec(620.0,8.19,82.78),      -- pd 2
            vec(-59.91,-2507.5,7.39),   -- pd 3
            vec(1506.99,781.37,77.71),  -- pd 4 ist bazresi
            vec(-1091.9,-825.61,26.83), -- pd 5
            vec(845.29,-1286.54,28.24), -- Detective
            vec(1839.44,3685.25,34.19), -- sheriff sandy
            vec(-435.98,6010.45,37.0),  -- sheriff paleto
            vec(-2353.33, 3257.22, 32.81), -- Army
        },
        job = 'sheriff',
        limit = 20,
        maxWeight = 500,
    },
-- mt
    {
        coords = {
            vec(451.72,-999.02,30.69),   -- pd 1
            vec(616.89,-1.81,82.78),     -- pd 2
            vec(-50.98,-2508.05,7.39),   -- pd 3
            vec(1513.88,784.89,77.71),   -- pd 4 ist bazresi
            vec(-1098.64,-825.94,26.83), -- pd 5
            vec(848.68,-1283.65,28.24),  -- Detective
            vec(1840.39,3677.27,34.19),  -- sheriff sandy
            vec(-436.23,6002.46,37.0),   -- sheriff paleto
            vec(-2350.13, 3262.36, 32.81),-- Army
        },
        job = 'mt',
        limit = 20,
        maxWeight = 500,
    },
-- detective
    {
        coords = {
            vec(451.79, -998.82, 30.69),    -- pd 1
            vec(614.68, 5.73, 82.78),       -- pd 2
            vec(-53.32, -2507.19, 7.39),    -- pd 3
            vec(-1091.86, -826.98, 26.83),  -- pd 5
            vec(854.73, -1294.65, 28.24),   -- Detective
            vec(383.34, 799.79, 190.49),    -- pd 8
            vec(1833.07, 3679.46, 34.19),   -- sheriff sandy
            vec(-438.39, 6008.0, 37.0),     -- sheriff paleto
            vec(-2354.06, 3264.26, 32.81),  -- Army
        },
        job = 'detective',
        limit = 20,
        maxWeight = 500,
    },
-- mechanic
    {
        coords = {
            vec(1350.34,-779.98,67.31), -- mc rast
            vec(599.74,611.3,135.11),   -- mc portal
            vec(1223.9,2732.18,38.22),  -- mc sandy
            vec(153.9,-3011.23,7.04),   -- mc tune
        },
        job = 'mechanic',
        limit = 20,
        maxWeight = 500,
    },
-- ambulance
    {
        coords = {
            vec(1147.43, -1561.23, 35.38),  -- md 1
            vec(-1842.22, -334.34, 49.25),  -- md 2
            vec(-265.21, 6324.63, 32.43),   -- md paleto
            vec(1774.2, 3660.51, 40.4),     -- Administatior
        },
        job = 'ambulance',
        limit = 20,
        maxWeight = 500,
    },
-- taxi
    {
        coords = {
            vec(367.62, -1599.28, 29.29),   -- tx asli
            vec(-807.46, -1358.39, 5.15),   -- tx 2
            vec(2518.04, 4099.99, 38.71),   -- tx sandy
            vec(-366.64, 6044.61, 31.44),   -- tx paleto
            vec(1773.22, 3662.43, 40.4),    -- Administatior
        },
        job = 'taxi',
        limit = 20,
        maxWeight = 500,
    },
-- weazel
    {
        coords = {
            vec(-557.04,-914.91,33.34), -- wz 1
            vec(-812.39,-694.42,28.06), -- wz 2
        },
        job = 'weazel',
        limit = 20,
        maxWeight = 500,
    },
-- fbi
    {
        coords = {
            vec(-561.61, -205.87, 43.37), -- fbi justic
            vec(152.17, -735.9, 242.15),  -- fbi 1
            vec(2508.42, -441.9, 106.91), -- fbi 2
            vec(1781.94, 3647.97, 35.34), -- Administatior
            vec(-2361.53, 3243.2, 92.9),  -- Army
        },
        job = 'fbi',
        limit = 20,
        maxWeight = 500,
    },
-- justice
    {
        coords = {
            vec(-561.61, -205.76, 43.37), -- justice
        },
        job = 'justice',
        limit = 20,
        maxWeight = 500,
    },
-- resturan
    {
        coords = {
            vec(-586.25, -1061.99, 22.34),  -- resturan gorbe
            vec(119.72, -1048.28, 29.28),   -- resturan parking markazi
            vec(-1656.52, 173.41, 61.73),   -- resturan shams
            vec(-1343.26, -1061.38, 7.39),  -- resturan B
        },
        job = 'resturan',
        limit = 20,
    },

-- Gangs
    { -- Admins lvl 20
        coords = {
            vec(-419.67, 1096.26, 327.65),
        },
        gang = 'Admins',
        limit = 20,
        maxWeight = 500,
    },
    { -- Sylla lvl 10
        coords = {
            vec(-646.28, -2388.23, 13.95),
        },
        gang = 'Sylla',
        limit = 5,
        maxWeight = 250,
    },
    { -- GroveStreet lvl 18
        coords = {
            vec(-1531.24, -94.71, 54.53),
        },
        gang = 'GroveStreet',
        limit = 10,
        maxWeight = 500,
    },
    { -- TALEB lvl 13
        coords = {
            vec(948.94, -2123.89, 31.44),
        },
        gang = 'TALEB',
        limit = 5,
        maxWeight = 250,
    },
    { -- DEVIANT lvl 8
        coords = {
            vec(-800.59, 174.62, 76.74),
        },
        gang = 'DEVIANT',
        limit = 2,
        maxWeight = 100,
    },
    { -- Capone lvl 17
        coords = {
            vec(842.94, -2500.06, 28.43),
        },
        gang = 'Capone',
        limit = 10,
        maxWeight = 500,
    },
    { -- NATO lvl 10
        coords = {
            vec(-1601.74, -21.51, 57.77),
        },
        gang = 'NATO',
        limit = 5,
        maxWeight = 250,
    },
    { -- el_poder lvl 7
        coords = {
            vec(159.99, -2203.25, 4.69),
        },
        gang = 'el_poder',
        limit = 5,
        maxWeight = 250,
    },
    { -- Purple lvl 12
        coords = {
            vec(964.16, -104.39, 74.36),
        },
        gang = 'Purple',
        limit = 5,
        maxWeight = 250,
    },
    { -- Alghaede lvl 18
        coords = {
            vec(-625.36, -1616.58, 33.01),
        },
        gang = 'Alghaede',
        limit = 10,
        maxWeight = 500,
    },
    { -- Syc lvl 14
        coords = {
            vec(-109.62, 981.89, 235.78),
        },
        gang = 'Syc',
        limit = 10,
        maxWeight = 500,
    },
    { -- GOD_OF_GAMERS lvl 11
        coords = {
            vec(959.27, -108.38, 74.36),
        },
        gang = 'GOD_OF_GAMERS',
        limit = 5,
        maxWeight = 250,
    }, 
    { -- BUSHEHR lvl 11
        coords = {
            vec(1357.19, -2104.98, 52.0),
        },
        gang = 'BUSHEHR',
        limit = 5,
        maxWeight = 250,
    }, 
    { -- Hydra lvl 13
        coords = {
            vec(-140.0, 874.05, 232.69),
        },
        gang = 'Hydra',
        limit = 5,
        maxWeight = 250,
    }, 
    { -- SILENT_HELL lvl 9
        coords = {
            vec(-853.27, -28.49, 44.16),
        },
        gang = 'SILENT_HELL',
        limit = 2,
        maxWeight = 100,
    }, 
    { -- Ochi lvl 9
        coords = {
            vec(-11.61, 516.65, 174.63),
        },
        gang = 'Ochi',
        limit = 5,
        maxWeight = 250,
    }, 
    { -- Alpha lvl 12
        coords = {
            vec(-475.14, -1658.53, 18.79),
        },
        gang = 'Alpha',
        limit = 5,
        maxWeight = 250,
    }, 
    { -- VaGoS lvl 9
        coords = {
            vec(-1205.92, 287.64, 69.68),
        },
        gang = 'VaGoS',
        limit = 2,
        maxWeight = 100,
    }, 
    { -- FOX lvl 10
        coords = {
            vec(-580.18, -2320.75, 13.83),
        },
        gang = 'FOX',
        limit = 5,
        maxWeight = 250,
    }, 
    { -- Sopranos lvl 10
        coords = {
            vec(1002.77, -2530.59, 28.45), 
        },
        gang = 'Sopranos',
        limit = 5,
        maxWeight = 250,
    }, 
    { -- Raven lvl 11
        coords = {
            vec(1012.65, -2547.78, 28.29),
        },
        gang = 'Raven',
        limit = 5,
        maxWeight = 250,
    },
    { -- DISORDER lvl 11
        coords = {
            vec(-858.39, -35.99, 40.56),
        },
        gang = 'DISORDER',
        limit = 5,
        maxWeight = 250,
    },
    { -- Ballas lvl 10
        coords = {
            vec(-746.81, -1415.79, 5.01),
        },
        gang = 'Ballas',
        limit = 5,
        maxWeight = 250,
    },
    { -- Shelby lvl 8
        coords = {
            vec(-973.27, 104.77, 55.67),
        },
        gang = 'Shelby',
        limit = 2,
        maxWeight = 100,
    },
    { -- BAD_BAX lvl 9
        coords = {
            vec(208.23, 760.93, 205.01),
        },
        gang = 'BAD_BAX',
        limit = 2,
        maxWeight = 100,
    },
    { -- cukur_Godal lvl 9
        coords = {
            vec(222.08, -1993.41, 19.62),
        },
        gang = 'cukur_Godal',
        limit = 2,
        maxWeight = 100,
    },
    { -- savak lvl 6
        coords = {
            vec(231.41, 771.87, 204.78),
        },
        gang = 'savak',
        limit = 2,
        maxWeight = 100,
    },
    { -- ZAKHAR lvl 7
        coords = {
            vec(-568.55, 291.07, 79.18),
        },
        gang = 'ZAKHAR',
        limit = 2,
        maxWeight = 100,
    },
    { -- coyote lvl 5
        coords = {
            vec(-1126.76, 315.45, 66.18),
        },
        gang = 'coyote',
        limit = 2,
        maxWeight = 100,
    },
    { -- Mandem lvl 11
        coords = {
            vec(-1516.89, 851.5, 181.59),
        },
        gang = 'Mandem',
        limit = 5,
        maxWeight = 250,
    },
    { -- Samurai lvl 12
        coords = {
            vec(-372.06, -2286.85, 9.05),
        },
        gang = 'Samurai',
        limit = 5,
        maxWeight = 250,
    },
    { -- BlackHands lvl 10
        coords = {
            vec(1081.55, -2273.44, 30.86),
        },
        gang = 'BlackHands',
        limit = 5,
        maxWeight = 250,
    },
    { -- BangBros lvl 11
        coords = {
            vec(-1474.21, 513.6, 117.9),
        },
        gang = 'BangBros',
        limit = 5,
        maxWeight = 250,
    },
    { -- ULTRA lvl 10
        coords = {
            vec(262.77, -2563.21, 5.7),
        },
        gang = 'ULTRA',
        limit = 5,
        maxWeight = 250,
    },
    -- { -- Adlers lvl 3
    --     coords = {
    --         vec(-1289.46, 483.99, 97.56), 
    --     },
    --     gang = 'Adlers',
    --     limit = 2,
    --     maxWeight = 100,
    -- },
    { -- Black_Scorpions lvl 7
        coords = {
            vec(77.57, -1960.54, 20.75),
        },
        gang = 'Black_Scorpions',
        limit = 2,
        maxWeight = 100,
    },
    { -- SAVAGE lvl 10
        coords = {
            vec(-1586.96, -66.62, 56.79),
        },
        gang = 'SAVAGE',
        limit = 5,
        maxWeight = 250,
    },
    { -- GeNTrY lvl 10
        coords = {
            vec(-1564.98, 412.22, 109.66),
        },
        gang = 'GeNTrY',
        limit = 5,
        maxWeight = 250,
    },
    { -- GULAG_GANG lvl 10
        coords = {
            vec(-82.74, -1830.04, 26.91),
        },
        gang = 'GULAG_GANG',
        limit = 5,
        maxWeight = 250,
    },
    { -- commando lvl 5
        coords = {
            vec(-1936.5, 2047.69, 140.87),
        },
        gang = 'commando',
        limit = 2,
        maxWeight = 100,
    },
    { -- Rooster lvl 7
        coords = {
            vec(-1819.68, 434.73, 132.31),
        },
        gang = 'Rooster',
        limit = 2,
        maxWeight = 100,
    },
    { -- Rogue lvl 11
        coords = {
            vec(-1542.94, -249.02, 48.28),
        },
        gang = 'Rogue',
        limit = 5,
        maxWeight = 250,
    },
    { -- Senator_Family lvl 10
        coords = {
            vec(-151.67, 910.73, 235.66),
        },
        gang = 'Senator_Family',
        limit = 5,
        maxWeight = 250,
    },
    { -- BlackMask lvl 12
        coords = {
            vec(-2009.13, 287.81, 91.98),
        },
        gang = 'BlackMask',
        limit = 5,
        maxWeight = 250,
    },
    { -- Khalifa lvl 6
        coords = {
            vec(952.61, -116.93, 75.01),
        },
        gang = 'Khalifa',
        limit = 2,
        maxWeight = 100,
    },
    { -- Al_Nasr lvl 10
        coords = {
            vec(-972.9, 104.44, 55.67),
        },
        gang = 'Al_Nasr',
        limit = 5,
        maxWeight = 250,
    },
    { -- Alliance lvl 9
        coords = {
            vec(-2800.4, 1428.52, 100.93),
        },
        gang = 'Alliance',
        limit = 2,
        maxWeight = 100,
    },
    { -- Siege lvl 5
        coords = {
            vec(-563.13, 285.8, 85.38),
        },
        gang = 'Siege',
        limit = 2,
        maxWeight = 100,
    },
    { -- 2poc lvl 8
        coords = {
            vec(-1731.73, 330.58, 87.16),
        },
        gang = '2poc',
        limit = 2,
        maxWeight = 100,
    },
    { -- Vikings lvl 8
        coords = {
            vec(-1590.07, -62.18, 56.48),
        },
        gang = 'Vikings',
        limit = 2,
        maxWeight = 100,
    },
}
