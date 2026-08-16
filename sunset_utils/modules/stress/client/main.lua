local stress, stressLoaded, timers, checkData = 0, false, {}, {}
CreateThread(function()
    waitForLoad()
    ESX.TriggerServerCallback('stress:getData', function(_stress)
        stress = _stress
        stressLoaded = true
        TriggerEvent('stress:update', stress)
    end)
end)

function addStress(value)
    while not stressLoaded do Wait(100) end
    if stressConfig.add[value] then
        stress += stressConfig.add[value]
        if stress > 100 then stress = 100 end
    end
    TriggerEvent('stress:update', stress)
end
exports('addStress', addStress)

function removeStress(value)
    while not stressLoaded do Wait(100) end
    if stressConfig.remove[value] then
        stress -= stressConfig.remove[value]
    end
    TriggerEvent('stress:update', stress)
end
exports('removeStress', removeStress)

exports('getStress', function()
    while not stressLoaded do Wait(100) end
    return stress
end)

CreateThread(function()
    waitForLoad()
    while true do
        Wait(10)
        local gameTime = GetGameTimer()
        if IsPedShooting(SUN.ped) and (not timers.shooting or timers.shooting < gameTime) then
            timers.shooting = gameTime + 100
            addStress('shooting_gun')
        end
        if SUN.isPlayerInVehicle then
            if checkData.vehicleEngineHealth then
                local health = GetVehicleEngineHealth(SUN.vehiclePlayerIsIn)
                if checkData.vehicleEngineHealth - health > 30 then
                    addStress('crash_car')
                end
                checkData.vehicleEngineHealth = health
            else
                checkData.vehicleEngineHealth = GetVehicleEngineHealth(SUN.vehiclePlayerIsIn)
            end
        else
            checkData.vehicleEngineHealth = 0
        end
    end
end)

AddEventHandler('KeyDown:space', function()
    if IsPedJumping(SUN.ped) then
        addStress('player_jump')
    end
end)

RegisterNetEvent('stress:add', function(k)
    addStress(k)
end)

RegisterNetEvent('stress:remove', function(k)
    removeStress(k)
end)