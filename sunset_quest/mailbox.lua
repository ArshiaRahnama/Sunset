local near = 0
local boxcoords = {
    vector3(261.1629,-780.3817,30.52185),
    vector3(656.4531,588.4216,129.011),
    vector3(-264.6746,-894.6898,31.17769),
    -- Miner
    vector3(892.33,-1581.58,30.62),
    -- birone shahre 
    vector3(587.49,2744.04,42.07),
    vector3(1719.6,3698.06,34.5),
    vector3(159.07,6639.07,31.58),
    vector3(-1602.6,203.16,59.41),
    vec(-1027.29, -2125.03, 13.38),
    vec(70.91, -1566.94, 29.6),
}
local kaduid = 0
local kaduname = 'prop_veg_crop_03_pump'
local kaduhash = GetHashKey(kaduname)
Citizen.CreateThread(function()
    while ESX == nil do Wait(100) end
    
    while true do
        Wait(500)
        local coords = GetEntityCoords(PlayerPedId())
        for k , v in pairs(boxcoords) do
            local distance = ESX.GetDistance(coords,v)
            if distance <= 3 then
                if near == 0 then
                    near = k
                    Citizen.CreateThread(function()
                        while near ~= 0 do
                            Wait(10)
                            ESX.ShowHelpNotification('~INPUT_CONTEXT~ To open mail box')
                        end
                    end)
                end
            elseif near == k then
                near = 0
            end
        end
        -- local kadu = GetClosestObjectOfType(coords, 3.0, kaduhash, false)
        -- if DoesEntityExist(kadu) and not DecorGetBool(kadu,'prog') then
        --     if kaduid == 0 then
        --         kaduid = kadu
        --         Citizen.CreateThread(function()
        --             while kaduid ~= 0 do
        --                 Wait(10)
        --                 if DoesEntityExist(kaduid) and ESX.GetDistance(GetEntityCoords(PlayerPedId()),GetEntityCoords(kaduid)) < 3 and not DecorGetBool(kaduid,'prog') then
        --                     ESX.ShowHelpNotification('~INPUT_CONTEXT~ Jahat baz kardan kadu')
        --                 else
        --                     kaduid = 0
        --                 end
        --             end
        --         end)
        --     end
        -- else
        --     kaduid = 0
        -- end
    end
end)
--
AddEventHandler('onKeyDown',function(key)
    if key == 'e' then
        if near ~= 0 then
            openMailBox('self')
        elseif kaduid ~= 0 then
            Wait(500,2000)
            if DoesEntityExist(kaduid) and not DecorGetBool(kaduid,'prog') then
                ESX.Game.DeleteObject(kaduid)
                TriggerEvent("mythic_progbar:client:progress", {
                    name = "kadu",
                    duration = math.random(10000,15000),
                    label = "Dar hal baz kardan kadu",
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "anim@heists@box_carry@",
                        anim = "idle",
                    },
                    prop = {
                        model = "prop_veg_crop_03_pump",
                    }
                }, function(status)
                    if not status then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                        ESX.TriggerServerEvent('sunset_quest:Hallowen')
                        TriggerEvent('InteractSound_CL:PlayOnOne','evil', 10.0)
                    elseif status then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                    end
                end)
            end
        end
    end
end)

RegisterNetEvent('mailbox:openother')
AddEventHandler('mailbox:openother',function(name)
    openMailBox(name)
end)

function openMailBox(name)
    local data = getMailboxInventory(name)
    local items = exports['sun-inventory-hud']:sortItems(data)
    exports['sun-inventory-hud']:openOtherInventory({items = items, timeout = 1000, label = 'Mailbox'}, function(data)
        if data.type == 'close' then
        elseif data.type == 'update' then
            return exports['sun-inventory-hud']:sortItems(getMailboxInventory(name))
        elseif data.type == 'moveInside' then
            -- ESX.TriggerServerEvent('mailbox:updateSlot', name, data.data)
        elseif data.type == 'moveToOther' then
            if ESX.isDead() then return end
            ESX.TriggerServerEvent('mailbox:put', name, data.data.itemType, data.data.name, data.data.count, data.data)
        elseif data.type == 'moveToMain' then
            if ESX.isDead() then return end
            ESX.TriggerServerEvent('mailbox:get', name, data.data.itemType, data.data.name, data.data.count, data.data)
            Wait(500)
            if data.data.droppedTo then
                data.data.inventoryType = 'main'
                exports['sun-inventory-hud']:moveInside(data.data)
            end
        end
    end)
end

function getMailboxInventory(name)
    local p = promise.new()
    ESX.TriggerServerCallback('mailbox:getInventory',function(data)
        p:resolve(data) 
    end, name)
    return Citizen.Await(p)
end