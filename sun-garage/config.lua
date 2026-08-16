Config = {}
Config.UseDamageMult = true -- If true it costs more to store a Broken Vehicle.
Config.DamageMult = 8 -- Higher Number = Higher Repair Price.

Config.CarPoundPrice      = 5000 -- Car Pound Price.
Config.BoatPoundPrice     = 50000 -- Boat Pound Price.
Config.AircraftPoundPrice = 100000 -- Aircraft Pound Price.

Config.zones = {
    spawnCar = {
        label = '[E]',
        icon = 'fa-solid fa-square-parking fa-beat',
        type = 'car',
        label2 = 'Mashin',
        coords = {
            { -- garag 1
                garagePoint = vec(240.77, -792.27, 30.48, 35.0),
                spawnPoints = {
                    { coords = vec(229.72, -806.15, 30.51, 160.0) },
                    { coords = vec(232.32, -798.26, 30.55, 160.0) },
                    { coords = vec(235.02, -791.21, 30.57, 160.0) },
                    { coords = vec(237.81, -784.33, 30.61, 160.0) },
                    { coords = vec(240.43, -776.32, 30.68, 160.0) },
                },
                blip = vec(216.85, -810.03, 30.71),
            },
            { -- garag 2
                garagePoint = vec(126.88, -1073.28, 29.19, 30.0),
                spawnPoints = {
                    { coords = vec(107.55, -1063.97, 28.80, 244.74) },
                    { coords = vec(108.65, -1060.05, 28.80, 244.60) },
                    { coords = vec(110.00, -1056.76, 28.81, 245.52) },
                    { coords = vec(138.86, -1069.64, 28.84, 180.60) },
                    { coords = vec(135.64, -1070.08, 28.84, 181.94) },
                    { coords = vec(132.33, -1069.58, 28.84, 179.77) },
                },
				blip = vec(122.96, -1068.51, 29.19),
            },
			{ -- garag 3
                garagePoint = vec(373.0, 281.15, 103.37, 23.0),
                spawnPoints = {
					{ coords = vec(370.91, 284.20, 102.91, 340.21) },
					{ coords = vec(374.62, 283.26, 102.84, 339.46) },
					{ coords = vec(378.83, 282.10, 102.76, 337.78) },
					{ coords = vec(375.70, 273.62, 102.72, 160.62) },
					{ coords = vec(371.89, 275.29, 102.78, 160.69) },
					{ coords = vec(368.27, 276.88, 102.84, 158.64) },
                },
				blip = vec(373.0, 281.15, 103.37),
            },
			{ -- garag 4
                garagePoint = vec(-300.55, -905.57, 31.6, 30.0),
                spawnPoints = {
					{ coords = vec(-296.29, -886.75, 31.08, 167.32) },
					{ coords = vec(-303.63, -885.18, 31.08, 167.68) },
					{ coords = vec(-311.05, -882.21, 31.08, 172.74) },
					{ coords = vec(-309.42, -897.34, 31.08, 346.40) },
					{ coords = vec(-316.66, -894.55, 31.08, 348.19) },
					{ coords = vec(-323.87, -894.85, 31.08, 352.24) },
                },
				blip = vec(-300.55, -905.57, 31.61),
            },
			{ -- garag 5
                garagePoint = vec(1730.04, 3719.86, 34.07, 12.0),
                spawnPoints = {
					{ coords = vec(1737.84, 3719.28, 33.04, 21.22) },
                },
				blip = vec(1730.04, 3719.86, 34.07),
            },
			{ -- garag 6
                garagePoint = vec(130.05, 6606.26, 31.85, 23.0),
                spawnPoints = {
					{ coords = vec(128.78, 6622.99, 30.78, 315.01) },
                },
				blip = vec(130.05, 6606.26, 31.85),
            },
			{ -- garag 7 paintball 
				garagePoint = vec(-1620.85, 5123.33, 19.79, 18.0),
				spawnPoints = {
					{ coords = vec(-1632.97, 5115.16, 19.79, 300.47) },
					{ coords = vec(-1636.50, 5121.26, 19.79, 297.85) },
					{ coords = vec(-1625.99, 5133.77, 19.79, 210.43) },
				},
				blip = vec(-1620.85, 5123.33, 19.79),
			},
			{ -- garag 8 bimarestan
				garagePoint = vec(1196.37, -1382.36, 35.22, 15.0),
				spawnPoints = {
					{ coords = vec(1198.35, -1402.86, 35.22, 180.96) },
				},
				blip = vec(1196.37, -1382.36, 35.22),
			},
			{ -- garag 9 PD2
				garagePoint = vec(610.24, 95.89, 92.54, 20.0),
				spawnPoints = {
					{ coords = vec(600.2 , 97.82, 92.33, 246.48) },
				},
				blip = vec(610.24, 95.89, 92.54),
			},
			{ -- garag 10 saheli
				garagePoint = vec(-2036.26, -471.74, 11.42, 25.0),
				spawnPoints = {
					{ coords = vec(-2024.47 , -472.47, 11.4, 319.31) },
				},
				blip = vec(-2036.26, -471.74, 11.42),
			},
			{ -- garag 11 Island tp
				garagePoint = vec(540.35, -3044.67, 6.07, 15.0),
				spawnPoints = {
					{ coords = vec(542.86 , -3051.0, 6.07, 2.47) },
				},
				blip = vec(540.35, -3044.67, 6.07),
			},
		},
    },
	spawnHeli = {
        label = '[E]',
        icon = 'fa-solid fa-square-parking fa-beat',
        type = 'heli',
        label2 = 'Forodgah',
        coords = {
            { -- foroodgah payin
				garagePoint = vec(-1653.2, -3145.96, 14.0, 35.0),
				spawnPoints = {
					{ coords = vec(-1653.1, -3144.63, 13.99, 327.71) }
				},
				blip = vec(-1653.2, -3145.96, 14.0),
			},
            { -- foroodgah sandy
				garagePoint = vec(1693.54, 3247.75, 40.9, 30.0),
				spawnPoints = {
					{ coords = vec(1693.54, 3247.75, 40.9, 100.42) }
				},
				blip = vec(1693.54, 3247.75, 40.9),
			},
            { -- foroodgah sandy mythic
				garagePoint = vec(2123.97, 4801.5, 41.03, 30.0),
				spawnPoints = {
					{ coords = vec(2123.97, 4801.5, 41.03, 112.62) }
				},
				blip = vec(2123.97, 4801.5, 41.03),
			},
            { -- paintball 1 
				garagePoint = vec(-1619.75, 5153.14, 21.52, 8.0),
				spawnPoints = {
					{ coords = vec(-1619.75, 5153.14, 21.52, 30.89) }
				},
				blip = vec(-1619.75, 5153.14, 21.52),
			},
            { -- paintball 2 
				garagePoint = vec(-1645.35, 5138.98, 21.52, 8.0),
				spawnPoints = {
					{ coords = vec(-1645.35, 5138.98, 21.52, 32.17) }
				},
				blip = vec(-1645.35, 5138.98, 21.52),
			},
        },
    },
	spawnboat = {
        label = '[E]',
        icon = 'fa-solid fa-square-parking fa-beat',
        type = 'boat',
        label2 = 'Eskele',
        coords = {
            { -- boat 1
				garagePoint = vec(-718.87, -1320.18, -0.47, 15.0),
				spawnPoints = {
					{ coords = vec(-718.87, -1320.18, -0.47, 45.0) }
				},
				blip = vec(-718.87, -1320.18, -0.47),
			},
            { -- boat 2
				garagePoint = vec(1334.61, 4264.68, 29.86, 15.0),
				spawnPoints = {
					{ coords = vec(1334.61, 4264.68, 29.86, 87.0) }
				},
				blip = vec(1334.61, 4264.68, 29.86),
			},
            { -- boat 3
				garagePoint = vec(-290.46, 6622.72, -0.47, 15.0),
				spawnPoints = {
					{ coords = vec(-290.46, 6622.72, -0.47, 52.0) }
				},
				blip = vec(-290.46, 6622.72, -0.47),
			},
            { -- boat 4
				garagePoint = vec(-1600.48, 5262.57, 0.31, 15.0),
				spawnPoints = {
					{ coords = vec(-1600.48, 5262.57, 0.31, 40.50) }
				},
				blip = vec(-1600.48, 5262.57, 0.31),
			},
        },
    },
}

Config.pounds = {
    vec(-191.77, -1166.11, 23.67),
    vec(1651.38, 3804.84, 37.65),
    vec(-234.82, 6198.65, 30.9),
}

Config.ParkMeter = {

--- aparteman
	-- aparteman dakhele shahr
    { coords = vec(753.63, -1753.43, 29.22, 86.24),		range = 11 },	-- Aparteman 1
	{ coords = vec(778.65, -1760.6, 29.48, 268.68),		range = 15 },	-- Aparteman 1
    { coords = vec(961.21, -201.38, 73.11, 326.73),		range = 20 },	-- Aparteman 5
    { coords = vec(-796.13, 300.93, 85.71, 179.04),		range = 22 },	-- Aparteman 1
	{ coords = vec(-752.94, 305.31, 85.69, 89.38),		range = 21 },	-- Aparteman 1
	{ coords = vec(-1277.8, 280.59, 64.87, 198.4),		range = 30 },	-- Aparteman 4
    { coords = vec(-1412.04, -529.98, 31.53, 214.0),	range = 20 },	-- Aparteman 7
	{ coords = vec(-1410.45, -570.91, 30.34, 303.39),	range = 20 },	-- Aparteman 7
    { coords = vec(-821.09, -1203.87, 6.93, 60.29),		range = 16 },	-- Aparteman 3
	{ coords = vec(-840.77, -1229.28, 6.93, 47.5),		range = 16 },	-- Aparteman 3
    { coords = vec(-885.1, -2108.43, 8.86, 312.76),		range = 20 },	-- Aparteman 6
	-- aparteman birun shahr
	{ coords = vec(1121.57, 2652.13, 38.0, 0.59),		range = 20 },	-- Aparteman 2 kenare mechanicki sandy
	{ coords = vec(1594.39, 3620.69, 35.15, 31.72),		range = 27 },	-- Aparteman 9 kenare sheriff sandy
	{ coords = vec(-84.64, 6345.09, 31.49, 138.36),		range = 23 },	-- kenare banke paleto

-- Robs
    { coords = vec(-1309.24, -853.54, 15.82, 34.25),	range = 5  },	-- maze bank
    { coords = vec(254.79, 189.37, 104.84, 66.72), 		range = 5  },	-- Center Bank
    { coords = vec(-125.96, 6478.01, 31.47, 134.92),	range = 5  },	-- Bank Sheriff
    { coords = vec(-2955.91, 492.85, 15.31, 84.07),		range = 5  },	-- Bank Sahel
    { coords = vec(-1100.78, -259.02, 37.69, 197.54),	range = 3  },	-- Bimeh
    { coords = vec(-669.54, -225.84, 37.18, 136.25),	range = 10 },	-- javaheri
    { coords = vec(2781.25, 3460.39, 55.47, 160.11),	range = 10 },	-- javaheri Shams
    { coords = vec(298.17, -268.35, 54.02, 339.93),		range = 10 },	-- mini bank 1
    { coords = vec(-349.56, -33.56, 47.44, 71.76), 		range = 10 },	-- mini bank 2
    { coords = vec(-1193.0, -318.24, 37.71, 31.8), 		range = 10 },	-- mini bank 3
    { coords = vec(1192.75, 2695.76, 37.93, 99.34),		range = 10 },	-- mini bank 4
    { coords = vec(2415.85, 4967.97, 46.12, 133.79),	range = 10 },	-- MyThic
    { coords = vec(-1058.31, 4905.99, 211.24, 287.22),	range = 5  },	-- Cargo
	{ coords = vec(820.35, -2052.61, 29.41, 82.66),		range = 10 },	-- jawaheri flat
	{ coords = vec(822.61, -1973.25, 29.18, 358.03),	range = 10 },	-- jawaheri flat

-- Jobs
	{ coords = vec(855.07, -1586.73, 31.25, 7.55), 		range = 15 },	-- minery start
    { coords = vec(846.22, -1558.94, 29.82, 22.56),		range = 15 },	-- minery start
	{ coords = vec(898.71, -1572.15, 30.85, 90.44),		range = 20 },	-- minery start
    { coords = vec(1063.59, -1963.97, 31.01, 1.32),		range = 30 },	-- minery zob

	{ coords = vec(137.44, -1451.6, 29.18, 50.07), 		range = 10 },	-- barbari
    { coords = vec(-1057.8, -2019.48, 13.16, 136.13),	range = 7  },	-- ghasab
    { coords = vec(1205.69, -1266.3, 35.23, 172.99),	range = 15 },	-- choob bor
    { coords = vec(704.42, -986.2, 24.09, 275.0),		range = 15 },	-- khayat
    { coords = vec(550.75, -2307.61, 5.88, 263.27),		range = 15 },	-- sherkat naft 
	{ coords = vec(-580.76, 5251.82, 70.47, 332.08),	range = 20 },	-- shekar
	{ coords = vec(-593.28, 5291.25, 70.21, 164.53),	range = 22 },	-- shekar

-- job dolati
    -- taxi
    { coords = vec(388.12, -1633.16, 29.29, 323.56),	range = 5  },
	{ coords = vec(355.59, -1574.2, 29.3, 322.86), 		range = 10 },
    -- medic
    { coords = vec(-233.88, 6307.11, 31.33, 140.02),	range = 10 },
    { coords = vec(1829.54, 3659.27, 33.92, 120.39),	range = 10 },
	-- MC tune
	{ coords = vec(168.6, -3048.44, 5.84, 266.12),		range = 10 },
	-- Roberoye Bimarestan 1
	{ coords = vec(1171.79, -1422.88, 34.57, 87.72),	range = 12 },
	{ coords = vec(1116.01, -1443.88, 35.96, 268.71),	range = 12 },
	{ coords = vec(1185.17, -1446.76, 34.85, 268.48),	range = 12 },
	{ coords = vec(1160.73, -1446.76, 34.61, 267.2),	range = 12 },
	{ coords = vec(1138.27, -1445.97, 34.6, 270.32),	range = 10 },
    -- Roberoye Bimarestan 2
	{ coords = vec(-1855.9, -401.26, 46.2, 56.34),		range = 21 },
	{ coords = vec(-1886.75, -374.47, 48.76, 48.59),	range = 20 },
	-- FBI NEW
	{ coords = vec(56.31, -744.78, 44.14, 347.33),		range = 10 },	-- FBI 1
	{ coords = vec(2541.64, -384.07, 92.99, 262.93),	range = 30 },	-- fbi 2
    -- mechanic
    { coords = vec(1360.75, -715.31, 66.39, 76.15),		range = 10 },
	{ coords = vec(658.46, 630.69, 128.91, 254.27),		range = 10 },
	-- police
	{ coords = vec(-1100.84, -793.02, 18.75, 308.55),	range = 10 },	-- PD 5
	{ coords = vec(832.19, -1265.07, 26.28, 91.88),		range = 15 },	-- detective
	-- fbi
	{ coords = vec(-487.57, -254.19, 35.65, 229.2),		range = 6  },	-- justic
	{ coords = vec(-498.36, -258.75, 35.52, 226.71),	range = 6  },	-- justic
	{ coords = vec(-520.48, -267.61, 35.31, 233.01),	range = 6  },	-- justic
	{ coords = vec(-531.49, -271.92, 35.21, 234.82),	range = 6  },	-- justic
	-- { coords = vec(-503.16, -231.67, 37.6, 67.27),		range = 5  },	-- justic heli movaghat
	-- { coords = vec(-541.93, -253.1, 37.26, 179.09),		range = 5  },	-- justic heli movaghat
	-- Resturan
	{ coords = vec(-572.7, -1107.92, 22.18, 179.54),	range = 20 },	-- caffe gorbe
	{ coords = vec(-1328.22, -1095.5, 6.87, 116.5),		range = 10 },	-- burger shop  
	{ coords = vec(107.6, -1033.04, 29.22, 342.14),		range = 10 },	-- resturan markazi 
	-- administatior 
	{ coords = vec(1779.28, 3628.55, 34.71, 120.01), 	range = 15 },	-- administatior
	-- weazel carbimeh
	{ coords = vec(-840.64, -696.89, 27.35, 92.33), 	range= 13 },

-- parking
    { coords = vec(-1607.31, 172.32, 59.58, 205.93),	range = 20 },	-- resturan
    { coords = vec(371.29, -951.33, 29.36, 88.38), 		range = 10 },	-- parking kenare pd
	{ coords = vec(202.9, -843.48, 30.57, 246.63), 		range = 20 },	-- parking markazi
	{ coords = vec(240.01, -856.82, 29.64, 253.02),		range = 20 },	-- parking markazi

-- teleporter jazire
	{ coords = vec(618.31, -3023.41, 6.03, 92.16), 		range = 20 },
	{ coords = vec(586.21, -3040.52, 6.07, 91.38), 		range = 20 },

-- Air & Boots
    { coords = vec(-1614.69, -3124.42, 13.94, 328.19), 	range = 10 },
    { coords = vec(1737.29, 3286.85, 41.13, 180.14),	range = 10 },
    { coords = vec(1312.11, 4318.87, 38.13, 357.77),	range = 10 },
    { coords = vec(-195.24, 6553.95, 11.07, 132.45),	range = 10 },
	{ coords = vec(-745.41, -1309.73, 5.0, 57.23), 		range = 10 },
	-- Island
	{ coords = vec(4928.18, -4904.38, 3.54, 219.24),	range = 10 },
	{ coords = vec(4890.39, -5736.64, 26.35, 337.73),	range = 10 },

-- sahele coca
	{ coords = vec(-1801.66, -951.94, 2.42, 291.05),	range = 20 },
	{ coords = vec(-1821.24, -911.46, 2.46, 285.21),	range = 20 },
	{ coords = vec(-1842.74, -872.03, 2.97, 305.34), 	range = 20 },
	{ coords = vec(-1878.41, -826.49, 2.98, 323.3), 	range = 30 },
	{ coords = vec(-1923.04, -769.08, 2.97, 318.01), 	range = 30 },
	{ coords = vec(-1961.13, -723.6, 2.97, 318.59), 	range = 30 },
	{ coords = vec(-2004.68, -1043.51, 2.02, 150.73), 	range = 20 },	-- dakhele ab
	{ coords = vec(-1912.33, -871.65, 0.85, 146.56),	range = 20 },	-- dakhele ab

-- lebas forooshi
	{ coords = vec(93.3, -1401.26, 29.18, 43.58), 		range = 15 },
	{ coords = vec(-732.04, -144.56, 37.17, 31.89), 	range = 15 },
	{ coords = vec(-146.35, -306.46, 38.86, 165.0), 	range = 15 },
	{ coords = vec(410.56, -810.25, 29.21, 2.52), 		range = 15 },
	{ coords = vec(-817.92, -1090.47, 10.97, 297.07), 	range = 15 },
	{ coords = vec(-1458.96, -225.95, 49.14, 318.98), 	range = 15 },
	{ coords = vec(-4.88, 6520.65, 31.29, 315.92), 		range = 15 },
	{ coords = vec(134.0, -200.37, 54.34, 251.27), 		range = 15 },
	{ coords = vec(1678.56, 4817.67, 42.01, 10.51), 	range = 15 },
	{ coords = vec(591.86, 2732.42, 42.06, 183.72), 	range = 35 },
	{ coords = vec(-1209.58, -787.92, 16.86, 40.49), 	range = 15 },
	{ coords = vec(-3153.96, 1079.4, 20.69, 256.67), 	range = 15 },
	{ coords = vec(-1101.0, 2694.94, 18.92, 139.72), 	range = 15 },

-- arayeshgah
	{ coords = vec(-829.94, -193.28, 37.38, 33.62), 	range = 15 },
	{ coords = vec(129.42, -1718.19, 29.05, 53.21), 	range = 15 },
	{ coords = vec(-1278.88, -1150.64, 6.19, 18.1), 	range = 15 },
	{ coords = vec(1939.24, 3736.46, 32.3, 212.58), 	range = 15 },
	{ coords = vec(1196.18, -469.56, 66.15, 345.77),	range = 15 },
	{ coords = vec(-29.08, -136.92, 57.0, 247.3), 		range = 15 },
	{ coords = vec(-289.07, 6238.94, 31.36, 315.38), 	range = 15 },

-- shop
	{ coords = vec(-46.3, -1738.78, 29.15, 44.24), 		range = 15 },
	{ coords = vec(15.34, -1343.16, 29.29, 180.9), 		range = 15 },
	{ coords = vec(1133.65, -974.33, 46.57, 277.01), 	range = 15 },
	{ coords = vec(1155.18, -337.54, 68.16, 177.28), 	range = 15 },
	{ coords = vec(367.9, 340.54, 103.23, 165.49), 		range = 15 },
	{ coords = vec(-1468.8, -393.15, 38.56, 128.09), 	range = 15 },
	{ coords = vec(-1249.57, -914.58, 11.46, 300.63), 	range = 15 },
	{ coords = vec(-729.0, -911.89, 19.01, 178.38), 	range = 15 },
	{ coords = vec(-1820.9, 808.46, 138.78, 220.86), 	range = 15 },
	{ coords = vec(-2962.81, 370.95, 14.77, 75.35), 	range = 15 },
	{ coords = vec(-3050.99, 603.42, 7.26, 289.93), 	range = 15 },
	{ coords = vec(-3250.83, 987.53, 12.49, 277.6), 	range = 15 },
	{ coords = vec(566.05, 2668.39, 42.07, 6.02), 		range = 15 },
	{ coords = vec(2566.47, 405.66, 108.46, 184.57), 	range = 15 },
	{ coords = vec(2659.2, 3260.97, 55.24, 241.14), 	range = 15 },
	{ coords = vec(1978.65, 3748.37, 32.18, 206.93), 	range = 15 },
	{ coords = vec(1689.1, 4914.11, 42.08, 53.09), 		range = 15 },
	{ coords = vec(1720.54, 6425.48, 33.38, 153.83), 	range = 15 },
	{ coords = vec(1661.6, 4859.7, 41.95, 186.15), 		range = 15 },	-- mini javahery
	{ coords = vec(-1131.78, -1340.33, 5.02, 113.14),	range = 15 },	-- mini javahery
	{ coords = vec(-1532.96, -435.11, 35.44, 221.78),	range = 15 },	-- mini javahery

-- kasti gabz
	{ coords = vec(-1631.69, -1813.33, 0.82, 290.17), 	range = 15 },
	{ coords = vec(-2171.45, -2586.06, 0.1, 229.08), 	range = 15 },
	{ coords = vec(-1396.43, -3778.88, -0.31, 351.56), 	range = 15 },
	{ coords = vec(-819.78, -3935.94, 0.71, 0.46), 		range = 15 },
	{ coords = vec(-316.2, -3496.39, 0.85, 59.05), 		range = 15 },
	{ coords = vec(1577.41, -2986.72, 0.09, 57.58), 	range = 15 },
	{ coords = vec(1993.17, -2860.14, 1.65, 33.94), 	range = 15 },
	{ coords = vec(2557.59, -2411.34, 0.69, 182.46), 	range = 15 },
	{ coords = vec(3021.29, -1943.84, 0.15, 61.26), 	range = 15 },
	{ coords = vec(3047.39, -1431.48, 1.99, 71.9), 		range = 15 },
	{ coords = vec(3013.89, -792.65, 1.37, 81.25), 		range = 15 },
	{ coords = vec(3352.16, 1153.81, 1.44, 11.9), 		range = 15 },
	{ coords = vec(3418.64, 2044.39, 1.67, 64.75), 		range = 15 },
	{ coords = vec(3784.0, 2478.04, 2.41, 86.75), 		range = 15 },
	{ coords = vec(4195.92, 3302.74, 2.36, 79.13), 		range = 15 },
	{ coords = vec(4195.86, 3927.8, 2.37, 66.52), 		range = 15 },
	{ coords = vec(4277.99, 4513.56, 2.33, 113.9), 		range = 15 },
	{ coords = vec(3803.96, 5707.75, 2.37, 136.0), 		range = 15 },
	{ coords = vec(3556.29, 6279.45, 2.4, 146.33), 		range = 15 },
	{ coords = vec(1933.15, 6896.29, 2.38, 195.14), 	range = 15 },
	{ coords = vec(1466.42, 6858.46, 2.38, 162.74), 	range = 15 },
	{ coords = vec(620.04, 7068.4, 1.51, 122.34), 		range = 15 },
	{ coords = vec(-400.84, 6881.34, 1.82, 255.33), 	range = 15 },
	{ coords = vec(-836.27, 6534.93, 1.26, 214.33), 	range = 15 },
	{ coords = vec(-1166.72, 5908.9, 0.62, 274.85), 	range = 15 },
	{ coords = vec(-2320.78, 4752.61, 2.06, 208.05), 	range = 15 },
	{ coords = vec(-2793.8, 4143.32, 0.07, 240.87), 	range = 15 },
	{ coords = vec(-3263.28, 3615.59, 1.56, 268.0), 	range = 15 },
	{ coords = vec(-3143.62, 2738.24, 1.26, 281.99),	range = 15 },
	{ coords = vec(-3281.8, 2068.37, 1.27, 284.94), 	range = 15 },
	{ coords = vec(-3506.73, 1547.62, 0.68, 231.17), 	range = 15 },
	{ coords = vec(-3458.42, 377.12, 0.12, 269.01), 	range = 15 },
	{ coords = vec(-3135.79, -220.88, 0.53, 6.45), 		range = 15 },
	{ coords = vec(-2639.18, -577.0, 1.82, 329.51), 	range = 15 },
	{ coords = vec(3643.17, 5275.48, 2.44, 124.65), 	range = 15 },
	{ coords = vec(-2051.37, -1496.57, 0.32, 19.85), 	range = 15 },
	
-- motofareghe
	{ coords = vec(149.22, -1307.55, 29.2, 93.14), 		range = 20 },	-- Club
	{ coords = vec(-1569.63, -865.59, 10.06, 316.16), 	range = 30 },	-- CarDelaer
	{ coords = vec(-54.46, -1110.23, 26.44, 70.88), 	range = 15 },	-- car shop
	{ coords = vec(-198.05, -2003.87, 27.62, 259.56), 	range = 30 },	-- game net
	{ coords = vec(-1574.04, 5094.54, 26.67, 163.68), 	range = 20 },	-- Paintball
	{ coords = vec(216.36, 1236.93, 225.46, 189.46), 	range = 30 },	-- mozayede
	{ coords = vec(-188.94, -1149.79, 22.95, 270.29), 	range = 15 },	-- impound

	{ coords = vec(-1013.06, -2114.55, 12.33, 228.57), 	range = 15 },	-- AH
	{ coords = vec(54.87, -1566.66, 29.44, 50.96), 		range = 15 },	-- AH
	{ coords = vec(142.07, 6638.76, 32.65, 135.13), 	range = 5  }, 	-- paleto AH
	{ coords = vec(148.45, 6625.48, 31.75, 134.64), 	range = 10 }, 	-- paleto AH
	{ coords = vec(171.69, 6622.42, 31.78, 135.81), 	range = 14 }, 	-- paleto AH
	{ coords = vec(476.25, 6591.99, 30.94, 172.25), 	range = 8  }, 	-- paleto heli AH
	{ coords = vec(454.42, 6595.33, 31.0, 178.08), 	    range = 8  }, 	-- paleto heli AH
	--drug
	{ coords = vec(-1075.81, -1663.59, 4.4, 37.46), 	range = 15 },	-- ephedrine
	{ coords = vec(3616.71, 3738.05, 28.69, 320.91), 	range = 20 },	-- opum
	{ coords = vec(2314.75, 2565.84, 46.67, 348.2), 	range = 20 },	-- marijuana
	{ coords = vec(2199.22, 5566.96, 53.82, 356.34), 	range = 20 },	-- shahdane
	{ coords = vec(1622.18, 3575.16, 35.15, 212.46),	range = 27 },	-- shishe

	-- farm
	{ coords = vec(437.22, 6539.41, 27.99, 89.1), 		range = 30 },
	{ coords = vec(134.29, 6363.26, 31.33, 26.73), 		range = 17 },
	{ coords = vec(88.62, 6375.27, 31.23, 300.23), 		range = 20 },
	{ coords = vec(1832.47, 3945.3, 33.2, 273.47), 		range = 20 },
	{ coords = vec(1863.68, 3917.54, 33.08, 190.56), 	range = 20 },
	{ coords = vec(1842.02, 3892.16, 33.39, 109.63), 	range = 14 },

	-- gym
	{ coords = vec(-1209.11, -1548.5, 4.37, 302.69), 	range = 30 },

	-- car mitting
	{ coords = vec(970.38, -1770.34, 21.03, 87.43), 	range = 5 },

-- ekhtesasi
	-- public
    { coords = vec(-410.71, 1178.63, 325.64, 256.58), 	range = 20 },	-- Admins 
    { coords = vec(96.54, -1933.34, 20.8, 51.15), 		range = 30 },	-- mahale grove
	-- shakhsi
	{ coords = vec(-981.32, 777.68, 174.0, 39.52), 		range = 5  },	-- amirali
	{ coords = vec(-585.84, 527.54, 107.64, 210.95), 	range = 5  },	-- Mahdavi
	{ coords = vec(-294.39, 240.34, 88.71, 15.21), 		range = 5  },	-- armin zx
	{ coords = vec(-249.14, 607.85, 185.92, 79.48), 	range = 5  },	-- ashkan janfaza
	{ coords = vec(-956.32, 455.58, 79.7, 16.46), 		range = 5  },	-- SE
	{ coords = vec(-1343.59, 594.4, 133.69, 11.23), 	range = 5  },	-- silent 
	-- Gang
	{ coords = vec(1361.04, 1165.19, 113.57, 180.37), 	range = 5  },	-- gang alpha
	{ coords = vec(780.39, -2510.27, 20.23, 350.07), 	range = 5  }, 	-- gang Capone
	{ coords = vec(-1572.55, -78.65, 54.13, 274.62), 	range = 5  },  	-- grovestreet
	{ coords = vec(-598.19, -1586.23, 26.75, 97.76), 	range = 5  },  	-- gang Alghaede
	{ coords = vec(-992.4, 309.39, 69.13, 354.79), 		range = 5  },	-- ULTRA
	{ coords = vec(976.79, -2547.03, 28.3, 353.02), 	range = 5  },	-- Raven

}
