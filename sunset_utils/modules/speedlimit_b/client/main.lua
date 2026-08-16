local useMph = false
local spam = false

function showHelpNotification(msg, type)
    if type == 0 then
        TriggerEvent("pNotify:SendNotification", {text = msg, type = "success", timeout = math.random(1000, 10000), layout = "centerLeft", queue = "left"})
    else
        TriggerEvent("pNotify:SendNotification", {text = msg, type = "error", timeout = math.random(1000, 10000), layout = "centerLeft", queue = "left"})
    end
end

AddEventHandler('onKeyUP',function(key)
    if key == "b" then
        if not SUN.InStreet or spam then return end
        spam = true
        SetTimeout(5000,function()
            spam = false
        end)
        local playerPed = SUN.PlayerPedId
        local vehicle = GetVehiclePedIsIn(playerPed,false)
        if GetPedInVehicleSeat(vehicle, -1) == playerPed and IsPedInAnyVehicle(playerPed, false) then
            if speedLimited then
                speedLimited = false
                maxSpeed = GetVehicleHandlingFloat(vehicle,"CHandlingData","fInitialDriveMaxFlatVel")
                SetEntityMaxSpeed(vehicle, maxSpeed)
                showHelpNotification("Mahdoudiat Sorat Khamoush Shod", 1)
            elseif not speedLimited then
                speedLimited = true
                cruise = GetEntitySpeed(vehicle)
                SetEntityMaxSpeed(vehicle, cruise)
                cruise = math.floor(cruise * 3.6 + 0.5)
                showHelpNotification("Sorat Shoma Roye "..cruise.." KM. Mahdoud Shod.", 0)
            end
        else
            resetSpeedOnEnter = true
        end
    end
end)
