local banned = false
local thread2World = {
    [0] = true,
    [98] = true,
    [97] = true,
    [96] = true,
    [95] = true,
}

local function hourCheck()
    ESX.TriggerServerEvent('fightban:hourCheck')
    SetTimeout(60 * 60000, hourCheck)
end
Citizen.CreateThread(function()
    while ESX == nil do Citizen.Wait(10) end
    ESX.TriggerServerCallback('fireBan:check',function(state)
        Citizen.Wait(1000)
        banned = state
        if banned then
            fireBanThread2()     
            AddEventHandler('KeyDown:mouse_left',function()
                if banned and not ESX.meleeWeapons[SUN.CurrentWeaponModel] then
                    ExecuteCommand('checkfightban')
                end
            end)
        else
            while ESX.GetPlayerData().SelfLevel == nil do
                Citizen.Wait(1000)
            end
            if ESX.GetPlayerData().SelfLevel < 2 then
                banned = true
                fireBanThread()
                Citizen.CreateThread(function()
                    while banned do
                        Citizen.Wait(10000)
                        if ESX.GetPlayerData().SelfLevel > 1 then
                            banned = false
                        end
                    end
                end)
            end
        end
        SetTimeout(60 * 60000, hourCheck)
    end)
end)

RegisterNetEvent('fireBan:setBan',function(state)
    banned = state
    if banned then
        fireBanThread2()
        AddEventHandler('KeyDown:mouse_left',function()
            if banned then
                ExecuteCommand('checkfightban')
            end
        end)
    end
end)

function fireBanThread()
    Citizen.CreateThread(function()
        local _ = false
        while banned do         
            Citizen.Wait(500)
            if World == 0 and (SUN.VehiclePlayerIsIn == 0 or not SUN.PlayerIsDriver)then
                if not _ then
                    _ = true
                    NetworkSetFriendlyFireOption(false)
                end
            else
                _ = false
                NetworkSetFriendlyFireOption(true)
            end
        end
        NetworkSetFriendlyFireOption(true)
    end)
end

function fireBanThread2()
    Citizen.CreateThread(function()
        local _ = false
        CreateThread(function()
            while banned do
                Wait(100)
                _ = LocalPlayer.state.job == 'hunterrr' or ESX.meleeWeapons[SUN.CurrentWeaponModel]
            end
        end)
        while banned do         
            Citizen.Wait(1)
            if thread2World[World] and not _ then
                -- DisablePlayerFiring(SUN.PlayerId,true)
                disableFiring()
            end
        end
    end)
end