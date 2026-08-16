Config = {}

Config.ESX = true


-- Return an object in the format
-- {
--     name = job name
-- }

Config.NonEsxJob = function()
    local PlayerJob = {}

    return PlayerJob
end

Config.vehicleMenu = {
    {
        icon = "fas fa-dumpster",
        label = "🚙باز کردن صندوق عقب",
        cb = function(_)
            exports['sun-inventory-hud']:openTrunk(_)
        end,
    },
    {
        icon = "fas fa-dumpster",
        label = "👊بیرون انداختن راننده",
        cb = function(_)
            local plate = ESX.GetPlate(_)
            if plate then
                plate = 'key_' .. string.upper(ESX.Math.Trim(plate))
                if ESX.DoesHaveItem(plate,1,nil,nil,false) then
                    local driver = GetPedInVehicleSeat(_,-1)
                    if driver ~= 0 then
                        TriggerServerEvent('3dme:shareDisplay2', "Dar mashin ro baz mikone va fard ro az mashin biroun mindaze", true)
                        local targetID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(driver))
                        ESX.TriggerServerEvent('citizen:putoutvehicle2',targetID)
                    else
                        ESX.Alert('','Kasi savar mashin nist',5000,'error')
                    end
                else
                    ESX.Alert('','Shoma switch in mashin ra nadarid',5000,'error')
                end
            end
        end,
    },
    {
        icon = "fas fa-dumpster",
        label = "🛑برداشتن تابلو",
        doesShow = function(vehicle)
            local placedEntity = Entity(vehicle).state.placedEntity
            return placedEntity and placedEntity >= 100
        end,
        cb = function(vehicle)
            TriggerEvent('yaghi:pickup',vehicle)
        end,
    },
    {
        icon = "fas fa-dumpster",
        label = 'وصل کردن طناب',
        doesShow = function(vehicle)
            return ESX.DoesHaveItem2('rope', 1) and exports['esx_carlock']:canAccessToVehicle(vehicle) and not exports['sunset_utils']:doesVehicleInRopeList(vehicle)
        end,
        cb = function(vehicle)
            exports['sunset_utils']:addVehicleToRope(vehicle)
        end,
    },
    {
        icon = "fas fa-dumpster",
        label = 'جدا کردن طناب',
        doesShow = function(vehicle)
            return exports['sunset_utils']:doesVehicleInRopeList(vehicle)
        end,
        cb = function(vehicle)
            exports['sunset_utils']:removeVehicleRope(vehicle)
        end,
    },
    {
        icon = "fas fa-dumpster",
        label = 'گذاشتن گروگان',
        doesShow = function()
            return exports['sunset_utils']:doesCarrySoghra()
        end,
        cb = function(vehicle)
            exports['sunset_utils']:putSoghraInVehicle(vehicle)
        end,
    },
    {
        icon = "fas fa-dumpster",
        label = 'بیرون انداختن گروگان',
        doesShow = function(vehicle)
            local maxSeats = GetVehicleMaxNumberOfPassengers(vehicle)
            local freeSeat = nil
            for i = maxSeats - 1, 0, -1 do
                if not IsVehicleSeatFree(vehicle, i) then
                    local ped = GetPedInVehicleSeat(vehicle, i)
                    if Entity(ped).state.soghraId then
                        return true
                    end
                end
            end    
        end,
        cb = function(vehicle)
            exports['sunset_utils']:putOutSoghra(vehicle)
        end,
    },
}