local coords = {
    vector4(2891.84,3735.0,44.02,284.7),
    vector4(2538.54,2845.61,38.06,53.57),
    vector4(2723.73,3166.11,49.84,50.44 ),
    vector4(2851.14,3439.27,51.92,340),
    vector4(2834.01,4568.09,46.51,19.21),
}

Citizen.CreateThread(function()
    while ESX == nil do Wait(10) end
    for k , v in pairs(coords) do
        ESX.RegisterPoint(v.xyz,2,{
            Color = {R = 255,G = 0,B = 0,A = 255},
            DrawDistance = 20,
            Radius = 0.5,
            Type = 15
        },{
            Notification = nil,
            DrawText = 'Dokme ~INPUT_CONTEXT~ jahat shosteshuye poul',
            DrawTextRadius = 4,
            DrawTextCoords = v.xyz,
            Key = 'e',
            CB = function()
                if ESX.GetPlayerData().World ~= 0 then return end
                SetEntityHeading(PlayerPedId(),v.w)
                TriggerEvent("mythic_progbar:client:progress", {
                    name = "wash",
                    duration = 20000,
                    label = "",
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "amb@prop_human_bum_bin@idle_a",
						anim = "idle_a",
                    }
                }, function(status)
                    if not status then
                        ESX.TriggerServerEvent('moneywash:wash',GetClockHours())
                    elseif status then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
                end)
            end,
        },{
            In = nil,
            Out = ESX.UI.Menu.CloseAll
        })
    end
end)

RegisterNetEvent('moneywash:alarm',function(coords)
    local alpha = 250
    local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 50.0)

    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 5)
    SetBlipAlpha(blip, alpha)
    SetBlipAsShortRange(blip, true)
    ESX.ShowNotification('~r~Poul shuee tu ruze roshan :| ! ~w~')
    while alpha ~= 0 do
        Citizen.Wait(20 * 4)
        alpha = alpha - 1
        SetBlipAlpha(blip, alpha)

        if alpha == 0 then
            RemoveBlip(blip)
            return
        end
    end
end)