local deadData = nil
local thread = true
local reviveThread = false
local lossData = false
local warnText = [[
    شما در حال نزدیک شدن به مکان مرگ خود هستید
    جهت جلوگیری از زیر پا گذاشتن قانون نیو لایف سریعا از این منطقه فاصله بگیرید
    
    اخطار آخر درصورت دور نشدن با شما برخورد خواهد شد
]]

local function deadCheckThread(data)
    local deadData = ESX.CopyTable(data)
    Citizen.CreateThread(function()
        thread = true
        while thread do
            Citizen.Wait(5000)
            if deadData.ts > GetServerOSTime() then
                local distance = ESX.GetDistance(SUN.PlayerCoords,deadData.coords)
                if distance < 200 and ESX.GetPlayerData().World == 0 and not ESX.GetPlayerData().inNCZ then
                    if not deadData.selfAlarm then
                        deadData.selfAlarm = true
                        Citizen.SetTimeout(60000,function()
                            deadData.selfAlarm = false
                        end)
                        --TriggerEvent('txAdminClient:warn','System',warnText)
                        TriggerEvent('chat:addMessage', {
                            template = '<div style="padding: 0.5vw; direction: rtl; margin: 0.5vw; background-color: rgba(255, 0, 0, 0.4); border-radius: 3px;"><i class="far fa-newspaper"></i><br>  {1}</div>',
                            args = { 'System', warnText }
                        })
                        TriggerEvent("MpGameMessage:send", 'Ekhtar', 'Az makan new life khod fasele begirid\nDar gheyr in surat punishment e\'emal mishavad', 10000, 'success')
                    end
                    if distance < 100 then
                        if not deadData.adminAlarm then
                            deadData.adminAlarm = true
                            Citizen.SetTimeout(30000,function()
                                deadData.adminAlarm = false
                            end)
                            alarm('Man be makan ^1new life^7 nazdik shodam')
                        end
                    end
                end
            else
                deadData = nil
                break
            end
        end
    end)
end

AddEventHandler('antiNonRP:setNewLifeData',function()
    local coords = SUN.PlayerCoords
    if ESX.GetPlayerData().isInIslandZone then return end
    local data = {coords = coords,ts = GetServerOSTime() + 30 * 60}
    SetResourceKvp('deadData',json.encode(data))
    deadData = data
    lossData = true
end)

AddEventHandler('antiNonRP:startNewLifeThread',function()
    if deadData ~= nil then
        if ESX.GetPlayerData().isInIslandZone then return end
        deadCheckThread(deadData)
        lossData = false
    end
end)

RegisterNetEvent('antiNonRP:clearNewLifeData',function(force)
    if lossData or force then
        SetResourceKvp('deadData',json.encode({}))
        deadData = nil
    end
    if force then
        thread = false
    end
end)



Citizen.CreateThread(function()
    while not SUN.serverTimeReady do Citizen.Wait(1000) end
    local data = GetResourceKvpString('deadData')
    if data then
        data = json.decode(data)
        if data.ts and data.ts > GetServerOSTime() then
            data.coords = vector3(data.coords.x,data.coords.y,data.coords.z)
            deadData = data
            deadCheckThread(deadData)
        end
    end
end)

AddEventHandler('antiNonRP:startReviveThread',function()
    if ESX.GetPlayerData().isInIslandZone then return end
    reviveThread = true
    Citizen.SetTimeout(5 * 60 * 1000,function()
        reviveThread = false
    end)
    CreateThread(function()
        while reviveThread do
            Wait(1000)
            if IsPedRunning(SUN.ped) then
                SetPedToRagdoll(SUN.ped, 10000, 10000, 0, 0, 0, 0)
            end
        end
    end)
end)

function ripHandler()
    if reviveThread and SUN.CurrentWeaponModel ~= `weapon_stungun` then
        Citizen.Wait(200)
        SetPedToRagdoll(SUN.ped, 10000, 10000, 0, 0, 0, 0)
    end
end

AddEventHandler('antiNonRP:stopReviveThread',function()
    reviveThread = false
end)

AddEventHandler('KeyDown:space',ripHandler)
AddEventHandler('KeyDown:mouse_left',ripHandler)
AddEventHandler('KeyDown:mouse_right',ripHandler)