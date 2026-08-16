Config               = {}

Config.DrawDistance  = 5
Config.Size          = { x = 1.5, y = 1.5, z = 0.5 }
Config.Color         = { r = 0, g = 155, b = 253 }
Config.Type          = 27

Config.Locale        = 'en'

Config.Blur					 = true

Config.Loading			 = true

Config.LicenseEnable = false -- only turn this on if you are using esx_license
Config.LicensePrice  = 5000

Config.Zones = {

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(-658.76,-930.8,21.83),	-- shop 1
			vector3(823.09,-2155.99,29.62),	-- shop 2
			vector3(1693.74,3762.22,34.71),	-- shop 3
			vector3(-330.3,6086.27,31.45),	-- shop 4
			vector3(254.93,-55.17,69.94),	-- shop 5
			vector3(4.69,-1105.3,29.8),		-- shop 6
			vector3(2564.3,290.08,108.73),	-- shop 7
			vector3(-1118.0,2704.53,18.73),	-- shop 8
			vector3(840.56,-1034.95,28.19),	-- shop 9
			vector3(-1304.73,-396.57,36.7),	-- shop 10
			vector3(-3172.24,1089.85,20.84),-- shop 11
		}
	},
	Club = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(126.3,-1283.58,29.28),	-- club 
			vector3(1108.39,207.91,-49.44),	-- casino
		}
	},
	MiniShop = {
		Legal = false,
		Items = {},
		Locations = {
			vec(1138.53,-1482.64,34.84), 	-- md 1
			vec(-253.09,6337.06,32.43),	 	-- medic palato out city
			vec(-1849.76, -336.04, 49.25), 	-- md 2
			
			vec(614.65, -3056.83, 6.07),	-- exite jazire
			vec(3902.34, -4694.73, 4.23),	-- jazire 1
			vec(4811.04, -4297.81, 5.32),	-- jazire 2
			vec(5595.31, -5233.7, 14.6),	-- jazire 3
			vec(5497.93, -5848.27, 19.04),	-- jazire 4
			vec(4904.92, -5759.84, 26.08),	-- jazire 5
		}
	},
	
}
