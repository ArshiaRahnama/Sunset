RegisterCommand('saveworldskin', function(src, args)
    local name = args[1]
    if name and ESX.GetPlayerData().permission_level >= 8 then
        local skin = exports['skinchanger']:getSkin()
        TriggerServerEvent('change-world:saveSkin', name, skin)
    end
end)

RegisterCommand('worldskin', function()
    local world = ESX.GetPlayerData().World
    if changeWorldConfig.worlds[world] and changeWorldConfig.worlds[world].skins then
        local options = {}
        for k, v in pairs(changeWorldConfig.worlds[world].skins) do
            table.insert(options, {label = v, args = k})
        end
        table.insert(options, {label = 'Default', args = 'def'})
        lib.registerMenu({
            id = 'changeWorldSkin',
            title = 'Skin',
            options = options
        }, function(selected, scrollIndex, args)
            if args then
                if args == 'def' then
                    TriggerEvent('change-world:loadUsedClothe')
                else
                    ESX.TriggerServerCallback('changeworld:getSkin', function(clothe)
                        if clothe then
                            TriggerEvent('skinchanger:getSkin', function(skin)
                                TriggerEvent('skinchanger:loadClothes', skin, clothe)
                            end)
                        end
                    end, args)
                end
            end
        end)
        lib.showMenu('changeWorldSkin')
    end
end)

RegisterNetEvent('change-world:loadUsedClothe', function()
    exports['sunset_clothe']:removeStuffJob()
    Wait(1000)
    exports['sunset_clothe']:loadUsed()
end)