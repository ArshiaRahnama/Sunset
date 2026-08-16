ESX = nil
local SpawnedRockes = 0
local golds = 0
local irons = 0
local Melting = false
local PlayerData = {}
local Rocks = {}
local price = {}
local JobBlips = {}
local IsMiner = false
local IsDuty = true
local frist = true
local vehplate = nil
local vehicleMaxHealth = nil
local spawnCD = false
local firstLocationBlip = 0
local RocksObject = {
    'prop_rock_1_a',
    'prop_rock_1_e',
    'prop_rock_1_c'
}

local Config = {
    StartField = {
        Locker = vector3(925.54, -1560.19, 29.74),  --
        Veh    = vector3(922.26, -1556.8, 29.78), -- 
        Spawn  = { c = vector3(910.69, -1565.42, 30.79), h = 92.3 }, --   
        Delete = vector3(902.57, -1566.37, 29.82)  --     
    },
    RockField = {
        coords = vector3(2953.44, 2792.82, 40.31)
    },
    WashField = {
        { coords = vector3(318.40, 2864.33, 42.52), h = 119.45 },
        { coords = vector3(306.97, 2884.08, 42.46), h = 114.08 },
        { coords = vector3(312.68, 2875.18, 42.50), h = 115.84 }
    },
    MeltingField = {
        { coords = vector3(1109.52, -2013.08, 34.45) ,task = { c = vector3(1110.0, -2012.42, 35.44), h = 324.77 } },
        { coords = vector3(1114.24, -2006.08, 34.44) ,task = { c = vector3(1113.89, -2006.54, 35.44),h = 144.92 } }
    },
    ISSell = {
        coords = vector3(2473.81,1489.99,35.2)    -- Ahan                 -91.54, -1029.71, 26.83
    },
    DGSell = {
        coords = vector3(2674.63,3506.55,51.72)    -- javaheri                 -620.57, -228.36, 37.06
    },
    SSell = {
        coords = vector3(2486.46,1557.34,31.91)  -- Ajoor               -149.11, -1040.24, 26.27
    }
}

function OpenCloakroomMenu()
    exports['esx_jobs']:openMenu('miner')
end


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    
    ESX.TriggerServerCallback('getMiningPrices', function(data)
        price = data
    end)
    ESX.RegisterPoint(Config.StartField.Locker,2,{
        Color = {R = 42,G = 255,B = 0,A = 255},
        DrawDistance = 20,
        Radius = 0.5,
        Type = 27
    },{
        Notification = nil,
        DrawText = 'Dokme ~INPUT_CONTEXT~ jahat baz kardan menu job',
        DrawTextRadius = 4,
        DrawTextCoords = vector3(Config.StartField.Locker.x,Config.StartField.Locker.y,Config.StartField.Locker.z + 1),
        Key = 'e',
        CB = function()
            OpenCloakroomMenu()
        end,
    },{
        In = nil,
        Out = ESX.UI.Menu.CloseAll
    })	
    CreateBlip(Config.StartField.Locker, 'Vasayele Mining',true)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:inJob')
AddEventHandler('esx:inJob', function(name,injob)
    if name == 'miner' and not IsMiner then
        IsMiner = true
        TirggerMinerCitizen()
    else
        for _,v in pairs(JobBlips) do
            RemoveBlip(v)
        end
        IsMiner = false
    end
end)


function SpawRocks()
    repeat
        GenerateRockCoords(function(rockCoords)
            ESX.Game.SpawnLocalObject(RocksObject[math.random(1,3)], rockCoords, function(obj)
                PlaceObjectOnGroundProperly(obj)
                FreezeEntityPosition(obj, true)
                table.insert(Rocks, {object = obj, health = 100})
                SpawnedRockes = SpawnedRockes + 1
            end)
        end)
    until SpawnedRockes > 9
end

function GenerateRockCoords(cb)
    local coord
    repeat
		Citizen.Wait(1)

		local rockCoordX, rockCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-35, 35)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-35, 35)

		rockCoordX = Config.RockField.coords.x + modX
		rockCoordY = Config.RockField.coords.y + modY
		
		
		local coordZ = GetCoordZ(rockCoordX, rockCoordY)
		coord = vector3(rockCoordX, rockCoordY, coordZ)

	until ValidateRockCoord(coord)
    cb(coord)
end

function GetCoordZ(x, y)
	local groundCheckHeights = { 35.0, 36.0, 37.0, 38.0, 39.0, 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0 ,55.0, 56.0, 57.0 }

	for i, height in ipairs(groundCheckHeights) do
		local foundGround, z = GetGroundZFor_3dCoord(x, y, height)

		if foundGround then
			return z
		end
	end
	return 45.0
end

function HitReward()
    local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
    local kamy = GetHashKey('rubble')
    local isVehicleKamy = IsVehicleModel(vehicle, kamy)
    if isVehicleKamy and DoesEntityExist(vehicle) then
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), GetEntityCoords(vehicle), true) < 60 then
            local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
            if ESX.inRealWorld() then
                ESX.TriggerServerEvent('mining:PutStoneInVehicle', plate,ESX.GetPlayerData().isvip)
            end
        else
            ESX.ShowNotification('Lotfan Mashine Khodeton Ro Nazdik Tar Biyarid')
        end
    else
        ESX.ShowNotification('Shoma Ba Khodeton Kamion Nayavordid')
    end
end



function ValidateRockCoord(rockCoord)
	if SpawnedRockes > 0 then
		local validate = true

		for k, v in pairs(Rocks) do
			if GetDistanceBetweenCoords(rockCoord, GetEntityCoords(v.object), true) < 6 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(rockCoord, Config.RockField.coords, false) > 70 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function loadModel(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

function loadDict(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

function OpenShop(selling)
	ESX.UI.Menu.CloseAll()
	local elements = {}
    local temp     = {}
    for k, v in pairs(ESX.GetPlayerData().inventory) do
            if price[v.name] ~= nil then
                if v.count > 0 then
                    table.insert(temp, {
                        label = ('%s - <span style="color:green;">%s</span>'):format(v.label, '$'..ESX.Math.GroupDigits(price[v.name])),
                        name = v.name,
                        price = price[v.name],

                        -- menu properties
                        type = 'slider',
                        value = 1,
                        min = 1,
                        max = v.count
                    })
                end
            end
	end

    for k,v in pairs(temp) do
        for i=1, #selling do
            if v.name == selling[i] then
                table.insert(elements, v)
            end
        end
    end

    if #elements == 0 then
        ESX.ShowNotification('Shoma Mahsoli Baraye Forosh nadarid')
        return
    end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = 'Mining Shop',
		align    = 'top-left',
		elements = elements
	}, function(data, menu)
        if ESX.inRealWorld() then
            ESX.TriggerServerEvent('mining:sell', data.current.name, data.current.value,ESX.GetPlayerData().isvip)
            OpenShop(selling)
        end
	end, function(data, menu)
		menu.close()
    end)
    Citizen.CreateThread(function()
        local coords = GetEntityCoords(PlayerPedId())
        while true do
            local distance = ESX.GetDistance(coords,GetEntityCoords(PlayerPedId()))
            if distance >= 3 then
                ESX.UI.Menu.CloseAll()
                break
            end
            Wait(1000)
        end
    end)
end



RegisterNetEvent('mining:getPrice')
AddEventHandler('mining:getPrice', function(data)
    price = data
end)

RegisterNetEvent('mining:CallbackOnMelting')
AddEventHandler('mining:CallbackOnMelting', function(event)
    if event == 'skipgold' then
        golds = 0
    else
        irons = 0
    end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(Rocks) do
			SetEntityAsMissionEntity(v.object, false, true)
			DeleteObject(v.object)
        end
        for _,v in pairs(JobBlips) do
            RemoveBlip(v)
        end
	end
end)

function CreateBlip(coords, name,nakon)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite  (blip, 318)
    SetBlipDisplay (blip, 4)
    SetBlipScale   (blip, 1.2)
    SetBlipCategory(blip, 3)
    SetBlipColour  (blip, 5)
    SetBlipAsShortRange(blip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)
    if not nakon then
        table.insert(JobBlips, blip)
    else
        firstLocationBlip = blip
    end
end

function TirggerMinerCitizen()
    Wait(1000)

    Citizen.CreateThread(function()
        for _,v in pairs(JobBlips) do
            RemoveBlip(v)
        end
        CreateBlip(Config.StartField.Locker, 'Vasayele Mining')
        CreateBlip(Config.RockField.coords, 'Madane Sang')
        CreateBlip(Config.WashField[1].coords, 'Shososho Va Qarbale Sangha')
        CreateBlip(Config.MeltingField[1].coords, 'Zoob Tala va Ahan')
        CreateBlip(Config.ISSell.coords, 'Foroshe Shemshe Ahan')
        CreateBlip(Config.DGSell.coords, 'Foroshe Shemshe Tala va Almas')
        CreateBlip(Config.SSell.coords, 'Foroshe Sang')
    end)
    local menuopen = false
    -- Citizen.CreateThread(function()
    --     while IsMiner do
    --         Citizen.Wait(0)
    --         local coords = GetEntityCoords(PlayerPedId())
    --         DrawMarker(1, Config.StartField.Locker, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 255, 0, 100, false, true, 2, false, false, false, false)
    --         if GetDistanceBetweenCoords(coords, Config.StartField.Locker, true) < 1.5 then
    --             ESX.ShowHelpNotification('~INPUT_CONTEXT~ Locker Room')
    --             if IsControlJustReleased(0, 38) then
    --                 OpenCloakroomMenu()
    --                 menuopen = true
    --             end
    --         elseif menuopen then
    --             menuopen = false
    --             ESX.UI.Menu.CloseAll()
    --         end
    --     end
    -- end)

    Citizen.CreateThread(function()
        while IsMiner do
            Citizen.Wait(0)
            local coords = GetEntityCoords(PlayerPedId())
            -- wash
            if IsDuty then
                if GetDistanceBetweenCoords(coords, Config.WashField[1].coords, true) < 70 then
                    for k,v in pairs(Config.WashField) do
                        DrawMarker(1, v.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 1.0, 255, 255, 0, 100, false, true, 2, false, false, false, false)
                        if GetDistanceBetweenCoords(coords, v.coords, true) < 3.0 then
                            local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                            local kamy = GetHashKey('rubble')
                            local isVehicleKamy = IsVehicleModel(vehicle, kamy)
                            if isVehicleKamy and DoesEntityExist(vehicle) then
                                ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to start wash.')
                                if IsControlJustReleased(0, 38) and ESX.inRealWorld() then
                                    local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                                    ESX.TriggerServerEvent('mining:WashStonePieces', plate,ESX.GetPlayerData().isvip)
                                    SetEntityHeading(vehicle, v.h)
                                    TaskLeaveVehicle(GetPlayerPed(-1), vehicle, 0)
                                    SetVehicleDoorsLocked(vehicle, 2)
                                    FreezeEntityPosition(vehicle, true)
                                    ESX.ShowNotification('Lotfan Chand Daqiqe Baraye Gharbale Sangha Sabr konid')
                                    --SetVehicleNumberPlateText(vehicle, 'XDDDD')
                                    SetTimeout(15000, function()
                                        SetVehicleDoorsLocked(vehicle, 1)
                                        FreezeEntityPosition(vehicle, false)
                                        ESX.ShowNotification('Shoma Aknon mitavanid Mashine Khodeton Ro Bardarid')
                                    --	SetVehicleNumberPlateText(vehicle, plate)
                                    end)
                                end
                            end
                        end
                    end
                elseif GetDistanceBetweenCoords(coords, Config.MeltingField[1].coords, true) < 70 then
                    for k,v in pairs(Config.MeltingField) do
                        DrawMarker(1, v.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 255, 0, 100, false, true, 2, false, false, false, false)
                        if GetDistanceBetweenCoords(coords, v.coords, true) < 1.5 then
                            ESX.ShowHelpNotification('~INPUT_CONTEXT~ Amaliyate Zoob')
                            if IsControlJustReleased(0, 38) and ESX.inRealWorld() then
                                TaskGoStraightToCoord(GetPlayerPed(-1), v.task.c, 1.0, 5000, 140.01, 0)
                                Wait(1000)
                                TaskAchieveHeading(GetPlayerPed(-1), v.task.h, 1000)
                                Wait(1000)
                                FreezeEntityPosition(GetPlayerPed(-1), true)
                                exports['essentialmode']:disablecontrol('x',true)
                                local dict = loadDict("random@mugging4")
                                TaskPlayAnim(PlayerPedId(), dict, "struggle_loop_b_thief", 8.0, -8.0, -1, 2, 0, false, false, false)
                                Melting = true
                                local msg = 'Amaliyate Zoob Be Payan Resid'
                                local PlayerData = ESX.GetPlayerData()
                                ironss = 0
                                goldss = 0
                                for i=1, #PlayerData.inventory do
                                    if PlayerData.inventory[i].name == 'gold_piece' then
                                        golds = PlayerData.inventory[i].count
                                    elseif PlayerData.inventory[i].name == 'iron_piece' then
                                        irons = PlayerData.inventory[i].count
                                    elseif PlayerData.inventory[i].name == 'iron' then
                                        ironss = PlayerData.inventory[i].count
                                    elseif PlayerData.inventory[i].name == 'gold' then
                                        goldss = PlayerData.inventory[i].count
                                    end
                                end
                                if not (golds >= 20 or irons >= 20) then msg = 'Shoma Tala ya Ahan Be Mizane Kafi nadarid, Hade Aqal tedade morede niyaz: 20' Melting = false end
                                if goldss >= 20 or ironss >= 20 then msg = 'jib shoma por ast' Melting = false end
                                while Melting do
                                    FreezeEntityPosition(GetPlayerPed(-1), true)
                                    Wait(5000)
                                    if golds >= 20 then
                                        ESX.TriggerServerEvent('mining:MeltItems', 'gold_piece',ESX.GetPlayerData().isvip)
                                        golds = golds - 20
                                    elseif irons >= 20 then
                                        ESX.TriggerServerEvent('mining:MeltItems', 'iron_piece',ESX.GetPlayerData().isvip)
                                        irons = irons - 20
                                    else
                                        Melting = false
                                    end
                                end
                                FreezeEntityPosition(GetPlayerPed(-1), false)
                                ClearPedTasksImmediately(GetPlayerPed(-1))
                                exports['essentialmode']:disablecontrol('x',false)
                                ESX.ShowNotification(msg)
                            end
                        end
                    end
                elseif GetDistanceBetweenCoords(coords, Config.RockField.coords, true) < 70 and SpawnedRockes < 10 then
                    SpawRocks()
                    Citizen.Wait(500)
                elseif GetDistanceBetweenCoords(coords, Config.ISSell.coords, true) < 70 then
                    DrawMarker(1, Config.SSell.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 3.0, 3.0, 2.0, 255, 255, 0, 100, false, true, 2, false, false, false, false)
                    DrawMarker(1, Config.ISSell.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 255, 0, 100, false, true, 2, false, false, false, false)
                    if GetDistanceBetweenCoords(coords, Config.ISSell.coords, true) < 1.5 then
                        ESX.ShowHelpNotification('~INPUT_CONTEXT~ Menu Forosh')
                        if IsControlJustReleased(0, 38) then
                            OpenShop({'iron'})
                        end
                    elseif GetDistanceBetweenCoords(coords, Config.SSell.coords, true) < 3 then
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        if DoesEntityExist(vehicle) then
                            ESX.ShowHelpNotification('~INPUT_CONTEXT~ Menu Forosh ')
                            if IsControlJustReleased(0, 38) and ESX.inRealWorld() then
                                local plate = ESX.Math.Trim(GetVehicleNumberPlateText(vehicle))
                                ESX.TriggerServerEvent('mining:SellStone', plate,ESX.GetPlayerData().isvip)
                            end
                        end
                    end
                elseif GetDistanceBetweenCoords(coords, Config.DGSell.coords, true) < 70 then
                    DrawMarker(1, Config.DGSell.coords, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 255, 0, 100, false, true, 2, false, false, false, false)
                    if GetDistanceBetweenCoords(coords, Config.DGSell.coords, true) < 1.5 then
                        ESX.ShowHelpNotification('~INPUT_CONTEXT~ Menu Forosh ')
                        if IsControlJustReleased(0, 38) then
                            OpenShop({'gold','diamond'})
                        end
                    end
                elseif GetDistanceBetweenCoords(coords, Config.StartField.Locker, true) < 70 then
                    DrawMarker(1, Config.StartField.Veh, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 255, 0, 100, false, true, 2, false, false, false, false)
                    DrawMarker(1, Config.StartField.Delete, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, 255, 0, 0, 100, false, true, 2, false, false, false, false)
                    if GetDistanceBetweenCoords(coords, Config.StartField.Veh, true) < 1.5 then
                        ESX.ShowHelpNotification('~INPUT_CONTEXT~ Spawn Vehicle')
                        if IsControlJustReleased(0, 38) then
                            Wait(500)
                            if not spawnCD then 
                                spawnCD = true
                                SetTimeout(10000,function()
                                    spawnCD = false
                                end)
                                if ESX.Game.IsSpawnPointClear(Config.StartField.Spawn.c, 6.0) then
                                    if not ESX.getVehicleFromPlate('M' .. ESX.GetPlayerData().rawid) then
                                        ESX.Game.SpawnVehicle('rubble', Config.StartField.Spawn.c, Config.StartField.Spawn.h, function(vehicle)
                                            DecorSetBool(vehicle,"JobCenter",true)
                                            TaskWarpPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
                                            ESX.setVehicleFuel(vehicle, 100.0)
                                            --local plate = 'MINE' .. math.random(1000, 9999)
                                            local plate = 'M' .. ESX.GetPlayerData().rawid
                                            --TriggerEvent("jobcarlock:setplate",plate)
                                            SetVehicleNumberPlateText(vehicle, plate)
                                            TriggerEvent('esx:createvehiclekey')
                                            Citizen.CreateThread(function()
                                            Citizen.Wait(2000)
                                            ESX.setVehicleFuel(vehicle, 100.0)
                                            end)
                                            vehplate = plate
                                            TriggerServerEvent('esx_jobs:cautionss2', 'take')
                                        end)
                                    else
                                        ESX.ShowNotification('Shoma ghablan yek mashin gereftid!')
                                    end
                                end
                            end
                        end
                    elseif GetDistanceBetweenCoords(coords, Config.StartField.Delete, true) < 3.0 then
                        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                        local kamy = GetHashKey('rubble')
                        local isVehicleKamy = IsVehicleModel(vehicle, kamy)
                        if isVehicleKamy and DoesEntityExist(vehicle) then
                            ESX.ShowHelpNotification('~INPUT_CONTEXT~ Delete Vehicle')
                            if IsControlJustReleased(0, 38) and ESX.inRealWorld() then
                                TriggerEvent('esx_carlock:addCarLock', VehToNet(vehicle), false)
                                if ESX.Math.Trim(GetVehicleNumberPlateText(vehicle)) == ESX.Math.Trim('M' .. ESX.GetPlayerData().rawid) then
                                    TriggerServerEvent('esx_jobs:cautionss2', "give_back")
                                    vehicleMaxHealth  = nil
                                end
                                ESX.Game.DeleteVehicle(vehicle)
                            end
                        end
                    end
                end
            else
                Wait(500)
            end
        end
    end)

    Citizen.CreateThread(function()
        while IsMiner do
            Citizen.Wait(0)
            if IsDuty then
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)
                local nearbyObject, nearbyID
    
                for i=1, #Rocks, 1 do
                    if GetDistanceBetweenCoords(coords, GetEntityCoords(Rocks[i].object), false) < 3 then
                        nearbyObject, nearbyID = Rocks[i].object, i
                    end
                end
    
                if nearbyObject and IsPedOnFoot(playerPed) and not IsPedUsingAnyScenario(playerPed) then
                    ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to start mine.')
                    if IsControlJustReleased(0, 38) then
                        mining = true
                        TaskTurnPedToFaceEntity(PlayerPedId(), nearbyObject, 0.5)
                        FreezeEntityPosition(PlayerPedId(), true)
                        --local axe = ESX.Game.SpawnObject('prop_tool_pickaxe', GetEntityCoords(PlayerPedId()))
                        --Wait(500)
                        --AttachEntityToEntity(axe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, false, true, 0, true)
                        exports["essentialmode"]:disableallControl(true)
                        while mining do
                            Wait(0)
                            SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'))
                            ESX.ShowHelpNotification('Press ~INPUT_ATTACK~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.')
                            DisableControlAction(0, 24, true)
                            DisableControlAction(0, 73, true)
                            DisableControlAction(0, 288, true)
                            DisableControlAction(0, 289, true)
                            DisableControlAction(0, 170, true)
                            if IsDisabledControlJustReleased(0, 24) then
                                local dict = loadDict('melee@hatchet@streamed_core')
                                TaskPlayAnim(PlayerPedId(), dict, 'plyr_rear_takedown_b', 8.0, -8.0, -1, 2, 0, false, false, false)
                                Wait(1000)
                                Rocks[nearbyID].health = Rocks[nearbyID].health - 10 
                                ClearPedTasks(PlayerPedId())
                                TaskTurnPedToFaceEntity(PlayerPedId(), nearbyObject, 0.5)
                                Wait(1000)
                                FreezeEntityPosition(PlayerPedId(), true)
                                HitReward()
                                if Rocks[nearbyID].health <= 0 then
                                    SpawnedRockes = SpawnedRockes - 1
                                    --ESX.Game.DeleteLocalObject(Rocks[nearbyID].object)
                                    SetEntityAsMissionEntity(Rocks[nearbyID].object, false, true)
                                    DeleteObject(Rocks[nearbyID].object)
                                    table.remove(Rocks, nearbyID)
                                    break
                                end
                            elseif IsControlJustReleased(0, 194) then
                                break
                            end
                        end
                        exports["essentialmode"]:disableallControl(false)
                        ClearPedTasks(PlayerPedId())
                        FreezeEntityPosition(PlayerPedId(), false)
                        mining = false
                        ESX.Game.DeleteObject(axe)
                    end
                end
            else
                Wait(500)
            end
        end
    end)
end
local tOut = 0
AddEventHandler('startJob',function(name)
    if name == 'miner' then
        SetNewWaypoint(GetBlipCoords(firstLocationBlip).xy)
        SetBlipAsShortRange(firstLocationBlip,false)
        exports.sunset_helper:LoadNotif({title = 'پوشیدن لباس', text = "به این مکان بروید (پین شده در نقشه)، سپس لباس شغل خود را بپوشید", picture = 'https://cdn.discordapp.com/attachments/819575527588757558/923014142066032680/Untitled.png'})
        ESX.ClearTimeout(tOut)
        tOut = ESX.SetTimeout(15000,function()
			exports.sunset_helper:UnLoadNotif()
		end)
    else
        SetBlipAsShortRange(firstLocationBlip,true)
    end
end)