local Active = true
local spawnedMush = 1
local mushPlants = {}
local isPickingUp, isProcessing = false, false

Citizen.CreateThread(function()
	while ESX == nil do
		Wait(100)
	end
	
	while Active do
		Citizen.Wait(10)
		local coords = GetEntityCoords(PlayerPedId())

		if GetDistanceBetweenCoords(coords, Config.FieldZones.MushroomField.coords, true) < 30 then
			--if ESX.PlayerData and ESX.PlayerData.gang.name == 'Cartel' then
				SpawnMushPlants()
				Citizen.Wait(500)
			--end
		else
			Citizen.Wait(500)
		end
	end
end)


Citizen.CreateThread(function()
	while Active do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local nearbyObject, nearbyID

		for i=1, #mushPlants, 1 do
			if GetDistanceBetweenCoords(coords, GetEntityCoords(mushPlants[i]), false) < 1 then
				nearbyObject, nearbyID = mushPlants[i], i
			end
		end

		if nearbyObject and IsPedOnFoot(playerPed) and not IsPedUsingAnyScenario(playerPed) then

			if not isPickingUp then
				ESX.ShowHelpNotification('~INPUT_CONTEXT~ bezanid ta ~g~Ghargh~s~ bardasht konid.')
			end

			if IsControlJustReleased(0, 38) and not isPickingUp and ESX.inRealWorld() then
				

				ESX.TriggerServerCallback('esx_jk_drugs:canPickUpss', function(canPickUp)

					if canPickUp then

						isPickingUp = true
						TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
						TriggerEvent("mythic_progbar:client:progress", {
							name = "harvest_mushroom",
							duration = 3500 / hollysion,
							label = "Bardasht Mushroom",
							useWhileDead = false,
							canCancel = true,
							controlDisables = {
								disableMovement = true,
								disableCarMovement = true,
								disableMouse = false,
								disableCombat = true,
							},
						}, function(status)
							if not status then
		
								table.remove(mushPlants, nearbyID)
								spawnedMush = spawnedMush - 1
		
								--ClearPedTasks(playerPed)		
								ClearPedTasksImmediately(playerPed)
								ESX.Game.DeleteLocalObject(nearbyObject)
		
								ESX.TriggerServerEvent('esx_jk_drugs:pickedUpMush')
								exports['sunset_utils']:addStress('all_drug_farm')
	
								isPickingUp = false
					
							elseif status then

								ClearPedTasksImmediately(playerPed)
								isPickingUp = false

							end
						end)  

					else
						ESX.ShowNotification('Jibet pore')
					end
				end, 'mushroom')

			end
		else
			Citizen.Wait(500)
		end
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		for k, v in pairs(mushPlants) do
			ESX.Game.DeleteLocalObject(v)
		end
	end
end)

function SpawnMushPlants()
	while spawnedMush < 10 do
		Citizen.Wait(0)
		local mushCoords = GenerateMushCoords()
		ESX.Game.SpawnLocalObject(GetHashKey('prop_weed_02'), mushCoords, function(obj)
			Wait(100)
			PlaceObjectOnGroundProperly(obj)
			FreezeEntityPosition(obj, true)

			table.insert(mushPlants, obj)
			spawnedMush = spawnedMush + 1
		end)
	end
end

function ValidateMushCoord(plantCoord)
	if spawnedMush > 0 then
		local validate = true

		for k, v in pairs(mushPlants) do
			if GetDistanceBetweenCoords(plantCoord, GetEntityCoords(v), true) < 5 then
				validate = false
			end
		end

		if GetDistanceBetweenCoords(plantCoord, Config.FieldZones.MushroomField.coords, false) > 50 then
			validate = false
		end

		return validate
	else
		return true
	end
end

function GenerateMushCoords()
	while true do
		Citizen.Wait(1)

		local mushCoordX, mushCoordY

		math.randomseed(GetGameTimer())
		local modX = math.random(-25, 25)

		Citizen.Wait(100)

		math.randomseed(GetGameTimer())
		local modY = math.random(-25, 25)

		mushCoordX = Config.FieldZones.MushroomField.coords.x + modX
		mushCoordY = Config.FieldZones.MushroomField.coords.y + modY

		local coordZ = GetCoordZ(mushCoordX, mushCoordY)
		local coord = vector3(mushCoordX, mushCoordY, coordZ)

		if ValidateMushCoord(coord) then
			return coord
		end
	end
end

function GetCoordZ(x, y)
	local coordZ = 0
	local height = 300.0

	local foundGround = false
	repeat
		Wait(10)
		foundGround, z = GetGroundZFor_3dCoord(x, y, height)
		coordZ = z + 1
		height = height - 5.0
	until foundGround or height < -100

 	return coordZ
end