Config = {

    BlipSprite = 237,
    BlipColor = 26,
    BlipText = 'Workbench',
    CraftingStopWithDistance = true, -- Crafting will stop when not near workbench
    HideWhenCantCraft = false, -- Instead of lowering the opacity it hides the item that is not craftable due to low level or wrong job
    Categories = {
        ['weapons'] = {
            Label = 'Weapons',
            Image = 'WEAPON_APPISTOL',
        },
        ['items'] = {
            Label = 'Items',
            Image = 'items',
            Jobs = {}
        },
        ['skins'] = {
            Label = 'Gun skin',
            Image = 'gunskin',
            Jobs = {}
        },
    },

    gangscost = {
        [11] = 10,
        [12] = 20,
        [13] = 30,
        [14] = 40,
        [15] = 50,
        [16] = 50,
        [17] = 50,
        [18] = 50,
        [19] = 50,
        [20] = 50,
        [21] = 50,
        [22] = 50,
        [23] = 50,
        [24] = 50,
        [25] = 50,
        [26] = 50,
        [27] = 50,
        [28] = 50,
        [29] = 50,
        [30] = 50,
    },

    Dischant = {
        ["WEAPON_KNIFE"] = {iron = 0,ember = 5},
		["WEAPON_DAGGER"] = {iron = 0,ember = 5},
		["WEAPON_HEAVYPISTOL"] = {iron_piece = 18,ember = 25},
		["WEAPON_VINTAGEPISTOL"] = {iron_piece = 18,ember = 25},
		["WEAPON_PISTOL50"] = {iron_piece = 14,ember = 25},
		["WEAPON_SMG"] = {iron_piece = 14,ember = 25},
		["WEAPON_ASSAULTSMG"] = {iron_piece = 8,iron = 1,ember = 50},
		["WEAPON_CARBINERIFLE"] = {iron_piece = 2,iron = 2,ember = 100},
		["WEAPON_ASSAULTRIFLE"] = {iron_piece = 2,iron = 2,ember = 100},
		["WEAPON_ADVANCEDRIFLE"] = {iron_piece = 2,iron = 2,ember = 100},
		["WEAPON_COMBATPDW"] = {iron_piece = 2,iron = 2,ember = 100},
		["WEAPON_BULLPUPRIFLE"] = {iron_piece = 16,iron = 2,ember = 125},
		["WEAPON_GUSENBERG"] = {iron_piece = 16,iron = 2,ember = 125},
		["WEAPON_ASSAULTSHOTGUN"] = {iron_piece = 16,iron = 2,ember = 125},
		["WEAPON_SAWNOFFSHOTGUN"] = {iron_piece = 16,iron = 2,ember = 125},
		["WEAPON_PUMPSHOTGUN"] = {iron_piece = 16,iron = 2,ember = 125},
		["WEAPON_BULLPUPSHOTGUN"] = {iron_piece = 16,iron = 2,ember = 125},
		["WEAPON_KNUCKLE"] = {iron = 1,ember = 25},
		["WEAPON_PISTOL_MK2"] = {iron = 1,ember = 50},
		["WEAPON_SWITCHBLADE"] = {iron = 1,ember = 50},
		["WEAPON_CERAMICPISTOL"] = {iron_piece = 15,iron = 1,ember = 50},
		["WEAPON_PUMPSHOTGUN_MK2"] = {iron = 5,ember = 200},
		["WEAPON_BULLPUPRIFLE_MK2"] = {iron = 5,ember = 200},
		["WEAPON_DOUBLEACTION"] = {iron_piece = 18,iron = 11,ember = 250},
		["WEAPON_SMG_MK2"] = {iron = 5,ember = 200},
		["WEAPON_COMPACTRIFLE"] = {iron = 5,ember = 200},
		["WEAPON_SPECIALCARBINE_MK2"] = {iron = 6,ember = 200},
		["WEAPON_MICROSMG"] = {iron = 5,ember = 200},
		["WEAPON_ASSAULTRIFLE_MK2"] = {iron = 5,ember = 200},
		["WEAPON_CARBINERIFLE_MK2"] = {iron = 5,ember = 200},
		["WEAPON_APPISTOL"] = {iron = 7,ember = 250},
    },

    Recipes = {
------------------ level 0
        ['WEAPON_KNIFE'] = {
            Level = 0,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 54000,
            Ingredients = {
                ['iron_piece'] = 5,
                ['diamond'] = 1,
				['gold_piece'] = 1,
				['petrol_raffin'] = 10,
				['essence'] = 5,
				['fabric'] = 4,
            }
        },
        ['WEAPON_DAGGER'] = {
            Level = 0,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 61000,
            Ingredients = { 
                ['iron_piece'] = 5,
				['diamond'] = 1,
				['gold_piece'] = 1,
				['cutted_wood'] = 5,
				['petrol'] = 5,
				['petrol_raffin'] = 5,
				['fabric'] = 4,
            }
        },
        ['WEAPON_MACHETE'] = {
            Level = 0,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 90000,
            Ingredients = { 
                ['iron_piece'] = 5,
				['diamond'] = 2,
				['gold_piece'] = 5,
				['cutted_wood'] = 5,
				['petrol'] = 5,
				['petrol_raffin'] = 5,
				['essence'] = 5,
            }
        },
------------------ level 1
        ['WEAPON_VINTAGEPISTOL'] = {
            Level = 1,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            Money = 0,
            blackmoney = 168000,
            Ingredients = {
                ['iron_piece'] = 10,
                ['gold_piece'] = 5,
                ['cutted_wood'] = 20,
                ['petrol'] = 10,
                ['essence'] = 30,
                ['fabric'] = 5,
            },
            access = {
                hamid = true,
                wash = 3,
            }
        },
        ['WEAPON_PISTOL'] = {
            Level = 1,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            Money = 0,
            blackmoney = 120000,
            Ingredients = {
                ['iron_piece'] = 5,
                ['petrol'] = 10,
                ['petrol_raffin'] = 10,
                ['essence'] = 10,
            }
        },
        ['WEAPON_SNSPISTOL'] = {
            Level = 1,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            Money = 0,
            blackmoney = 110000,
            Ingredients = {
                ['iron_piece'] = 5,
                ['gold_piece'] = 5,
                ['cutted_wood'] = 10,
                ['petrol_raffin'] = 15,
                ['essence'] = 15,
            }
        },
------------------ level 2
        ['WEAPON_HEAVYPISTOL'] = {
            Level = 2,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            Money = 0,
            blackmoney = 168000,
            Ingredients = {
                ['iron_piece'] = 10,
                ['gold_piece'] = 5,
                ['petrol'] = 10,
                ['petrol_raffin'] = 15,
                ['essence'] = 10,
                ['fabric'] = 5,
            }
        },
        ['WEAPON_COMBATPISTOL'] = {
            Level = 2,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            Money = 0,
            blackmoney = 135000,
            Ingredients = {
                ['iron_piece'] = 10,
                ['gold_piece'] = 5,
                ['cutted_wood'] = 10,
                ['petrol'] = 10,
                ['petrol_raffin'] = 15,
                ['essence'] = 15,
                ['fabric'] = 5,
            }
        },
------------------ level 3
        ['WEAPON_PISTOL50'] = {
            Level = 3,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            Money = 0,
            blackmoney = 236000,
            Ingredients = {
                ['iron'] = 1,
                ['gold_piece'] = 5,
                ['cutted_wood'] = 20,
                ['petrol'] = 10,
                ['petrol_raffin'] = 25,
                ['essence'] = 30,
            }
        },
        ['WEAPON_SMG'] = {
            Level = 3,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 337000,
            Ingredients = { 
                ['iron'] = 1,
                ['gold_piece'] = 5,
                ['cutted_wood'] = 20,
                ['petrol'] = 10,
                ['essence'] = 30,
                ['fabric'] = 5,
            }
        },
        ['WEAPON_SNSPISTOL_MK2'] = {
            Level = 3,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 180000,
            Ingredients = { 
                ['iron_piece'] = 5,
                ['iron'] = 1,
                ['diamond'] = 5,
                ['gold_piece'] = 5,
                ['petrol'] = 15,
                ['petrol_raffin'] = 20,
                ['essence'] = 20,
                ['fabric'] = 10,
            }
        },
------------------ level 4
        ['WEAPON_ASSAULTSMG'] = {
            Level = 4,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 378000,
            Ingredients = { 
                ['iron'] = 2,
                ['gold_piece'] = 5,
                ['cutted_wood'] = 20,
                ['petrol'] = 15,
                ['petrol_raffin'] = 25,
                ['essence'] = 30,
            }
        },
        ['WEAPON_CARBINERIFLE'] = {
            Level = 4,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 472000,
            Ingredients = { 
                ['iron'] = 3,
                ['gold_piece'] = 10,
                ['petrol'] = 15,
                ['petrol_raffin'] = 25,
                ['essence'] = 40,
                ['fabric'] = 10,
            }
        },
------------------ level 5
        ['tur'] = {
            Level = 5,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = {
                ['iron_piece'] = 5,
            }
        },
        ['darkphone'] = {
            Level = 5,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 1,
            Money = 0,
            blackmoney = 135000,
            Ingredients = {
                ['phone'] = 1,
                ['iron_piece'] = 10,
                ['gold_piece'] = 10,
                ['diamond'] = 2,
            }
        },
        ['WEAPON_ASSAULTRIFLE'] = {
            Level = 5,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 472000,
            Ingredients = { 
                ['iron'] = 3,
                ['gold_piece'] = 10,
                ['cutted_wood'] = 30,
                ['petrol'] = 20,
                ['petrol_raffin'] = 25,
                ['fabric'] = 10,
            }
        },
        ['WEAPON_ADVANCEDRIFLE'] = {
            Level = 5,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 472000, 
            Ingredients = {
                ['iron'] = 3,
                ['gold_piece'] = 10,
                ['cutted_wood'] = 30,
                ['petrol_raffin'] = 25,
                ['essence'] = 40,
                ['fabric'] = 10,
            }
        },
        ['rc'] = {
            Level = 5,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 67000,
            Ingredients = { 
                ["engine3"] = 1,
                ["iron_piece"] = 10,
                ["iron"] = 1,
                ["gold"] = 1,
				['petrol'] = 25,
				['petrol_raffin'] = 25,
				['essence'] = 50,
				['fabric'] = 10,
            }
        },
        ['trinket1'] = {
            Level = 5,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 400000,
            Ingredients = { 
                ["lockpick"] = 1,
                ["sc"] = 10,
            }
        },
        ['clip'] = {
            Level = 5,
            Category = 'items', 
            Amount = 20, 
            SuccessRate = 100, 
            Time = 5, 
            Money = 0,
            blackmoney = 0, 
            Ingredients = { 
                ["iron_piece"] = 10,
            }
        },
        ['grip'] = {
            Level = 5,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["iron_piece"] = 5,
                ["gold_piece"] = 1,
                ["petrol"] = 1,
            }
        },
        ['silencer'] = {
            Level = 5,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["iron_piece"] = 5,
                ["gold_piece"] = 1,
                ["petrol"] = 1,
            }
        },
        ['blowtorch'] = {
            Level = 5,
            Category = 'items', 
            Amount = 2, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["iron_piece"] = 4,
                ['gold_piece'] = 6,
            }
        },
        ['raspberry'] = {
            Level = 5,
            Category = 'items', 
            Amount = 2, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["iron_piece"] = 7,
                ['gold_piece'] = 5,
                ['petrol'] = 3,
                ['petrol_raffin'] = 3,
                ['fabric'] = 1,
                ['diamond'] = 1,
            }
        },
        ['c4_bank'] = {
            Level = 5,
            Category = 'items', 
            Amount = 2, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["iron_piece"] = 10,
                ['gold_piece'] = 10,
                ['petrol'] = 5,
                ['petrol_raffin'] = 5,
                ['essence'] = 5,
            }
        },
        ['radio'] = {
            Level = 5,
            Category = 'items', 
            Amount = 5, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["phone"] = 5,
            }
        },
        ['kingkey'] = {
            Level = 5,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["iron_piece"] = 8,
                ["gold_piece"] = 2,
                ["petrol"] = 2,
                ["diamond"] = 1,
            }
        },
        ['ghayegh_badi'] = {
            Level = 5,
            Category = 'items',
            Amount = 1,
            SuccessRate = 100,
            Time = 10,
            Money = 0,
            blackmoney = 0,
            Ingredients = {
                ["petrol_raffin"] = 5,
                ["fabric"] = 5,
            }
        },
------------------ level 6
        ['WEAPON_COMBATPDW'] = {
            Level = 6,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 472000, 
            Ingredients = { 
                ['iron'] = 3,
                ['gold_piece'] = 10,
                ['cutted_wood'] = 30,
                ['petrol'] = 15,
                ['essence'] = 40,
                ['fabric'] = 10,
            }
        },
        ['WEAPON_BULLPUPRIFLE'] = {
            Level = 6,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 513000,
            Ingredients = { 
                ['iron'] = 4,
                ['gold'] = 1,
                ['cutted_wood'] = 30,
                ['petrol'] = 20,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
            }
        },
        ['WEAPON_GUSENBERG'] = {
            Level = 6,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 540000,
            Ingredients = { 
                ['iron'] = 4,
                ['gold'] = 1,
                ['cutted_wood'] = 40,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
                ['fabric'] = 10,
            }
        },
------------------ level 7
        ['WEAPON_ASSAULTSHOTGUN'] = {
            Level = 7,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 513000,
            Ingredients = { 
                ['iron'] = 4,
                ['gold'] = 1,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['fabric'] = 10,
            }
        },
        ['WEAPON_BULLPUPSHOTGUN'] = {
            Level = 7,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 513000,
            Ingredients = { 
                ['iron'] = 4,
                ['gold'] = 1,
                ['cutted_wood'] = 50,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
                ['fabric'] = 10,
            }
        },
        ['WEAPON_SAWNOFFSHOTGUN'] = {
            Level = 7,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 513000,
            Ingredients = { 
                ['iron'] = 4,
                ['gold'] = 1,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['essence'] = 50,
                ['fabric'] = 10,
            }
        },
        ['WEAPON_PUMPSHOTGUN'] = {
            Level = 7,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 513000, 
            Ingredients = {
                ['iron'] = 4,
                ['gold'] = 1,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
            }
        },
        ['trinket2'] = {
            Level = 7,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["trinket1"] = 1,
                ["ember"] = 10,
            }
        },
------------------ level 8
        ['WEAPON_KNUCKLE'] = {
            Level = 8,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            Money = 0,
            blackmoney = 67000, 
            Ingredients = {
                ["iron_piece"] = 10,
                ["iron"] = 1,
                ["diamond"] = 2,
                ["gold_piece"] = 10,
                ['petrol'] = 10,
                ['petrol_raffin'] = 10,
                ['essence'] = 5,
                ['fabric'] = 10,
            }
        },
        ['WEAPON_PISTOL_MK2'] = {
            Level = 8,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 150000,
            Ingredients = { 
                ["iron_piece"] = 10,
                ["iron"] = 1,
                ["diamond"] = 5,
                ["gold_piece"] = 10,
                ['petrol'] = 15,
                ['petrol_raffin'] = 20,
                ['essence'] = 30,
                ['fabric'] = 10,
            }
        },
        ['trinket3'] = {
            Level = 8,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = { 
                ["trinket2"] = 1,
                ["ember"] = 30,
            }
        },
------------------ level 9
        ['WEAPON_SPECIALCARBINE'] = {
            Level = 9,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 513000,
            Ingredients = { 
                ['iron'] = 4,
                ['gold'] = 1,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
                ['fabric'] = 10,
            }
        },
        ['WEAPON_CERAMICPISTOL'] = {
            Level = 9,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 202000,
            Ingredients = { 
                ["iron_piece"] = 5,
                ["iron"] = 2,
                ["diamond"] = 3,
                ["gold_piece"] = 5,
                ['cutted_wood'] = 15,
                ['petrol_raffin'] = 20,
                ['essence'] = 30,
                ['fabric'] = 10,
            }
        },
------------------ level 10
        ['uav'] = { -- UAV
            Level = 10,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 20000, 
            limit = 10,
            Ingredients = { 
                ["engine1"] = 1,
                ['iron_piece'] = 10,
                ['petrol'] = 25,
            }
        },
        ['WEAPON_PUMPSHOTGUN_MK2'] = {
            Level = 10,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 675000,
            Ingredients = { 
                ["iron"] = 7,
                ["gold"] = 2,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['fabric'] = 15,
            }
        },
        ['WEAPON_BULLPUPRIFLE_MK2'] = {
            Level = 10,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 675000,
            Ingredients = { 
                ["iron"] = 7,
                ["gold"] = 2,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
                ['fabric'] = 15,
            }
        },
        ['yusuf'] = {
            Level = 10,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 135000, 
            Ingredients = { 
                ["gold_piece"] = 20,
                ["gold"] = 3,
            }
        },
------------------ level 11
        ['WEAPON_DOUBLEACTION'] = {
            Level = 11,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 810000,
            Ingredients = { 
                ["iron_piece"] = 40,
                ["iron"] = 15,
                ["diamond"] = 20,
                ["gold"] = 2,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
                ['fabric'] = 20,
            }
        },
        ['WEAPON_SMG_MK2'] = {
            Level = 11,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 675000,
            Ingredients = { 
                ["iron"] = 7,
                ["gold"] = 2,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
                ['fabric'] = 20,
            }
        },
        ['WEAPON_COMPACTRIFLE'] = {
            Level = 11,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 675000, 
            Ingredients = {
				["iron"] = 7,
                ["gold"] = 1,
				['cutted_wood'] = 50,
				['petrol'] = 25,
				['petrol_raffin'] = 25,
				['essence'] = 50,
				['fabric'] = 20,
            }
        },
        ['camo1'] = {
            Level = 11,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000,
            Ingredients = { 
                ["iron_piece"] = 10,
 				["diamond"] = 3,
                ["gold_piece"] = 10,
                ["gold"] = 1,
				['petrol'] = 10,
            }
        },
        ['camo2'] = {
            Level = 11,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000,
            Ingredients = { 
                ["iron_piece"] = 10,
 				["diamond"] = 3,
                ["gold_piece"] = 10,
                ["gold"] = 1,
				['petrol'] = 10,
            }
        },
        ['hollysion2'] = { -- speed jam kardan drag
            Level = 11,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0, 
            limit = 10,
            Ingredients = { 
                ["mushroom"] = 5,
                ["crack"] = 5,
            }
        },
------------------ level 12
        ['WEAPON_SPECIALCARBINE_MK2'] = {
            Level = 12,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 675000, 
            Ingredients = { 
                ["iron_piece"] = 10,
                ["iron"] = 8,
                ["diamond"] = 10,
                ["gold"] = 2,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
                ['fabric'] = 20,
            }
        },
        ['camo3'] = {
            Level = 12,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000,
            Ingredients = { 
                ["iron_piece"] = 10,
 				["diamond"] = 3,
                ["gold_piece"] = 10,
                ["gold"] = 1,
				['petrol'] = 10,
            }
        },
        ['camo4'] = {
            Level = 12,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000,
            Ingredients = { 
                ["iron_piece"] = 10,
 				["diamond"] = 3,
                ["gold_piece"] = 10,
                ["gold"] = 1,
				['petrol'] = 10,
            }
        },
        ['desomorphine2'] = { -- vest up
            Level = 12,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0, 
            limit = 10,
            Ingredients = { 
                ["mushroom"] = 5,
                ["heroine"] = 3,
            }
        },
------------------ level 13
        ['WEAPON_MICROSMG'] = {
            Level = 13,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 810000, 
            Ingredients = {
				["iron_piece"] = 10,
				["iron"] = 7,
				["diamond"] = 10,
                ["gold"] = 2,
				['cutted_wood'] = 50,
				['petrol'] = 25,
				['petrol_raffin'] = 50,
				['essence'] = 100,
				['fabric'] = 20,
            }
        },
        ['camo5'] = {
            Level = 13,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000,
            Ingredients = { 
                ["iron_piece"] = 15,
 				["diamond"] = 4,
                ["gold_piece"] = 15,
				['petrol_raffin'] = 25,
            }
        },
        ['camo6'] = {
            Level = 13,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000,
            Ingredients = { 
                ["iron_piece"] = 15,
 				["diamond"] = 4,
                ["gold_piece"] = 15,
				['petrol_raffin'] = 25,
            }
        },
        ['diastat2'] = { -- speed up
            Level = 13,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0, 
            limit = 10,
            Ingredients = { 
                ["mushroom"] = 5,
                ["marijuana"] = 10,
            }
        },
        ['sianor'] = {
            Level = 13,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,           
            Ingredients = { 
                ["meth"] = 2,
                ["extra_meth"] = 2,
                ["titopgold"] = 1,
            }
        },
------------------ level 14
        ['WEAPON_ASSAULTRIFLE_MK2'] = {
            Level = 14,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 675000,
            Ingredients = { 
                ["iron"] = 7,
                ["diamond"] = 10,
                ["gold"] = 2,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['petrol_raffin'] = 50,
                ['essence'] = 100,
                ['fabric'] = 20,
            }
        },
        ['WEAPON_CARBINERIFLE_MK2'] = {
            Level = 14,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 675000,
            Ingredients = { 
				["iron"] = 7,
				["diamond"] = 10,
                ["gold"] = 2,
				['cutted_wood'] = 50,
				['petrol'] = 25,
				['petrol_raffin'] = 50,
				['essence'] = 100,
				['fabric'] = 20,
            }
        },
        ['camo7'] = {
            Level = 14,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000,
            Ingredients = { 
                ["iron_piece"] = 15,
 				["diamond"] = 4,
                ["gold_piece"] = 15,
				['petrol_raffin'] = 25,
            }
        },
        ['camo8'] = {
            Level = 14,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000, 
            Ingredients = {
                ["iron_piece"] = 15,
 				["diamond"] = 4,
                ["gold_piece"] = 15,
				['petrol_raffin'] = 25,
            }
        },
        ['wellbutrin2'] = { -- hel up
            Level = 14,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0, 
            limit = 10,
            Ingredients = { 
                ["mushroom"] = 5,
                ["cocaine"] = 6,
            }
        },
------------------ level 15
        ['WEAPON_APPISTOL'] = {
            Level = 15,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 1350000, 
            Ingredients = { 
				["iron_piece"] = 10,
				["iron"] = 10,
				["diamond"] = 10,
                ["gold"] = 10,
				['cutted_wood'] = 100,
				['petrol'] = 25,
				['petrol_raffin'] = 50,
				['essence'] = 100,
				['fabric'] = 20,
            }
        },
        ['camo9'] = {
            Level = 15,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000, 
            Ingredients = { 
                ["iron"] = 1,
 				["diamond"] = 5,
                ["gold"] = 1,
				['essence'] = 100,
            }
        },
        ['camo10'] = {
            Level = 15,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000, 
            Ingredients = { 
                ["iron"] = 1,
 				["diamond"] = 5,
                ["gold"] = 1,
				['essence'] = 100,
            }
        },
        ['camo11'] = {
            Level = 15,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 5,
            Money = 0,
            blackmoney = 135000, 
            Ingredients = { 
                ["iron"] = 1,
 				["diamond"] = 10,
                ["gold"] = 2,
				['essence'] = 100,
            }
        },
        ['scope'] = {
            Level = 15,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            limit = 5,
            Money = 0,
            blackmoney = 1000000, 
            Ingredients = { 
                ["iron"] = 4,
                ["diamond"] = 10,
                ["gold"] = 5,
                ['petrol'] = 10,
                ['petrol_raffin'] = 10,
                ['essence'] = 10,
            }
        },
        ['lsd2'] = {
            Level = 15,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,             
            limit = 10,
            Ingredients = { 
                ["mushroom"] = 5,
                ["meth"] = 3,
            }
        },
        ['mask_shab'] = {
            Level = 15,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 0,
            Ingredients = {
                ['cutted_wood'] = 20,
                ['petrol'] = 20,
                ['petrol_raffin'] = 20,
                ['essence'] = 20,
                ['fabric'] = 20,
            }
        },
------------------ level 16
        ['firework'] = {
            Level = 16,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 500000,             
            limit = 5,
            Ingredients = { 
                ['cutted_wood'] = 10,
                ['petrol'] = 10,
                ['petrol_raffin'] = 10,
                ['essence'] = 10,
                ['fabric'] = 10,
            }
        },
        ['eclip'] = {
            Level = 16,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 20, 
            Money = 0,
            blackmoney = 1500000,             
            limit = 1,
            Ingredients = { 
                ["iron"] = 4,
                ["diamond"] = 10,
                ["gold"] = 5,
                ['petrol'] = 10,
                ['petrol_raffin'] = 10,
                ['essence'] = 10,
            }
        },
        ['tintblack'] = {
            Level = 16,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 400000,             
            limit = 2,
            Ingredients = { 
                ["diamond"] = 4,
                ["gold"] = 1,
                ['essence'] = 50,
            }
        },
        ['tintcream'] = {
            Level = 16,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 500000,             
            limit = 2,
            Ingredients = { 
                ["diamond"] = 5,
                ["gold"] = 2,
                ['essence'] = 50,
            }
        },
        ['WEAPON_GADGETPISTOL'] = {
            Level = 16,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 700000,
            Ingredients = {
                ["iron_piece"] = 20,
                ["diamond"] = 10,
                ["gold_piece"] = 20,
                ["gold"] = 10,
                ['cutted_wood'] = 5,
                ['petrol'] = 5,
                ['petrol_raffin'] = 5,
                ['essence'] = 5,
                ['fabric'] = 5,
            }
        },
------------------ level 17
        ['tintgold'] = {
            Level = 17,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 600000,
            limit = 2,
            Ingredients = { 
                ["diamond"] = 6,
                ["gold"] = 3,
                ['essence'] = 50,
            }
        },
        ['tintgreen'] = {
            Level = 17,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 700000,             
            limit = 2,
            Ingredients = { 
                ["diamond"] = 7,
                ["gold"] = 4,
                ['essence'] = 50,
            }
        },
        ['WEAPON_COMBATSHOTGUN'] = {
            Level = 17,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 1000000,
            Ingredients = {
                ["iron"] = 4,
                ["gold"] = 5,
                ['cutted_wood'] = 50,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['fabric'] = 10,
            }
        },
        ['GADGET_PARACHUTE'] = {
            Level = 17,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            limit = 10,
            Money = 0,
            blackmoney = 150000,
            Ingredients = {
                ['cutted_wood'] = 20,
                ['petrol'] = 20,
                ['petrol_raffin'] = 20,
                ['essence'] = 20,
                ['fabric'] = 20,
            }
        },
------------------ level 18
        ['boombox'] = {
            Level = 18,
            Category = 'items', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 15, 
            Money = 0,
            blackmoney = 15000000,             
            limit = 1,
            Ingredients = { 
                ["iron_piece"] = 10,
                ["iron"] = 2,
                ["diamond"] = 5,
                ["gold_piece"] = 10,
                ["gold"] = 3,
                ['petrol'] = 10,
                ['petrol_raffin'] = 10,
                ['essence'] = 10,
                ['fabric'] = 10,
            }
        },
        ['tintorange'] = {
            Level = 18,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 800000,             
            limit = 2,
            Ingredients = { 
                ["diamond"] = 8,
                ["gold"] = 5,
                ['essence'] = 50,
            }
        },
        ['WEAPON_MILITARYRIFLE'] = {
            Level = 18,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 750000,
            Ingredients = {
                ["iron"] = 7,
                ["gold_piece"] = 20,
                ["gold"] = 5,
                ['petrol'] = 25,
                ['petrol_raffin'] = 25,
                ['essence'] = 50,
                ['fabric'] = 10,
            }
        },
------------------ level 19 
        ['tintpink'] = {
            Level = 19,
            Category = 'skins', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 900000,             
            limit = 2,
            Ingredients = { 
                ["diamond"] = 9,
                ["gold"] = 6,
                ['essence'] = 50,
            }
        },
        ['WEAPON_FLARE'] = {
            Level = 19,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 10, 
            Money = 0,
            blackmoney = 500000,
            Ingredients = {
                ['cutted_wood'] = 10,
                ['petrol'] = 10,
                ['petrol_raffin'] = 10,
                ['essence'] = 10,
                ['fabric'] = 10,
            }
        },
        ['WEAPON_TACTICALRIFLE'] = {
            Level = 19,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 1500000,
            Ingredients = {
                ["iron"] = 7,
                ["gold"] = 5,
                ['cutted_wood'] = 10,
                ['petrol'] = 15,
                ['petrol_raffin'] = 10,
                ['essence'] = 25,
                ['fabric'] = 10,
            }
        },
------------------ level 20 
        ['tintplat'] = {
            Level = 20,
            Category = 'skins',
            Amount = 1,
            SuccessRate = 100,
            Time = 10,
            Money = 0,
            blackmoney = 1000000,
            limit = 2,
            Ingredients = {
                ["diamond"] = 10,
                ["gold"] = 7,
                ['essence'] = 50,
            }
        },
        ['WEAPON_HEAVYRIFLE'] = {
            Level = 20,
            Category = 'weapons', 
            Amount = 1, 
            SuccessRate = 100, 
            Time = 25, 
            Money = 0,
            blackmoney = 1000000,
            Ingredients = {
                ["iron"] = 5,
                ["gold"] = 3,
                ['petrol_raffin'] = 25,
                ['fabric'] = 5,
            }
        },
    },
    
--
    Workbenches = { -- Every workbench location, leave {} for jobs if you want everybody to access

        { coords = vec(591.62, -3273.71, 6.0),      recipes = {}, blip = false, radius = 2.0 }, -- public
        -- gangs
        { coords = vec(845.27, -2488.97, 28.43),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_01
        { coords = vec(1025.71, -2544.08, 28.29),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_02
        { coords = vec(1072.51, -2329.08, 30.28),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_03
        { coords = vec(959.52, -2124.39, 31.46),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_04  
        { coords = vec(1361.74, -2092.65, 47.21),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_05
        { coords = vec(149.97, -2205.05, 4.69),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_07
        { coords = vec(-109.52, -2212.08, 7.81),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_08
        { coords = vec(-432.07, -1673.66, 19.03),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_09
        { coords = vec(-613.15, -1623.85, 33.01),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_10  
        { coords = vec(984.13, -90.85, 74.85),      recipes = {}, blip = false, radius = 2.0 }, -- Gang G_11
        { coords = vec(1405.54, 1137.44, 109.75),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_12
        { coords = vec(-133.92, 869.91, 232.69),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_16
        { coords = vec(-78.31, 1002.53, 230.61),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_18
        { coords = vec(-575.61, 290.53, 79.18),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_19
        { coords = vec(-888.53, -53.98, 38.05),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_20
        { coords = vec(-815.77, 178.53, 76.74),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_27
        { coords = vec(-1121.44, 363.62, 74.97),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_31
        { coords = vec(-1362.64, 87.69, 60.63),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_34 
        { coords = vec(-1550.91, 84.03, 53.87),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_35
        { coords = vec(-1590.68, -56.8, 56.48),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_36
        { coords = vec(-1589.65, -82.61, 54.33),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_37
        { coords = vec(-1919.25, 553.67, 114.44),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_42
        { coords = vec(-1790.41, 430.35, 125.21),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_43
        { coords = vec(-1545.45, 421.88, 109.66),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_45
        { coords = vec(-1501.38, 857.66, 181.59),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_49 
        { coords = vec(-3194.99, 832.46, 8.93),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_51
        { coords = vec(-2678.76, 1327.51, 140.88),  recipes = {}, blip = false, radius = 2.0 }, -- Gang G_52
        { coords = vec(-2614.63, 1684.65, 141.87),  recipes = {}, blip = false, radius = 2.0 }, -- Gang G_53
        { coords = vec(-1870.29, 2061.68, 135.43),  recipes = {}, blip = false, radius = 2.0 }, -- Gagn G_55
        { coords = vec(1990.6, 3045.63, 47.22),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_60  
        { coords = vec(-1578.98, -243.04, 49.48),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_61
        { coords = vec(-1483.14, -34.52, 51.32),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_65
        { coords = vec(15.52, -1822.19, 24.95),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_66
        { coords = vec(221.33, -1987.23, 19.69),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_67
        { coords = vec(-118.06, -2212.11, 7.81),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_68
        { coords = vec(552.26, -2769.97, 6.09),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_69
        { coords = vec(-1050.82, 308.53, 62.22),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_70
        { coords = vec(-97.03, -1792.12, 26.91),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_72
        { coords = vec(167.27, 1703.5, 227.39),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_73
        { coords = vec(-638.45, -2389.01, 13.95),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_74
        { coords = vec(309.7, -2557.93, 5.7),       recipes = {}, blip = false, radius = 2.0 }, -- Gang G_78
        { coords = vec(-683.53, -1449.38, 5.0),     recipes = {}, blip = false, radius = 2.0 }, -- Gang G_84
        { coords = vec(-567.67, -2345.89, 13.84),   recipes = {}, blip = false, radius = 2.0 }, -- Gang G_86
        { coords = vec(-463.09, -2276.39, 8.69),    recipes = {}, blip = false, radius = 2.0 }, -- Gang G_87

    },
    
    Text = {
    
        ['not_enough_ingredients'] = 'You dont have enough ingredients',
        ['you_cant_hold_item'] = 'You cant hold the item',
        ['item_crafted'] = 'Item crafted!',
        ['wrong_job'] = 'You cant open this workbench',
        ['workbench_hologram'] = '[~b~E~w~] Workbench',
        ['wrong_usage'] = 'Wrong usage of command',
        ['inv_limit_exceed'] = 'Inventory limit exceeded! Clean up before you lose more',
        ['crafting_failed'] = 'You failed to craft the item!'
    
    },
--
}

    function SendTextMessage(msg)
        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)
    end
    
    Config.Weapons = {
        -- Meeles
        {
            name = 'WEAPON_DAGGER',
            hash = GetHashKey('WEAPON_DAGGER'),
            label = "Dagger",
            components = {}
        },
        {
            name = 'WEAPON_BAT',
            hash = GetHashKey('WEAPON_BAT'),
            label = "Bat",
            components = {}
        },
        {
            name = 'WEAPON_BOTTLE',
            hash = GetHashKey('WEAPON_BOTTLE'),
            label = "Bottle",
            components = {}
        },
        {
            name = 'WEAPON_CROWBAR',
            hash = GetHashKey('WEAPON_CROWBAR'),
            label = "Crowbar",
            components = {}
        },
        {
            name = 'WEAPON_FLASHLIGHT',
            hash = GetHashKey('WEAPON_FLASHLIGHT'),
            label = "Flashlight",
            components = {}
        },
        {
            name = 'WEAPON_GOLFCLUB',
            hash = GetHashKey('WEAPON_GOLFCLUB'),
            label = "Golf Club",
            components = {}
        },
        {
            name = 'WEAPON_HAMMER',
            hash = GetHashKey('WEAPON_HAMMER'),
            label = "Hammer",
            components = {}
        },
        {
            name = 'WEAPON_HATCHET',
            hash = GetHashKey('WEAPON_HATCHET'),
            label = "Hatchet",
            components = {}
        },
        {
            name = 'WEAPON_KNUCKLE',
            hash = GetHashKey('WEAPON_KNUCKLE'),
            label = "Knuckle Dusters",
            components = {
                {name = 'default_varmod', label = "Defualt Skin", hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_BASE')},
                {name = 'pimp_varmod',    label = "Pimp Skin",    hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_PIMP')},
                {name = 'ballas_varmod',  label = "Ballas Skin",  hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_BALLAS')},
                {name = 'dollar_varmod',  label = "Dollar Skin",  hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_DOLLAR')},
                {name = 'diamond_varmod', label = "Diamond Skin", hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_DIAMOND')},
                {name = 'hate_varmod',    label = "Hate Skin",    hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_HATE')},
                {name = 'love_varmod',    label = "Love Skin",    hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_LOVE')},
                {name = 'player_varmod',  label = "Player Skin",  hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_PLAYER')},
                {name = 'king_varmod',    label = "King Skin",    hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_KING')},
                {name = 'vagos_varmod',   label = "Vagos Skin",   hash = GetHashKey('COMPONENT_KNUCKLE_VARMOD_VAGOS')},
            },
        },
        {
            name = 'WEAPON_KNIFE',
            hash = GetHashKey('WEAPON_KNIFE'),
            label = "Knife",
            components = {}
        },
        {
            name = 'WEAPON_MACHETE',
            hash = GetHashKey('WEAPON_MACHETE'),
            label = "Machete",
            components = {}
        },
        {
            name = 'WEAPON_SWITCHBLADE',
            hash = GetHashKey('WEAPON_SWITCHBLADE'),
            label = "Switch Blade",
            components = {
                {name = 'default_varmod', label = "Defualt Skin", hash = GetHashKey('COMPONENT_SWITCHBLADE_VARMOD_BASE')},
                {name = 'var1_varmod',    label = "Var1 Skin",    hash = GetHashKey('COMPONENT_SWITCHBLADE_VARMOD_VAR1')},
                {name = 'var2_varmod',    label = "Var2 Skin",    hash = GetHashKey('COMPONENT_SWITCHBLADE_VARMOD_VAR2')},
            },
        },
        {
            name = 'WEAPON_NIGHTSTICK',
            hash = GetHashKey('WEAPON_NIGHTSTICK'),
            label = "Nightstick",
            components = {}
        },
        {
            name = 'WEAPON_WRENCH',
            hash = GetHashKey('WEAPON_WRENCH'),
            label = "Pipe Wrench",
            components = {}
        },
        {
            name = 'WEAPON_BATTLEAXE',
            hash = GetHashKey('WEAPON_BATTLEAXE'),
            label = "Battle Axe",
            components = {}
        },
        {
            name = 'WEAPON_POOLCUE',
            hash = GetHashKey('WEAPON_POOLCUE'),
            label = "Pool Cue",
            components = {}
        },
        {
            name = 'WEAPON_STONE_HATCHET',
            hash = GetHashKey('WEAPON_STONE_HATCHET'),
            label = "Stone Hatchet",
            components = {}
        },
        -- Pistols
        {
            name = 'WEAPON_PISTOL',
            hash = GetHashKey('WEAPON_PISTOL'),
            label = "Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_PISTOL_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_PISTOL_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_PI_SUPP_02')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_PISTOL_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_PISTOL_MK2',
            hash = GetHashKey('WEAPON_PISTOL_MK2'),
            label = "Pistol MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',     label = "Default Clip",     hash = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_01')},
                {name = 'clip_extended',    label = "Extended Clip",    hash = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_02')},
                {name = 'clip_tracer',      label = "Tracer Clip",      hash = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',  label = "Incendiary Clip",  hash = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_INCENDIARY')},
                {name = 'clip_hollowpoint', label = "Hollowpoint Clip", hash = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_HOLLOWPOINT')},
                {name = 'clip_fmj',         label = "FMJ Clip",         hash = GetHashKey('COMPONENT_PISTOL_MK2_CLIP_FMJ')},
                {name = 'mounted_scope',    label = "Mounted Scope",    hash = GetHashKey('COMPONENT_AT_PI_RAIL')},
                {name = 'flashlight',       label = "Flashlight",       hash = GetHashKey('COMPONENT_AT_PI_FLSH_02')},
                {name = 'suppressor',       label = "Suppressor",       hash = GetHashKey('COMPONENT_AT_PI_SUPP_02')},
                {name = 'compensator',      label = "Compensator",      hash = GetHashKey('COMPONENT_AT_PI_COMP')},
                {name = 'camo1',            label = "Camo 1",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO')},
                {name = 'camo2',            label = "Camo 2",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_02')},
                {name = 'camo3',            label = "Camo 3",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_03')},
                {name = 'camo4',            label = "Camo 4",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_04')},
                {name = 'camo5',            label = "Camo 5",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_05')},
                {name = 'camo6',            label = "Camo 6",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_06')},
                {name = 'camo7',            label = "Camo 7",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_07')},
                {name = 'camo8',            label = "Camo 8",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_08')},
                {name = 'camo9',            label = "Camo 9",           hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_09')},
                {name = 'camo10',           label = "Camo 10",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_10')},
                {name = 'camo11',           label = "Camo 11",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_IND_01')},
                {name = 'camo12',           label = "Camo 12",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_SLIDE')},
                {name = 'camo13',           label = "Camo 13",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_02_SLIDE')},
                {name = 'camo14',           label = "Camo 14",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_03_SLIDE')},
                {name = 'camo15',           label = "Camo 15",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_04_SLIDE')},
                {name = 'camo16',           label = "Camo 16",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_05_SLIDE')},
                {name = 'camo17',           label = "Camo 17",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_06_SLIDE')},
                {name = 'camo18',           label = "Camo 18",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_07_SLIDE')},
                {name = 'camo19',           label = "Camo 19",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_08_SLIDE')},
                {name = 'camo20',           label = "Camo 20",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_09_SLIDE')},
                {name = 'camo21',           label = "Camo 21",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_10_SLIDE')},
                {name = 'camo22',           label = "Camo 22",          hash = GetHashKey('COMPONENT_PISTOL_MK2_CAMO_IND_01_SLIDE')}
            }
        },
        {
            name = 'WEAPON_COMBATPISTOL',
            hash = GetHashKey('WEAPON_COMBATPISTOL'),
            label = "Combat Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_COMBATPISTOL_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_COMBATPISTOL_VARMOD_LOWRIDER')}
            },
        },
        {
            name = 'WEAPON_APPISTOL',
            hash = GetHashKey('WEAPON_APPISTOL'),
            label = "AP Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_APPISTOL_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_APPISTOL_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_APPISTOL_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_STUNGUN',
            hash = GetHashKey('WEAPON_STUNGUN'),
            label = "Taser",
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_PISTOL50',
            hash = GetHashKey('WEAPON_PISTOL50'),
            label = "Pistol .50",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_PISTOL50_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_PISTOL50_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_PISTOL50_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_SNSPISTOL',
            hash = GetHashKey('WEAPON_SNSPISTOL'),
            label = "SNS Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_SNSPISTOL_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_SNSPISTOL_CLIP_02')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_SNSPISTOL_VARMOD_LOWRIDER')}
            }
        },
        {
            name = 'WEAPON_SNSPISTOL_MK2',
            hash = GetHashKey('WEAPON_SNSPISTOL_MK2'),
            label = "SNS Pistol MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',     label = "Default Clip",     hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_01')},
                {name = 'clip_extended',    label = "Extended Clip",    hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_02')},
                {name = 'clip_tracer',      label = "Tracer Clip",      hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',  label = "Incendiary Clip",  hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_INCENDIARY')},
                {name = 'clip_hollowpoint', label = "Hollowpoint Clip", hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_HOLLOWPOINT')},
                {name = 'clip_fmj',         label = "FMJ Clip",         hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CLIP_FMJ')},
                {name = 'mounted_scope',    label = "Mounted Scope",    hash = GetHashKey('COMPONENT_AT_PI_RAIL_02')},
                {name = 'flashlight',       label = "Flashlight",       hash = GetHashKey('COMPONENT_AT_PI_FLSH_03')},
                {name = 'suppressor',       label = "Suppressor",       hash = GetHashKey('COMPONENT_AT_PI_SUPP_02')},
                {name = 'compensator',      label = "Compensator",      hash = GetHashKey('COMPONENT_AT_PI_COMP_02')},
                {name = 'camo1',            label = "Camo 1",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO')},
                {name = 'camo2',            label = "Camo 2",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_02')},
                {name = 'camo3',            label = "Camo 3",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_03')},
                {name = 'camo4',            label = "Camo 4",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_04')},
                {name = 'camo5',            label = "Camo 5",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_05')},
                {name = 'camo6',            label = "Camo 6",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_06')},
                {name = 'camo7',            label = "Camo 7",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_07')},
                {name = 'camo8',            label = "Camo 8",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_08')},
                {name = 'camo9',            label = "Camo 9",           hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_09')},
                {name = 'camo10',           label = "Camo 10",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_10')},
                {name = 'camo11',           label = "Camo 11",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_IND_01')},
                {name = 'camo12',           label = "Camo 12",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_SLIDE')},
                {name = 'camo13',           label = "Camo 13",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_02_SLIDE')},
                {name = 'camo14',           label = "Camo 14",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_03_SLIDE')},
                {name = 'camo15',           label = "Camo 15",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_04_SLIDE')},
                {name = 'camo16',           label = "Camo 16",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_05_SLIDE')},
                {name = 'camo17',           label = "Camo 17",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_06_SLIDE')},
                {name = 'camo18',           label = "Camo 18",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_07_SLIDE')},
                {name = 'camo19',           label = "Camo 19",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_08_SLIDE')},
                {name = 'camo20',           label = "Camo 20",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_09_SLIDE')},
                {name = 'camo21',           label = "Camo 21",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_10_SLIDE')},
                {name = 'camo22',           label = "Camo 22",          hash = GetHashKey('COMPONENT_SNSPISTOL_MK2_CAMO_IND_01_SLIDE')}
            }
        },
        {
            name = 'WEAPON_HEAVYPISTOL',
            hash = GetHashKey('WEAPON_HEAVYPISTOL'),
            label = "Heavy Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_HEAVYPISTOL_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_HEAVYPISTOL_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_VINTAGEPISTOL',
            hash = GetHashKey('WEAPON_VINTAGEPISTOL'),
            label = "Vintage Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_VINTAGEPISTOL_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_VINTAGEPISTOL_CLIP_02')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
            }
        },
        {
            name = 'WEAPON_FLAREGUN',
            hash = GetHashKey('WEAPON_FLAREGUN'),
            label = "Flaregun",
            ammo = {label = "Flare(s)", hash = GetHashKey('AMMO_FLAREGUN')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_MARKSMANPISTOL',
            hash = GetHashKey('WEAPON_MARKSMANPISTOL'),
            label = "Marksman Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_REVOLVER',
            hash = GetHashKey('WEAPON_REVOLVER'),
            label = "Heavy Revolver",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",   hash = GetHashKey('COMPONENT_REVOLVER_CLIP_01')},
                {name = 'boss_varmod',   label = "VIP Skin",       hash = GetHashKey('COMPONENT_REVOLVER_VARMOD_BOSS')},
                {name = 'goon_varmod',   label = "Bodyguard Skin", hash = GetHashKey('COMPONENT_REVOLVER_VARMOD_GOON')}
            }
        },
        {
            name = 'WEAPON_REVOLVER_MK2',
            hash = GetHashKey('WEAPON_REVOLVER_MK2'),
            label = "Heavy Revolver MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',     label = "Default Clip",     hash = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_01')},
                {name = 'clip_tracer',      label = "Tracer Clip",      hash = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',  label = "Incendiary Clip",  hash = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_INCENDIARY')},
                {name = 'clip_hollowpoint', label = "Hollowpoint Clip", hash = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_HOLLOWPOINT')},
                {name = 'clip_fmj',         label = "FMJ Clip",         hash = GetHashKey('COMPONENT_REVOLVER_MK2_CLIP_FMJ')},
                {name = 'holo_sight',       label = "Holograph Sight",  hash = GetHashKey('COMPONENT_AT_SIGHTS')},
                {name = 'small_scope',      label = "Small Scope",      hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')},
                {name = 'flashlight',       label = "Flashlight",       hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
                {name = 'compensator',      label = "Compensator",      hash = GetHashKey('COMPONENT_AT_PI_COMP_03')},
                {name = 'camo1',            label = "Camo 1",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO')},
                {name = 'camo2',            label = "Camo 2",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_02')},
                {name = 'camo3',            label = "Camo 3",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_03')},
                {name = 'camo4',            label = "Camo 4",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_04')},
                {name = 'camo5',            label = "Camo 5",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_05')},
                {name = 'camo6',            label = "Camo 6",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_06')},
                {name = 'camo7',            label = "Camo 7",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_07')},
                {name = 'camo8',            label = "Camo 8",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_08')},
                {name = 'camo9',            label = "Camo 9",           hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_09')},
                {name = 'camo10',           label = "Camo 10",          hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_10')},
                {name = 'camo11',           label = "Camo 11",          hash = GetHashKey('COMPONENT_REVOLVER_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_DOUBLEACTION',
            hash = GetHashKey('WEAPON_DOUBLEACTION'),
            label = "Double-Action Revolver",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_RAYPISTOL',
            hash = GetHashKey('WEAPON_RAYPISTOL'),
            label = "Up-n-Atomizer",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'xmas_varmod', label = "Xmas Skin", hash = GetHashKey('COMPONENT_RAYPISTOL_VARMOD_XMAS18')}
            }
        },
        {
            name = 'WEAPON_CERAMICPISTOL',
            hash = GetHashKey('WEAPON_CERAMICPISTOL'),
            label = "Ceramic Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_CERAMICPISTOL_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_CERAMICPISTOL_CLIP_02')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_CERAMICPISTOL_SUPP')}
            }
        },
        {
            name = 'WEAPON_NAVYREVOLVER',
            hash = GetHashKey('WEAPON_NAVYREVOLVER'),
            label = "Navy Revolver",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_GADGETPISTOL',
            hash = GetHashKey('WEAPON_GADGETPISTOL'),
            label = "Perico Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_PISTOL')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        -- SMGs
        {
            name = 'WEAPON_MICROSMG',
            hash = GetHashKey('WEAPON_MICROSMG'),
            label = "Micro SMG",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SMG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_MICROSMG_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_MICROSMG_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_PI_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_MICROSMG_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_SMG',
            hash = GetHashKey('WEAPON_SMG'),
            label = "SMG",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SMG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_SMG_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_SMG_CLIP_02')},
                {name = 'clip_drum',     label = "Drum Clip",     hash = GetHashKey('COMPONENT_SMG_CLIP_03')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_SMG_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_SMG_MK2',
            hash = GetHashKey('WEAPON_SMG_MK2'),
            label = "SMG MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SMG')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',     label = "Default Clip",     hash = GetHashKey('COMPONENT_SMG_MK2_CLIP_01')},
                {name = 'clip_extended',    label = "Extended Clip",    hash = GetHashKey('COMPONENT_SMG_MK2_CLIP_02')},
                {name = 'clip_tracer',      label = "Tracer Clip",      hash = GetHashKey('COMPONENT_SMG_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',  label = "Incendiary Clip",  hash = GetHashKey('COMPONENT_SMG_MK2_CLIP_INCENDIARY')},
                {name = 'clip_hollowpoint', label = "Hollowpoint Clip", hash = GetHashKey('COMPONENT_SMG_MK2_CLIP_HOLLOWPOINT')},
                {name = 'clip_fmj',         label = "FMJ Clip",         hash = GetHashKey('COMPONENT_SMG_MK2_CLIP_FMJ')},
                {name = 'holo_sight',       label = "Holograph Sight",  hash = GetHashKey('COMPONENT_AT_SIGHTS_SMG')},
                {name = 'small_scope',      label = "Small Scope",      hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_SMG_MK2')},
                {name = 'medium_scope',     label = "Medium Scope",     hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL_SMG_MK2')},
                {name = 'flashlight',       label = "Flashlight",       hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',       label = "Suppressor",       hash = GetHashKey('COMPONENT_AT_PI_SUPP')},
                {name = 'muzzle1',          label = "Muzzle Brake 1",   hash = GetHashKey('COMPONENT_AT_MUZZLE_01')},
                {name = 'muzzle2',          label = "Muzzle Brake 2",   hash = GetHashKey('COMPONENT_AT_MUZZLE_02')},
                {name = 'muzzle3',          label = "Muzzle Brake 3",   hash = GetHashKey('COMPONENT_AT_MUZZLE_03')},
                {name = 'muzzle4',          label = "Muzzle Brake 4",   hash = GetHashKey('COMPONENT_AT_MUZZLE_04')},
                {name = 'muzzle5',          label = "Muzzle Brake 5",   hash = GetHashKey('COMPONENT_AT_MUZZLE_05')},
                {name = 'muzzle6',          label = "Muzzle Brake 6",   hash = GetHashKey('COMPONENT_AT_MUZZLE_06')},
                {name = 'muzzle7',          label = "Muzzle Brake 7",   hash = GetHashKey('COMPONENT_AT_MUZZLE_07')},
                {name = 'default_barrel',   label = "Default Barrel",   hash = GetHashKey('COMPONENT_AT_SB_BARREL_01')},
                {name = 'heavy_barrel',     label = "Heavy Barrel",     hash = GetHashKey('COMPONENT_AT_SB_BARREL_02')},
                {name = 'camo1',            label = "Camo 1",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO')},
                {name = 'camo2',            label = "Camo 2",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_02')},
                {name = 'camo3',            label = "Camo 3",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_03')},
                {name = 'camo4',            label = "Camo 4",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_04')},
                {name = 'camo5',            label = "Camo 5",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_05')},
                {name = 'camo6',            label = "Camo 6",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_06')},
                {name = 'camo7',            label = "Camo 7",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_07')},
                {name = 'camo8',            label = "Camo 8",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_08')},
                {name = 'camo9',            label = "Camo 9",           hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_09')},
                {name = 'camo10',           label = "Camo 10",          hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_10')},
                {name = 'camo11',           label = "Camo 11",          hash = GetHashKey('COMPONENT_SMG_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_ASSAULTSMG',
            hash = GetHashKey('WEAPON_ASSAULTSMG'),
            label = "Assault SMG",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SMG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_ASSAULTSMG_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_ASSAULTSMG_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER')}
            }
        },
        {
            name = 'WEAPON_COMBATPDW',
            hash = GetHashKey('WEAPON_COMBATPDW'),
            label = "Combat PDW",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SMG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_COMBATPDW_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_COMBATPDW_CLIP_02')},
                {name = 'clip_drum',     label = "Drum Clip",     hash = GetHashKey('COMPONENT_COMBATPDW_CLIP_03')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL')}
            }
        },
        {
            
            name = 'WEAPON_MACHINEPISTOL',
            hash = GetHashKey('WEAPON_MACHINEPISTOL'),
            label = "Machine Pistol",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SMG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_02')},
                {name = 'clip_drum',     label = "Drum Clip",     hash = GetHashKey('COMPONENT_MACHINEPISTOL_CLIP_03')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_PI_SUPP')}
            }
        },
        {
            name = 'WEAPON_MINISMG',
            hash = GetHashKey('WEAPON_MINISMG'),
            label = "Mini SMG",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SMG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_MINISMG_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_MINISMG_CLIP_02')}
            }
        },
        {
            name = 'WEAPON_RAYCARBINE',
            hash = GetHashKey('WEAPON_RAYCARBINE'),
            label = "Unholy Hellbringer",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SMG')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        -- Shotguns
        {
            name = 'WEAPON_PUMPSHOTGUN',
            hash = GetHashKey('WEAPON_PUMPSHOTGUN'),
            label = "Pump Shotgun",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_SR_SUPP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_PUMPSHOTGUN_VARMOD_LOWRIDER')}
            }
        },
        {
            name = 'WEAPON_PUMPSHOTGUN_MK2',
            hash = GetHashKey('WEAPON_PUMPSHOTGUN_MK2'),
            label = "Pump Shotgun MK2",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',       label = "Default Clip",       hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CLIP_01')},
                {name = 'clip_incendiary',    label = "Incendiary Clip",    hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CLIP_INCENDIARY')},
                {name = 'clip_armorpiercing', label = "Armorpiercing Clip", hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CLIP_ARMORPIERCING')},
                {name = 'clip_hollowpoint',   label = "Hollowpoint Clip",   hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CLIP_HOLLOWPOINT')},
                {name = 'clip_explosive',     label = "Explosive Clip",     hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CLIP_EXPLOSIVE')},
                {name = 'holo_sight',         label = "Holograph Sight",    hash = GetHashKey('COMPONENT_AT_SIGHTS')},
                {name = 'small_scope',        label = "Small Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')},
                {name = 'medium_scope',       label = "Medium Scope",       hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL_MK2')},
                {name = 'flashlight',         label = "Flashlight",         hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',         label = "Suppressor",         hash = GetHashKey('COMPONENT_AT_SR_SUPP_03')},
                {name = 'muzzle1',            label = "Muzzle Brake 1",     hash = GetHashKey('COMPONENT_AT_MUZZLE_08')},
                {name = 'camo1',              label = "Camo 1",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO')},
                {name = 'camo2',              label = "Camo 2",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_02')},
                {name = 'camo3',              label = "Camo 3",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_03')},
                {name = 'camo4',              label = "Camo 4",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_04')},
                {name = 'camo5',              label = "Camo 5",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_05')},
                {name = 'camo6',              label = "Camo 6",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_06')},
                {name = 'camo7',              label = "Camo 7",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_07')},
                {name = 'camo8',              label = "Camo 8",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_08')},
                {name = 'camo9',              label = "Camo 9",             hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_09')},
                {name = 'camo10',             label = "Camo 10",            hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_10')},
                {name = 'camo11',             label = "Camo 11",            hash = GetHashKey('COMPONENT_PUMPSHOTGUN_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_SAWNOFFSHOTGUN',
            hash = GetHashKey('WEAPON_SAWNOFFSHOTGUN'),
            label = "Sawed-Off Shotgun",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'luxe_varmod', label = "Luxary Skin", hash = GetHashKey('COMPONENT_SAWNOFFSHOTGUN_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_ASSAULTSHOTGUN',
            hash = GetHashKey('WEAPON_ASSAULTSHOTGUN'),
            label = "Assault Shotgun",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_ASSAULTSHOTGUN_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')}
            }
        },
        {
            name = 'WEAPON_BULLPUPSHOTGUN',
            hash = GetHashKey('WEAPON_BULLPUPSHOTGUN'),
            label = "Bullpup Shotgun",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')}
            }
        },
        {
            name = 'WEAPON_MUSKET',
            hash = GetHashKey('WEAPON_MUSKET'),
            label = "Musket",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_HEAVYSHOTGUN',
            hash = GetHashKey('WEAPON_HEAVYSHOTGUN'),
            label = "Heavy Shotgun",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_HEAVYSHOTGUN_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_HEAVYSHOTGUN_CLIP_02')},
                {name = 'clip_drum',     label = "Drum Clip",     hash = GetHashKey('COMPONENT_HEAVYSHOTGUN_CLIP_03')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')}
            }
        },
        {
            name = 'WEAPON_DBSHOTGUN',
            hash = GetHashKey('WEAPON_DBSHOTGUN'),
            label = "Double-Barrel Shotgun",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_AUTOSHOTGUN',
            hash = GetHashKey('WEAPON_AUTOSHOTGUN'),
            label = "Auto Shotgun",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_COMBATSHOTGUN',
            hash = GetHashKey('WEAPON_COMBATSHOTGUN'),
            label = "Combat Shotgun",
            ammo = {label = "Shell(s)", hash = GetHashKey('AMMO_SHOTGUN')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        -- Rifles
        {
            name = 'WEAPON_ASSAULTRIFLE',
            hash = GetHashKey('WEAPON_ASSAULTRIFLE'),
            label = "Assault Rifle",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_02')},
                {name = 'clip_drum',     label = "Drum Clip",     hash = GetHashKey('COMPONENT_ASSAULTRIFLE_CLIP_03')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_ASSAULTRIFLE_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_ASSAULTRIFLE_MK2',
            hash = GetHashKey('WEAPON_ASSAULTRIFLE_MK2'),
            label = "Assault Rifle MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',       label = "Default Clip",       hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CLIP_01')},
                {name = 'clip_extended',      label = "Extended Clip",      hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CLIP_02')},
                {name = 'clip_tracer',        label = "Tracer Clip",        hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',    label = "Incendiary Clip",    hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CLIP_INCENDIARY')},
                {name = 'clip_armorpiercing', label = "Armorpiercing Clip", hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CLIP_ARMORPIERCING')},
                {name = 'clip_fmj',           label = "FMJ Clip",           hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CLIP_FMJ')},
                {name = 'holo_sight',         label = "Holograph Sight",    hash = GetHashKey('COMPONENT_AT_SIGHTS')},
                {name = 'small_scope',        label = "Small Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')},
                {name = 'large_scope',        label = "Large Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2')},
                {name = 'grip',               label = "Grip",               hash = GetHashKey('COMPONENT_AT_AR_AFGRIP_02')},
                {name = 'flashlight',         label = "Flashlight",         hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',         label = "Suppressor",         hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'muzzle1',            label = "Muzzle Brake 1",     hash = GetHashKey('COMPONENT_AT_MUZZLE_01')},
                {name = 'muzzle2',            label = "Muzzle Brake 2",     hash = GetHashKey('COMPONENT_AT_MUZZLE_02')},
                {name = 'muzzle3',            label = "Muzzle Brake 3",     hash = GetHashKey('COMPONENT_AT_MUZZLE_03')},
                {name = 'muzzle4',            label = "Muzzle Brake 4",     hash = GetHashKey('COMPONENT_AT_MUZZLE_04')},
                {name = 'muzzle5',            label = "Muzzle Brake 5",     hash = GetHashKey('COMPONENT_AT_MUZZLE_05')},
                {name = 'muzzle6',            label = "Muzzle Brake 6",     hash = GetHashKey('COMPONENT_AT_MUZZLE_06')},
                {name = 'muzzle7',            label = "Muzzle Brake 7",     hash = GetHashKey('COMPONENT_AT_MUZZLE_07')},
                {name = 'default_barrel',     label = "Default Barrel",     hash = GetHashKey('COMPONENT_AT_AR_BARREL_01')},
                {name = 'heavy_barrel',       label = "Heavy Barrel",       hash = GetHashKey('COMPONENT_AT_AR_BARREL_02')},
                {name = 'camo1',              label = "Camo 1",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO')},
                {name = 'camo2',              label = "Camo 2",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_02')},
                {name = 'camo3',              label = "Camo 3",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_03')},
                {name = 'camo4',              label = "Camo 4",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_04')},
                {name = 'camo5',              label = "Camo 5",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_05')},
                {name = 'camo6',              label = "Camo 6",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_06')},
                {name = 'camo7',              label = "Camo 7",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_07')},
                {name = 'camo8',              label = "Camo 8",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_08')},
                {name = 'camo9',              label = "Camo 9",             hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_09')},
                {name = 'camo10',             label = "Camo 10",            hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_10')},
                {name = 'camo11',             label = "Camo 11",            hash = GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_CARBINERIFLE',
            hash = GetHashKey('WEAPON_CARBINERIFLE'),
            label = "Carbine Rifle",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_CARBINERIFLE_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_CARBINERIFLE_CLIP_02')},
                {name = 'clip_drum',     label = "Drum Clip",     hash = GetHashKey('COMPONENT_CARBINERIFLE_CLIP_03')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_CARBINERIFLE_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_CARBINERIFLE_MK2',
            hash = GetHashKey('WEAPON_CARBINERIFLE_MK2'),
            label = "Carbine Rifle MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',       label = "Default Clip",       hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CLIP_01')},
                {name = 'clip_extended',      label = "Extended Clip",      hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CLIP_02')},
                {name = 'clip_tracer',        label = "Tracer Clip",        hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',    label = "Incendiary Clip",    hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CLIP_INCENDIARY')},
                {name = 'clip_armorpiercing', label = "Armorpiercing Clip", hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CLIP_ARMORPIERCING')},
                {name = 'clip_fmj',           label = "FMJ Clip",           hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CLIP_FMJ')},
                {name = 'holo_sight',         label = "Holograph Sight",    hash = GetHashKey('COMPONENT_AT_SIGHTS')},
                {name = 'small_scope',        label = "Small Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')},
                {name = 'large_scope',        label = "Large Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2')},
                {name = 'grip',               label = "Grip",               hash = GetHashKey('COMPONENT_AT_AR_AFGRIP_02')},
                {name = 'flashlight',         label = "Flashlight",         hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',         label = "Suppressor",         hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'muzzle1',            label = "Muzzle Brake 1",     hash = GetHashKey('COMPONENT_AT_MUZZLE_01')},
                {name = 'muzzle2',            label = "Muzzle Brake 2",     hash = GetHashKey('COMPONENT_AT_MUZZLE_02')},
                {name = 'muzzle3',            label = "Muzzle Brake 3",     hash = GetHashKey('COMPONENT_AT_MUZZLE_03')},
                {name = 'muzzle4',            label = "Muzzle Brake 4",     hash = GetHashKey('COMPONENT_AT_MUZZLE_04')},
                {name = 'muzzle5',            label = "Muzzle Brake 5",     hash = GetHashKey('COMPONENT_AT_MUZZLE_05')},
                {name = 'muzzle6',            label = "Muzzle Brake 6",     hash = GetHashKey('COMPONENT_AT_MUZZLE_06')},
                {name = 'muzzle7',            label = "Muzzle Brake 7",     hash = GetHashKey('COMPONENT_AT_MUZZLE_07')},
                {name = 'default_barrel',     label = "Default Barrel",     hash = GetHashKey('COMPONENT_AT_CR_BARREL_01')},
                {name = 'heavy_barrel',       label = "Heavy Barrel",       hash = GetHashKey('COMPONENT_AT_CR_BARREL_02')},
                {name = 'camo1',              label = "Camo 1",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO')},
                {name = 'camo2',              label = "Camo 2",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_02')},
                {name = 'camo3',              label = "Camo 3",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_03')},
                {name = 'camo4',              label = "Camo 4",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_04')},
                {name = 'camo5',              label = "Camo 5",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_05')},
                {name = 'camo6',              label = "Camo 6",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_06')},
                {name = 'camo7',              label = "Camo 7",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_07')},
                {name = 'camo8',              label = "Camo 8",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_08')},
                {name = 'camo9',              label = "Camo 9",             hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_09')},
                {name = 'camo10',             label = "Camo 10",            hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_10')},
                {name = 'camo11',             label = "Camo 11",            hash = GetHashKey('COMPONENT_CARBINERIFLE_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_ADVANCEDRIFLE',
            hash = GetHashKey('WEAPON_ADVANCEDRIFLE'),
            label = "Advanced Rifle",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_ADVANCEDRIFLE_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_SPECIALCARBINE',
            hash = GetHashKey('WEAPON_SPECIALCARBINE'),
            label = "Special Carbine",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_02')},
                {name = 'clip_drum',     label = "Drum Clip",     hash = GetHashKey('COMPONENT_SPECIALCARBINE_CLIP_03')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_SPECIALCARBINE_VARMOD_LOWRIDER')}
            }
        },
        {
            name = 'WEAPON_SPECIALCARBINE_MK2',
            hash = GetHashKey('WEAPON_SPECIALCARBINE_MK2'),
            label = "Special Carbine MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',       label = "Default Clip",       hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CLIP_01')},
                {name = 'clip_extended',      label = "Extended Clip",      hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CLIP_02')},
                {name = 'clip_tracer',        label = "Tracer Clip",        hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',    label = "Incendiary Clip",    hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CLIP_INCENDIARY')},
                {name = 'clip_armorpiercing', label = "Armorpiercing Clip", hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CLIP_ARMORPIERCING')},
                {name = 'clip_fmj',           label = "FMJ Clip",           hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CLIP_FMJ')},
                {name = 'holo_sight',         label = "Holograph Sight",    hash = GetHashKey('COMPONENT_AT_SIGHTS')},
                {name = 'small_scope',        label = "Small Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2')},
                {name = 'large_scope',        label = "Large Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2')},
                {name = 'grip',               label = "Grip",               hash = GetHashKey('COMPONENT_AT_AR_AFGRIP_02')},
                {name = 'flashlight',         label = "Flashlight",         hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',         label = "Suppressor",         hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'muzzle1',            label = "Muzzle Brake 1",     hash = GetHashKey('COMPONENT_AT_MUZZLE_01')},
                {name = 'muzzle2',            label = "Muzzle Brake 2",     hash = GetHashKey('COMPONENT_AT_MUZZLE_02')},
                {name = 'muzzle3',            label = "Muzzle Brake 3",     hash = GetHashKey('COMPONENT_AT_MUZZLE_03')},
                {name = 'muzzle4',            label = "Muzzle Brake 4",     hash = GetHashKey('COMPONENT_AT_MUZZLE_04')},
                {name = 'muzzle5',            label = "Muzzle Brake 5",     hash = GetHashKey('COMPONENT_AT_MUZZLE_05')},
                {name = 'muzzle6',            label = "Muzzle Brake 6",     hash = GetHashKey('COMPONENT_AT_MUZZLE_06')},
                {name = 'muzzle7',            label = "Muzzle Brake 7",     hash = GetHashKey('COMPONENT_AT_MUZZLE_07')},
                {name = 'default_barrel',     label = "Default Barrel",     hash = GetHashKey('COMPONENT_AT_SC_BARREL_01')},
                {name = 'heavy_barrel',       label = "Heavy Barrel",       hash = GetHashKey('COMPONENT_AT_SC_BARREL_02')},
                {name = 'camo1',              label = "Camo 1",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO')},
                {name = 'camo2',              label = "Camo 2",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_02')},
                {name = 'camo3',              label = "Camo 3",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_03')},
                {name = 'camo4',              label = "Camo 4",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_04')},
                {name = 'camo5',              label = "Camo 5",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_05')},
                {name = 'camo6',              label = "Camo 6",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_06')},
                {name = 'camo7',              label = "Camo 7",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_07')},
                {name = 'camo8',              label = "Camo 8",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_08')},
                {name = 'camo9',              label = "Camo 9",             hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_09')},
                {name = 'camo10',             label = "Camo 10",            hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_10')},
                {name = 'camo11',             label = "Camo 11",            hash = GetHashKey('COMPONENT_SPECIALCARBINE_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_BULLPUPRIFLE',
            hash = GetHashKey('WEAPON_BULLPUPRIFLE'),
            label = "Bullpup Rifle",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_BULLPUPRIFLE_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_BULLPUPRIFLE_VARMOD_LOW')}
            }
        },
        {
            name = 'WEAPON_BULLPUPRIFLE_MK2',
            hash = GetHashKey('weapon_bullpuprifle_mk2'),
            label = "Bullpup Rifle MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',       label = "Default Clip",       hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CLIP_01')},
                {name = 'clip_extended',      label = "Extended Clip",      hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CLIP_02')},
                {name = 'clip_tracer',        label = "Tracer Clip",        hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',    label = "Incendiary Clip",    hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CLIP_INCENDIARY')},
                {name = 'clip_armorpiercing', label = "Armorpiercing Clip", hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CLIP_ARMORPIERCING')},
                {name = 'clip_fmj',           label = "FMJ Clip",           hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CLIP_FMJ')},
                {name = 'holo_sight',         label = "Holograph Sight",    hash = GetHashKey('COMPONENT_AT_SIGHTS')},
                {name = 'small_scope',        label = "Small Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MACRO_02_MK2')},
                {name = 'meduim_scope',       label = "Medium Scope",       hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL_MK2')},
                {name = 'grip',               label = "Grip",               hash = GetHashKey('COMPONENT_AT_AR_AFGRIP_02')},
                {name = 'flashlight',         label = "Flashlight",         hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',         label = "Suppressor",         hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'muzzle1',            label = "Muzzle Brake 1",     hash = GetHashKey('COMPONENT_AT_MUZZLE_01')},
                {name = 'muzzle2',            label = "Muzzle Brake 2",     hash = GetHashKey('COMPONENT_AT_MUZZLE_02')},
                {name = 'muzzle3',            label = "Muzzle Brake 3",     hash = GetHashKey('COMPONENT_AT_MUZZLE_03')},
                {name = 'muzzle4',            label = "Muzzle Brake 4",     hash = GetHashKey('COMPONENT_AT_MUZZLE_04')},
                {name = 'muzzle5',            label = "Muzzle Brake 5",     hash = GetHashKey('COMPONENT_AT_MUZZLE_05')},
                {name = 'muzzle6',            label = "Muzzle Brake 6",     hash = GetHashKey('COMPONENT_AT_MUZZLE_06')},
                {name = 'muzzle7',            label = "Muzzle Brake 7",     hash = GetHashKey('COMPONENT_AT_MUZZLE_07')},
                {name = 'default_barrel',     label = "Default Barrel",     hash = GetHashKey('COMPONENT_AT_BP_BARREL_01')},
                {name = 'heavy_barrel',       label = "Heavy Barrel",       hash = GetHashKey('COMPONENT_AT_BP_BARREL_02')},
                {name = 'camo1',              label = "Camo 1",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO')},
                {name = 'camo2',              label = "Camo 2",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_02')},
                {name = 'camo3',              label = "Camo 3",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_03')},
                {name = 'camo4',              label = "Camo 4",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_04')},
                {name = 'camo5',              label = "Camo 5",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_05')},
                {name = 'camo6',              label = "Camo 6",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_06')},
                {name = 'camo7',              label = "Camo 7",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_07')},
                {name = 'camo8',              label = "Camo 8",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_08')},
                {name = 'camo9',              label = "Camo 9",             hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_09')},
                {name = 'camo10',             label = "Camo 10",            hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_10')},
                {name = 'camo11',             label = "Camo 11",            hash = GetHashKey('COMPONENT_BULLPUPRIFLE_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_COMPACTRIFLE',
            hash = GetHashKey('WEAPON_COMPACTRIFLE'),
            label = "Compact Rifle",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_02')},
                {name = 'clip_drum',     label = "Drum Clip",     hash = GetHashKey('COMPONENT_COMPACTRIFLE_CLIP_03')}
            }
        },
        {
            name = 'WEAPON_MILITARYRIFLE',
            hash = GetHashKey('WEAPON_MILITARYRIFLE'),
            label = "Military Rifle",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RIFLE')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_MILITARYRIFLE_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_MILITARYRIFLE_CLIP_02')},
                {name = 'iron_sight',    label = "Iron Sight",    hash = GetHashKey('COMPONENT_MILITARYRIFLE_SIGHT_01')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP')}
            }
        },
        -- MGs
        {
            name = 'WEAPON_MG',
            hash = GetHashKey('WEAPON_MG'),
            label = "MG",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_MG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_MG_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_MG_CLIP_02')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL_02')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_MG_VARMOD_LOWRIDER')}
            }
        },
        {
            name = 'WEAPON_COMBATMG',
            hash = GetHashKey('WEAPON_COMBATMG'),
            label = "Combat MG",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_MG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_COMBATMG_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_COMBATMG_CLIP_02')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_COMBATMG_VARMOD_LOWRIDER')}
            }
        },
        {
            name = 'WEAPON_COMBATMG_MK2',
            hash = GetHashKey('WEAPON_COMBATMG_MK2'),
            label = "Combat MG MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_MG')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',       label = "Default Clip",       hash = GetHashKey('COMPONENT_COMBATMG_MK2_CLIP_01')},
                {name = 'clip_extended',      label = "Extended Clip",      hash = GetHashKey('COMPONENT_COMBATMG_MK2_CLIP_02')},
                {name = 'clip_tracer',        label = "Tracer Clip",        hash = GetHashKey('COMPONENT_COMBATMG_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',    label = "Incendiary Clip",    hash = GetHashKey('COMPONENT_COMBATMG_MK2_CLIP_INCENDIARY')},
                {name = 'clip_armorpiercing', label = "Armorpiercing Clip", hash = GetHashKey('COMPONENT_COMBATMG_MK2_CLIP_ARMORPIERCING')},
                {name = 'clip_fmj',           label = "FMJ Clip",           hash = GetHashKey('COMPONENT_COMBATMG_MK2_CLIP_FMJ')},
                {name = 'holo_sight',         label = "Holograph Sight",    hash = GetHashKey('COMPONENT_AT_SIGHTS')},
                {name = 'meduim_scope',       label = "Medium Scope",       hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL_MK2')},
                {name = 'large_scope',        label = "Large Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2')},
                {name = 'grip',               label = "Grip",               hash = GetHashKey('COMPONENT_AT_AR_AFGRIP_02')},
                {name = 'flashlight',         label = "Flashlight",         hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',         label = "Suppressor",         hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'muzzle1',            label = "Muzzle Brake 1",     hash = GetHashKey('COMPONENT_AT_MUZZLE_01')},
                {name = 'muzzle2',            label = "Muzzle Brake 2",     hash = GetHashKey('COMPONENT_AT_MUZZLE_02')},
                {name = 'muzzle3',            label = "Muzzle Brake 3",     hash = GetHashKey('COMPONENT_AT_MUZZLE_03')},
                {name = 'muzzle4',            label = "Muzzle Brake 4",     hash = GetHashKey('COMPONENT_AT_MUZZLE_04')},
                {name = 'muzzle5',            label = "Muzzle Brake 5",     hash = GetHashKey('COMPONENT_AT_MUZZLE_05')},
                {name = 'muzzle6',            label = "Muzzle Brake 6",     hash = GetHashKey('COMPONENT_AT_MUZZLE_06')},
                {name = 'muzzle7',            label = "Muzzle Brake 7",     hash = GetHashKey('COMPONENT_AT_MUZZLE_07')},
                {name = 'default_barrel',     label = "Default Barrel",     hash = GetHashKey('COMPONENT_AT_MG_BARREL_01')},
                {name = 'heavy_barrel',       label = "Heavy Barrel",       hash = GetHashKey('COMPONENT_AT_MG_BARREL_02')},
                {name = 'camo1',              label = "Camo 1",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO')},
                {name = 'camo2',              label = "Camo 2",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_02')},
                {name = 'camo3',              label = "Camo 3",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_03')},
                {name = 'camo4',              label = "Camo 4",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_04')},
                {name = 'camo5',              label = "Camo 5",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_05')},
                {name = 'camo6',              label = "Camo 6",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_06')},
                {name = 'camo7',              label = "Camo 7",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_07')},
                {name = 'camo8',              label = "Camo 8",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_08')},
                {name = 'camo9',              label = "Camo 9",             hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_09')},
                {name = 'camo10',             label = "Camo 10",            hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_10')},
                {name = 'camo11',             label = "Camo 11",            hash = GetHashKey('COMPONENT_COMBATMG_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_GUSENBERG',
            hash = GetHashKey('WEAPON_GUSENBERG'),
            label = "Gusenberg Sweeper",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_MG')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_GUSENBERG_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_GUSENBERG_CLIP_02')}
            }
        },
        -- Sniper Rifles
        {
            name = 'WEAPON_SNIPERRIFLE',
            hash = GetHashKey('WEAPON_SNIPERRIFLE'),
            label = "Sniper Rifle",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SNIPER')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',   label = "Default Clip",   hash = GetHashKey('COMPONENT_SNIPERRIFLE_CLIP_01')},
                {name = 'suppressor',     label = "Suppressor",     hash = GetHashKey('COMPONENT_AT_AR_SUPP_02')},
                {name = 'scope',          label = "Scope",          hash = GetHashKey('COMPONENT_AT_SCOPE_LARGE')},
                {name = 'advanced_scope', label = "Advanced Scope", hash = GetHashKey('COMPONENT_AT_SCOPE_MAX')},
                {name = 'luxe_varmod',    label = "Luxary Skin",    hash = GetHashKey('COMPONENT_SNIPERRIFLE_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_HEAVYSNIPER',
            hash = GetHashKey('WEAPON_HEAVYSNIPER'),
            label = "Heavy Sniper",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SNIPER')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',   label = "Default Clip",   hash = GetHashKey('COMPONENT_HEAVYSNIPER_CLIP_01')},
                {name = 'scope',          label = "Scope",          hash = GetHashKey('COMPONENT_AT_SCOPE_LARGE')},
                {name = 'advanced_scope', label = "Advanced Scope", hash = GetHashKey('COMPONENT_AT_SCOPE_MAX')}
            }
        },
        {
            name = 'WEAPON_HEAVYSNIPER_MK2',
            hash = GetHashKey('WEAPON_HEAVYSNIPER_MK2'),
            label = "Heavy Sniper MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SNIPER')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',       label = "Default Clip",       hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_01')},
                {name = 'clip_extended',      label = "Extended Clip",      hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_02')},
                {name = 'clip_incendiary',    label = "Incendiary Clip",    hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_INCENDIARY')},
                {name = 'clip_armorpiercing', label = "Armorpiercing Clip", hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_ARMORPIERCING')},
                {name = 'clip_fmj',           label = "FMJ Clip",           hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_FMJ')},
                {name = 'clip_explosive',     label = "Explosive Clip",     hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CLIP_EXPLOSIVE')},
                {name = 'zoom_scope',         label = "Zoom Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_LARGE_MK2')},
                {name = 'advanced_scope',     label = "Advanced Scope",     hash = GetHashKey('COMPONENT_AT_SCOPE_MAX')},
                {name = 'nv_scope',           label = "Night Vision Scope", hash = GetHashKey('COMPONENT_AT_SCOPE_NV')},
                {name = 'thermal_scope',      label = "Thermal Scope",      hash = GetHashKey('COMPONENT_AT_SCOPE_THERMAL')},
                {name = 'suppressor',         label = "Suppressor",         hash = GetHashKey('COMPONENT_AT_SR_SUPP_03')},
                {name = 'muzzle1',            label = "Muzzle Brake 1",     hash = GetHashKey('COMPONENT_AT_MUZZLE_08')},
                {name = 'muzzle2',            label = "Muzzle Brake 2",     hash = GetHashKey('COMPONENT_AT_MUZZLE_09')},
                {name = 'default_barrel',     label = "Default Barrel",     hash = GetHashKey('COMPONENT_AT_SR_BARREL_01')},
                {name = 'heavy_barrel',       label = "Heavy Barrel",       hash = GetHashKey('COMPONENT_AT_SR_BARREL_02')},
                {name = 'camo1',              label = "Camo 1",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO')},
                {name = 'camo2',              label = "Camo 2",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_02')},
                {name = 'camo3',              label = "Camo 3",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_03')},
                {name = 'camo4',              label = "Camo 4",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_04')},
                {name = 'camo5',              label = "Camo 5",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_05')},
                {name = 'camo6',              label = "Camo 6",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_06')},
                {name = 'camo7',              label = "Camo 7",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_07')},
                {name = 'camo8',              label = "Camo 8",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_08')},
                {name = 'camo9',              label = "Camo 9",             hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_09')},
                {name = 'camo10',             label = "Camo 10",            hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_10')},
                {name = 'camo11',             label = "Camo 11",            hash = GetHashKey('COMPONENT_HEAVYSNIPER_MK2_CAMO_IND_01')}
            }
        },
        {
            name = 'WEAPON_MARKSMANRIFLE',
            hash = GetHashKey('WEAPON_MARKSMANRIFLE'),
            label = "Marksman Rifle",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SNIPER')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_MARKSMANRIFLE_CLIP_01')},
                {name = 'clip_extended', label = "Extended Clip", hash = GetHashKey('COMPONENT_MARKSMANRIFLE_CLIP_02')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM')},
                {name = 'suppressor',    label = "Suppressor",    hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')},
                {name = 'luxe_varmod',   label = "Luxary Skin",   hash = GetHashKey('COMPONENT_MARKSMANRIFLE_VARMOD_LUXE')}
            }
        },
        {
            name = 'WEAPON_MARKSMANRIFLE_MK2',
            hash = GetHashKey('WEAPON_MARKSMANRIFLE_MK2'),
            label = "Marksman Rifle MK2",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_SNIPER')},
            tints = Config.DefaultWeaponTintsMK2,
            components = {
                {name = 'clip_default',       label = "Default Clip",       hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_01')},
                {name = 'clip_extended',      label = "Extended Clip",      hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_02')},
                {name = 'clip_tracer',        label = "Tracer Clip",        hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_TRACER')},
                {name = 'clip_incendiary',    label = "Incendiary Clip",    hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_INCENDIARY')},
                {name = 'clip_armorpiercing', label = "Armorpiercing Clip", hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_ARMORPIERCING')},
                {name = 'clip_fmj',           label = "FMJ Clip",           hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CLIP_FMJ')},
                {name = 'holo_sight',         label = "Holograph Sight",    hash = GetHashKey('COMPONENT_AT_SIGHTS')},
                {name = 'large_scope',        label = "Large Scope",        hash = GetHashKey('COMPONENT_AT_SCOPE_MEDIUM_MK2')},
                {name = 'zoom_scope',         label = "Zoom Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_LARGE_FIXED_ZOOM_MK2')},
                {name = 'grip',               label = "Grip",               hash = GetHashKey('COMPONENT_AT_AR_AFGRIP_02')},
                {name = 'flashlight',         label = "Flashlight",         hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'suppressor',         label = "Suppressor",         hash = GetHashKey('COMPONENT_AT_AR_SUPP')},
                {name = 'muzzle1',            label = "Muzzle Brake 1",     hash = GetHashKey('COMPONENT_AT_MUZZLE_01')},
                {name = 'muzzle2',            label = "Muzzle Brake 2",     hash = GetHashKey('COMPONENT_AT_MUZZLE_02')},
                {name = 'muzzle3',            label = "Muzzle Brake 3",     hash = GetHashKey('COMPONENT_AT_MUZZLE_03')},
                {name = 'muzzle4',            label = "Muzzle Brake 4",     hash = GetHashKey('COMPONENT_AT_MUZZLE_04')},
                {name = 'muzzle5',            label = "Muzzle Brake 5",     hash = GetHashKey('COMPONENT_AT_MUZZLE_05')},
                {name = 'muzzle6',            label = "Muzzle Brake 6",     hash = GetHashKey('COMPONENT_AT_MUZZLE_06')},
                {name = 'muzzle7',            label = "Muzzle Brake 7",     hash = GetHashKey('COMPONENT_AT_MUZZLE_07')},
                {name = 'default_barrel',     label = "Default Barrel",     hash = GetHashKey('COMPONENT_AT_MRFL_BARREL_01')},
                {name = 'heavy_barrel',       label = "Heavy Barrel",       hash = GetHashKey('COMPONENT_AT_MRFL_BARREL_02')},
                {name = 'camo1',              label = "Camo 1",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO')},
                {name = 'camo2',              label = "Camo 2",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_02')},
                {name = 'camo3',              label = "Camo 3",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_03')},
                {name = 'camo4',              label = "Camo 4",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_04')},
                {name = 'camo5',              label = "Camo 5",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_05')},
                {name = 'camo6',              label = "Camo 6",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_06')},
                {name = 'camo7',              label = "Camo 7",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_07')},
                {name = 'camo8',              label = "Camo 8",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_08')},
                {name = 'camo9',              label = "Camo 9",             hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_09')},
                {name = 'camo10',             label = "Camo 10",            hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_10')},
                {name = 'camo11',             label = "Camo 11",            hash = GetHashKey('COMPONENT_MARKSMANRIFLE_MK2_CAMO_IND_01')}
            }
        },
        -- Heavy Weapons
        {
            name = 'WEAPON_RPG',
            hash = GetHashKey('WEAPON_RPG'),
            label = "RPG",
            ammo = {label = "Rocket(s)", hash = GetHashKey('AMMO_RPG')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_GRENADELAUNCHER',
            hash = GetHashKey('WEAPON_GRENADELAUNCHER'),
            label = "Grenade Launcher",
            ammo = {label = "Grenade(s)", hash = GetHashKey('AMMO_GRENADELAUNCHER')},
            tints = Config.DefaultWeaponTints,
            components = {
                {name = 'clip_default',  label = "Default Clip",  hash = GetHashKey('COMPONENT_GRENADELAUNCHER_CLIP_01')},
                {name = 'flashlight',    label = "Flashlight",    hash = GetHashKey('COMPONENT_AT_AR_FLSH')},
                {name = 'scope',         label = "Scope",         hash = GetHashKey('COMPONENT_AT_SCOPE_SMALL')},
                {name = 'grip',          label = "Grip",          hash = GetHashKey('COMPONENT_AT_AR_AFGRIP')}
            }
        },
        {
            name = 'WEAPON_GRENADELAUNCHER_SMOKE',
            hash = GetHashKey('WEAPON_GRENADELAUNCHER_SMOKE'),
            label = "Grenade Launcher Smoke",
            ammo = {label = "Grenade(s)", hash = GetHashKey('AMMO_GRENADELAUNCHER_SMOKE')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_MINIGUN',
            hash = GetHashKey('WEAPON_MINIGUN'),
            label = "Minigun",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_MINIGUN')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_FIREWORK',
            hash = GetHashKey('WEAPON_FIREWORK'),
            label = "Firework",
            ammo = {label = "Firework(s)", hash = GetHashKey('AMMO_FIREWORK')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_RAILGUN',
            hash = GetHashKey('WEAPON_RAILGUN'),
            label = "Railgun",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RAILGUN')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_HOMINGLAUNCHER',
            hash = GetHashKey('WEAPON_HOMINGLAUNCHER'),
            label = "Homing Launcher",
            ammo = {label = "Rocket(s)", hash = GetHashKey('AMMO_HOMINGLAUNCHER')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_COMPACTLAUNCHER',
            hash = GetHashKey('WEAPON_COMPACTLAUNCHER'),
            label = "Compact Launcher",
            ammo = {label = "Grenade(s)", hash = GetHashKey('AMMO_GRENADELAUNCHER')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_RAYMINIGUN',
            hash = GetHashKey('WEAPON_RAYMINIGUN'),
            label = "Widowmaker",
            ammo = {label = "Round(s)", hash = GetHashKey('AMMO_RAYMINIGUN')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        -- Throwables
        {
            name = 'WEAPON_GRENADE',
            hash = GetHashKey('WEAPON_GRENADE'),
            label = "Grenade",
            ammo = {label = "Grenade(s)", hash = GetHashKey('AMMO_GRENADE')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_BZGAS',
            hash = GetHashKey('WEAPON_BZGAS'),
            label = "BZ Gas",
            ammo = {label = "Can(s)", hash = GetHashKey('AMMO_BZGAS')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_MOLOTOV',
            hash = GetHashKey('WEAPON_MOLOTOV'),
            label = "Molotov Cocktail",
            ammo = {label = "Cocktail(s)", hash = GetHashKey('AMMO_MOLOTOV')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_STICKYBOMB',
            hash = GetHashKey('WEAPON_STICKYBOMB'),
            label = "Sticky Bomb",
            ammo = {label = "Bomb(s)", hash = GetHashKey('AMMO_STICKYBOMB')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_PROXMINE',
            hash = GetHashKey('WEAPON_PROXMINE'),
            label = "Proximity Mine",
            ammo = {label = "Mine(s)", hash = GetHashKey('AMMO_PROXMINE')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_SNOWBALL',
            hash = GetHashKey('WEAPON_SNOWBALL'),
            label = "Snow Ball",
            ammo = {label = "Snowball(s)", hash = GetHashKey('AMMO_SNOWBALL')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_PIPEBOMB',
            hash = GetHashKey('WEAPON_PIPEBOMB'),
            label = "Pipe Bomb",
            ammo = {label = "Bomb(s)", hash = GetHashKey('AMMO_PIPEBOMB')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_BALL',
            hash = GetHashKey('WEAPON_BALL'),
            label = "Ball",
            ammo = {label = "Ball(s)", hash = GetHashKey('AMMO_BALL')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_SMOKEGRENADE',
            hash = GetHashKey('WEAPON_SMOKEGRENADE'),
            label = "Smoke Grenade",
            ammo = {label = "Bomb(s)", hash = GetHashKey('AMMO_SMOKEGRENADE')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        {
            name = 'WEAPON_FLARE',
            hash = GetHashKey('WEAPON_FLARE'),
            label = "Flare",
            ammo = {label = "Flare(s)", hash = GetHashKey('AMMO_FLARE')},
            tints = Config.DefaultWeaponTints,
            components = {}
        },
        -- Miscellaneous
        {
            name = 'WEAPON_PETROLCAN',
            hash = GetHashKey('WEAPON_PETROLCAN'),
            label = "Jerrycan",
            ammo = {label = "Fuel", hash = GetHashKey('AMMO_PETROLCAN')},
            components = {}
        },
        {
            name = 'GADGET_PARACHUTE',
            hash = GetHashKey('GADGET_PARACHUTE'),
            label = "Parachute",
            components = {}
        },
        {
            name = 'WEAPON_FIREEXTINGUISHER',
            hash = GetHashKey('WEAPON_FIREEXTINGUISHER'),
            label = "Fire Extinguisher",
            ammo = {label = "Charge", hash = GetHashKey('AMMO_FIREEXTINGUISHER')},
            components = {}
        },
        {
            name = 'WEAPON_HAZARDCAN',
            hash = GetHashKey('WEAPON_HAZARDCAN'),
            label = "Hazardous Jerry Can",
            ammo = {label = "Fuel", hash = GetHashKey('AMMO_HAZARDCAN')},
            components = {}
        },
    }