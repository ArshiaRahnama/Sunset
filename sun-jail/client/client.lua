local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
PlayerData = {}
local time = 0
local triggerTime = 0
local sentence = {active = false, time = 0, coords = {x = 0, y = 0, z = 0}, distance = 0, type = 0, ajail = false}
local stopThread, cutscene = false, false
local cam = 0
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

        Wait(0)
    end

    while ESX.GetPlayerData() == nil do

        Wait(10)
    end

    while ESX.GetPlayerData().job == nil do

        Wait(10)
    end

    PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    PlayerData.job = job
end)

AddEventHandler("loading:Loaded", function()
    ESX.TriggerServerCallback("esx_jail:retriveJail", function(psentence)
        if psentence.time > 0 then
            Sentence(psentence.type, psentence.time, psentence.coords,psentence.unjail, true)
        end
    end)
end)

RegisterNetEvent("esx_jail:unJailSelf")
AddEventHandler("esx_jail:unJailSelf", function()
    UnJail()
end)

RegisterNetEvent("esx_jail:SentencePlayer")
AddEventHandler("esx_jail:SentencePlayer", function(type, time, coords,unjail)
    Sentence(type, time, coords,unjail)
end)

RegisterNetEvent("esx_jail:notifications")
AddEventHandler("esx_jail:notifications", function(message)
    if not ESX or not PlayerData or not PlayerData.job then return end
    if PlayerData.job.name == "police" or PlayerData.job.name == "sheriff" or PlayerData.job.name == 'mt' or PlayerData.job.name == 'fbi' or PlayerData.job.name == 'justice' or PlayerData.job.name == 'detective' then
        TriggerEvent('chat:addMessage', {color = {0, 95, 254}, multiline = true ,args = {"[DISPATCH]", message}})
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(1)
        if sentence.active then
            DrawGenericText("~r~Zamane Jail : ~w~" .. sentence.time .. " ~r~Daghighe")
            DisableControlAction(0, Keys['F3'],true)
            DisableControlAction(0, Keys[','], true)
            --if sentence.ajail then
            DisableControlAction(0, Keys['F1'], true)
            DisableControlAction(0, Keys['M'], true)
            DisableControlAction(0, Keys['R'], true)
            DisableControlAction(0, Keys['F2'], true)
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Right click
            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 27, true) -- Arrow up
            --end
        else
            Wait(1000)
        end
    end
end)

Citizen.CreateThread(function()

        while true do
            Wait(500)

            if sentence.active and not stopThread then

                local ped = PlayerPedId()
                local coords = GetEntityCoords(ped)
                local distance = GetDistanceBetweenCoords(coords, sentence.coords.x, sentence.coords.y, sentence.coords.y, false)

                if distance > sentence.distance then
                    DetachEntity(ped, true, true)
                    ESX.Game.Teleport(ped, sentence.coords)
                    ESX.ShowNotification("~r~~h~Nemitoni Az Zendan Farar Koni!")
                end

            else
                Wait(2000)
            end

        end

end)

Citizen.CreateThread(function()

        while true do
            Wait(1000)

            if sentence.active then
                if triggerTime == 0 then
                    if GetGameTimer() - time > 60000 then
                        time = GetGameTimer()

                        sentence.time = sentence.time - 1

                        TriggerServerEvent('esx_jail:UpdateTime')
                        if sentence.time == 0 then
                            sentence.active = false
                        end

                    end
                end
            end

        end

end)

function tTime()
    triggerTime = triggerTime - 1
    if triggerTime > 0 then
        SetTimeout(1000, tTime)
    end
end

function Sentence(type, time, coords,unjail, join)
    exports['sun-jobs']:uncuffself()
    local ped = GetPlayerPed(-1)
    RemoveWeapons(ped)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "cell", 0.3)
    ESX.SetPlayerData('jailed', 1)

    sentence.time = time
    sentence.type = type
    sentence.ajail = false
    sentence.distance = 3.0
    sentence.coords = coords
    sentence.unjail = unjail
    if type == "admin" then
        local place = Config.Admin
        sentence.coords = place.coords
        sentence.distance = place.distance
        sentence.ajail = true
        sentence.unjail = Config.Unjails.admin
        ESX.Game.Teleport(ped, place.coords)
        SetEntityHeading(ped, place.heading)
    elseif sentence.coords.x == 1691 then
        sentence.distance = 150.0
        if not join then
            playCutscene()
        end
    end
    changeClothes()
    triggerTime = 61
    tTime()

    sentence.active = true

end

function RemoveWeapons(ped)
    ESX.SetPedArmour(ped, 0)
    ClearPedBloodDamage(ped)
    ResetPedVisibleDamage(ped)
    ClearPedLastWeaponDamage(ped)
end

function UnJail()
    sentence.time = 0
    sentence.coords = {x = 0, y = 0, z = 0}
    sentence.distance = 0
    ESX.SetPlayerData('jailed', 0)
    sentence.type = 0
    sentence.ajail = false
    sentence.active = false
    local ped = GetPlayerPed(-1)
    ESX.Game.Teleport(ped, sentence.unjail)
    -- ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
    -- 	TriggerEvent('skinchanger:loadSkin', skin)
    -- end)
    exports['sunset_clothe']:removeStuffJob()
    Wait(1000)
    exports['sunset_clothe']:loadUsed()
    ESX.ShowNotification("~g~~h~Shoma Azad Shodid!")
end

function changeClothes()
    TriggerEvent('skinchanger:getSkin', function(skin)
        if skin.sex == 0 then
            local clothesSkin = {
                ['tshirt_1'] = 15, ['tshirt_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0,
                ['mask_1'] = 0,   ['mask_2'] = 0,
                ['helmet_1'] = -1,  ['helmet_2'] = 0,
                ['bags_1'] = -1,  ['bags_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['chain_1'] = 0,    ['chain_2'] = 0,
                ['torso_1'] = 5, ['torso_2'] = 0,
                ['arms'] = 5,
                ['pants_1'] = 9, ['pants_2'] = 4,
                ['shoes_1'] = 42, ['shoes_2'] = 2,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        elseif skin.sex == 1 then
            local clothesSkin = {
                ['tshirt_1'] = 14, ['tshirt_2'] = 0,
                ['bproof_1'] = 0,  ['bproof_2'] = 0,
                ['mask_1'] = 0,   ['mask_2'] = 0,
                ['helmet_1'] = -1,  ['helmet_2'] = 0,
                ['bags_1'] = -1,  ['bags_2'] = 0,
                ['decals_1'] = 0,   ['decals_2'] = 0,
                ['chain_1'] = 0,    ['chain_2'] = 0,
                ['torso_1'] = 141, ['torso_2'] = 2,
                ['arms'] = 0,
                ['pants_1'] = 66, ['pants_2'] = 10,
                ['shoes_1'] = 16, ['shoes_2'] = 2,
            }
            TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        end
    end)
end

function DrawGenericText(text)
    SetTextFont(0)
    SetTextScale(0.378, 0.378)
    SetTextWrap(0.0, 1.0)
    SetTextCentre(false)
    SetTextDropshadow(5.0, 35, 41, 37, 255)
    SetTextEdge(1, 0, 0, 0, 205)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.40, 0.00)
end

RegisterNetEvent('esx_jail:openmenu')
AddEventHandler('esx_jail:openmenu',function()
    local canopen = false
    local unjail = 0
    local coords = GetEntityCoords(PlayerPedId())
    for k , v in pairs(Config.CanJail) do
        local distance = GetDistanceBetweenCoords(coords,v.coords)
        if distance <= v.radius then
            canopen = true
            unjail = v.unjail
        end
    end
    if canopen then
        ESX.selectPlayerMenu(function(src)
            local id = src
            ESX.UI.Menu.Open(
                'dialog',
                GetCurrentResourceName(),
                'get_time',
                {
                    title = "time jail ra vared konid"
                },
                function(data2,menu2)
                    menu2.close()
                    if tonumber(data2.value) then
                        local time = tonumber(data2.value)
                        ESX.UI.Menu.Open(
                            'dialog',
                            GetCurrentResourceName(),
                            'get_reason',
                            {
                                title = "dalil jail ra vared konid"
                            },
                            function(data3,menu3)
                                menu3.close()
                                if data3.value then
                                    local reason = data3.value
                                    if GetPlayerName(GetPlayerFromServerId(id)) then
                                        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(id))), true) < 10.000 and ESX.Game.PlayerExist(id) then
                                            TriggerServerEvent("esx_jail:sendto",id,time,reason,unjail)
                                        end
                                    else
                                        ESX.ShowNotification('id eshtebah ast!!')
                                    end
                                end
                            end, function(data3,menu2)
                                menu3.close()
                            end)
                    end
                end, function(data2,menu2)
                    menu2.close()
                end)
        end)
    else
        ESX.ShowNotification('Shoma nemitavanid dar in makan kasi ro jail konid')
    end
end)

function createCam(coords, rotation)
    if cam ~= 0 then
        DestroyCam(cam, 0)
        cam = 0
    end

    cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
    SetCamCoord(cam, coords)
    SetCamRot(cam, rotation, 2)
    RenderScriptCams(true, false, 0, true, true)
    Wait(250)
end

function AddPropToPlayer(prop1, bone, off1, off2, off3, rot1, rot2, rot3, namies, player, network)
	local Player = nil
	if player ~= nil then
		Player = player
	else
		Player = PlayerPedId()
	end
	local x,y,z = table.unpack(GetEntityCoords(Player))
	ESX.requestModel(prop1)
    local prop
	if network then
		prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  true,  true, true)
		AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
		SetModelAsNoLongerNeeded(prop1)
	else
		prop = CreateObject(GetHashKey(prop1), x, y, z+0.2,  false,  true, true)
		AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
		SetModelAsNoLongerNeeded(prop1)
	end
    return prop
end

function playCutscene()
    stopThread = true
    cutscene = true
    CreateThread(function()
        exports['essentialmode']:disableallControl(true)
        exports['suncore']:SetPlayerVisible(false)
        while cutscene do
            Wait(0)
            DisableAllControlActions(0)
            SetPlayerVisibleLocally(PlayerId(), true)
        end
        exports['essentialmode']:disableallControl(false)
        exports['suncore']:SetPlayerVisible(true)
    end)
	local ped = PlayerPedId()
    DoScreenFadeOut(1000)
    RequestAnimDict('mp_character_creation@customise@male_a')
    Wait(3000)
    ESX.SetEntityCoords(ped, Config.cutscene.cuff)
    Wait(500)
    ESX.SetEntityCoords(ped, Config.cutscene.cuff)
    ESX.requestModel(Config.cutscene.guardModel)
    ESX.requestModel(Config.cutscene.clotheModel)
    ESX.Streaming.RequestAnimDict('mp_arresting')
    ESX.Streaming.RequestAnimDict('switch@trevor@escorted_out')
    TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
    SetEnableHandcuffs(ped, true)
    DisablePlayerFiring(ped, true)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    SetPedCanPlayGestureAnims(ped, false)
    FreezeEntityPosition(ped, true)
    local byped = ESX.Game.SpawnLocalPed(5, Config.cutscene.guardModel, Config.cutscene.guardCoords.xyz, Config.cutscene.guardCoords.w)
    PlaceObjectOnGroundProperly(byped)
    SetEntityAsMissionEntity(byped)
    SetPedDropsWeaponsWhenDead(byped, false)
    SetPedAsEnemy(byped, false)
    SetEntityInvincible(byped, true)
    Wait(500)
    AttachEntityToEntity(ped, byped, 11816, -0.06, 0.65, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    TaskPlayAnim(byped, 'switch@trevor@escorted_out', '001215_02_trvs_12_escorted_out_idle_guard2', 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    -- SetFocusPosAndVel(Config.cutscene.camCoords, Config.cutscene.camCoords)
    createCam(Config.cutscene.camCoords, Config.cutscene.camRot)
    DoScreenFadeIn(500)

    TaskGoStraightToCoord(byped, Config.cutscene.stopTurn.xyz, 1.0, 2500, Config.cutscene.stopTurn.w, 0)
    Wait(2500)
    TaskGoStraightToCoord(byped, Config.cutscene.enterCoords, 1.0, 2000, 160.0, 0)
    Wait(2000)
    TaskGoStraightToCoord(byped, Config.cutscene.clotheCoords2.xyz, 1.0, 3000, Config.cutscene.clotheCoords2.w, 0)
    Wait(3000)
    DetachEntity(ped, true, false)
    ClearPedSecondaryTask(ped)
    ClearPedSecondaryTask(byped)
    SetEnableHandcuffs(ped, false)
    DisablePlayerFiring(ped, false)
    SetPedCanPlayGestureAnims(ped, true)
    FreezeEntityPosition(ped, false)
    ESX.Streaming.RequestAnimDict('clothingtie')
    TaskGoStraightToCoord(byped, Config.cutscene.stopNLook.xyz, 1.0, 1500, 85.28, 0)
    Wait(2000)
    ESX.Streaming.RequestAnimDict('mp_prison_break')
    TaskGoStraightToCoord(byped, Config.cutscene.computerCoords.xyz, 1.0, 2000, Config.cutscene.computerCoords.w, 0)
    Wait(2000)
    TaskPlayAnim(byped, "mp_prison_break", "hack_loop", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
    TaskPlayAnim(ped, "clothingtie", "try_tie_positive_a", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
    ESX.Streaming.RequestAnimDict('anim@heists@prison_heistig1_p1_guard_checks_bus')
    Wait(2000)
    ClearPedTasksImmediately(ped)
    changeClothes()
    Wait(100)
    local _prop =  AddPropToPlayer('prop_police_id_board', 58868, 0.12, 0.24, 0.0, 5.0, 0.0, 70.0, 'enter', nil, false)

    TaskPlayAnim(byped, 'gestures@f@standing@casual', 'gesture_point', 8.0, 8.0, -1, 1, 1, 0, 0, 0)
    RemoveAnimDict('gestures@f@standing@casual')
    Wait(200)
    TaskGoStraightToCoord(ped, Config.cutscene.enterCoords, 1.0, 4000, Config.cutscene.enterHeadings.Front, 0)
    Wait(2000)
    ClearPedTasksImmediately(byped)
    TaskGoStraightToCoord(byped, Config.cutscene.computerCoords.xyz, 1.0, 2500, Config.cutscene.computerCoords.w, 0)
    Wait(2500)
    TaskPlayAnim(byped, "mp_prison_break", "hack_loop", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
    RemoveAnimDict('anim@heists@prison_heistig1_p1_guard_checks_bus')
    RemoveAnimDict('mp_prison_break')

    ESX.Streaming.RequestAnimDict('mp_character_creation@customise@male_a')

    TaskPlayAnim(ped, "mp_character_creation@customise@male_a", "loop", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
    FreezeEntityPosition(ped, true)

    Wait(5500)
    FreezeEntityPosition(ped, false)
    TaskAchieveHeading(ped, Config.cutscene.enterHeadings.Side, 3000)
    Wait(3000)
    TaskPlayAnim(ped, "mp_character_creation@customise@male_a", "loop", 8.0, 8.0, -1, 1, 1, 0, 0, 0)
    FreezeEntityPosition(ped, true)
    Wait(6000)
    FreezeEntityPosition(ped, false)
    ClearPedTasksImmediately(ped)
    RemoveAnimDict('mp_character_creation@customise@male_a')
    DeleteEntity(_prop)

    ClearPedTasksImmediately(byped)
    TaskGoStraightToCoord(byped, Config.cutscene.stopNLook.xyz, 1.0, 2000, Config.cutscene.stopNLook.w, 0)
    Wait(2000)
    TaskGoStraightToCoord(byped, Config.cutscene.grabCoords.xyz, 1.0, 5500, Config.cutscene.grabCoords.w, 0)
    TaskAchieveHeading(ped, 24.44, 5500)
    Wait(6000)
    TaskPlayAnim(ped, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
    RemoveAnimDict('mp_arresting')
    SetEnableHandcuffs(ped, true)
    DisablePlayerFiring(ped, true)
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    SetPedCanPlayGestureAnims(ped, false)
    FreezeEntityPosition(ped, true)
    Wait(500)
    AttachEntityToEntity(ped, byped, 11816, -0.06, 0.65, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    TaskPlayAnim(byped, 'switch@trevor@escorted_out', '001215_02_trvs_12_escorted_out_idle_guard2', 8.0, 1.0, -1, 49, 0, 0, 0, 0)
    Wait(500)
    TaskAchieveHeading(byped, 258.46, 1500)
    Wait(1500)
    TaskGoStraightToCoord(byped, Config.cutscene.walkCoords, 1.0, 5500, 100, 0)
    Wait(5500)
    DetachEntity(ped, true, false)
    ClearPedSecondaryTask(ped)
    ClearPedSecondaryTask(byped)
    SetEnableHandcuffs(ped, false)
    DisablePlayerFiring(ped, false)
    SetPedCanPlayGestureAnims(ped, true)
    FreezeEntityPosition(ped, false)

    DeleteEntity(byped)
    DoScreenFadeOut(1000)
    Wait(1000)
    RenderScriptCams(false, false, 0, 1, 0)
    DestroyCam(cam, false)
    -- SetFocusPosAndVel(Config.cutscene.camCoords2, Config.cutscene.camCoords2)
    createCam(Config.cutscene.camCoords2, Config.cutscene.camRot2)
    ESX.Game.Teleport(ped, Config.cutscene.spawnCoords2, function()
        local swat = ESX.Game.SpawnLocalPed(1, 's_m_y_swat_01', Config.cutscene.police2Coords.xyz, Config.cutscene.police2Coords.w)
        SetBlockingOfNonTemporaryEvents(swat, true)
        SetEntityHeading(swat, Config.cutscene.police2Coords.w)
        -- local bag = ESX.Game.SpawnLocalObject('prop_money_bag_01', GetEntityCoords(ped), nil, true)
        -- AttachEntityToEntity(bag, ped, GetPedBoneIndex(ped, 12844), 0.2, 0.04, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
        -- SetEntityCompletelyDisableCollision(bag, false, true)
        -- AttachEntityToEntity(ped, swat, 11816, -0.06, 0.65, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        -- TaskPlayAnim(swat, 'switch@trevor@escorted_out', '001215_02_trvs_12_escorted_out_idle_guard2', 8.0, 1.0, -1, 49, 0, 0, 0, 0)
        ESX.Game.SpawnLocalVehicle('riot', Config.cutscene.riotCoords.xyz, Config.cutscene.riotCoords.w, function(vehicle)
            local driver = ESX.Game.SpawnLocalPed(1, 's_m_y_swat_01', Config.cutscene.police2Coords.xyz, Config.cutscene.police2Coords.w)
            TaskWarpPedIntoVehicle(driver, vehicle, -1)
            SetBlockingOfNonTemporaryEvents(driver, true)
            SetPedRandomComponentVariation(driver, false)
            SetPedKeepTask(driver, true)
            SetVehicleEngineOn(vehicle, true, false, false)
            -- TaskGoStraightToCoord(swat, Config.cutscene.behindRiotCoords.xyz, 1.0, -1, Config.cutscene.behindRiotCoords.w, 0)
            -- TaskGoToCoordAnyMeans(swat, Config.cutscene.behindRiotCoords.xyz, 1.0)
            Wait(1000)
            -- TaskGoStraightToCoord(ped, Config.cutscene.behindRiotCoords.xyz, 1.0, 20000, Config.cutscene.behindRiotCoords.w, 0.5)
            -- TaskGoStraightToCoord(swat, Config.cutscene.behindRiotCoords.xyz, 1.2, 20000, Config.cutscene.behindRiotCoords.w, 0.5)
            -- Wait(10000)
            TaskEnterVehicle(ped, vehicle, 15000, 2, 1.0, 1, 0)
            TaskEnterVehicle(swat, vehicle, 15000, 6, 1.0, 1, 0)
            DoScreenFadeIn(500)
            SetTimeout(5000, function()
                createCam(Config.cutscene.camCoords3, Config.cutscene.camRot3)
            end)
            -- TaskGoToEntity(swat, vehicle, -1, 1.0, 1.0, 1073741824.0, 0)
            Wait(15000)
            TaskVehicleDriveWander(driver, vehicle, GetVehicleModelMaxSpeed(GetEntityModel(vehicle)), 447)
            Wait(5000)
            DoScreenFadeOut(500)
            Wait(1000)
            DeleteEntity(driver)
            DeleteEntity(vehicle)
            DeleteEntity(swat)
            DeleteEntity(driver)
            DetachEntity(ped, true, false)
            RenderScriptCams(false, false, 0, 1, 0)
            DestroyCam(cam, false)
            SetFocusEntity(GetPlayerPed(PlayerId()))
            stopThread = false
            cutscene = false
            Wait(1000)
            DoScreenFadeIn(500)
        end)
    end)
end