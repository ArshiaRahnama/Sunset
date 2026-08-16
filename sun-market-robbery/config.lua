Config = {}
Config.Locale = 'en'

Config.Marker = {
	r = 250, g = 0, b = 0, a = 100,  -- red color
	x = 1.0, y = 1.0, z = 1.5,       -- tiny, cylinder formed circle
	DrawDistance = 15.0, Type = 1    -- default circle type, low draw distance due to indoors area
}

Config.MaxDistance    = 12   -- max distance from the robbary, going any longer away from it will to cancel the robbary
Config.GiveBlackMoney = true -- give black money? If disabled it will give cash instead

policeSalary = {  -- shop
    max = 2,
	amount = {
		police  = {
			[1]  = 15000,
			[2]  = 16000,
			[3]  = 17000,
			[4]  = 18000,
			[5]  = 19000,
			[6]  = 20000,
			[7]  = 21000,
			[8]  = 22000,
			[9]  = 23000,
			[10] = 24000,
			[11] = 25000,
			['12:30'] = 5000,
		},
		-- sheriff  = 5000,
		mt  = {
			[1]  = 13000,
			[2]  = 14000,
			[3]  = 15000,
			[4]  = 16000,
			[5]  = 17000,
			[6]  = 18000,
			[7]  = 19000,
			[8]  = 20000,
			[9]  = 21000,
			[10] = 22000,
			[11] = 23000,
			['12:30'] = 5000,
		},
		justice  = {
			[1]  = 13000,
			[2]  = 14000,
			[3]  = 15000,
			[4]  = 16000,
			[5]  = 17000,
			[6]  = 18000,
			[7]  = 19000,
			[8]  = 20000,
			[9]  = 21000,
			[10] = 22000,
			['11:30'] = 5000,
		},
	},
}

Stores = {
	["paleto_twentyfourseven"] = {
		position = { x = 1736.32, y = 6419.47, z = 35.03 },
		reward = math.random(280000, 315000),
		nameOfStore = "24/7. (Paleto Bay), SHOP1",
		PoliceNumberRequired = 2,
		distance = 11,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 1,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
		pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(1732.0, 6413.28, 35.04, 152.12),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 20,
		}
	},
	["littleseoul_twentyfourseven"] = {
		position = { x = -709.17, y = -904.21, z = 19.21 },
		reward = math.random(280000, 315000),
		nameOfStore = "24/7. (Little Seoul), SHOP2",
		PoliceNumberRequired = 2,
		realposition = vector3(-712.28, -909.17, 19.22),
		distance = 10,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 2,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-711.91, -914.58, 19.22, 174.57),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 5,
		}
	},
	["Biron_shahr"] = {
		position = { x = -3249.21, y = 1005.35, z = 12.83 },
		reward = math.random(280000, 315000),
		nameOfStore = "Robs Liquor. (Biron shahr), SHOP3",
		PoliceNumberRequired = 2,
		distance = 11,
		secondsRemaining = 210, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 3,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-3242.08, 1004.6, 12.83, 263.36),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 11,
		}
	},
	["South_Senora_Fwy"] = {
		position = { x = 2673.1, y = 3286.81, z = 55.24 },
		reward = math.random(280000, 315000),
		nameOfStore = "Robs Liquor. (Biron shahr), SHOP4",
		PoliceNumberRequired = 2,
		distance = 12,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 4,
		active = true,
		policeCheck = {
			radius = 45,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(2679.82, 3283.57, 55.24, 236.96),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 16,
		}
	},
	["South_Senora_2bilon"] = {
		position = { x = 1707.54, y = 4920.12, z = 42.06 },
		reward = math.random(280000, 315000),
		nameOfStore = "Robs Liquor. (Biron 4), SHOP5",
		PoliceNumberRequired = 2,
		distance = 15,
		secondsRemaining = 350, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 5,
		active = true,
		policeCheck = {
			radius = 50,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(1700.85, 4928.12, 42.06, 54.88),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 19,
		}
	},
	["Biron_shahrr"] = {
		position = { x = -3047.31, y = 585.9, z = 7.91 },
		reward = math.random(280000, 315000),
		nameOfStore = "Robs Liquor. (Biron shahr 2), SHOP6",
		PoliceNumberRequired = 2,
		distance = 11,
		secondsRemaining = 250, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 6,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-3040.7, 588.7, 7.91, 282.66),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 10,
		}
	},
	["Downtown_Vinewood"] = {
		position = { x = 377.0, y = 333.13, z = 103.57 },
		reward = math.random(280000, 315000),
		nameOfStore = "Downtown Vinewood 24/7 Safe, SHOP7",
		PoliceNumberRequired = 2,
		distance = 12,
		secondsRemaining = 220, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 7,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(377.02, 325.42, 103.57, 161.82),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 7,
		}
	},
	["Rockford_Dr"] = {
		position = { x = -1828.91, y = 799.06, z = 138.18 },
		reward = math.random(280000, 315000),
		nameOfStore = "Rockford Dr 24/7 Safe, SHOP8",
		PoliceNumberRequired = 2,
		realposition = vector3(-1827.67, 793.33, 138.22),
		distance = 10,
		secondsRemaining = 220, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 8,
		active = true,
		policeCheck = {
			radius = 45,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-1824.18, 789.76, 138.2, 224.15),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 13,
		}
	},
	["Innocence_Blvd"] = {
		position = { x = 29.12, y = -1339.89, z = 29.5 },
		reward = math.random(280000, 315000),
		nameOfStore = "Innocence Blvd 24/7 Safe, SHOP9",
		PoliceNumberRequired = 2,
		distance = 11,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 9,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(29.01, -1346.94, 29.5, 177.12),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 1,
		}
	},
	["Route_Register"] = {
		position = { x = 546.66, y = 2663.26, z = 42.16 },
		reward = math.random(280000, 315000),
		nameOfStore = "Route 68 24/7 Register, SHOP10",
		PoliceNumberRequired = 2,
		distance = 12,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 10,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(544.62, 2670.61, 42.16, 7.94),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 14,
		}
	},
	["grove_ltd"] = {
		position = { x = -43.40, y = -1749.20, z = 29.42 },
		reward = math.random(280000, 315000),
		nameOfStore = "LTD Gasoline. (Grove Street), SHOP11",
		PoliceNumberRequired = 2,
		realposition = vector3(-48.6, -1750.6, 29.42),
		distance = 10,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 11,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-51.69, -1754.73, 29.42, 138.14),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 2,
		}
	},
	["mirror_ltd"] = {
		position = { x = 1160.67, y = -314.40, z = 69.20 },
		reward = math.random(280000, 315000),
		nameOfStore = "LTD Gasoline. (Mirror Park Boulevard), SHOP12",
		PoliceNumberRequired = 2,
		realposition = vector3(1157.88, -319.44, 69.21),
		distance = 12,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 12,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(1159.08, -324.29, 69.21, 193.57),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 8,
		}
	},
	--new
	["Rockford_DrR_shahri"] = {
		position = { x = 2550.08, y = 385.45, z = 108.62 },    
		reward = math.random(280000, 315000),
		nameOfStore = "Rockford Dr2 24/7 Safe, SHOP13",
		PoliceNumberRequired = 2,
		realposition = vector3(2552.75,386.27,108.62),
		distance = 12,
		secondsRemaining = 220, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 13,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(2557.16, 385.27, 108.62, 267.25),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 9,
		}
	},
	["Rockford_DrR_shahri_sheriff"] = {
		position = { x = 1959.63, y = 3748.25, z = 32.34 },    
		reward = math.random(280000, 315000),
		nameOfStore = "Rockford Dr3 24/7 Safe, SHOP14",
		PoliceNumberRequired = 2,
		realposition = vector3(1962.33,3746.67,32.34),
		distance = 12,
		secondsRemaining = 220, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 14,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(1963.7, 3742.62, 32.34, 209.58),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 17,
		}
	},
	--mini shops
	["mini_shop_1"] = {
		position = { x = 1126.32, y = -981.1, z = 45.42 },  --   
		reward = math.random(280000, 315000), 
		nameOfStore = "Mini Shops, SHOP15",
		PoliceNumberRequired = 2,
		realposition = vector3(1132.93, -983.81, 46.42),    ---
		distance = 10,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 15,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(1138.27, -981.55, 46.42, 279.45),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 6,
		}
	},
	["mini_shop_2"] = {
		position = { x = -1219.84, y = -915.95, z = 11.33 },  --     
		reward = math.random(280000, 315000),
		nameOfStore = "Mini Shops, SHOP16",
		PoliceNumberRequired = 2,
		realposition = vector3(-1220.59,-909.14,12.33),    ---
		distance = 10,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 16,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-1224.63, -904.96, 12.33, 32.45),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 3,
		}
	},
	["mini_shop_3"] = {
		position = { x = -1479.14, y = -374.55, z = 39.16 },  --       
		reward = math.random(280000, 315000),
		nameOfStore = "Mini Shops, SHOP17",
		PoliceNumberRequired = 2,
		realposition = vector3(-1485.59,-376.71,40.16),    ---
		distance = 10,
		secondsRemaining = 200, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 17,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-1489.04, -381.33, 40.16, 133.45),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 4,
		}
	},
	["mini_shop_4"] = {
		position = { x = -2959.33, y = 388.07, z = 14.04 },  --         
		reward = math.random(280000, 315000),
		nameOfStore = "Mini Shops, SHOP18",
		PoliceNumberRequired = 2,
		realposition = vector3(-2964.96,391.32,15.04),    ---  
		distance = 10,
		secondsRemaining = 220,-- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 18,
		active = true,
		policeCheck = {
			radius = 40,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-2970.63, 390.83, 15.04, 93.6),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 12,
		}
	},
	["mini_shop_5"] = {
		position = { x = 1168.34, y = 2718.14, z = 37.16 },
		reward = math.random(280000, 315000),
		nameOfStore = "Mini Shops, SHOP19",
		PoliceNumberRequired = 2,
		realposition = vector3(1167.02,2711.81,38.16),
		distance = 10,
		secondsRemaining = 220, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 19,
		active = true,
		policeCheck = {
			radius = 30,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(1166.38, 2706.52, 38.16, 177.84),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 15,
		}
	},
	["mini_jewel_1"] = {
		position = { x = 1649.46, y = 4875.73, z = 42.16 },  --
		label = "Mini Jewelry",
		--
		blipSprite = 617,
		blipColor = 5,
		--
		reward = math.random(280000, 315000),
		nameOfStore = "Mini Javaheri",
		PoliceNumberRequired = 2,
		realposition = vec(1645.91, 4881.8, 42.16),  --
		distance = 9,
		secondsRemaining = 350, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 20,
		active = true,
		policeCheck = {
			radius = 30,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(1650.91, 4882.41, 42.16, 282.75),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 21,
		}
	},
	["mini_jewel_2"] = {
		position = { x = -1127.82, y = -1351.98, z = 5.03 },
		label = "Mini Jewelry",
		--
		blipSprite = 617,
		blipColor = 5,
		--
		reward = math.random(280000, 315000),
		nameOfStore = "Mini Javaheri",
		PoliceNumberRequired = 2,
		realposition = vec(-1131.18, -1357.23, 5.03),
		distance = 9,
		secondsRemaining = 350, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 21,
		active = true,
		policeCheck = {
			radius = 30,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-1134.22, -1353.25, 5.03, 26.94),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 22,
		}
	},
	["mini_jewel_3"] = {
		position = { x = -1543.12, y = -423.61, z = 35.64 },
		label = "Mini Jewelry",
		--
		blipSprite = 617,
		blipColor = 5,
		--
		reward = math.random(280000, 315000),
		nameOfStore = "Mini Javaheri",
		PoliceNumberRequired = 2,
		realposition = vec(-1541.99, -417.37, 35.64),
		distance = 9,
		secondsRemaining = 350, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 22,
		active = true,
		policeCheck = {
			radius = 30,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(-1537.67, -419.95, 35.64, 228.69),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 23,
		}
	},
	["mini_jewel_4"] = {
		position = { x = 555.68, y = 2745.8, z = 42.21 },
		label = "Mini Jewelry",
		--
		blipSprite = 617,
		blipColor = 5,
		--
		reward = math.random(280000, 315000),
		nameOfStore = "Mini Javaheri",
		PoliceNumberRequired = 2,
		realposition = vec(561.39, 2749.66, 42.21),
		distance = 9,
		secondsRemaining = 350, -- seconds
		TimerBeforeNewRob = 3600, -- seconds
		lastRobbed = 0,
		id = 23,
		active = true,
		policeCheck = {
			radius = 30,
			need = 1,
			money = math.random(30000, 31000),
		},
        pursuit = {
			model = `s_f_y_sweatshop_01`,
			coords = vec(562.12, 2745.16, 42.21, 181.23),
			range = 25,
			deleteTimeout = 40,
			reward = {locationConfig = 1, type = 1, rewardConfig = {
				{'blackmoney', 300000},
			}},
			hack = {count = 3, timeout = 200},
			marketId = 24,
		}
	},
}