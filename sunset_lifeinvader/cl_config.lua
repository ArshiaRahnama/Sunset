Config = {}
Config.Blip = vec(-1066.23, -241.44, 39.73)
Config.Distance = 22
Config.BlowTorchCoords = vector3(-1054.42,-236.73,44.05)
Config.ImportVirusCoords = vector3(-1056.84, -233.31, 44.02)
Config.Hack = vector3(-1054.01, -230.50, 44.02)

Config.TimeImportVirus = 400 
Config.TimeTorching = 30 
Config.TimeHack = 50 
Config.TimeToHack = 50 
Config.NeedToCloseDoor = 1800000 
Config.NeedToNextRob = 14400
Config.PartyNeed = 5
Config.policeCheck = {
    coords = vector3(-1083.04, -258.34, 37.76),
    radius = 100,
    need = 5,
    money = math.random(1800000 , 1810000)
}
Config.Reward = math.random(6800000 , 7000000)
Config.policeSalary = {  -- bime
    max = 7,
    amount = {
		police  = {
			[1]  = 64000,
			[2]  = 65000,
			[3]  = 66000,
			[4]  = 67000,
			[5]  = 68000,
			[6]  = 69000,
			[7]  = 70000,
			[8]  = 71000,
			[9]  = 72000,
			[10] = 73000,
			[11] = 74000,
			['12:30'] = 5000,
		},
		-- sheriff  = 5000,
		mt  = {
			[1]  = 66000,
			[2]  = 67000,
			[3]  = 68000,
			[4]  = 69000,
			[5]  = 70000,
			[6]  = 71000,
			[7]  = 72000,
			[8]  = 73000,
			[9]  = 74000,
			[10] = 75000,
			[11] = 76000,
			['12:30'] = 5000,
		},
		-- fbi     = 5000,
	},
}

Config.jobCheck = {
    mt = 2,
    all = 7,
}