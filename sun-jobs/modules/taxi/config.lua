Shared.taxi = {
	label = 'Taxi'
}
Shared.taxi.config = {
	needUnit = false,
	customPlate = true,
	platePrefix = 'TX',
	decor = 'TX',
	billing = {
		customReason = true,
		reason = 'Taxi',
		player = true,
		maxBillAmount = 50000,
	},
	objects = {
		{ label = "Light 1",				model = 'xm_prop_base_tripod_lampa',	grade = 19, freeze = true },
		{ label = "Light 2",				model = 'prop_studio_light_02',			grade = 19, freeze = true },
		{ label = "Light stand", 			model = 'xm_prop_base_tripod_lampb',	grade = 19, freeze = true },
		{ label = "Board",					model = 'prop_scrim_02',				grade = 19, freeze = true },
		{ label = "Camera Stand",			model = 'prop_tv_cam_02',				grade = 19, freeze = true },
		{ label = "TV Stand",				model = 'prop_tv_stand_01',				grade = 19, freeze = true },
		{ label = "Chair 1", 				model = 'v_ilev_chair02_ped', 			grade = 19, freeze = true },
		{ label = "Chair 2",	 			model = 'ex_mp_h_stn_chairstrip_01',	grade = 19, freeze = true },
		{ label = "Chair 4", 				model = 'vw_prop_vw_offchair_03',		grade = 19, freeze = true },
		{ label = "Chair 5", 				model = 'mp_b_din_chair_02',			grade = 19, freeze = true },
		{ label = "worklight", 				model = 'prop_worklight_01a',			grade = 19, freeze = true },
		{ label = "lights 3", 				model = 'prop_air_lights_04a',			grade = 19, freeze = true },
		{ label = "lights 4", 				model = 'prop_air_lights_05a',			grade = 19, freeze = true },
		{ label = "news", 					model = 'ng_proc_paper_news_quik',		grade = 19, freeze = true },
		{ label = "disp 1", 				model = 'prop_news_disp_03a',			grade = 19, freeze = true },
		{ label = "disp 2", 				model = 'prop_news_disp_01a',			grade = 19, freeze = true },
		{ label = "sofacorn",		 		model = 'apa_mp_h_stn_sofacorn_05',		grade = 19, freeze = true },
		{ label = "vstage", 				model = 'v_ilev_fos_tvstage',			grade = 19, freeze = true },
		{ label = "v_ilev_fos_mic", 		model = 'v_ilev_fos_mic',				grade = 19, freeze = true },
		{ label = "v_ilev_mm_screen", 		model = 'v_ilev_mm_screen',				grade = 19, freeze = true },
		{ label = "ind_prop_dlc_flag_02",	model = 'ind_prop_dlc_flag_02',			grade = 19, freeze = true },
		{ label = "prop_tyre_wall_05", 		model = 'prop_tyre_wall_05',			grade = 19, freeze = true },
		{ label = "prop_parasol_02_c", 		model = 'prop_parasol_02_c',			grade = 19, freeze = true },
		{ label = "prop_table_01",	 		model = 'prop_table_01',				grade = 19, freeze = true },
		{ label = "prop_yaught_chair_01",	model = 'prop_yaught_chair_01',			grade = 19, freeze = true },
		{ label = "prop_air_lights_02a",	model = 'prop_air_lights_02a',			grade = 19, freeze = true },
		{ label = "prop_air_conelight", 	model = 'prop_air_conelight',			grade = 19, freeze = true },
		{ label = "prop_mp_barrier_02", 	model = 'prop_mp_barrier_02',			grade = 19, freeze = true },
		{ label = "prop_premier_fence_02", 	model = 'prop_premier_fence_02',		grade = 19, freeze = true },
		{ label = "prop_huge_display_01", 	model = 'prop_huge_display_01',			grade = 19, freeze = true },
		{ label = "prop_ld_greenscreen_01", model = 'prop_ld_greenscreen_01',		grade = 19, freeze = true },
		{ label = "prop_satdish_3_b", 		model = 'prop_satdish_3_b',				grade = 19, freeze = true },
		{ label = "prop_walllight_ld_01", 	model = 'prop_walllight_ld_01',			grade = 19, freeze = true },
    },
	taxiJobCooldown = 600, -- sanie taxi bot
	acceptPeykCoords = {
		vec(360.65, -1581.66, 29.29, 50.0)
	}
}
Shared.taxi.Locale = 'taxi'
Shared.taxi.lastRequestData = {}
Shared.taxi.menu = {
	{label = function()
		local p = promise.new()
		ESX.TriggerServerCallback('taxi:getlist', function(data)
			Shared.taxi.lastRequestData = data
			local count = 0
			for k, v in pairs(data) do
				if not v.data.courier and (v.data.type == 1 or v.data.type == 2) then
					count += 1
				end
			end
			p:resolve(('Request list(%s)'):format(count))
		end)
		return Citizen.Await(p)
	end, cb = function()
		openTaxiRequest(1)
	end},
	{label = function()
		local count = 0
		for k, v in pairs(Shared.taxi.lastRequestData) do
			if v.data.type == 3 then
				count += 1
			end
		end
		return ('Request list(Heli - %s)'):format(count)
	end, cb = function()
		openTaxiRequest(2)
	end},
	{label = function()
		local count = 0
		for k, v in pairs(Shared.taxi.lastRequestData) do
			if v.data.courier then
				count += 1
			end
		end
		return ('Request list(Peyk - %s)'):format(count)
	end, cb = function()
		openTaxiRequest(3)
	end},
	{ label = 'Ghabz', cb = openBilling},
	{ label = function()
		return getTaxiTripState() and 'Payane safar' or 'Shorue safar'
	end, cb = startMeter},
	{ label = function()
		local near = false
		local coords = GetEntityCoords(PlayerPedId())
		for k, v in pairs(Shared.taxi.config.acceptPeykCoords) do
			if #(coords - v.xyz) < v.w then
				near = true
				break
			end
		end
		return near and 'Tahvil Baste'
	end, cb = taxiGiveCourier},
	{ label = 'Extra Divisions', cb = divisionsMenu},
	{ label = 'Ghayegh badi', cb = function()
		exports['sunset_utils']:ghayeghBadi(true, {color1 = 126, color2 = 126})
	end},
	{ label = 'Spawn Object', cb = openSpawnObject },
	{ label = 'license', cb = openLicenseMenu },
}

Shared.taxi.zones = {
	bossAction = {
        vec(375.12,-1593.43,29.29),	 -- tx 1
		vec(-359.07,6049.41,31.44),  -- tx paleto
		vec(1770.23, 3666.08, 40.4), -- Administatior
		vec(-813.22, -1347.34, 8.57),-- TX 2
	},

	cloakroom = {
		vec(382.09,-1610.21,29.29),	 -- tx 1
		vec(-363.05,6046.06,31.44),	 -- tx paleto
		vec(1766.99, 3659.1, 40.4),	 -- tx Administatior
		vec(-786.94, -1352.02, 8.57),-- TX 2
	},

	locker = {
		vec(382.69, -1600.12, 29.29),
	},

	vehicles = {
        { -- tx 1
            spawner    = vec(397.4,-1632.92,29.29), 
            spawnPoint = vec(404.46,-1642.01,29.29,227.82),
        },
		{ -- tx 2
			spawner    = vec(-814.08, -1333.85, 5.15), 
			spawnPoint = vec(-812.49, -1326.95, 4.61, 260.38),
		},
		{ -- tx paleto
            spawner    = vec(-389.09,6053.66,31.5), 
            spawnPoint = vec(-395.37,6055.0,31.5,134.69),
        },
		{ -- tx poshte md ghadim 
            spawner    = vec(454.36,-600.56,28.57), 
            spawnPoint = vec(465.77,-601.53,28.44,170.94),
        },
		{ -- tx balaye bank markazi  
            spawner    = vec(-299.97,313.38,93.42), 
            spawnPoint = vec(-306.04,311.5,93.25,179.29),
        },
		{ -- tx base admin 
            spawner    = vec(-420.65,1217.7,325.75), 
            spawnPoint = vec(-410.75,1214.75,325.64,163.08),
        },
		{ -- tx nazdik md2  
            spawner    = vec(-2214.07,-367.29,13.32), 
            spawnPoint = vec(-2200.84,-368.21,13.15,20.27),
        },
		{ -- tx gun shop 8 
            spawner    = vec(-1128.73,2691.8,18.8), 
            spawnPoint = vec(-1140.95,2678.57,18.09,221.81),
        },
		{ -- tx job center
            spawner    = vec(-288.57,-1088.34,23.99), 
            spawnPoint = vec(-278.56,-1072.44,25.2,157.92),
        }, 
		{ -- tx foroodgah payin
			spawner    = vec(-1026.69, -3019.48, 13.95), 
			spawnPoint = vec(-979.67, -2997.72, 13.95, 56.31),
		},
		{ -- tx Administatior
			spawner    = vec(1736.4, 3621.61, 35.13), 
			spawnPoint = vec(1748.15, 3616.34, 34.97, 212.78),
		},
		{ -- tx Old
			spawner    = vec(894.4, -183.83, 73.72), 
			spawnPoint = vec(902.13, -185.77, 73.83, 328.27),
		},
    },

	helicopters = {
		{-- tx 1
			spawner    = vec(373.08,-1603.42,36.95),
			spawnPoint = vec(362.73,-1598.5,36.95,324.1),
		},
		{-- tx 2
			spawner    = vec(-810.58, -1395.3, 5.0),
			spawnPoint = vec(-814.48, -1416.19, 6.57, 349.41),
		},
		{-- tx paleto
			spawner    = vec(-368.02,6055.97,31.5),
			spawnPoint = vec(-379.3,6051.25,38.18,137.94),
		},
		{-- tx foroodgah payin
			spawner    = vec(-990.39, -2948.99, 13.95),
			spawnPoint = vec(-979.67, -2997.72, 13.95, 56.31),
		},
		{-- tx Administatior
			spawner    = vec(1735.96, 3643.26, 40.07),
			spawnPoint = vec(1747.28, 3642.39, 41.91, 306.99),
		},
	},

	vehicleDeleter = {
		vec(412.76, -1625.01, 29.29), 	-- tx 1
		vec(-800.73, -1329.07, 5.0), 	-- tx 2
		vec(-394.9, 6055.02, 31.5),		-- tx paleto
		vec(465.79, -601.53, 28.44),	-- station poshte md ghadim 
		vec(-306.03, 311.64, 93.25),	-- station balaye bank markazi 
		vec(-410.75, 1214.8, 325.63),	-- admin aria
		vec(-2200.83, -368.13, 13.15),	-- nazdik md2
		vec(-1140.9, 2678.66, 18.09),	-- gun shop 8
		vec(-278.54, -1072.36, 25.2),	-- job center
		vec(1758.36, 3622.66, 34.88),	-- Administatior
		vec(902.13, -185.77, 73.83),	-- tx Old

		vec(362.73, -1598.5, 36.95),	-- tx 1 			heli
		vec(-814.48, -1416.19, 6.57),	-- tx 2 			heli
		vec(-379.3, 6051.25, 38.18),	-- tx paleto		heli
		vec(-979.67, -2997.72, 13.95),	-- foroodgah payin	heli
		vec(1747.29, 3642.39, 41.91),	-- Administatior	heli
	},

	--
	startTaxiJob = {
		{
			spawner =    vec(408.92,-1622.76,29.29),
			spawnPoint = vec(403.85,-1638.28,29.29,233.11)
		},
	},

	stopTaxiJob = {
		vec(382.03, -1625.2, 29.29),
		vec(-737.28, -1295.85, 4.61),
	},

}


Shared.taxi.EndJobMoney				  = 2.5
Shared.taxi.TimeGenerator     	      = 280

Shared.taxi.JobLocations = {
	{start_loc = { coords = vector3(64.120, -735.250, 43.190), heading = 72.710 }, end_loc = { coords = vector3(-617.940, 4.2700, 40.720) }},
	{start_loc = { coords = vector3(-237.19,0 -985.91, 28.29), heading = 254.98 }, end_loc = { coords = vector3(-808.790, -227.240, 36.1) }},
	{start_loc = { coords = vector3(130.30, -200.790, 53.510), heading = 352.31 }, end_loc = { coords = vector3(-1322.44, -1288.78, 3.89) }},
	{start_loc = { coords = vector3(412.00, -983.540, 28.420), heading = 81.820 }, end_loc = { coords = vector3(294.210, 176.10, 103.090) }},
	{start_loc = { coords = vector3(294.210, 176.10, 103.090), heading = 156.93 }, end_loc = { coords = vector3(-619.04, -924.84, 21.950) }},
	{start_loc = { coords = vector3(-342.170, -181.13, 37.67), heading = 196.29 }, end_loc = { coords = vector3(104.35, -1323.770, 28.30) }},
	{start_loc = { coords = vector3(788.080, -2123.72, 28.14), heading = 78.310 }, end_loc = { coords = vector3(-68.55, -1744.10, 28.340) }},
	{start_loc = { coords = vector3(267.410, -354.890, 43.80), heading = 154.62 }, end_loc = { coords = vector3(219.69, -1414.18, 28.260) }},
	{start_loc = { coords = vector3(275.87, -591.710, 42.280), heading = 75.270 }, end_loc = { coords = vector3(-1514.41, -452.34, 34.39) }},
	{start_loc = { coords = vector3(214.40, -851.510, 29.250), heading = 337.99 }, end_loc = { coords = vector3(-645.70, -1262.12, 9.510) }},
	{start_loc = { coords = vector3(232.71, -858.260, 28.790), heading = 344.73 }, end_loc = { coords = vector3(1860.55, 3674.07, 32.740) }},
	{start_loc = { coords = vector3(285.14, -1034.60, 28.210), heading = 179.45 }, end_loc = { coords = vector3(-424.57, 6030.67, 30.280) }},
	{start_loc = { coords = vector3(-596.58, -304.906, 33.96), heading = 216.84 }, end_loc = { coords = vector3(1200.4, -328.490, 67.970) }},
	{start_loc = { coords = vector3(194.99, -845.940, 29.890), heading = 340.59 }, end_loc = { coords = vector3(-1510.1, -379.13, 40.370) }},
	{start_loc = { coords = vector3(-617.16, -920.170, 22.40), heading = 97.200 }, end_loc = { coords = vector3(228.15, -367.340, 43.140) }},
	{start_loc = { coords = vector3(14.91, -1375.260, 28.400), heading = 358.91 }, end_loc = { coords = vector3(-772.83, 292.210, 84.680) }},
	{start_loc = { coords = vector3(-1295.21, -1118.15, 5.61), heading = 175.62 }, end_loc = { coords = vector3(267.02, -332.560, 43.920) }},
	{start_loc = { coords = vector3(-1621.77, -531.00, 33.50), heading = 216.42 }, end_loc = { coords = vector3(404.23, -982.650, 28.310) }},
	{start_loc = { coords = vector3(405.88, -1016.80, 28.390), heading = 88.550 }, end_loc = { coords = vector3(1853.34, 3676.67, 32.79 ) }},
	{start_loc = { coords = vector3(392.88, -990.860, 28.420), heading = 271.61 }, end_loc = { coords = vector3(229.640, -54.870, 68.250) }},
	{start_loc = { coords = vector3(229.640, -54.870, 68.250), heading = 158.48 }, end_loc = { coords = vector3(16.02, -1123.520, 27.850) }},
	{start_loc = { coords = vector3(-251.750, 275.030, 90.71), heading = 172.63 }, end_loc = { coords = vector3(293.50, -590.200, 40.700) }},
}

Shared.taxi.TaxiJobPeds = {
	'ig_abigail',
	'ig_amandatownley',
	'cs_amandatownley',
	'csb_anita',
	'cs_ashley',
	's_f_y_bartender_01',
	's_f_y_baywatch_01',
	'a_f_m_beach_01',
	'a_f_y_beach_01',
	'a_f_m_bevhills_02',
	'a_f_y_bevhills_01',
	'a_f_y_bevhills_03',
	'a_f_y_bevhills_02',
	'u_f_y_bikerchic',
	'a_f_y_bevhills_04',
	'mp_f_boatstaff_01',
	'ig_bride',
	'csb_bride',
	'a_f_y_business_01',
	'a_f_m_business_02',
	'cs_debra',
	'mp_f_deadhooker',
	'a_f_y_eastsa_02',
	'a_f_y_epsilon_01',
	'a_f_m_fatcult_01',
	'a_f_m_fatbla_01',
	's_f_m_fembarber',
	'a_f_y_golfer_01',
	'cs_gurk',
	'a_f_y_hiker_01',
	'a_m_m_hillbilly_01',
	'a_f_y_hipster_01',
	'a_f_y_hipster_03',
	's_f_y_hooker_01',
	'a_m_y_jetski_01',
	'a_f_y_juggalo_01',
	'ig_kerrymcintosh',
	'a_f_o_ktown_01',
	'g_f_y_lost_01',
	'cs_maryann',
	'ig_michelle',
	'cs_movpremf_01',
	's_f_y_movprem_01',
	'cs_mrsphillips',
	'a_m_y_musclbeac_02',
	'ig_patricia',
	'a_f_y_runner_01',
	'a_m_y_surfer_01',
	's_f_y_sweatshop_01',
	'u_m_m_streetart_01'
}

Shared.taxi.tripPrice = 5250
Shared.taxi.tripPriceMethod2 = 7500
Shared.taxi.tripStartPrice = 5000

Shared.taxi.itemShop = {
	water = {count = 20, price = 17500},
	bread = {count = 20, price = 20000},
    radio = {count = 5, price = 25000},
}

Shared.taxi.delivery = {
	vehicleModels = {
		[`sunsetpv`] = true,
		[`boxville2`] = true,
	},
	startLocations = {
		{
			type = 1, -- type 1 : inventory job
			access = {
				['resturan'] = 1
			},
			coords = vec(-607.94, -1033.25, 21.79),
		},
	},

	endLocations = {
		[101] = {
			label = 'FBI',
			coords = vec(138.04, -740.44, 33.13),
			owners = {
				['steam:11000011b4907a2'] = true,
			},
			type = 1,
			inventory = {
				name = 'job:fbi',
			}
		},
		[102] = {
			label = 'MT',
			coords = vec(-2326.37, 3253.06, 32.83),
			owners = {
				['steam:11000014715ac8e'] = true,
			},
			type = 1,
			inventory = {
				name = 'job:mt',
			}
		},
		[103] = {
			label = 'Taxi',
			coords = vec(309.07, -1551.72, 29.33),
			owners = {
				['steam:1100001487ded6f'] = true,
			},
			type = 1,
			inventory = {
				name = 'job:taxi',
			}
		},
		[104] = {
			label = 'Police',
			coords = vec(540.92, -45.41, 70.65),
			owners = {
				['steam:11000014ad86d67'] = true,
			},
			type = 1,
			inventory = {
				name = 'job:police',
			}
		},
		[105] = {
			label = 'Sheriff',
			coords = vec(470.77, -961.78, 27.86),
			owners = {
				['steam:1100001441221d3'] = true,
			},
			type = 1,
			inventory = {
				name = 'job:sheriff',
			}
		},
		[106] = {
			label = 'Medic',
			coords = vec(1200.04, -1457.22, 34.91),
			owners = {
				['steam:110000134a5ebfc'] = true,
			},
			type = 1,
			inventory = {
				name = 'job:ambulance',
			}
		},
		[107] = {
			label = 'Mechanic',
			coords = vec(598.76, 629.69, 128.96),
			owners = {
				['steam:11000010a3abb87'] = true,
			},
			type = 1,
			inventory = {
				name = 'job:mechanic',
			}
		},
		[108] = {
			label = 'detective',
			coords = vec(824.85, -1270.18, 26.25),
			owners = {
				['steam:110000141ee91e6'] = true,
			},
			type = 1,
			inventory = {
				name = 'job:detective',
			}
		},
	}
}

-- [5] = {
-- 	label = 'Gang Hamid',
-- 	coords = vec(-951.6, -846.28, 16.06),
-- 	owners = {
-- 		['steam:11000013b961c60'] = true,
-- 	},
-- 	type = 1,
-- 	inventory = {
-- 		name = 'gang:hamid', -- job : job:police | gang : gang:Mandem_Bloock
-- 		location = 1, --Age gang bud set she !! baraye job pak she !!
-- 	}
-- },