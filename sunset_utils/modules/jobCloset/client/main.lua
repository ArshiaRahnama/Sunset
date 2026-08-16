local isFreeze = false
local function openCloset(identifier, job, zoneData, gang, militaryPut)
    local data = getClosetInventory(identifier, job, gang)
    local items = exports['sun-inventory-hud']:sortItems(data)
    exports['sun-inventory-hud']:openOtherInventory({items = items, timeout = 1000, label = 'Komod', maxWeight = zoneData.maxWeight}, function(data)
        if data.type == 'close' then
        elseif data.type == 'update' then
            return exports['sun-inventory-hud']:sortItems(getClosetInventory(identifier, job, gang))
        elseif data.type == 'moveInside' then
            if not isFreeze then
                ESX.TriggerServerEvent('jobCloset:updateSlot', identifier, job, data.data, gang)
            end
        elseif data.type == 'moveToOther' then
            if not isFreeze or militaryPut then
                if ESX.isDead() then return end
                ESX.TriggerServerEvent('jobCloset:put', {itemType = data.data.itemType, name = data.data.name, count = data.data.count, identifier = identifier, job = job, data = data.data, zoneData = zoneData, gang = gang, militaryPut = militaryPut})
            end
        elseif data.type == 'moveToMain' then
            if not isFreeze then
                if ESX.isDead() then return end
                ESX.TriggerServerEvent('jobCloset:get', data.data.itemType, data.data.name, data.data.count, identifier, job, data.data, zoneData, gang)
                Wait(500)
                if data.data.droppedTo then
                    data.data.inventoryType = 'main'
                    exports['sun-inventory-hud']:moveInside(data.data)
                end
            end
        end
    end)
end

local function createZone(k)
    local data = ConfigJobCloset[k]
    if not data.created then
        data.created = true
        for k , v in pairs(data.coords) do
            ESX.RegisterPoint(v - vector3(0,0,1),2,{
                Color = {R = 102,G = 153,B = 255,A = 255},
                DrawDistance = 4,
                Radius = 0.7,
                Type = 0
            },{
                Notification = nil,
                DrawText = 'Dokme ~INPUT_CONTEXT~ jahat baz kardan komod',
                DrawTextRadius = 2,
                DrawTextCoords = v,
                Key = 'e',
                CB = function()
                    isFreeze = false
                    if ESX.PlayerData.job.name == data.job then
                        openCloset(nil, nil, data)
                    elseif ESX.PlayerData.gang.name == data.gang then
                        openCloset(nil, nil, data, true)
                    end
                end,
            },{
                In = nil,
                Out = function()
                    ESX.UI.Menu.CloseAll()
                end
            })
        end
    end
end


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    Citizen.Wait(10000)
	local job = xPlayer.job
    for k , v in pairs(ConfigJobCloset) do
        if (v.job == job.name or v.gang == xPlayer.gang.name) and not v.created then
            createZone(k)
        end
    end
end)

RegisterNetEvent('esx:setJob',function(job)
    ESX.PlayerData.job = job
    for k , v in pairs(ConfigJobCloset) do
        if v.job == job.name and not v.created then
            createZone(k)
        end
    end
end)

RegisterNetEvent('esx:setGang',function(gang)
    ESX.PlayerData.gang = gang
    for k , v in pairs(ConfigJobCloset) do
        if v.gang == gang.name and not v.created then
            createZone(k)
        end
    end
end)


function getClosetInventory(hex, job, gang)
    local p = promise.new()
    ESX.TriggerServerCallback('jobCloset:getData',function(data)
        p:resolve(data) 
    end, hex, job, gang)
    return Citizen.Await(p)
end

RegisterNetEvent('jobCloset:openJobCloset', function(hex, job, freeze, gang, militaryPut)
    isFreeze = freeze
    openCloset(hex, job, {maxWeight = 1000}, gang, militaryPut)
end)