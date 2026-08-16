local minimize, minimizeCD, isSprinting, foodHide, waterHide, vehicleHide, stressHide, staminaHide, oxygenHide = false, false, false, false, false, true, true, true, true
local stress = 0
local pauseMenu = false
AddEventHandler('KeyDown:oem_3', function()
    if minimizeCD then return end
    minimizeCD = true
    SetTimeout(500, function()
        minimizeCD = false
    end)
    minimize = not minimize
    -- sendMessage({
    --     id = 'hud',
    --     event = 'toggleDisplay',
    --     key = 'foodBarFlexBox',
    --     state = not minimize,
    -- })
    -- sendMessage({
    --     id = 'hud',
    --     event = 'toggleDisplay',
    --     key = 'waterBarFlexBox',
    --     state = not minimize,
    -- })
    sendMessage({
        id = 'hud',
        event = 'toggleDisplay3',
        key = '#healthBarIcon',
        state = minimize,
    })
    sendMessage({
        id = 'hud',
        event = 'toggleDisplay3',
        key = '#armorBarIcon',
        state = minimize,
    })
    -- if minimize then
    --     toggleDisplay3('engine', false)
    --     toggleDisplay3('hunger', false)
    --     toggleDisplay3('thirst', false)
    --     toggleDisplay3('stress', false)
    --     toggleDisplay3('stamina', false)
    --     toggleDisplay3('oxygen', false)
    --     vehicleHide, foodHide, waterHide, stressHide, staminaHide, oxygenHide = true, true, true, true, true, true
    -- else
    --     TriggerEvent('stress:update', stress)
    -- end
end)

CreateThread(function()
    local player = PlayerId()
    local unarmed = `WEAPON_UNARMED`
    while true do
        Wait(250)
        local ped = PlayerPedId()
        if IsPauseMenuActive() then
            if not pauseMenu and GetSelectedPedWeapon(ped) == unarmed and not LocalPlayer.state.vanish then
                pauseMenu = true
                exports['dpemotes']:PlayEmote('map', true)
            end
        elseif pauseMenu then
            pauseMenu = false
            exports['dpemotes']:cancelEmote(true)
        end
        local vehicle = ESX.isVehicleDriver()
        if vehicle then
            if vehicleHide then
                vehicleHide = false
                sendMessage({
                    id = 'hud',
                    event = 'toggleDisplay3',
                    key = '#engine',
                    state = true,
                })
            end
        elseif not vehicleHide then
            vehicleHide = true
            sendMessage({
                id = 'hud',
                event = 'toggleDisplay3',
                key = '#engine',
                state = false,
            })
        end   
        if IsPedSprinting(ped) then
            if staminaHide then
                staminaHide = false
                toggleDisplay3('stamina', true)
            end
        elseif not staminaHide then
            staminaHide = true
            toggleDisplay3('stamina', false)
        end
        if IsPedSwimming(ped) then
            if oxygenHide then
                oxygenHide = false
                toggleDisplay3('oxygen', true)
            end
        elseif not oxygenHide then
            oxygenHide = true
            toggleDisplay3('oxygen', false)
        end
        
        local oxygen = GetPlayerUnderwaterTimeRemaining(player) * 10
        sendMessage({
            id = 'hud',
            event = 'setData',
            health = GetEntityHealth(ped),
            armor = GetPedArmour(ped),
            talking = MumbleIsPlayerTalking(player),
            engine = vehicle and GetVehicleEngineHealth(vehicle) / 10,
            stamina = GetPlayerStamina(player),
            oxygen = oxygen > 0 and oxygen or 0
        })
    end
end)

RegisterNetEvent('status:updateStatus', function(data)
    local sendData = {
        id = 'hud',
        event = 'setData',
    }
    -- if not minimize then
    --     for k, v in pairs(data) do
    --         if v.name == 'thirst' then
    --             local val = v.val / 10000
    --             sendData.thirst = val
    --             if val > 80 then
    --                 if not waterHide then
    --                     waterHide = true
    --                     sendMessage({
    --                         id = 'hud',
    --                         event = 'toggleDisplay3',
    --                         key = '#thirst',
    --                         state = false,
    --                     })
    --                 end
    --             elseif waterHide then
    --                 waterHide = false
    --                 sendMessage({
    --                     id = 'hud',
    --                     event = 'toggleDisplay3',
    --                     key = '#thirst',
    --                     state = true,
    --                 })
    --             end
    --         elseif v.name == 'hunger' then
    --             local val = v.val / 10000
    --             sendData.hunger = val
    --             if val > 80 then
    --                 if not foodHide then
    --                     foodHide = true
    --                     sendMessage({
    --                         id = 'hud',
    --                         event = 'toggleDisplay3',
    --                         key = '#hunger',
    --                         state = false,
    --                     })
    --                 end
    --             elseif foodHide then
    --                 foodHide = false
    --                 sendMessage({
    --                     id = 'hud',
    --                     event = 'toggleDisplay3',
    --                     key = '#hunger',
    --                     state = true,
    --                 })
    --             end
    --         end
    --     end
    --     sendMessage(sendData)
    -- end
    for k, v in pairs(data) do
        if v.name == 'thirst' then
            local val = v.val / 10000
            sendData.thirst = val
        elseif v.name == 'hunger' then
            local val = v.val / 10000
            sendData.hunger = val
        end
    end
    sendMessage(sendData)
end)

AddEventHandler('pma-voice:setTalkingMode', function(mode)
    local percent = 25
    if mode == 2 then
        percent = 50
    elseif mode == 3 then
        percent = 100
    end
    sendMessage({
        id = 'hud',
        event = 'setData',
        microphone = percent,
    })
end)

function updateIndicators(type, data)
    sendMessage({
        id = 'hud',
        event = 'setData',
        indicator = convertData(type, data),
    })
end
exports("updateIndicators", updateIndicators)

function convertData(type, data)
    local newData = {}
    for id,talking in pairs(data) do
        if talking then
            table.insert(newData, {id = id, type = type})
        end
    end
    return newData
end

AddEventHandler('stress:update', function(_stress)
    stress = _stress
    if stress >= 10 then
        if stressHide then
            stressHide = false
            toggleDisplay3('stress', true)
        end
    elseif not stressHide then
        stressHide = false
        toggleDisplay3('stress', false)
    end
    sendMessage({
        id = 'hud',
        event = 'setData',
        stress = stress,
    })
end)

function toggleDisplay3(k, v)
    sendMessage({
        id = 'hud',
        event = 'toggleDisplay3',
        key = '#'.. k,
        state = v,
    })
end