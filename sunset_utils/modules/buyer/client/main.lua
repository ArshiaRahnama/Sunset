local function openBuyMenu(k)
    local options = {}
    for k, v in pairs(buyerConfig.buyers[k].items) do
        if ESX.DoesHaveItem2(v.name, 1) then
            table.insert(options, {label = ('%s x%s $%s'):format(ESX.getItemLabel(v.name), ESX.getItemCount(v.name), v.price), icon = ('nui://sun-inventory-hud/ui/img/items/%s.png'):format(v.name), args = v.name})
        end
    end
    if #options == 0 then
        table.insert(options, {label = 'Itemi baraye forush nadarid!'})
    end
    lib.registerMenu({
        id = 'buyerMenu1',
        title = 'Forush',
        options = options,
    }, function(selected, scrollIndex, args)
        local input = lib.inputDialog('Foroush Item', {
            {type = 'number', label = 'Tedad', icon = 'hashtag', min = 1, max = ESX.getItemCount(args), required = true},
        })
        if input and input[1] then
            if input[1] > ESX.getItemCount(args) then
                input[1] = ESX.getItemCount(args)
            end
            ESX.TriggerServerEvent('buyer:sell', k, args, input[1])
        end
    end)
    lib.showMenu('buyerMenu1')
end
CreateThread(function()
    waitForLoad()
    for k, v in pairs(buyerConfig.buyers) do
        for k2, v2 in pairs(v.coords) do
            createLocalPed(4, v.model, v2 - vec(0, 0, 1, 0), function(ped)
                SetEntityAsMissionEntity(ped)
                SetBlockingOfNonTemporaryEvents(ped, true)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
                exports['sunset_target']:addTargetEntity({ped},{
                    options = {{
                        icon = '',
                        label = 'Sell💲',
                        cb = function()
                            openBuyMenu(k)
                            ESX.registerExitPoint(5, function()
                                lib.hideMenu()
                            end)
                        end,
                    }},
                    job = {'all'},
                    distance = 2.5
                })
            end, function(ped)
                exports['sunset_target']:removeTargetEntity(ped)
            end)
        end
    end
end)