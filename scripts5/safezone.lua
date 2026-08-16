local World = 0
RegisterNetEvent('esx:changeworld')
AddEventHandler('esx:changeworld',function(world)
	World = world
end)

local inzone = 0
local Disable = false
local noJob = true
local hornActiveJob = {
    wash = true,
    resturan = true,
}
ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
    if ESX.militaryJobs2[ESX.PlayerData.job.name] then
        Disable = true
    end
    noJob = ESX.PlayerData.job.name == 'nojob' or ESX.PlayerData.job.name:find('off') or hornActiveJob[ESX.PlayerData.job.name]
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	if not ESX.militaryJobs2[ESX.PlayerData.job.name] then
        Disable = false
    else
        Disable = true
    end
    noJob = ESX.PlayerData.job.name == 'nojob' or ESX.PlayerData.job.name:find('off') or hornActiveJob[ESX.PlayerData.job.name]
end)



local zones = {
    -- parking
    { coords = vec(200.12, -918.37, 30.69),     radius = 400,   disableSpeedLimit = true  },  -- vasate shahr
    -- { coords = vec(230.38, -784.27, 30.69),     radius = 75,    disableSpeedLimit = true  },  -- Parking markazi
    { coords = vec(-283.54, -913.2, 31.09),     radius = 70,    disableSpeedLimit = true  },  -- Parking jobcenter
    -- jobs
    { coords = vec(1360.1, -737.9, 67.21),      radius = 70,    disableSpeedLimit = true  },  -- MC 1
    { coords = vec(678.22, 631.82, 128.91),     radius = 150,   disableSpeedLimit = false },  -- MC 2 new
    { coords = vec(139.15, -3031.66, 7.06),     radius = 23,    disableSpeedLimit = false },  -- MC tune
    { coords = vec(1228.05, 2721.11, 38.22),    radius = 33,    disableSpeedLimit = false },  -- MC sandy
    { coords = vec(1837.54, 3685.42, 34.19),    radius = 38,    disableSpeedLimit = true  },  -- SH sandy
    { coords = vec(1760.27, 3639.81, 34.84),    radius = 40,    disableSpeedLimit = true  },  -- Administrative
    { coords = vec(-577.22, -911.77, 23.87),    radius = 45,    disableSpeedLimit = true  },  -- WN 1
    { coords = vec(-827.53, -713.56, 39.96),    radius = 65,    disableSpeedLimit = true  },  -- WN 2
    { coords = vec(362.82, -1629.75, 32.53),    radius = 50,    disableSpeedLimit = true  },  -- TX 1
    { coords = vec(423.65, -1640.05, 29.29),    radius = 25,    disableSpeedLimit = true  },  -- TX 1 part #2
    { coords = vec(-378.33, 6067.15, 31.5),     radius = 40,    disableSpeedLimit = true  },  -- TX 3
    { coords = vec(-800.24, -1334.5, 5.0),      radius = 60,    disableSpeedLimit = true  },  -- TX 2
    { coords = vec(2544.91, -384.8, 92.99),     radius = 120,   disableSpeedLimit = true  }, -- Fbi new
    { coords = vec(-537.63, -217.69, 37.65),    radius = 50,    disableSpeedLimit = true  }, -- Fbi justic
    { coords = vec(-500.82, -282.22, 35.47),    radius = 70,    disableSpeedLimit = true  }, -- Fbi justic 2
    { coords = vec(1177.15, -1505.12, 34.69),   radius = 90,    disableSpeedLimit = true  }, -- MD 1
    { coords = vec(-1870.18, -351.58, 49.22),   radius = 65,    disableSpeedLimit = true  }, -- MD 2
    { coords = vec(-256.08, 6328.14, 32.99),    radius = 30,    disableSpeedLimit = true  }, -- md paleto
    { coords = vec(897.72, -1566.67, 30.83),    radius = 100,   disableSpeedLimit = true  }, -- minery
    { coords = vec(2955.26, 2787.55, 41.43),    radius = 100,   disableSpeedLimit = true  }, -- minery madan
    { coords = vec(-264.19, -2014.51, 30.15),   radius = 30,    disableSpeedLimit = true  }, -- Game Net

    { coords = vec(-1569.75, 5037.81, 49.56),   radius = 70,    disableSpeedLimit = true  }, -- PaintBall2
    { coords = vec(-1601, 5151.06, 18.04),      radius = 65,    mute = true, }, -- PaintBall
    { coords = vec(-3451.93, -3464.14, 466.37), radius = 100,   mute = true, }, -- Prison cs 
    { coords = vec(1690.8, 2591.14, 45.97),     radius = 140,   disableSpeedLimit = true  }, -- prison markazi
    { coords = vec(108.26, -1289.63, 28.86),    radius = 30,    disableSpeedLimit = true  }, -- Club 1
    { coords = vec(-1387.11, -618.29, 30.82),   radius = 30,    disableSpeedLimit = true  }, -- Club 2
    { coords = vec(-1623.03, -899.12, 8.99),    radius = 60,    disableSpeedLimit = false }, -- Car Delaer
    { coords = vec(-2006.99, 3203.83, -123.89), radius = 150,   disableSpeedLimit = true  }, -- Personal Home
    { coords = vec(-2000.47, 3194.46, 32.81),   radius = 55,    disableSpeedLimit = true  }, -- artesh

    { coords = vec(187.24, 1162.65, 225.59),    radius = 100,   disableSpeedLimit = true  }, -- mozayede

    { coords = vec(-580.42, -1065.09, 22.35),   radius = 70,    disableSpeedLimit = true  }, -- resturan gorbe
    { coords = vec(-1342.72, -1079.83, 6.94),   radius = 15,    disableSpeedLimit = true  }, -- resturan B
    { coords = vec(-1216.78, -1544.5, 4.7),     radius = 100,   disableSpeedLimit = true  }, -- gym

    { coords = vec(1128.26, -1813.16, 18.03),   radius = 270,   disableSpeedLimit = true  }, -- car mitting
    
}

local blacklist = {
    [95] = true,
    [96] = true,
    [97] = true,
    [99] = true,
}
Citizen.CreateThread(function()
    while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(0)
	end
    while true do 
        for k = 1 , #zones , 1 do
            local distance = Vdist(GetEntityCoords(PlayerPedId()),zones[k].coords)
            if distance < zones[k].radius and inzone == 0 and not blacklist[World] then
                inzone = k
                ESX.SetPlayerData('inNCZ',true)
                if zones[k].mute then
                    TriggerEvent('pma-voice:mutePlayer',true)
                end
            elseif inzone == k and (distance > zones[k].radius or blacklist[World]) then
                endzone()
                ESX.SetPlayerData('inNCZ',false)
                if zones[k].mute then
                    TriggerEvent('pma-voice:mutePlayer',false)
                end
                SetHornEnabled(GetVehiclePedIsIn(PlayerPedId()),true)
            end
            Wait(10)
        end

        Wait(1000)
    end
end)

Citizen.CreateThread(function()
    local tazer = `WEAPON_STUNGUN`
    local petrol = `WEAPON_PETROLCAN`
    while true do
        if inzone ~= 0 then
            Wait(1)
            if (not Disable or (ESX.PlayerData.job.name ~= 'fbi' and GetSelectedPedWeapon(PlayerPedId()) ~= tazer)) and GetSelectedPedWeapon(PlayerPedId()) ~= petrol and not LocalPlayer.state.globalInBox then
                DisableControlAction(0, 45, true)
                DisableControlAction(0, 24, true) -- Attack
                DisableControlAction(0, 257, true) -- Attack 2
                DisableControlAction(0, 25, true) -- Right click
                DisableControlAction(0, 264, true) -- Disable melee
                DisableControlAction(0, 257, true) -- Disable melee
                DisableControlAction(0, 140, true) -- Disable melee
                DisableControlAction(0, 141, true) -- Disable melee
                DisableControlAction(0, 142, true) -- Disable melee
                DisableControlAction(0, 143, true) -- Disable melee
                DisableControlAction(0, 263, true) -- Melee Attack 1
                DisableControlAction(0, 170, true) -- Melee Attack 1
                DisableControlAction(0, 69, true) -- Melee Attack 1
                DisableControlAction(0, 70, true)
                DisableControlAction(0, 92, true)
                if GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey("WEAPON_UNARMED") and GetSelectedPedWeapon(PlayerPedId()) ~= `OBJECT` then
                    SetCurrentPedWeapon(PlayerPedId(), GetHashKey("WEAPON_UNARMED"), true)
                    --ESX.Alert("No No!", "Shoma nemitavanid dar inja az aslahe estefade konid", 5000, 'error')
                end
            end
            if GetVehiclePedIsIn(PlayerPedId()) ~= 0 and GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId())) > 10.0 and not IsPedInAnyHeli(PlayerPedId()) and not (zones[inzone] and zones[inzone].disableSpeedLimit) then
                if inzone ~= 0 then
                    SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId()),10.0)
                    --SetHornEnabled(GetVehiclePedIsIn(PlayerPedId()),false)
                end
            end
            if GetVehiclePedIsIn(PlayerPedId()) ~= 0 and noJob then
                SetHornEnabled(GetVehiclePedIsIn(PlayerPedId()),false)
            end
        else
            Wait(1000)
        end
    end
end)

function endzone()
    inzone = 0 
    --TriggerEvent('dpemote:enable',true)
    Wait(1000)
    if GetVehiclePedIsIn(PlayerPedId()) ~= 0 then
        maxSpeed = GetVehicleHandlingFloat(GetVehiclePedIsIn(PlayerPedId()),"CHandlingData","fInitialDriveMaxFlatVel")
        SetEntityMaxSpeed(GetVehiclePedIsIn(PlayerPedId()),maxSpeed)
    end
end
