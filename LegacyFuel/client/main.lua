ESX = nil

local NearestPump = nil
local NearestVehicle = nil
local IsFueling = false
local CurrentFuel = 0.0
local CurrentCost = 0.0
local CurrentCash = 0

local LastSyncValue = 0.0

Citizen.CreateThread(function()
	while not ESX do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(50)
	end
	--SyncFuel(GetVehiclePedIsIn(PlayerPedId()))
end)


RegisterNetEvent('LegacyFuel:setFuelClient')
AddEventHandler('LegacyFuel:setFuelClient', function(netId, fuel)
	if not tonumber(fuel) or not tonumber(netId) or fuel > 100.0 or fuel < 0.0 then
		return
	end
	local vehicle = NetworkGetEntityFromNetworkId(netId)
	if DoesEntityExist(vehicle) then
		SetVehicleFuelLevel(vehicle, fuel + 0.0)
	end
end)

function SyncFuelToAll(vehicle, percent)
    local fuel = GetFuel(vehicle)
    if LastSyncValue - fuel > percent then
        SetFuel(vehicle, fuel)
        LastSyncValue = fuel
    end
    if fuel > LastSyncValue then
        LastSyncValue = fuel
    end
end

Citizen.CreateThread(function()
	while true do
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed) then
            local vehicle = GetVehiclePedIsIn(playerPed)
            if GetPedInVehicleSeat(vehicle, -1) == playerPed then
                SyncFuelToAll(vehicle, Config.SyncPercent)
            end
        end
		Citizen.Wait(10000)
	end
end)

function SyncFuel(vehicle, fuel)
	if DoesEntityExist(vehicle) and IsEntityAMissionEntity(vehicle) then
		ESX.TriggerServerEvent('LegacyFuel:syncFuel',NetworkGetNetworkIdFromEntity(vehicle),fuel or GetFuel(vehicle),ESX.Game.GetPlayersToSend(300))
	end
end

-- Remove fuel based on RPM, find nearest pump object
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(2000)
		local playerPed = PlayerPedId()
		if IsPedInAnyVehicle(playerPed) then
			local vehicle = GetVehiclePedIsIn(playerPed)
			if not ArrayHasValue(Config.Blacklist, GetEntityModel(vehicle)) and GetPedInVehicleSeat(vehicle, -1) == playerPed and IsVehicleEngineOn(vehicle) then
				local fuelToRemove = (Config.FuelUsage[FuelRound(GetVehicleCurrentRpm(vehicle), 1)] or 0.0) * (Config.Classes[GetVehicleClass(vehicle)] or 1.0) / 10.0
                -- Update locally in real time
                local fuel = GetFuel(vehicle)
				local fuel2 = ESX.Math.Round(GetVehicleFuelLevel(vehicle))
				if ESX.Math.Round(fuel2) - fuel > 10 and fuel2 > 95 then
					-- TriggerServerEvent('sc:adminalarm',('Fuel Cheat %s - %s'):format(ESX.Math.Round(fuel), fuel2))
				end
				fuel = fuel  - fuelToRemove
                Entity(vehicle).state.fuel = fuel + 0.0
                SetVehicleFuelLevel(vehicle, fuel + 0.0)
			end
		end
		local pumpObject, pumpDistance = FindNearestFuelPump()
		if pumpObject ~= 0 and pumpDistance < 2.0 then
			NearestPump = pumpObject
		else
			NearestPump = nil
		end
		NearestVehicle = GetClosestVehicle2(GetEntityCoords(playerPed), 5.0)
	end
end)

function FuelUpTick(pumpObject, vehicle)
	Citizen.CreateThread(function()
		local playerPed = PlayerPedId()
		CurrentFuel = GetFuel(vehicle)
		CurrentCost = 0.0
		
		while IsFueling do
			Citizen.Wait(500)
			
			local oldFuel = CurrentFuel
			
			local fuelToAdd = 2
			local tickCost  = math.ceil(Config.RefillCost*fuelToAdd/100)
			
			if not pumpObject then
				-- Jerrican
				if GetAmmoInPedWeapon(playerPed, `WEAPON_PETROLCAN`) - fuelToAdd * 100 >= 0 then
					CurrentFuel = oldFuel + fuelToAdd
					SetPedAmmo(playerPed, `WEAPON_PETROLCAN`, math.floor(GetAmmoInPedWeapon(playerPed, `WEAPON_PETROLCAN`) - fuelToAdd * 100))
				else
					IsFueling = false
				end
			else
				CurrentFuel = oldFuel + fuelToAdd
			end
			
			-- Tank is full, stop fueling
			if CurrentFuel > 100.0 then
				CurrentFuel = 100.0
				IsFueling = false
			end
			
			-- -- No more money, stop fueling
			CurrentCost = CurrentCost + tickCost
			-- if pumpObject and CurrentCash < CurrentCost + tickCost then
			-- 	IsFueling = false
			-- end
		end
		
		-- Stopped fueling, pay or update jerrycan ammos
		if pumpObject then
			ESX.TriggerServerEvent('LegacyFuel:pay',CurrentCost,false)
			SetFuel(vehicle, CurrentFuel)
			SyncFuel(vehicle, CurrentFuel)
		else 
			SetFuel(vehicle, CurrentFuel)
			SyncFuel(vehicle, CurrentFuel)
		end
	end)
end

function RefuelVehicleFromPump(pumpObject, vehicle)
	Citizen.CreateThread(function()
		local playerPed = PlayerPedId()
		local animDict = 'timetable@gardener@filling_can'
		local anim = 'gar_ig_5_filling_can'
		ESX.Streaming.RequestAnimDict(animDict)
		
		-- Make ped to face vehicle
		SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true)
		TaskTurnPedToFaceEntity(playerPed, vehicle, 1000)
		Citizen.Wait(1000)
		
		-- Start refuel thread
		FuelUpTick(pumpObject, vehicle)
		
		while IsFueling do
			-- Disable controls when fueling
			for _, controlIndex in pairs(Config.DisableKeys) do
				DisableControlAction(0, controlIndex)
			end
			
			-- Disaply fueling progress
			local vehicleCoords = GetEntityCoords(vehicle)
			if pumpObject then
				local pumpCoords  = GetEntityCoords(pumpObject)
				DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, 'Dokme ~g~E ~w~Baraye Etmam Benzin Zadan\nHazine: ~g~' .. FuelRound(CurrentCost, 1) .. '$')
				DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5, FuelRound(CurrentFuel, 1) .. "%")
			else
				DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 0.5, 'Dokme ~g~E ~w~Baraye Etmam Benzin Zadan\nJerrican: ~g~'.. FuelRound(GetAmmoInPedWeapon(playerPed, `WEAPON_PETROLCAN`) / Config.DefaultPetrolCanAmmo * 100, 1) .. '~s~ | Vehicle: ~g~' .. FuelRound(CurrentFuel, 1) .. '~s~')
			end
			
			-- Play fueling animation
			if not IsEntityPlayingAnim(playerPed, animDict, anim, 3) then
				TaskPlayAnim(playerPed, animDict, anim, 2.0, 8.0, -1, 50, 0, 0, 0, 0)
			end
			
			-- Allow cancelling fuel
			if IsControlJustPressed(0, 38) or (NearestPump and GetEntityHealth(pumpObject) <= 0) then
				IsFueling = false
			end
			
			Citizen.Wait(0)
		end
		
		ClearPedTasks(playerPed)
		RemoveAnimDict(animDict)
	end)
end

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		
		if not IsFueling and (NearestPump and GetEntityHealth(NearestPump) > 0) then
			-- We are near a pump
			local pumpCoords = GetEntityCoords(NearestPump)
			if IsPedInAnyVehicle(playerPed) then
				-- Player is vehicle driver
				if GetPedInVehicleSeat(GetVehiclePedIsIn(playerPed), -1) == playerPed then
					DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, 'Baraye Benzin Zadan Az ~r~Mashin~w~ Kharej Shavid')
				end
			else
				-- Player is NOT in vehicle
				local vehicle = NearestVehicle
				if DoesEntityExist(vehicle) then
					-- A vehicle is near, ask for refuel
					local vehicleCoords = GetEntityCoords(vehicle)
					if GetFuel(vehicle) < 95 then
						DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1.2, 'Dokme ~g~E ~w~ Baraye ~g~Banzin~w~ Zadan')
						if IsControlJustPressed(0, 38) then
							IsFueling = true
							RefuelVehicleFromPump(NearestPump, vehicle)
						end
					else
						DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, 'Bak ~g~Benzin~w~ Poor Ast')
					end
				else
					-- No vehicle is near, ask for jerrycan buy/refill
					if ESX.GetPlayerData().money >= Config.JerryCanCost then
						if not HasPedGotWeapon(playerPed, `WEAPON_PETROLCAN`) then
							DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, 'Dokme ~g~E ~w~Baraye Kharid Boshke Benzin Be Gheimat : ~g~$' .. Config.JerryCanCost)

							if IsControlJustPressed(0, 38) then
								ESX.TriggerServerEvent('LegacyFuel:pay', Config.JerryCanCost,true)
							end
						else
							local refillCost = FuelRound(Config.RefillJerryCanCost * (1 - GetAmmoInPedWeapon(playerPed, `WEAPON_PETROLCAN`) / Config.DefaultPetrolCanAmmo))
							if refillCost > 0 then
								if ESX.GetPlayerData().money >= refillCost then
									DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, 'Dokme ~g~E ~w~Barate Poor Kardan Boshke Ba Gheimat :  ~g~'.. refillCost .. '$')

									if IsControlJustPressed(0, 38) then
										ESX.TriggerServerEvent('LegacyFuel:pay', Config.JerryCanCost,false)
										SetPedAmmo(ped, 883325847, 4500)
									end
								else
									DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, 'Pool Kafi Baraye Poor Kardan Boshke Nadarid')
								end
							else
								DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, 'Boshke Benzin Poor Ast')
							end
						end
					else
						DrawText3Ds(pumpCoords.x, pumpCoords.y, pumpCoords.z + 1.2, 'Pool Kam Ast!')
					end
				end
			end
		elseif not IsFueling and not NearestPump and not IsPedInAnyVehicle(playerPed) and GetSelectedPedWeapon(playerPed) == `WEAPON_PETROLCAN` then
			-- We are not near a pump but we have a Jerican
			local vehicle = NearestVehicle
			if DoesEntityExist(vehicle) then
				-- A vehicle is near
				local vehicleCoords = GetEntityCoords(vehicle)
				local canFuel = GetAmmoInPedWeapon(playerPed, `WEAPON_PETROLCAN`) > 0 and true or false
				if GetFuel(vehicle) < 95 and canFuel then
					DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1.2,  'Dokme ~g~E ~w~ Baraye ~g~Banzin~w~ Zadan')
					if IsControlJustPressed(0, 38) then
						IsFueling = true
						RefuelVehicleFromPump(NearestPump, vehicle)
					end
				elseif not canFuel then
					DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1.2, 'Boshke benzin khali ast')
				else
					DrawText3Ds(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z + 1.2, 'Bak ~g~Benzin~w~ Poor Ast')
				end
			end
		else
			Citizen.Wait(250)
		end
		Citizen.Wait(0)
	end
end)

-- Create Blips based on distance
if Config.ShowNearestGasStationOnly then
	Citizen.CreateThread(function()
		local currentGasBlip = 0
		while true do
			
			Citizen.Wait(5000)
			
			local playerCoords = GetEntityCoords(PlayerPedId())
			
			local closest = -1
			local closestCoords
			for _, gasStationCoords in pairs(Config.GasStations) do
				local dstcheck = #(playerCoords - gasStationCoords)
				if closest == -1 or dstcheck < closest then
					closest = dstcheck
					closestCoords = gasStationCoords
				end
			end
			
			if DoesBlipExist(currentGasBlip) then
				RemoveBlip(currentGasBlip)
			end
			currentGasBlip = CreateFuelBlip(closestCoords)
		end
	end)
else
	for _, gasStationCoords in pairs(Config.GasStations) do
		CreateFuelBlip(gasStationCoords)
	end
end