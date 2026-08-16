skillsConfig = {
    skills = {
    --- Job
        ['miner_skill'] = {
            label = 'Miner',
            img = 'miner_skill.png',
            addType = {
                ['wash_stone'] = 1.12,
            },
        },
        ['ghasab_skill'] = {
            label = 'Ghasab',
            img = 'ghasab_skill.png',
            addType = {
                ['farm_alive_chicken'] = 0.00462,
                ['farm_slaughtered_chicken'] = 0.00462,
                ['farm_packaged_chicken'] = 0.00462,
            },
            time = {
                ['farm_alive_chicken'] = {5000, 3000},-- AliveChicken
                ['farm_slaughtered_chicken'] = {5000, 3000},-- SlaughterHouse
                ['farm_packaged_chicken'] = {5000, 3000},-- Packaging
            }
        },
        ['clothe_skill'] = {
            label = 'Clothe',
            img = 'clothe_skill.png',
            addType = {
                ['farm_wool'] = 0.00185,
                ['farm_fabric'] = 0.00462,
                ['farm_clothe'] = 0.00462,
            },
            time = {
                ['farm_wool'] = {2000, 1500},-- Wool
                ['farm_fabric'] = {5000, 3000},-- Fabric
                ['farm_clothe'] = {5000, 3000},-- Clothe
            }
        },
        ['palayeshgah_skill'] = {
            label = 'Palayeshgah',
            img = 'palayeshgah_skill.png',
            addType = {
                ['farm_petrol'] = 0.002777,
                ['farm_petrol_raffin'] = 0.002777,
                ['farm_essence'] = 0.002777,
            },
            time = {
                ['farm_petrol'] = {3000, 2000},-- OilFarm
                ['farm_petrol_raffin'] = {3000, 2000},-- OilRefinement
                ['farm_essence'] = {3000, 2000},-- OilMix
            }
        },
        ['chobbori_skill'] = {
            label = 'Chob Bori',
            img = 'chobbori_skill.png',
            addType = {
                ['farm_wood'] = 0.00370,
                ['farm_cutted_wood'] = 0.00185,
                ['farm_packaged_plank'] = 0.00462,
            },
            time = {
                ['farm_wood'] = {4000, 2500},-- Wood
                ['farm_cutted_wood'] = {2000, 1000},-- CuttedWood
                ['farm_packaged_plank'] = {5000, 3000},-- Planks
            }
        },
        -- ['fishing_skill'] = {
        --     label = 'Fishing',
        --     img = 'fishing_skill.png',
        --     addType = {
        --         ['grab_fish'] = 0.01388,
        --     },
        --     time = {
        --         ['grab_fish'] = {{10000, 20000}, {5000, 15000}},-- rand
        --     }
        -- },
        ['hunting_skill'] = {
            label = 'Hunting',
            img = 'hunting_skill.png',
            addType = {
                ['grab_hunt'] = 0.11111,
            },
        },
        ['yaghi_skill'] = {
            label = 'Yaghi',
            img = 'yaghi_skill.png',
            addType = {
                ['farm_yaghi'] = 0.18518,
            },
            time = {
                ['farm_yaghi'] = {90, 45},-- animTime
            }
        },
        ['treasure_skill'] = {
            label = 'Ganj',
            img = 'treasure_skill.png',
            addType = {
                ['farm_treasure'] = 0.37037,
            },
        },
        ['barbari_skill'] = {
            label = 'BarBari',
            img = 'barbari_skill.png',
            addType = {
                ['farm_motor'] = 0.08,
                ['farm_van'] = 0.09523,
                ['farm_truck'] = 0.11764,
            },
        },
    --- Drug
        ['marijuana_skill'] = {
            label = 'Marijuana',
            img = 'marijuana_skill.png',
            addType = {
                ['farm_cannabis'] = 0.00925,
                ['farm_marijuana'] = 0.00740,
            },
            time = {
                ['farm_cannabis'] = {6000, 4500},-- harvest_weed
                ['farm_marijuana'] = {7000, 4000},-- process_marijuana
            }
        },
        ['crack_skill'] = {
            label = 'Crack',
            img = 'crack_skill.png',
            addType = {
                ['farm_coca'] = 0.00602,
                ['farm_cocaine'] = 0.01041,
                ['farm_crack'] = 0.01041,
            },
            time = {
                ['farm_coca'] = {3500, 3000},-- harvest_crack
                ['farm_cocaine'] = {4000, 2500},-- process_cocaine
                ['farm_crack'] = {4000, 2500},-- process_crack
            }
        },
        ['heroine_skill'] = {
            label = 'Heroine',
            img = 'heroine_skill.png',
            addType = {
                ['farm_poppy'] = 0.0125,
                ['farm_opium'] = 0.01515,
                ['farm_heroine'] = 0.011111,
            },
            time = {
                ['farm_poppy'] = {3500, 3000},-- harvest_poppy
                ['farm_opium'] = {5000, 2500},-- process_opium
                ['farm_heroine'] = {10000, 7000},-- process_opium
            }
        },
        ['meth_skill'] = {
            label = 'Shishe',
            img = 'meth_skill.png',
            addType = {
                ['farm_ephedra'] = 0.00833,
                ['farm_ephedrine'] = 0.00833,
                ['farm_meth'] = 0.125,
            },
            time = {
                ['farm_ephedra'] = {3500, 3000},-- harvest_ephedra
                ['farm_ephedrine'] = {8000, 6000},-- process_ephedrine
                ['farm_meth'] = {10000, 7000},-- process_meth
            }
        },
    --- Rob
        ['shop_skill'] = {
            label = 'Shop',
            img = 'shop_skill.png',
            addType = {
                ['gang_shoptoken'] = 0.66666,
            },
        },
        ['minibank_skill'] = {
            label = 'MiniBank',
            img = 'minibank_skill.png',
            addType = {
                ['gang_minibanktoken'] = 1.66666,
            },
        },
        ['jewel_skill'] = {
            label = 'Jewelry',
            img = 'jewel_skill.png',
            addType = {
                ['gang_jeweltoken'] = 1.66666,
            },
        },
        ['cargo_skill'] = {
            label = 'Cargo',
            img = 'cargo_skill.png',
            addType = {
                ['wgang_cargo_token'] = 25.0,
            },
        },
        ['maze_skill'] = {
            label = 'Bank Maze',
            img = 'maze_skill.png',
            addType = {
                ['wgang_Bankfleeca_token'] = 6.25,
            },
        },
        ['paleto_skill'] = {
            label = 'Bank Paleto',
            img = 'paleto_skill.png',
            addType = {
                ['wgang_bankpaleto_token'] = 8.33333,
            },
        },
        ['bankm_skill'] = {
            label = 'Bank Markazi',
            img = 'bankm_skill.png',
            addType = {
                ['wgang_bankm_token'] = 20.0,
            },
        },
        ['flat_skill'] = {
            label = 'Flat',
            img = 'flat_skill.png',
            addType = {
                ['wgang_flat_token'] = 20.0,
            },
        },
        ['bime_skill'] = {
            label = 'Bime',
            img = 'bime_skill.png',
            addType = {
                ['wgang_bime_token'] = 14.29,
            },
        },
        ['mythic_skill'] = {
            label = 'Mythic',
            img = 'mythic_skill.png',
            addType = {
                ['wgang_mythic_token'] = 1.0,
            },
        },
    --- Job dolati
        ['police_skill'] = {        -- police
            label = 'Police',
            img = 'police_skill.png',
            addType = {
                ['??'] = 0.06666,
            },
            time = {
                ['??'] = {7, 0},
            }
        },
        ['sheriff_skill'] = {       -- sheriff
            label = 'Sheriff',
            img = 'sheriff_skill.png',
            addType = {
                ['??'] = 0.06666,
            },
            time = {
                ['??'] = {7, 0},
            }
        },
        ['mt_skill'] = {            -- mt
            label = 'MT',
            img = 'mt_skill.png',
            addType = {
                ['??'] = 0.06666,
            },
            time = {
                ['??'] = {7, 0},
            }
        },
        ['justic_skill'] = {        -- justic
            label = 'Justic',
            img = 'justic_skill.png',
            addType = {
                ['??'] = 0.06666,
            },
            time = {
                ['??'] = {7, 0},
            }
        },
        ['revive_skill'] = {        -- medic
            label = 'Medic',
            img = 'revive_skill.png',
            addType = {
                ['success_revive'] = 0.06666,
            },
            time = {
                ['success_revive'] = {7, 0}, -- if chance <= 7 then
            }
        },
        ['taxi_skill'] = {          -- taxi
            label = 'Taxi',
            img = 'taxi_skill.png',
            addType = {
                ['accept_req_taxi'] = 0.06666,
            },
            time = {
                ['accept_req_taxi'] = {2.5, 3.5}, -- Shared.taxi.EndJobMoney
            }
        },
        ['repair_skill'] = {        -- mechanic
            label = 'Mechanic',
            img = 'repair_skill.png',
            addType = {
                ['success_repair'] = 0.06666,
                -- ['success_custom'] = 3.0,
            },
            time = {
                ['success_repair'] = {5000, 10000}, -- impound reward
            }
        },
    --- other
        ['sport_skill'] = {        -- varzesh
            label = 'Varzesh',
            img = 'sport_skill.png',
            addType = {
                ['sport_boxing'] = 0.1,
                ['sport_gym'] = 0.1,
            },
            removeType = {
                ['sport_boxing'] = 0.1, 
            },
            time = {
                ['stress_systems'] = {1, 0.5}, -- stressConfig.add
            }
        },

        ['farm_skill'] = {        -- farm mazrae
            label = 'Farm',
            img = 'farm_skill.png',
            addType = {
                ['farm_m_seed_coca'] = 0.01,
                ['farm_m_seed_ephedra'] = 0.02,
                ['farm_m_seed_cannabis'] = 0.03,
                ['farm_m_seed_poppy'] = 0.015,
                ['farm_m_seed_apple'] = 0.02,
                ['farm_m_seed_orange'] = 0.02,
                ['farm_m_seed_corn'] = 0.02,
                ['farm_m_seed_wheat'] = 0.02,
                ['farm_m_seed_grape'] = 0.02,
                ['farm_m_seed_rice'] = 0.02,
            },
            time = {
                ['seed_coca'] = {1800, 1350}, -- fruitingTime
                ['seed_ephedra'] = {3600, 2700}, -- fruitingTime
                ['seed_cannabis'] = {5400, 4050}, -- fruitingTime
                ['seed_poppy'] = {2700, 2025}, -- fruitingTime
                ['seed_apple'] = {3600, 2700}, -- fruitingTime
                ['seed_orange'] = {3600, 2700}, -- fruitingTime
                ['seed_corn'] = {3600, 2700}, -- fruitingTime
                ['seed_wheat'] = {3600, 2700}, -- fruitingTime
                ['seed_grape'] = {3600, 2700}, -- fruitingTime
                ['seed_rice'] = {3600, 2700}, -- fruitingTime
            }
        },

    },

---------------------------------------------------------------------------------
--[[
    hidden = true, --- for hide achieve
]]
    achievements = {
    --- Job
        ['mining_skillup'] = {      -- miner_skill
            label = 'Mining Connoisseur',
            img = 'mining_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت شغل ماینری را بالا ببرید',
            tasks = {
                ['skill:miner_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_mining_skillup'] = {      -- first_miner_skill
            label = 'First Mining Connoisseur',
            img = 'first_mining_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد ماینری را بدست آورده',
            tasks = {
                ['skill:first_miner_skill'] = {
                    max = 1,
                },
            }
        },
        ['ghasab_skillup'] = {      -- ghasab_skill
            label = 'Chop Chop Champion',
            img = 'ghasab_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت شغل قصابی را بالا ببرید',
            tasks = {
                ['skill:ghasab_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_ghasab_skillup'] = {      -- first_ghasab_skill
            label = 'First Chop Chop Champion',
            img = 'first_ghasab_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد شغل قصابی را بدست آورده',
            tasks = {
                ['skill:first_ghasab_skill'] = {
                    max = 1,
                },
            }
        },
        ['clothe_skillup'] = {      -- clothe_skill
            label = 'Tailoring Specialist',
            img = 'clothe_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت شغل خیاطی را بالا ببرید',
            tasks = {
                ['skill:clothe_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_clothe_skillup'] = {      -- first_clothe_skill
            label = 'First Tailoring Specialist',
            img = 'first_clothe_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد شغل خیاطی را بدست آورده',
            tasks = {
                ['skill:first_clothe_skill'] = {
                    max = 1,
                },
            }
        },
        ['fueler_skillup'] = {      -- palayeshgah_skill
            label = 'Refinery Expert',
            img = 'fueler_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت شغل پالایشگاه را بالا ببرید',
            tasks = {
                ['skill:palayeshgah_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_fueler_skillup'] = {      -- first_palayeshgah_skill
            label = 'First Refinery Expert',
            img = 'first_fueler_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد شغل پالایشگاه را بدست آورده',
            tasks = {
                ['skill:first_palayeshgah_skill'] = {
                    max = 1,
                },
            }
        },
        ['lumberjack_skillup'] = {  -- chobbori_skill
            label = 'Professional Carpenter',
            img = 'lumberjack_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت شغل نجاری را بالا ببرید',
            tasks = {
                ['skill:chobbori_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_lumberjack_skillup'] = {  -- first_chobbori_skill
            label = 'First Professional Carpenter',
            img = 'first_lumberjack_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد شغل تجاری را بدست آورده',
            tasks = {
                ['skill:first_chobbori_skill'] = {
                    max = 1,
                },
            }
        },
        -- ['fishing_skillup'] = {     -- fishing_skill
        --     label = 'Fisherman',
        --     img = 'fishing_skillup.png',
        --     point = 20,
        --     description = 'برای دریافت این دستاورد، مهارت ماهیگیری را بالا ببرید',
        --     tasks = {
        --         ['skill:fishing_skill'] = {
        --             max = 1,
        --         },
        --     }
        -- },
        -- ['first_fishing_skillup'] = {     -- first_fishing_skillup
        --     label = 'First Fisherman',
        --     img = 'first_fishing_skillup.png',
        --     point = 0,
        --     hidden = true,
        --     description = 'این نشان، مخصوص اولین نفری است که دستاورد ماهیگیری را بدست آورده',
        --     tasks = {
        --         ['skill:first_fishing_skill'] = {
        --             max = 1,
        --         },
        --     }
        -- },
        ['hunting_skillup'] = {     -- hunting_skill
            label = 'Poacher',
            img = 'hunting_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت شکار را بالا ببرید',
            tasks = {
                ['skill:hunting_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_hunting_skillup'] = {     -- first_hunting_skill
            label = 'First Poacher',
            img = 'first_hunting_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد شکار را بدست آورده',
            tasks = {
                ['skill:first_hunting_skill'] = {
                    max = 1,
                },
            }
        },
        ['yaghi_skillup'] = {       -- yaghi_skill
            label = 'Yaghi',
            img = 'yaghi_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت یاغی را بالا ببرید',
            tasks = {
                ['skill:yaghi_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_yaghi_skillup'] = {       -- first_yaghi_skill
            label = 'First Yaghi',
            img = 'first_yaghi_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد یاغی را بدست آورده',
            tasks = {
                ['skill:first_yaghi_skill'] = {
                    max = 1,
                },
            }
        },
        ['treasure_skillup'] = {    -- treasure_skill
            label = 'Treasure Hunter',
            img = 'treasure_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت گنج یابی را بالا ببرید',
            tasks = {
                ['skill:treasure_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_treasure_skillup'] = {    -- first_treasure_skill
            label = 'First Treasure Hunter',
            img = 'first_treasure_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد گنج یابی را بدست آورده',
            tasks = {
                ['skill:first_treasure_skill'] = {
                    max = 1,
                },
            }
        },
        ['barbari_skillup'] = {     -- barbari_skill
            label = 'Transport Manager',
            img = 'barbari_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت شغل باربری را بالا ببرید',
            tasks = {
                ['skill:barbari_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_barbari_skillup'] = {     -- first_barbari_skill
            label = 'First Transport Manager',
            img = 'first_barbari_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد شغل باربری را بدست آورده',
            tasks = {
                ['skill:first_barbari_skill'] = {
                    max = 1,
                },
            }
        },
    --- Drug
        ['marijuana_skillup'] = {   -- marijuana_skill
            label = 'Master Of Marijuana',
            img = 'marijuana_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت ساخت ماریجوانا را بالا ببرید',
            tasks = {
                ['skill:marijuana_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_marijuana_skillup'] = {   -- first_marijuana_skill
            label = 'First Master Of Marijuana',
            img = 'first_marijuana_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد ساخت ماریجوانا را بدست آورده',
            tasks = {
                ['skill:first_marijuana_skill'] = {
                    max = 1,
                },
            }
        },
        ['crack_skillup'] = {       -- crack_skill
            label = 'Master Of Crack',
            img = 'crack_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت ساخت کرک را بالا ببرید',
            tasks = {
                ['skill:crack_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_crack_skillup'] = {       -- first_crack_skill
            label = 'First Master Of Crack',
            img = 'first_crack_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد ساخت کرک را بدست آورده',
            tasks = {
                ['skill:first_crack_skill'] = {
                    max = 1,
                },
            }
        },
        ['heroine_skillup'] = {     -- heroine_skill
            label = 'Master Of Heroine',
            img = 'heroine_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت ساخت هروئین را بالا ببرید',
            tasks = {
                ['skill:heroine_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_heroine_skillup'] = {     -- first_heroine_skill
            label = 'First Master Of Heroine',
            img = 'first_heroine_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد ساخت هروئین را بدست آورده',
            tasks = {
                ['skill:first_heroine_skill'] = {
                    max = 1,
                },
            }
        },
        ['meth_skillup'] = {        -- meth_skill
            label = 'Master Of Meth',
            img = 'meth_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت ساخت شیشه را بالا ببرید',
            tasks = {
                ['skill:meth_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_meth_skillup'] = {        -- first_meth_skill
            label = 'First Master Of Meth',
            img = 'first_meth_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد ساخت شیشه را بدست آورده',
            tasks = {
                ['skill:first_meth_skill'] = {
                    max = 1,
                },
            }
        },
        ['alldrug_achievement'] = { -- All Drug
            label = 'Cartel',
            img = 'alldrug_achievement.png',
            point = 50,
            description = 'برای دریافت این نشان، دستاوردهای ساخت مواد را بدست آورید',
            tasks = {
                ['achievement:marijuana_skillup'] = {
                    max = 1,
                },
                ['achievement:crack_skillup'] = {
                    max = 1,
                },
                ['achievement:heroine_skillup'] = {
                    max = 1,
                },
                ['achievement:meth_skillup'] = {
                    max = 1,
                },
            }
        },
        ['first_alldrug_achievement'] = { -- first_alldrug_achievementup
            label = 'first Cartel',
            img = 'first_alldrug_achievement.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد ساخت همه موادها را بدست آورده',
            tasks = {
                ['achievement:first_alldrug_achievementup'] = {
                    max = 1,
                },
            }
        },
    --- Rob
        ['shop_skillup'] = {        -- shop_skill
            label = 'ShopLifter',
            img = 'shop_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از شاپ را بالا ببرید',
            tasks = {
                ['skill:shop_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_shop_skillup'] = {        -- first_shop_skill
            label = 'First ShopLifter',
            img = 'first_shop_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از شاپ را بدست آورده',
            tasks = {
                ['skill:first_shop_skill'] = {
                    max = 1,
                },
            }
        },
        ['minibank_skillup'] = {    -- minibank_skill
            label = 'MiniBank Lifter',
            img = 'minibank_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از مینی بانک را بالا ببرید',
            tasks = {
                ['skill:minibank_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_minibank_skillup'] = {    -- first_minibank_skill
            label = 'First MiniBank Lifter',
            img = 'first_minibank_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از مینی بانک را بدست آورده',
            tasks = {
                ['skill:first_minibank_skill'] = {
                    max = 1,
                },
            }
        },
        ['jewel_skillup'] = {       -- jewel_skill
            label = 'Jewel Thief',
            img = 'jewel_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از جواهری را بالا ببرید',
            tasks = {
                ['skill:jewel_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_jewel_skillup'] = {       -- first_jewel_skill
            label = 'First Jewel Thief',
            img = 'first_jewel_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از جواهری را بدست آورده',
            tasks = {
                ['skill:first_jewel_skill'] = {
                    max = 1,
                },
            }
        },
        ['cargo_skillup'] = {       -- cargo_skill
            label = 'cargo Thief',
            img = 'cargo_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از کارگو را بالا ببرید',
            tasks = {
                ['skill:cargo_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_cargo_skillup'] = {       -- first_cargo_skill
            label = 'First cargo Thief',
            img = 'first_cargo_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از کارگو را بدست آورده',
            tasks = {
                ['skill:first_cargo_skill'] = {
                    max = 1,
                },
            }
        },
        ['maze_skillup'] = {        -- maze_skill
            label = 'Maze Thief',
            img = 'maze_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از میزبانک را بالا ببرید',
            tasks = {
                ['skill:maze_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_maze_skillup'] = {        -- first_maze_skill
            label = 'First Maze Thief',
            img = 'first_maze_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از میزبانک را بدست آورده',
            tasks = {
                ['skill:first_maze_skill'] = {
                    max = 1,
                },
            }
        },
        ['paleto_skillup'] = {      -- paleto_skill
            label = 'Paleto Thief',
            img = 'paleto_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از بانک پلتو را بالا ببرید',
            tasks = {
                ['skill:paleto_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_paleto_skillup'] = {      -- first_paleto_skill
            label = 'First Paleto Thief',
            img = 'first_paleto_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از بانک پلتو را بدست آورده',
            tasks = {
                ['skill:first_paleto_skill'] = {
                    max = 1,
                },
            }
        },
        ['bankm_skillup'] = {       -- bankm_skill
            label = 'CBank Thief',
            img = 'bankm_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از بانک مرکزی را بالا ببرید',
            tasks = {
                ['skill:bankm_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_bankm_skillup'] = {       -- first_bankm_skill
            label = 'First CBank Thief',
            img = 'first_bankm_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از بانک مرکزی را بدست آورده',
            tasks = {
                ['skill:first_bankm_skill'] = {
                    max = 1,
                },
            }
        },
        ['flat_skillup'] = {        -- flat_skill
            label = 'Flat Thief',
            img = 'flat_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از بانک فلت را بالا ببرید',
            tasks = {
                ['skill:flat_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_flat_skillup'] = {        -- first_flat_skill
            label = 'First Flat Thief',
            img = 'first_flat_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از جواهری فلت را بدست آورده',
            tasks = {
                ['skill:first_flat_skill'] = {
                    max = 1,
                },
            }
        },
        ['bime_skillup'] = {        -- bime_skill
            label = 'Bime Thief',
            img = 'bime_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از بیمه را بالا ببرید',
            tasks = {
                ['skill:bime_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_bime_skillup'] = {        -- first_bime_skill
            label = 'First Bime Thief',
            img = 'first_bime_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از بیمه را بدست آورده',
            tasks = {
                ['skill:first_bime_skill'] = {
                    max = 1,
                },
            }
        },
        ['mythic_skillup'] = {      -- mythic_skill
            label = 'Mythic Thief',
            img = 'mythic_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت دزدی از رابری میثیک را بالا ببرید',
            tasks = {
                ['skill:mythic_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_mythic_skillup'] = {      -- first_mythic_skill
            label = 'First Mythic Thief',
            img = 'first_mythic_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد دزدی از میثیک را بدست آورده',
            tasks = {
                ['skill:first_mythic_skill'] = {
                    max = 1,
                },
            }
        },
        ['allrob_achievement'] = {  -- All Rob
            label = 'Gladiator',
            img = 'allrob_achievement.png',
            point = 100,
            description = 'برای دریافت این نشان، دستاوردهای رابری را بدست آورید',
            tasks = {
                ['achievement:shop_skillup'] = {
                    max = 1,
                },
                ['achievement:minibank_skillup'] = {
                    max = 1,
                },
                ['achievement:jewel_skillup'] = {
                    max = 1,
                },
                ['achievement:cargo_skillup'] = {
                    max = 1,
                },
                ['achievement:maze_skillup'] = {
                    max = 1,
                },
                ['achievement:paleto_skillup'] = {
                    max = 1,
                },
                ['achievement:bankm_skillup'] = {
                    max = 1,
                },
                ['achievement:flat_skillup'] = {
                    max = 1,
                },
                ['achievement:bime_skillup'] = {
                    max = 1,
                },
                ['achievement:mythic_skillup'] = {
                    max = 1,
                },
            }
        },
        ['first_allrob_achievement'] = {  -- first_allrob_achievement
            label = 'First Gladiator',
            img = 'first_allrob_achievement.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاوردهای دزدی را بدست آورده',
            tasks = {
                ['achievement:first_allrob_achievement'] = {
                    max = 1,
                },
            }
        },
    --- Job dolati
        ['police_skillup'] = {      -- police_skill
            label = 'Police',
            img = 'police_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، در شغل پلیس مهارت خود را بالا ببرید',
            tasks = {
                ['skill:police_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_police_skillup'] = {      -- first_police_skill
            label = 'First Police',
            img = 'first_police_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد پلیس را بدست آورده',
            tasks = {
                ['skill:first_police_skill'] = {
                    max = 1,
                },
            }
        },
        ['sheriff_skillup'] = {     -- sheriff_skill
            label = 'Sheriff',
            img = 'sheriff_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، در شغل شریف مهارت خود را بالا ببرید',
            tasks = {
                ['skill:sheriff_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_sheriff_skillup'] = {     -- first_sheriff_skill
            label = 'First Sheriff',
            img = 'first_sheriff_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد شریف را بدست آورده',
            tasks = {
                ['skill:first_sheriff_skill'] = {
                    max = 1,
                },
            }
        },
        ['mt_skilllup'] = {         -- mt_skill
            label = 'Swat',
            img = 'mt_skilllup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، در شغل ام تی مهارت خود را بالا ببرید',
            tasks = {
                ['skill:mt_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_mt_skilllup'] = {         -- first_mt_skill
            label = 'First Swat',
            img = 'first_mt_skilllup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد ام تی را بدست آورده',
            tasks = {
                ['skill:first_mt_skill'] = {
                    max = 1,
                },
            }
        },
        ['law_achievement'] = {     -- All military Job
            label = 'Law Enforcement',
            img = 'law_achievement.png',
            point = 50,
            description = 'برای دریافت این نشان، دستاوردهای پلیس، شریف، ام تی را بدست آورید',
            tasks = {
                ['achievement:police_skillup'] = {
                    max = 1,
                },
                ['achievement:sheriff_skillup'] = {
                    max = 1,
                },
                ['achievement:mt_skilllup'] = {
                    max = 1,
                },
            }
        },
        ['first_law_achievement'] = {     -- first_law_achievement
            label = 'First Law Enforcement',
            img = 'first_law_achievement.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاوردهای پلیس،شریف،ام تی را بدست آورده',
            tasks = {
                ['achievement:first_law_achievement'] = {
                    max = 1,
                },
            }
        },
        ['justic_skillup'] = {      -- justic_skill
            label = 'Marshal',
            img = 'justic_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، در شغل دادگستری مهارت خود را بالا ببرید',
            tasks = {
                ['skill:justic_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_justic_skillup'] = {      -- first_justic_skill
            label = 'First Marshal',
            img = 'first_justic_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد جاب جاستیس را بدست آورده',
            tasks = {
                ['skill:first_justic_skill'] = {
                    max = 1,
                },
            }
        },
        ['revive_skillup'] = {      -- revive_skill
            label = 'Doctor',
            img = 'revive_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، در شغل مدیک مهارت خود را بالا ببرید',
            tasks = {
                ['skill:revive_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_revive_skillup'] = {      -- first_revive_skill
            label = 'First Doctor',
            img = 'first_revive_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد جاب مدیک را بدست آورده',
            tasks = {
                ['skill:first_revive_skill'] = {
                    max = 1,
                },
            }
        },
        ['taxi_skillup'] = {        -- taxi_skill
            label = 'Transportation Driver',
            img = 'taxi_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، در شغل تاکسی مهارت خود را بالا ببرید',
            tasks = {
                ['skill:taxi_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_taxi_skillup'] = {        -- first_taxi_skill
            label = 'First Taxi Driver',
            img = 'first_taxi_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد جاب تاکسی را بدست آورده',
            tasks = {
                ['skill:first_taxi_skill'] = {
                    max = 1,
                },
            }
        },
        ['repair_skillup'] = {      -- repair_skill
            label = 'Professional Mechanic',
            img = 'repair_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، در شغل مکانیک مهارت خود را بالا ببرید',
            tasks = {
                ['skill:repair_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_repair_skillup'] = {      -- first_repair_skill
            label = 'First Professional Mechanic',
            img = 'first_repair_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد جاب مکانیک را بدست آورده',
            tasks = {
                ['skill:first_repair_skill'] = {
                    max = 1,
                },
            }
        },
    --- Other
        ['sport_skillup'] = {      -- Sport_skill
            label = 'Champion',
            img = 'sport_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت ورزش را بالا ببرید',
            tasks = {
                ['skill:sport_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_sport_skillup'] = {      -- first_sport_skill
            label = 'First Champion',
            img = 'first_sport_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد ورزش را بدست آورده',
            tasks = {
                ['skill:first_sport_skill'] = {
                    max = 1,
                },
            }
        },
    --- faram
        ['farm_skillup'] = {      -- farm_skill
            label = 'Gardener',
            img = 'farm_skillup.png',
            point = 20,
            description = 'برای دریافت این دستاورد، مهارت باغبانی را بالا ببرید',
            tasks = {
                ['skill:farm_skill'] = {
                    max = 1,
                },
            }
        },
        ['first_farm_skillup'] = {      -- first_farm_skill
            label = 'First Gardener',
            img = 'first_farm_skillup.png',
            point = 0,
            hidden = true,
            description = 'این نشان، مخصوص اولین نفری است که دستاورد باغبانی را بدست آورده',
            tasks = {
                ['skill:first_farm_skill'] = {
                    max = 1,
                },
            }
        },
    }
}
