Config = {}
Config.Locale = 'en'

Config.RequiredCopsRob1 = 1
Config.RequiredCopsRob2 = 1
Config.RequiredCopsSell = 1
Config.MinJewels = 45
Config.MaxJewels = 50
Config.MaxWindows = 20
Config.SecBetwNextRob = 3600 --30 min
Config.MaxJewelsSell = 35
Config.PriceForOneJewel = 2000
Config.EnableMarker = true
Config.NeedBag = false
Config.jobCheck = {
	all = 5
}

Config.Borsoni = {21, 22, 23, 41, 45}
Config.PartyNeed = 4
Stores = {
	["jewelry"] = {
		position = { ['x'] = -631.46, ['y'] = -230.07, ['z'] = 38.05 },       
		nameofstore = "jewelry",
		lastrobbed = 0
	},
	["jewelry2"] = {
		position = { ['x'] = 2742.63, ['y'] = 3469.49, ['z'] = 56.36 },
		nameofstore = "Javaheri shams ( Sandy )",
		lastrobbed = 0
	}
}
Config.sellPos = vector3(706.669, -966.898, 30.413)
Config.policeCheck = {
	radius = 30,
	need = 2,
	MinJewels = 7,
	MaxJewels = 10,
}
Config.policeSalary = {  -- jawahery
	max = 4,
	amount = {
		police  = {
			[1]  = 26000,
			[2]  = 27000,
			[3]  = 28000,
			[4]  = 29000,
			[5]  = 30000,
			[6]  = 31000,
			[7]  = 32000,
			[8]  = 33000,
			[9]  = 34000,
			[10] = 35000,
			[11] = 36000,
			['12:30'] = 5000,
		},
		-- sheriff  = 5000,
		mt  = {
			[1]  = 28000,
			[2]  = 29000,
			[3]  = 30000,
			[4]  = 31000,
			[5]  = 32000,
			[6]  = 33000,
			[7]  = 34000,
			[8]  = 35000,
			[9]  = 36000,
			[10] = 37000,
			[11] = 38000,
			['12:30'] = 5000,
		},
		-- fbi     = 5000,
	},
}

jobChecks = {
	javaheri1 = {
		mt = 1,
		all = 4,
	},
	javaheri2 = {
		mt = 1,
		all = 4,
	},
	fleeca2 = {
		mt = 2,
		all = 6,
	},
	blainecounty = {
		mt = 2,
		all = 6,
	},
	PrincipalBank = {
		mt = 4,
		all = 8,
	},
	flat = {
		mt = 4,
		all = 8,
	},
	mini = {
		all = 4,
		mt = 0,
	},
	cargo = {
		mt = 4,
		all = 8,
	},
	lifeInvader = {
		mt = 2,
		all = 7,
	},
	mythic = {
		mt = 11,
		all = 12,
	}
}