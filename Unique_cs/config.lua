Config = {}
Config.Locale = 'en' -- Language

Config.ServiceExtensionOnEscape = 8 -- Escape Extension
Config.DistanceExtension =  50.0    -- 36.0 -- Escape Distance           

-- Service Location
Config.ServiceLocation = {x = -3451.93, y = -3464.14, z = 462.35} -- {x = 1731.39, y = 2530.18, z = 45.56}           --                   50
-- Release Location
Config.ReleaseLocation = {x = -255.97, y = -973.38, z = 31.22}

Config.pedLocation = {
	vec(-3460.57, -3484.77, 462.35),
	vec(-3468.69, -3473.04, 462.35),
	vec(-3465.0, -3457.78, 462.35),
	vec(-3447.82, -3452.46, 462.35),
	vec(-3430.84, -3460.88, 462.35),
}
-- Service Locations
Config.ServiceLocations = {
	-- { type = "cleaning", coords = vector3(1758.7718505859,2531.3657226562,45.564979553223) },
	-- { type = "cleaning", coords = vector3(1733.4659423828,2547.7502441406,45.564907073975) },
	-- { type = "cleaning", coords = vector3(1711.5367431641,2537.9167480469,45.564903259277) },
	-- { type = "cleaning", coords = vector3(1714.416015625,2515.1762695312,45.564907073975) },
	-- { type = "cleaning", coords = vector3(1738.9294433594,2509.693359375,45.564971923828) },
	-- { type = "cleaning", coords = vector3(1749.7523193359,2516.4567871094,45.564971923828) },
	-- { type = "gardening", coords = vector3(1744.1722412109,2530.884765625,45.565032958984) },
	-- { type = "gardening", coords = vector3(1733.3854980469,2540.6928710938,45.564903259277) },
	-- { type = "gardening", coords = vector3(1742.4353027344,2541.1435546875,45.564975738525) },
	-- { type = "gardening", coords = vector3(1739.6361083984,2563.2924804688,45.565029144287) },
	-- { type = "gardening", coords = vector3(1699.5581054688,2518.2888183594,45.56489944458) },
	-- { type = "gardening", coords = vector3(1703.0610351562,2549.5341796875,45.56489944458) },
	{ type = "cleaning", coords = vector3(-3451.27,-3463.8,462.35) },
	{ type = "gardening", coords = vector3(-3449.92,-3488.68,462.35) },
	{ type = "gardening", coords = vector3(-3443.9,-3439.61,462.35) },
	{ type = "gardening", coords = vector3(-3424.43,-3467.07,462.35) }, 
	{ type = "gardening", coords = vector3(-3475.29,-3449.92,462.35) }, 
}

-- Uniforms
-- Config.Uniforms = {
-- 	prison_wear = {
-- 		male = {
-- 			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
-- 			['torso_1']  = 324, ['torso_2']  = 0,
-- 			['decals_1'] = 0,   ['decals_2'] = 0,
-- 			['arms']     = 82, 	['pants_1']  = 36,
-- 			['pants_2']  = 0,   ['shoes_1']  = 57,
-- 			['shoes_2']  = 0,  ['chain_1']  = 0,
-- 			['chain_2']  = 0
-- 		},
-- 		female = {
-- 			['tshirt_1'] = 15,  ['tshirt_2'] = 3,
-- 			['torso_1']  = 0,  	['torso_2']  = 0,
-- 			['decals_1'] = 0,   ['decals_2'] = 0,
-- 			['arms']     = 85,  ['pants_1']  = 3,
-- 			['pants_2']  = 15,  ['shoes_1']  = 16,
-- 			['shoes_2']  = 0, 	['chain_1']  = 0,
-- 			['chain_2']  = 0
-- 		}
-- 	}
-- }
Config.Uniforms = {
	prison_wear = {
		male = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 0,
			['torso_1']  = 146, ['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 74, 	['pants_1']  = 3,
			['pants_2']  = 7,   ['shoes_1']  = 5,
			['shoes_2']  = 0,  ['chain_1']  = 0,
			['chain_2']  = 0
		},
		female = {
			['tshirt_1'] = 15,  ['tshirt_2'] = 3,
			['torso_1']  = 0,  	['torso_2']  = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms']     = 85,  ['pants_1']  = 3,
			['pants_2']  = 15,  ['shoes_1']  = 16,
			['shoes_2']  = 0, 	['chain_1']  = 0,
			['chain_2']  = 0
		}
	}
}