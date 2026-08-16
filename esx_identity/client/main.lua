ESX = nil
local loadingScreenFinished = false
uiLoaded = false
needRegister = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function EnableGui(state)
    while not uiLoaded do Wait(10) end
    SetNuiFocus(state, state)
    guiEnabled = state
    if guiEnabled then
        guiThread()
    end
    SendNUIMessage({
        type = "enableui",
        enable = state
    })
end

RegisterNetEvent('setshowRegisterForm')
AddEventHandler('setshowRegisterForm', function(state)
    needRegister = state
end)

RegisterNetEvent('showRegisterForm')
AddEventHandler('showRegisterForm', function()
    EnableGui(true)
end)

RegisterNUICallback('register', function(data, cb)
    local player = {}
    player.playerName 	= data.firstname ..'_'.. data.lastname
    player.dateofbirth 	= "01/01/2000"
    ESX.TriggerServerCallback('nameAvalibity' , function(avalible)
        if data.firstname:find(" ") or data.lastname:find(" ") then
            SendNUIMessage({
                action = 'notification',
                message= 'Dadash Space Nazan!'
            })
        else
            if avalible then
                ESX.TriggerServerEvent('db:updateUserName', player.playerName , player.dateofbirth)
                ESX.TriggerServerEvent('newName', player.playerName)
                EnableGui(false)
                Wait (500)
                loadToGround()
                exports['sunset_quest']:Play('02_register_finish')
            else

                SendNUIMessage({
                    action = 'notification',
                    message= 'In moshakhasat qablan sabt shode, lotfan dobare emtehan konid!'
                })

            end
        end
    end ,player.playerName)
end)

RegisterNUICallback('uiLoaded',function()
    uiLoaded = true
end)

function guiThread()
    Citizen.CreateThread(function()
        while guiEnabled do
            Citizen.Wait(0)
            DisableControlAction(0, 1,   true) -- LookLeftRight
            DisableControlAction(0, 2,   true) -- LookUpDown
            DisableControlAction(0, 106, true) -- VehicleMouseControlOverride
            DisableControlAction(0, 142, true) -- MeleeAttackAlternate
            DisableControlAction(0, 30,  true) -- MoveLeftRight
            DisableControlAction(0, 31,  true) -- MoveUpDown
            DisableControlAction(0, 21,  true) -- disable sprint
            DisableControlAction(0, 24,  true) -- disable attack
            DisableControlAction(0, 25,  true) -- disable aim
            DisableControlAction(0, 47,  true) -- disable weapon
            DisableControlAction(0, 58,  true) -- disable weapon
            DisableControlAction(0, 263, true) -- disable melee
            DisableControlAction(0, 264, true) -- disable melee
            DisableControlAction(0, 257, true) -- disable melee
            DisableControlAction(0, 140, true) -- disable melee
            DisableControlAction(0, 141, true) -- disable melee
            DisableControlAction(0, 143, true) -- disable melee
            DisableControlAction(0, 75,  true) -- disable exit vehicle
            DisableControlAction(27, 75, true) -- disable exit vehicle
        end
    end)
end


Citizen.CreateThread(function()
    DoScreenFadeOut(50)
    Wait(1000)
    check()
    Citizen.SetTimeout(15000,function()
        DoScreenFadeIn(10)
    end)
end)

local registerattemp = 0
local need2step = false
local name = nil
function check()
    exports.suncore:SetPlayerVisible(false)
	Wait(500)
    ShutdownLoadingScreen()
    ShutdownLoadingScreenNui()
    showLoadingPromt("PCARD_JOIN_GAME", 500000)

    while needRegister == nil and registerattemp < 10 do
        registerattemp = registerattemp + 1
        Wait(1000)
    end
    if needRegister == nil then
        need2step = true
    end
    if not need2step then
        if needRegister then
            Wait(1000)
            showLoadingPromt("PCARD_JOIN_GAME", 0)
            EnableGui(true)
            exports['sunset_quest']:Play('01_register_menu_open')
        else
            Wait(1000)
            showLoadingPromt("PCARD_JOIN_GAME", 0)
            loadToGround()
        end
    else
        while name == nil do
            ESX.TriggerServerCallback('sun-jobs:getIcName', function(PlayerName)
                name = PlayerName
            end)
            Wait(500)
        end
        if name == "register" then
            Wait(1000)
            showLoadingPromt("PCARD_JOIN_GAME", 0)
            EnableGui(true)
            exports['sunset_quest']:Play('01_register_menu_open')
        else
            Wait(1000)
            showLoadingPromt("PCARD_JOIN_GAME", 0)
            loadToGround()
        end
    end
end

function loadToGround()
    local ped = PlayerPedId()
    TriggerServerEvent('getSkin')
    exports.suncore:SetPlayerVisible(true)
	TriggerEvent('spawn:open')
    Wait(15000)
    TriggerEvent('es_admin:freezePlayer',false)
    Wait(5000)
    TriggerEvent('es_admin:freezePlayer',false)
end

function showLoadingPromt(label, time)
    Citizen.CreateThread(function()
        BeginTextCommandBusyString(tostring(label))
        EndTextCommandBusyString(3)
        Citizen.Wait(time)
        RemoveLoadingPrompt()
    end)
end

