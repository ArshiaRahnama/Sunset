configResturan = {
    jobName = 'resturan',
    positions = {
        bossAction = {
            coords = {
                vector3(-1656.2,165.19,61.73),
                vector3(-577.38,-1067.64,26.61),
                vec(-586.72, -1123.26, 22.18)
            },
            label = 'Boss action',
            cb = function()
                local elements = {
                    {label = 'Boss action', value = 'bossAction'},
                }
                if ESX.PlayerData.job.grade_name == 'boss' then
                    table.insert(elements, {label = 'Kharid Item', value = 'buyItem'})
                end
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boss',
                {
                    title    = 'Boss action',
                    align    = 'top-left',
                    elements = elements,
                }, function(data, menu)
                    menu.close()
                    if data.current.value == 'bossAction' then
                        TriggerEvent('esx_society:openbossss', 'resturan', function(data, menu)
                            menu.close()
                        end)
                    elseif data.current.value == 'buyItem' then
                        buyItemResturan()
                    end
                end, function(data, menu)
                    menu.close()
                end)
            end
        },
        cloakRoom = {
            coords = {
                vector3(-1658.91,158.18,61.73),
                vector3(-587.09,-1050.33,22.34),
                vector3(-1353.06,-1065.97,7.39),
                vector3(122.37,-1045.54,29.28),
            },
            label = 'Komod lebas',
            cb = function()
                local elements = {
                    {label = 'Lebas Shakhsi', value = 'citizen_wear'},
                }
                table.insert(elements, {label = 'Lebas Kar'})
                ESX.UI.Menu.CloseAll()
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
                {
                    title    = 'Komod Lebas',
                    align    = 'top-left',
                    elements = elements,
                },
                function(data, menu)
                    if data.current.value == 'citizen_wear' then
                        exports['sunset_clothe']:removeStuffJob()
                        Citizen.Wait(1000)
                        exports['sunset_clothe']:loadUsed()
                    else
                        ESX.TriggerServerCallback('esx_society:getPlayerSkin', function(skin, jobSkin)
                            if skin.sex == 0 then
                                TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
                            else
                                TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
                            end
                        end)
                    end
                end,
                function(data, menu)
                    menu.close()
                end)
            end
        },
        locker = {
            coords = {
                vector3(-1651.75,159.69,61.73),
                vector3(-585.17,-1056.31,22.34),
                vector3(-595.8,-1062.95,22.34),
                vector3(-1351.09,-1059.76,3.89),
                vector3(123.09,-1043.35,29.28),
            },
            label = 'Locker',
            cb = function()
                local elements = {
                    {label = 'Anbar 🎒', value = 'locker'},
                }
                ESX.UI.Menu.CloseAll()
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'locker',
                {
                    title    = 'Locker',
                    align    = 'top-left',
                    elements = elements,
                },
                function(data, menu)
                    if data.current.value == 'locker' then
                        exports['sun-inventory-hud']:openJobInventory('resturan')
                    end
                end,
                function(data, menu)
                    menu.close()
                end)     
            end
        },
    },
    craft = {
        items = {
            {
                label = 'Kababe goraz',
                give = {'boar_kebab',8},
                need = {
                    {'boar_meat', 1},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Soupe Goraz',
                give = {'boar_soup',8},
                need = {
                    {'boar_meat', 1},
                    {'water', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Kababe Ahu',
                give = {'deer_kebab',6},
                need = {
                    {'deer_meat', 1},
                    {'bread', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Soupe Ahu',
                give = {'deer_soup',6},
                need = {
                    {'deer_meat', 1},
                    {'water', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Kababe Khuk',
                give = {'pig_kebab',6},
                need = {
                    {'pig_meat', 1},
                    {'bread', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Soupe Khuk',
                give = {'pig_soup',6},
                need = {
                    {'pig_meat', 1},
                    {'water', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Kababe Khargush',
                give = {'rabbit_kebab',23},
                need = {
                    {'rabbit_meat', 1},
                    {'bread', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Soupe Khargush',
                give = {'rabbit_soup',23},
                need = {
                    {'rabbit_meat', 1},
                    {'water', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Kotlet',
                give = {'kotlet_kebab',23},
                need = {
                    {'pigeon_meat', 1},
                    {'bread', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Soupe Kabutar',
                give = {'pigeon_soup',23},
                need = {
                    {'pigeon_meat', 1},
                    {'bread', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Khorake Sardine',
                give = {'sardine_kebab',10},
                need = {
                    {'mahi_sardine', 14},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Ghalie Mahi',
                give = {'sangsar_kebab',10},
                need = {
                    {'mahi_sangsar', 11},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Khorake OrdakMahi',
                give = {'ordak_kebab',10},
                need = {
                    {'mahi_ordak', 11},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Ghezelala Sukhari',
                give = {'ghezel_kebab',10},
                need = {
                    {'mahi_ghezel', 10},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Hamoor sorkh shode',
                give = {'hamoor_kebab',10},
                need = {
                    {'mahi_hamoor', 10},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Sorkhoo Kababi',
                give = {'sorkhoo_kebab',10},
                need = {
                    {'mahi_sorkhoo', 10},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Mahi Salmon Tanuri',
                give = {'salmon_kebab',10},
                need = {
                    {'mahi_salmon', 10},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'shooride sorkh shode',
                give = {'shooride_kebab',10},
                need = {
                    {'mahi_shooride', 10},
                    {'bread', 1},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Sandwich Tilapia',
                give = {'tilapia_kebab',10},
                need = {
                    {'mahi_tilapia', 10},
                    {'bread', 1},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Mahi Sefid Kababi',
                give = {'sefid_kebab',10},
                need = {
                    {'mahi_sefid', 9},
                    {'bread', 2},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Mahi Shir sorkh shode',
                give = {'shir_kebab',10},
                need = {
                    {'mahi_shir', 9},
                    {'bread', 1},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Meygoo Sukhari',
                give = {'meygoo_kebab',10},
                need = {
                    {'mahi_meygoo', 8},
                    {'bread', 4},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Morghe Sorkh karde',
                give = {'chicken_kebab',10},
                need = {
                    {'slaughtered_chicken', 6},
                    {'bread', 3},
                    {'petrol', 1},
                },
                time = 20
            },
            {
                label = 'Jooje Kabab',
                give = {'jooje_kebab',10},
                need = {
                    {'packaged_chicken', 24},
                    {'bread', 3},
                    {'petrol', 1},
                },
                time = 20
            }
        },
        coords = {
            vec(-590.42, -1056.52, 22.36),
            vec(125.98, -1035.57, 29.28),
            vec(-1338.95, -1061.35, 7.39),
            vec(-1660.64, 175.81, 61.73),

        },
        cb = function(key,data)
            local p = promise.new()
            ESX.TriggerServerCallback('esx_society:doesHavePerm',function(cb)
                p:resolve(cb)
            end,'craftWithLocker')
            local craftWithLocker = Citizen.Await(p)
            local canCraft = true
            local need = data.need
            if craftWithLocker then
                local p = promise.new()
                ESX.TriggerServerCallback('resturan:getInventory', function(inventory)
                    p:resolve(inventory)
                end)
                local inventory = Citizen.Await(p)
                local items = inventory.items
                if #items == 0 then canCraft = false end
                local can = false
                for k, v in pairs(need) do
                    local breakBool = false
                    local find = false
                    for k2, v2 in pairs(items) do
                        if v2.name == v[1] then
                            if v2.count >= v[2] then
                                can = true
                                find = true
                            else
                                can = false
                                breakBool = true
                                break
                            end
                        end
                    end
                    if breakBool or not find then break end
                end
                canCraft = can
            else
                for k,v in pairs(need) do
                    if not ESX.DoesHaveItem2(v[1],v[2]) then
                        canCraft = false
                        break
                    end
                end
            end
            if canCraft then
                exports.dpemotes:PlayEmote('bbq',true)
                TriggerEvent("mythic_progbar:client:progress", {
                    name = "resturan",
                    duration = data.time * 1000,
                    label = "",
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = data.anim,
                }, function(status)
                    if not status then
                        ClearPedTasksImmediately(PlayerPedId())
                        ESX.TriggerServerEvent('resturan:craft', key,craftWithLocker)
                    end
                end)
            else
                ESX.chatMessage('Item haye mored niaz baraye craft : ')
                for k,v in pairs(need) do
                    ESX.chatMessage(ESX.getItem(v[1]).label .. ' ' .. v[2] .. 'x')
                end
                ESX.Alert('','Shoma material haye lazem ra nadarid!',5000,'error')
            end
        end
    },

    itemShop = {
        water = {count = 100, price = 40000},
        bread = {count = 100, price = 45000},
        radio = {count = 10,  price = 60000},
    },

    items = {
        {'boar_kebab','Kababe goraz',20},
        {'boar_soup','Soupe Goraz',20},
        {'deer_kebab','Kababe Ahu',20},
        {'deer_soup','Soupe Ahu',20},
        {'pig_kebab','Kababe Khuk',20},
        {'pig_soup','Soupe Khuk',20},
        {'rabbit_kebab','Kababe Khargush',20},
        {'rabbit_soup','Soupe Khargush',20},
        {'kotlet_kebab','Kotlet',20},
        {'pigeon_soup','Soupe Kabutar',20},
        {'sardine_kebab','Khorake Sardine',20},
        {'sangsar_kebab','Ghalie Mahi',20},
        {'ordak_kebab','Khorake OrdakMahi',20},
        {'ghezel_kebab','Ghezelala Sukhari',20},
        {'hamoor_kebab','Hamoor sorkh shode',20},
        {'salmon_kebab','Mahi Salmon Tanuri',20},
        {'shooride_kebab','Shooride sorkh shode',20},
        {'tilapia_kebab','Sandwich Tilapia',20},
        {'sefid_kebab','Mahi Sefid Kababi',20},
        {'shir_kebab','Mahi Shir sorkh shode',20},
        {'meygoo_kebab','Meygoo Sukhari',20},
        {'chicken_kebab','Morghe Sorkh karde',20},
        {'jooje_kebab','Jooje Kabab',20},
        {'sorkhoo_kebab','Sorkhoo Kababi',20},
    }
} 
