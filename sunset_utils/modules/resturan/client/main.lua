local inJob = false
local doesPointRegistred = false
local registerPoint = nil
local doesThreadRunning = false
local runThread = nil
local drawedText = {}
local blips = {}
Citizen.CreateThread(function()
    waitForLoad()
    Wait(1000)
    if ESX.PlayerData.job.name == 'resturan' then
        inJob = true
    end
    if inJob then
        registerPoint()
        runThread()
    end
end)

RegisterNetEvent('esx:setJob',function(job)
    if job.name == 'resturan' then
        inJob = true
        registerPoint()
        runThread()
    else
        inJob = false
        doesThreadRunning = false
    end
end)

registerPoint = function()
    if not doesPointRegistred then
        doesPointRegistred = true
        for k, v in pairs(configResturan.positions) do
            for k2, v2 in pairs(v.coords) do
                table.insert(blips,ESX.AddBlipForCoord(v2,0.5,1,2,'Pokhte ghaza'))
                exports['sunset_target']:AddCircleZone('resturan-'..k..k2,v2,1.5,{
                    name = 'resturan-'..k..k2,
                }, {
                    options = {
                        {
                            label = "📕باز کردن منو",
                            cb = function()
                                if inJob then
                                    v.cb()
                                    ESX.registerExitPoint(2,function()
                                        ESX.UI.Menu.CloseAll()
                                        exports['icon_menu']:ForceCloseMenu()
                                    end)
                                end
                            end,
                        },
                    },
                    job = {"all"},
                    distance = 1.5
                })
            end
        end

        for k, v in pairs(configResturan.craft.coords) do
            table.insert(blips,ESX.AddBlipForCoord(v,0.5,1,2,'Pokhtan'))
            exports['sunset_target']:AddCircleZone('resturan-craft-'..k,v,1.5,{
                name = 'resturan-craft-'..k,
            }, {
                options = {
                    {
                        label = "شروع به ساخت",
                        cb = function()
                            ESX.TriggerServerCallback('esx_society:getJobPerm', function(data, data2)
                                local elements = {}
                                for k, v in pairs(configResturan.craft.items) do
                                    if data2 and data2[v.label] then
                                        table.insert(elements, {label = v.label, value = v, k = k})
                                    end
                                end 
                                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'craft', {
                                    title    = 'Kodam ghaza ro mikhay bepazi?',
                                    align    = 'top-left',
                                    elements = elements
                                }, function(data, menu)
                                    menu.close()
                                    configResturan.craft.cb(data.current.k, data.current.value)
                                end, function(data, menu)
                                    menu.close()
                                end)
                                ESX.registerExitPoint(2,function()
                                    ESX.UI.Menu.CloseAll()
                                    exports['icon_menu']:ForceCloseMenu()
                                end)
                            end)
                        end,
                    },
                },
                job = {"all"},
                distance = 1.5
            })
        end
    end
end

runThread = function()
    if not doesThreadRunning then
        doesThreadRunning = true
        Citizen.CreateThread(function()
            while doesThreadRunning do
                Wait(1000)
                for k, v in pairs(configResturan.positions) do
                    for k2, v2 in pairs(v.coords) do
                        local distance = ESX.GetDistance(SUN.PlayerCoords, v2)
                        if distance <= 5 then
                            if not drawedText[k..k2] then
                                drawedText[k..k2] = true
                                Citizen.CreateThread(function()
                                    while drawedText[k..k2] do
                                        Wait(0)
                                        ESX.Game.Utils.DrawText3D(v2, v.label, 1.0)
                                    end
                                end)
                            end
                        else
                            drawedText[k..k2] = nil
                        end
                    end 
                end 
            end
            -- for k, v in pairs(blips) do
            --     RemoveBlip(v)
            -- end
            -- blips = {}
        end)
        Citizen.CreateThread(function()
            while doesThreadRunning do
                Wait(1000)
                for k, v in pairs(configResturan.craft.coords) do
                    local distance = ESX.GetDistance(SUN.PlayerCoords, v)
                    if distance <= 5 then
                        if not drawedText[k] then
                            drawedText[k] = true
                            Citizen.CreateThread(function()
                                while drawedText[k] do
                                    Wait(0)
                                    ESX.Game.Utils.DrawText3D(v, 'Pokhtan', 1.0)
                                end
                            end)
                        end
                    else
                        drawedText[k] = nil
                    end
                end 
            end
        end)
    end
end

exports('getResturanConfig',function()
    return configResturan
end)

-- AddEventHandler('KeyDown:f6', function()
--     if inJob then
--         exports['sun-billing']:openMenu('Resturan')
--     end
-- end)

function buyItemResturan()
	local elements = {}

	for k, v in pairs(configResturan.itemShop) do
		table.insert(elements, {label = 'x'.. v.count ..' '.. ESX.getItemLabel(k) ..' $' .. v.price, value = k})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'buyItem',
	{
		title    = 'Kharid item',
		align    = 'top-left',
		elements = elements,
	},
	function(data, menu)
        menu.close()
        Wait(math.random(1000, 2000))
		ESX.TriggerServerEvent('resturan:buyItem', data.current.value)
		Wait(500)
		buyItemResturan()
	end,function(data, menu)
		menu.close()
	end)
end
