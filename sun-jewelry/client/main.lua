holdingup = false
holdingup2 = false
kodoum = 0
local canPickup = false
local store = ""
local blipRobbery = nil
local vetrineRotte = 0 
local realworld  = true
RegisterNetEvent('esx:changeworld')
AddEventHandler('esx:changeworld',function(world)
	if world == 0 then
		realworld = true
	else
		realworld = false
	end
end)

local vetrine = {
	{x = 147.085, y = -1048.612, z = 29.346, heading = 70.326, isOpen = false},--
	{x = -626.735, y = -238.545, z = 38.057, heading = 214.907, isOpen = false},--
	{x = -625.697, y = -237.877, z = 38.057, heading = 217.311, isOpen = false},--
	{x = -626.825, y = -235.347, z = 38.057, heading = 33.745, isOpen = false},--
	{x = -625.77, y = -234.563, z = 38.057, heading = 33.572, isOpen = false},--
	{x = -627.957, y = -233.918, z = 38.057, heading = 215.214, isOpen = false},--
	{x = -626.971, y = -233.134, z = 38.057, heading = 215.532, isOpen = false},--
	{x = -624.433, y = -231.161, z = 38.057, heading = 305.159, isOpen = false},--
	{x = -623.045, y = -232.969, z = 38.057, heading = 303.496, isOpen = false},--
	{x = -620.265, y = -234.502, z = 38.057, heading = 217.504, isOpen = false},--
	{x = -619.225, y = -233.677, z = 38.057, heading = 213.35, isOpen = false},--
	{x = -620.025, y = -233.354, z = 38.057, heading = 34.18, isOpen = false},--
	{x = -617.487, y = -230.605, z = 38.057, heading = 309.177, isOpen = false},--
	{x = -618.304, y = -229.481, z = 38.057, heading = 304.243, isOpen = false},--
	{x = -619.741, y = -230.32, z = 38.057, heading = 124.283, isOpen = false},--
	{x = -619.686, y = -227.753, z = 38.057, heading = 305.245, isOpen = false},--
	{x = -620.481, y = -226.59, z = 38.057, heading = 304.677, isOpen = false},--
	{x = -621.098, y = -228.495, z = 38.057, heading = 127.046, isOpen = false},--
	{x = -623.855, y = -227.051, z = 38.057, heading = 38.605, isOpen = false},--
	{x = -624.977, y = -227.884, z = 38.057, heading = 48.847, isOpen = false},--
	{x = -624.056, y = -228.228, z = 38.057, heading = 216.443, isOpen = false},--
}

local vetrine2 = {
    {x = 2748.02, y = 3488.15, z = 56.36, heading = 149.24, isOpen = false},--vec(, , , )
    {x = 2744.06, y = 3487.89, z = 56.36, heading = 64.53,  isOpen = false},--vec(, , , )
    {x = 2741.4,  y = 3486.82, z = 56.36, heading = 324.43, isOpen = false},--vec(, , , )
    {x = 2740.08, y = 3489.28, z = 56.36, heading = 246.74, isOpen = false},--vec(, , , )
    {x = 2738.29, y = 3482.12, z = 55.69, heading = 245.9,  isOpen = false},--vec(, , , )
    {x = 2740.14, y = 3481.51, z = 55.69, heading = 70.23,  isOpen = false},--vec(, , , )
    {x = 2736.66, y = 3473.01, z = 55.69, heading = 63.28,  isOpen = false},--vec(, , , )
    {x = 2734.89, y = 3473.62, z = 55.69, heading = 250.07, isOpen = false},--vec(, , , )
    {x = 2733.36, y = 3467.62, z = 56.36, heading = 162.44, isOpen = false},--vec(, , , )
    {x = 2734.69, y = 3465.06, z = 56.36, heading = 58.6,   isOpen = false},--vec(, , , )
    {x = 2730.62, y = 3466.53, z = 56.36, heading = 253.5,  isOpen = false},--vec(, , , )
    {x = 2736.39, y = 3488.77, z = 56.36, heading = 163.73, isOpen = false},--vec(, , , )
    {x = 2746.84, y = 3485.18, z = 56.36, heading = 333.34, isOpen = false},--vec(, , , )
    {x = 2748.82, y = 3486.07, z = 56.36, heading = 68.32,  isOpen = false},--vec(, , , )
    {x = 2746.03, y = 3487.11, z = 56.36, heading = 251.55, isOpen = false},--vec(, , , )
    {x = 2738.39, y = 3464.91, z = 56.36, heading = 3159.7, isOpen = false},--vec(, , , )
    {x = 2739.22, y = 3462.92, z = 56.36, heading = 65.3,   isOpen = false},--vec(, , , )
    {x = 2737.28, y = 3462.09, z = 56.36, heading = 344.33, isOpen = false},--vec(, , , )
    {x = 2736.41, y = 3464.03, z = 56.36, heading = 246.25, isOpen = false},--vec(, , , )
    {x = 2728.65, y = 3469.67, z = 56.36, heading = 344.19, isOpen = false},--vec(, , , )
}

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

function DrawText3D(x, y, z, text, scale)
	local onScreen, _x, _y = World3dToScreen2d(x, y, z)
	local pX, pY, pZ = table.unpack(GetGameplayCamCoords())

	SetTextScale(scale, scale)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextEntry("STRING")
	SetTextCentre(1)
	SetTextColour(255, 255, 255, 215)

	AddTextComponentString(text)
	DrawText(_x, _y)

end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent("mt:missiontext")
AddEventHandler("mt:missiontext", function(text, time)
    ClearPrints()
    SetTextEntry_2("STRING")
    AddTextComponentString(text)
    DrawSubtitleTimed(time, 1)
end)

function loadAnimDict( dict )  
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end 

RegisterNetEvent('jewelry:currentlyrobbing')
AddEventHandler('jewelry:currentlyrobbing', function(robb)
	store = robb
	if robb == "jewelry" then
		holdingup = true
	else
		holdingup2 = true
	end
end)

RegisterNetEvent('jewelry:killblip')
AddEventHandler('jewelry:killblip', function()
    RemoveBlip(blipRobbery)
end)

RegisterNetEvent('jewelry:setblip')
AddEventHandler('jewelry:setblip', function(position)
	RemoveBlip(blipRobbery)
	Wait(1000)
    blipRobbery = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery , 161)
    SetBlipScale(blipRobbery , 2.0)
    SetBlipColour(blipRobbery, 3)
    PulseBlip(blipRobbery)
	SetTimeout(30 * 60 * 1000,function()
		RemoveBlip(blipRobbery)
	end)
end)

RegisterNetEvent('jewelry:toofarlocal')
AddEventHandler('jewelry:toofarlocal', function(robb)
	if store == "jewelry" then
		holdingup = false
	else
		holdingup2 = false
	end
	ESX.ShowNotification(_U('robbery_cancelled'))
	robbingName = ""
	incircle = false
end)


RegisterNetEvent('jewelry:robberycomplete')
AddEventHandler('jewelry:robberycomplete', function(robb)
	if store == "jewelry" then
		holdingup = false
	else
		holdingup2 = false
	end
	ESX.ShowNotification(_U('robbery_complete'))
	store = ""
	incircle = false
	vetrineRotte = 0
end)

Citizen.CreateThread(function()
	for k,v in pairs(Stores)do
		local ve = v.position

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 617)
		SetBlipScale(blip, 0.9)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(_U('shop_robbery'))
		EndTextCommandSetBlipName(blip)
	end
end)

animazione = false
incircle = false
soundid = GetSoundId()

function drawTxt(x, y, scale, text, red, green, blue, alpha)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(0.64, 0.64)
	SetTextColour(red, green, blue, alpha)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
    DrawText(0.155, 0.935)
end

local borsa = nil
local coolDown = false
Citizen.CreateThread(function()
      
	while true do
		local pos = GetEntityCoords(GetPlayerPed(-1), true)
		local canSleep = true
		for k,v in pairs(Stores)do
			local pos2 = v.position

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0) and realworld then
				if not holdingup and not holdingup2 then
					DrawMarker(27, v.position.x, v.position.y, v.position.z-0.9, 0, 0, 0, 0, 0, 0, 2.001, 2.0001, 0.5001, 255, 0, 0, 200, 0, 0, 0, 0)
					canSleep = false
					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							DisplayHelpText(_U('press_to_rob'))
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							if coolDown then 
								ESX.Alert('Error','Spam nakonid!',5000,'error') 
							else
								coolDown = true
								Citizen.SetTimeout(10 * 1000,function()
									coolDown = false
								end)
								local selfid = GetPlayerServerId(PlayerId())
								Wait(math.random(1000, 4000))
								ESX.TriggerServerCallback('Party:GetParty', function(index,data)
									if index[selfid] then
											local ind = index[selfid]
											local partydata = data[ind]
											local nearparty = 0
											for k , v in pairs(partydata) do 
												if ESX.Game.PlayerExist(k) then
													local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(k))))
													if distance <= 50 then
														nearparty = nearparty + 1
													end
												end
											end
											if nearparty >= Config.PartyNeed then
												if k == "jewelry" then
													Wait(math.random(100, 1000))
													ESX.TriggerServerCallback('rob:getall2', function(jobs)
														local check = jobChecks.javaheri1
														if (not check.mt or jobs.mt >= check.mt) and (not check.all or jobs.all >= check.all) and (not check.police or jobs.police >= check.police) then
															ESX.TriggerServerCallback('rob:getcd', function(data,canrob)
																if not data.javaheri1.cooldown then
																	--if canrob then
																		ESX.TriggerServerCallback('sunset_lifeinvader:removerasp', function(istrue)
																			if istrue == false then
																				ESX.ShowNotification('shoma tablet nadarid') 
																			else
																				TriggerServerEvent('jewelry:rob', k,180000)
																				ClearPedTasks(GetPlayerPed(-1))
																				LoadAnim('mp_fbi_heist')
																				ESX.SetEntityCoords(GetPlayerPed(-1), -630.94, -229.67, 38.06, false, false, false, false)
																				SetEntityHeading(GetPlayerPed(-1), 198.8)
																				TaskPlayAnim(GetPlayerPed(-1), 'mp_fbi_heist', 'loop', 2.0, 2.0, -1, 1, 0, false, false, false)
																				ESX.SetPlayerState('jewerlyRobbery',true)
																				FreezeEntityPosition(PlayerPedId(), true)
																				canPickup = false
																				SetTimeout(450000, function()
																					canPickup = true
																				end)
																				CreateThread(function()
																					while not canPickup do
																						Wait(0)
																						FreezeEntityPosition(PlayerPedId(), true)
																					end
																					Wait(1000)
																					FreezeEntityPosition(PlayerPedId(), false)
																				end)
																				if lib.progressCircle({
																					duration = 450 * 1000,
																					position = 'bottom',
																					useWhileDead = false,
																					canCancel = false,
																					disable = {
																						car = true,
																						move = true,
																						combat = true,
																					},
																				}) then
																					FreezeEntityPosition(PlayerPedId(), false)
																					ClearPedTasks(PlayerPedId())
																					ESX.SetPlayerState('jewerlyRobbery', nil)
																					ESX.TriggerServerEvent('javaheri:hack','Shahr')
																				end
																			end
																		end)
																	--else
																	--	TriggerEvent('esx:showNotification', 'Yek robbery dar shahr dar hal anjam ast')
																	--end
																else
																	TriggerEvent('esx:showNotification', 'In rob dar cooldown ast zaman paian cooldown : '.. data.javaheri1.time)
																end
															end)
														else
															TriggerEvent('esx:showNotification', _U('min_two_police') .. Config.RequiredCopsRob1 .. _U('min_two_police2'))
														end
													end)	
												else
													ESX.TriggerServerCallback('rob:getall2', function(jobs)
														local check = jobChecks.javaheri2
														if (not check.mt or jobs.mt >= check.mt) and (not check.all or jobs.all >= check.all) and (not check.police or jobs.police >= check.police) then
															ESX.TriggerServerCallback('rob:getcd', function(data,canrob)
																if not data.javaheri2.cooldown then
																	--if canrob then
																		ESX.TriggerServerCallback('sunset_lifeinvader:removerasp', function(istrue)
																			if istrue == false then
																				ESX.ShowNotification('shoma tablet nadarid') 
																			else
																				TriggerServerEvent('jewelry:rob', k,450000)
																				ClearPedTasks(GetPlayerPed(-1))
																				LoadAnim('mp_fbi_heist')
																				ESX.SetEntityCoords(GetPlayerPed(-1), 2742.63, 3469.49, 56.36, false, false, false, false)   
																				SetEntityHeading(GetPlayerPed(-1), 70.61)
																				TaskPlayAnim(GetPlayerPed(-1), 'mp_fbi_heist', 'loop', 2.0, 2.0, -1, 1, 0, false, false, false)
																				ESX.SetPlayerState('jewerlyRobbery',true)
																				FreezeEntityPosition(PlayerPedId(), true)
																				canPickup = false
																				SetTimeout(450000, function()
																					canPickup = true
																				end)
																				CreateThread(function()
																					while not canPickup do
																						Wait(0)
																						FreezeEntityPosition(PlayerPedId(), true)
																					end
																					Wait(1000)
																					FreezeEntityPosition(PlayerPedId(), false)
																				end)
																				if lib.progressCircle({
																					duration = 450 * 1000,
																					position = 'bottom',
																					useWhileDead = false,
																					canCancel = false,
																					disable = {
																						car = true,
																						move = true,
																						combat = true,
																					},
																				}) then
																					FreezeEntityPosition(PlayerPedId(), false)
																					ClearPedTasks(PlayerPedId())
																					ESX.SetPlayerState('jewerlyRobbery',nil)
																					ESX.TriggerServerEvent('javaheri:hack','Shams')
																				end
																			end
																		end)
																	--else
																	--	TriggerEvent('esx:showNotification', 'Yek robbery dar shahr dar hal anjam ast')
																	--end
																else
																	TriggerEvent('esx:showNotification', 'In rob dar cooldown ast zaman paian cooldown : '.. data.javaheri2.time)
																end
															end)		
														else
															TriggerEvent('esx:showNotification', _U('min_two_police') .. Config.RequiredCopsRob2 .. _U('min_two_police2'))
														end								
													end)
												end	
											else
												ESX.Alert('Error','Shoma be '.. Config.PartyNeed ..'x party dar nazdiki khod niaz darid ',7000,'warning')
											end
									else
										ESX.Alert('Error','Shoma baraye start in robbery bayad dar party bashid',7000,'warning') 
									end
								end)
							end 
													
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end		
				end
			end
		end
		
		if holdingup then
			canSleep = false
			drawTxt(0.3, 1.4, 0.45, _U('smash_case') .. ' :~r~ ' .. vetrineRotte .. '/' .. Config.MaxWindows, 185, 185, 185, 255)

			for i,v in pairs(vetrine) do 
				if(GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 10.0) and not v.isOpen and Config.EnableMarker then 
					DrawMarker(20, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.6, 0, 255, 0, 200, 1, 1, 0, 0)
				end
				if(GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 0.75) and not v.isOpen then 
					DrawText3D(v.x, v.y, v.z, '~w~[~g~E~w~] ' .. _U('press_to_collect'), 0.6)
					if IsControlJustPressed(0, 38) and not ESX.isDead() then
						animazione = true
						animThread()
					    ESX.SetEntityCoords(GetPlayerPed(-1), v.x, v.y, v.z-0.95)
					    SetEntityHeading(GetPlayerPed(-1), v.heading)
						v.isOpen = true 
						--PlaySoundFromCoord(-1, "Glass_Smash", v.x, v.y, v.z, "", 0, 0, 0)
					    if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
					    RequestNamedPtfxAsset("scr_jewelheist")
					    end
					    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
					    Citizen.Wait(0)
					    end
					    SetPtfxAssetNextCall("scr_jewelheist")
					    StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", v.x, v.y, v.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
					    loadAnimDict( "missheist_jewel" ) 
						TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
						TriggerEvent("mt:missiontext", _U('collectinprogress'), 3000)
					    --DisplayHelpText(_U('collectinprogress'))
					    DrawSubtitleTimed(5000, 1)
					    Citizen.Wait(5000)
					    ClearPedTasksImmediately(GetPlayerPed(-1))
					    ESX.TriggerServerEvent('jewelry:gioielli')
						ClearPedTasksImmediately(GetPlayerPed(-1))
					    PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					    vetrineRotte = vetrineRotte+1
					    animazione = false

						if vetrineRotte == Config.MaxWindows then 
						    for i,v in pairs(vetrine) do 
								v.isOpen = false
								vetrineRotte = 0
							end
							ESX.TriggerServerEvent('jewelry:endrob', store)
						    ESX.ShowNotification(_U('lester'))
						    holdingup = false
						    StopSound(soundid)
						end
					end
				end	
			end

			local pos2 = Stores[store].position
			if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), -622.566, -230.183, 38.057, true) > 20.5 ) then
				TriggerServerEvent('jewelry:toofar', store)
				ESX.SetPlayerState('jewerlyRobbery', nil)
				holdingup = false
				for i,v in pairs(vetrine) do 
					v.isOpen = false
					vetrineRotte = 0
				end
				StopSound(soundid)
			end

		end
		
		if holdingup2 then
			canSleep = false
			drawTxt(0.3, 1.4, 0.45, _U('smash_case') .. ' :~r~ ' .. vetrineRotte .. '/' .. Config.MaxWindows, 185, 185, 185, 255)

			for i,v in pairs(vetrine2) do 
				if(GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 10.0) and not v.isOpen and Config.EnableMarker then 
					DrawMarker(20, v.x, v.y, v.z, 0, 0, 0, 0, 0, 0, 0.6, 0.6, 0.6, 0, 255, 0, 200, 1, 1, 0, 0)
				end
				if(GetDistanceBetweenCoords(pos, v.x, v.y, v.z, true) < 0.75) and not v.isOpen then 
					DrawText3D(v.x, v.y, v.z, '~w~[~g~E~w~] ' .. _U('press_to_collect'), 0.6)
					if IsControlJustPressed(0, 38) and not ESX.isDead() then
						animazione = true
						animThread()
					    ESX.SetEntityCoords(GetPlayerPed(-1), v.x, v.y, v.z-0.95)
					    SetEntityHeading(GetPlayerPed(-1), v.heading)
						v.isOpen = true 
						--PlaySoundFromCoord(-1, "Glass_Smash", v.x, v.y, v.z, "", 0, 0, 0)
					    if not HasNamedPtfxAssetLoaded("scr_jewelheist") then
					    RequestNamedPtfxAsset("scr_jewelheist")
					    end
					    while not HasNamedPtfxAssetLoaded("scr_jewelheist") do
					    Citizen.Wait(0)
					    end
					    SetPtfxAssetNextCall("scr_jewelheist")
					    StartParticleFxLoopedAtCoord("scr_jewel_cab_smash", v.x, v.y, v.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
					    loadAnimDict( "missheist_jewel" ) 
						TaskPlayAnim(GetPlayerPed(-1), "missheist_jewel", "smash_case", 8.0, 1.0, -1, 2, 0, 0, 0, 0 ) 
						TriggerEvent("mt:missiontext", _U('collectinprogress'), 3000)
					    --DisplayHelpText(_U('collectinprogress'))
					    DrawSubtitleTimed(5000, 1)
					    Citizen.Wait(5000)
					    ClearPedTasksImmediately(GetPlayerPed(-1))
						if canPickup then
							ESX.TriggerServerEvent('jewelry:gioielli')
						end
						ClearPedTasksImmediately(GetPlayerPed(-1))
					    PlaySound(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, 0, 1)
					    vetrineRotte = vetrineRotte+1
					    animazione = false

						if vetrineRotte == Config.MaxWindows then 
						    for i,v in pairs(vetrine2) do 
								v.isOpen = false
								vetrineRotte = 0
							end
							ESX.TriggerServerEvent('jewelry:endrob', store)
						    ESX.ShowNotification(_U('lester'))
						    holdingup2 = false
						    StopSound(soundid)
						end
					end
				end	
			end

			local pos2 = Stores[store].position

			if (GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 2737.61, 3477.12, 55.69, true) > 40.0 ) then

				TriggerServerEvent('jewelry:toofar', store)
				ESX.SetPlayerState('jewerlyRobbery', nil)
				holdingup2 = false
				for i,v in pairs(vetrine2) do 
					v.isOpen = false
					vetrineRotte = 0
				end
				StopSound(soundid)
			end

		end

		if canSleep then
			Citizen.Wait(2000)
		else
			Citizen.Wait(5)
		end
	end
end)

function animThread()
	FreezeEntityPosition(true)
	Citizen.CreateThread(function()
		ESX.disableKey('x', true)
		while animazione do
			Citizen.Wait(10)
			local ped = PlayerPedId()
			if not IsEntityPlayingAnim(ped, 'missheist_jewel', 'smash_case', 3) then
				TaskPlayAnim(ped, 'missheist_jewel', 'smash_case', 8.0, 8.0, -1, 17, 1, false, false, false)
			end
		end
		ESX.disableKey('x', false)
		ClearPedTasksImmediately(PlayerPedId())
		FreezeEntityPosition(false)
	end)
end


RegisterNetEvent("lester:createBlip")
AddEventHandler("lester:createBlip", function(type, x, y, z)
	local blip = AddBlipForCoord(x, y, z)
	SetBlipSprite(blip, type)
	SetBlipColour(blip, 1)
	SetBlipScale(blip, 0.8)
	SetBlipAsShortRange(blip, true)
	if(type == 77)then
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Lester")
		EndTextCommandSetBlipName(blip)
	end
end)

blip = false

Citizen.CreateThread(function()
	TriggerEvent('lester:createBlip', 77, Config.sellPos.x,Config.sellPos.y,Config.sellPos.z)
	-- while true do
	-- 	Citizen.Wait(5)
	-- 	local playerPed = PlayerPedId()
	-- 	local coords    = GetEntityCoords(playerPed)
	-- 	if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), 706.669, -966.898, 30.413, true) <= 10 and not blip then
	-- 		DrawMarker(20, 706.669, -966.898, 30.413, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.5, 102, 100, 102, 100, false, true, 2, false, false, false, false)
	-- 		if GetDistanceBetweenCoords(coords, 706.669, -966.898, 30.413, true) < 1.0 then
	-- 			DisplayHelpText(_U('press_to_sell'))
	-- 			if IsControlJustReleased(1, 51) then
	-- 				blip = true
	-- 				ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
	-- 					if quantity >= Config.MaxJewelsSell then
	-- 						ESX.TriggerServerCallback('rob:getpolice', function(CopsConnected)
	-- 							if CopsConnected >= Config.RequiredCopsSell then
	-- 								FreezeEntityPosition(playerPed, true)
	-- 								TriggerEvent('mt:missiontext', _U('goldsell'), 10000)
	-- 								Wait(10000)
	-- 								FreezeEntityPosition(playerPed, false)
	-- 								if ESX.GetPlayerData().job.name == 'police' or ESX.GetPlayerData().job.name == 'sheriff' or ESX.GetPlayerData().job.name == 'mt' or ESX.GetPlayerData().job.name == 'fbi' then
	-- 									ESX.TriggerServerEvent('ss_cs:csMe',300,'Job abuse #3')
	-- 								else
	-- 									TriggerServerEvent('lester:vendita')
	-- 								end
	-- 								blip = false
	-- 							else
	-- 								blip = false
	-- 								TriggerEvent('esx:showNotification', _U('copsforsell') .. Config.RequiredCopsSell .. _U('copsforsell2'))
	-- 							end
	-- 						end)
	-- 					else
	-- 						blip = false
	-- 						TriggerEvent('esx:showNotification', _U('notenoughgold'))
	-- 					end
	-- 				end, 'jewels')
	-- 			end
	-- 		end
	-- 	end
	-- end
	ESX.RegisterPoint(Config.sellPos - vector3(0.0, 0.0, 1.0),2,{
		Color = {R = 255,G = 102,B = 204,A = 255},
		DrawDistance = 5,
		Radius = 0.5,
		Type = 0
	},{
		Notification = nil,
		DrawText = 'Dokme ~INPUT_CONTEXT~ jahat forush javaher',
		DrawTextRadius = 4,
		DrawTextCoords = Config.sellPos,
		Key = 'e',
		CB = function()
			if not blip then
				blip = true
				if ESX.DoesHaveItem2('jewels', Config.MaxJewelsSell) then
					ESX.TriggerServerCallback('rob:getpolice', function(CopsConnected)
						if CopsConnected >= Config.RequiredCopsSell then
							FreezeEntityPosition(playerPed, true)
							TriggerEvent('mt:missiontext', _U('goldsell'), 10000)
							Wait(10000)
							FreezeEntityPosition(playerPed, false)
							if ESX.militaryJobs[ESX.GetPlayerData().job.name] then
								ESX.TriggerServerEvent('ss_cs:csMe',300,'Job abuse #3')
							else
								TriggerServerEvent('lester:vendita')
							end
							blip = false
						else
							blip = false
							TriggerEvent('esx:showNotification', _U('copsforsell') .. Config.RequiredCopsSell .. _U('copsforsell2'))
						end
					end)
				else
					blip = false
					TriggerEvent('esx:showNotification', _U('notenoughgold'))
				end
			end
		end,
	},{
		In = nil,
		Out = ESX.UI.Menu.CloseAll
	})
end)

function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
	  	RequestAnimDict(dict)
	  	Wait(10)
	end
end

local Gerogan = 0
local GeroganPulse = 0
local JobGergan = {
	['fbi'] = true,
	['sheriff'] = true,
	['police'] = true,
	['mt'] = true,
	['justice'] = true,
	['weazel'] = true,
	['detective'] = true,
}

RegisterNetEvent("Gerogan:Start")
AddEventHandler("Gerogan:Start", function(coords)
	if JobGergan[ESX.GetPlayerData().job.name] then
		RemoveBlip(Gerogan)
		Gerogan = AddBlipForCoord(coords)
		SetBlipSprite(Gerogan, 303)
		SetBlipColour(Gerogan, 1)
		SetBlipScale(Gerogan, 0.8)
		SetBlipAsShortRange(Gerogan, true)
		GeroganPulse = AddBlipForCoord(coords)
		SetBlipSprite(GeroganPulse , 161)
		SetBlipScale(GeroganPulse , 2.0)
		SetBlipColour(GeroganPulse, 46)
		PulseBlip(GeroganPulse)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString("Gerogan")
		EndTextCommandSetBlipName(Gerogan)
	end
end)

RegisterNetEvent("Gerogan:UpdateBlip")
AddEventHandler("Gerogan:UpdateBlip", function(coords)
	if JobGergan[ESX.GetPlayerData().job.name] then
		if DoesBlipExist(Gerogan) then
			SetBlipCoords(GeroganPulse,coords.x,coords.y,coords.z)
			SetBlipCoords(Gerogan,coords.x,coords.y,coords.z)
		end
	end
end)

RegisterNetEvent("Gerogan:End")
AddEventHandler("Gerogan:End", function()
	RemoveBlip(Gerogan)
	RemoveBlip(GeroganPulse)
end)

RegisterNetEvent("Gerogan:StartTimer")
AddEventHandler("Gerogan:StartTimer", function(min)
	local sec = min * 60
	Citizen.CreateThread(function()
		while sec > 0 do
			Wait(1000)
			sec = sec - 1
		end
	end)
	Citizen.CreateThread(function()
		while sec > 0 do
			Wait(1)
			drawTxt(0.3, 1.4, 0.45, sec .. ' sanie ta payan gerogan giri', 185, 185, 185, 255)
		end
	end)
end)

local drawTime, time = false, 0
RegisterNetEvent('cd:drawEndPlanTime',function(_time,gang,label)
	if ESX.GetPlayerData().gang.name == gang then
		time = _time / 1000
		if not drawTime then
			drawTime = true
			Citizen.CreateThread(function()
				while drawTime and time > 0 do
					Citizen.Wait(100)
					ESX.ShowMissionText('~y~Zaman payan ticket robbery '.. ESX.Math.Round(time) .. 's')
				end
				drawTime = false
			end)
			Citizen.CreateThread(function()
				while drawTime and time > 0 do
					Citizen.Wait(1000)
					time = time - 1
				end
			end)
		end
	end
end)

RegisterNetEvent('cd:stopDrawEndPlanTime',function(gang)
	if ESX.GetPlayerData().gang.name == gang then
		drawTime = false
	end
end)

RegisterNetEvent('cd:addEndPlanTime',function(gang, _time)
	if ESX.GetPlayerData().gang.name == gang then
		time = time + (_time / 1000)
	end
end)

exports('getRob', function(rob)
	if rob:find('mini') then
		rob = 'mini'
	end
	return jobChecks[rob]
end)