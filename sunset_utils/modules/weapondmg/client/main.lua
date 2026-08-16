local lasthp = 0
local lasthpDeath = 0
local sikh = false
local sikhDisable = false
local weapons = {}
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		lasthp = GetEntityHealth(PlayerPedId())
	end
end)

Citizen.CreateThread(function()
	waitForLoad()
	for k,v in pairs(ESX.GetWeaponList()) do
		if GetWeaponDamage(v.hash) > 0 then
			weapons[v.name] = {
				hash = v.hash,
				damage = GetWeaponDamage(v.hash)
			}
		end
	end
	ESX.TriggerServerEvent('weapondmg:getList')
	Wait(5000)
	while GetWeaponDamage(`weapon_smg_mk2`) == 25 do
		Wait(5000)
		ESX.TriggerServerEvent('weapondmg:getList')
	end
end)

RegisterNetEvent('weapondmg:loadList',function(data)
	TriggerEvent('setWeaponDamage',data)
	Wait(5000)
	TriggerEvent('setWeaponDamage',data)
	for k,v in pairs(data) do
		SetWeaponDamageModifier(tonumber(k) and tonumber(k) or GetHashKey(k), v.damage + .0)
	end
end)

RegisterNetEvent('weapondmg:openMenu',function(data)
	local elements = {}
	table.insert(elements,{
		img = '',
		text = 'Add', 
		text2 = '', 
		callBack = function()
			exports.icon_menu:ForceCloseMenu()
			local keyboard, hash, value = exports["input"]:Keyboard({
				header = "Add", 
				rows = {"Name || Hash", "Value"}
			})
			if keyboard then
				if hash and value then
					hash = type(hash) == 'string' and hash:upper() or hash
					value = tonumber(value)
					local _value = {
						damage = ESX.Math.Round(weapons[hash] and (tonumber(value) / weapons[hash].damage) or value,3),
						value = value,
					}
					ESX.TriggerServerEvent('weapondmg:setDamage',hash,_value)
				end
			end
	end})
	for k,v in pairs(data) do
		table.insert(elements,{
			img = 'nui://sun-inventory-hud/ui/img/items/' .. k .. '.png',
			text = k .. ' = ' .. v.value, 
			text2 = '', 
			callBack = function()
				exports.icon_menu:ForceCloseMenu()
				local keyboard, value = exports["input"]:Keyboard({
					header = "Change damage", 
					rows = {"Value"}
				})
				if keyboard then
					if value then
						value = tonumber(value)
						local _value = {
							damage = ESX.Math.Round(weapons[k] and (tonumber(value) / weapons[k].damage) or value,3),
							value = value,
						}
						ESX.TriggerServerEvent('weapondmg:setDamage',k,_value)
					end
				end
		end})
	end
	exports.icon_menu:OpenMenu(elements)
end)



local combatTime = 0
AddEventHandler('gameEventTriggered', function (name, data)
	if name == 'CEventNetworkEntityDamage' then
		local hash = data[7]
		local victim = data[1]
		local attacker = data[2]
		if hash == -1569615261 and data[1] == PlayerPedId() then
			local hp = GetEntityHealth(PlayerPedId())
			if globalInBox then
				ESX.SetEntityHealth(PlayerPedId(), hp - 5)
			else
				if hp < 130 then
					SetPedToRagdoll(PlayerPedId(), 10000, 10000, 0, 0, 0, 0)
					ESX.SetEntityHealth(PlayerPedId(),120)
				else
					ESX.SetEntityHealth(PlayerPedId(),hp - 15)
				end
			end
		end
		if (hash == `WEAPON_NIGHTSTICK` or hash == `WEAPON_BAT`) and data[1] == PlayerPedId() then
			local hp = GetEntityHealth(PlayerPedId())
			if hp < 125 then
				SetPedToRagdoll(PlayerPedId(), 10000, 10000, 0, 0, 0, 0)
				ESX.SetEntityHealth(PlayerPedId(),115)
			else
				ESX.SetEntityHealth(PlayerPedId(),hp - 20)
			end
		end
		if hash == -1553120962 then
			if attacker == PlayerPedId() and GetEntityType(attacker) == 1 and GetEntityType(victim) == 1 then
				local vehicle = GetVehiclePedIsIn(attacker)
				local plate = GetVehicleNumberPlateText(vehicle)
				if plate then
					local coords = ESX.GetCoordsString()
					local attackerid = NetworkGetPlayerIndexFromPed(attacker)
					local serverid = GetPlayerServerId(attackerid)
					local victimid = NetworkGetPlayerIndexFromPed(victim)
					local vehname = 'Not found'
					if DoesEntityExist(vehicle) then 
						vehname = ESX.GetVehicleLabelFromName(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
					end
					TriggerServerEvent('DiscordBot:ToDiscord','vdm','VDM','```css\nTarget : '.. GetPlayerServerId(victimid) .. ' Target name : '..  GetPlayerName(victimid) ..'\nAttacker : '.. serverid .. ' Attacker name : '.. GetPlayerName(attackerid) .. '\nPlate : '.. plate ..'\nVehicle name : '.. vehname ..'\n'..coords..'\n```')
				end
			elseif victim == PlayerPedId() and attacker ~= PlayerPedId() then
				if GetVehiclePedIsIn(attacker,true) == GetVehiclePedIsIn(PlayerPedId(),true) then
					return
				end
				if not sikh and not sikhDisable then
					sikh = true
					lasthpDeath = lasthp
					Citizen.Wait(4000)
					if not sikhDisable then
						ESX.SetEntityHealth(PlayerPedId(),lasthpDeath)
					end
					sikh = false
				end
			end
		end
		if data[2] == PlayerPedId() and GetEntityType(data[1]) == 2 and GetVehiclePedIsIn(PlayerPedId()) ~= data[1] then
			local vehicle = data[1]
			local vehname = 'Not found'
			local plate = GetVehicleNumberPlateText(vehicle)
			if DoesEntityExist(vehicle) then 
				vehname = ESX.GetVehicleLabelFromName(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
			end
			TriggerServerEvent('DiscordBot:ToDiscord','tirelog','Panchar kard','```css\nID : '.. GetPlayerServerId(PlayerId()) .. ' Name : '..  GetPlayerName(PlayerId()) ..'\nPlate : '.. plate ..'\nVehicle name : '.. vehname ..'\nVehicle : '.. GetEntityCoords(vehicle) ..'\nPlayer : '.. GetEntityCoords(PlayerPedId()) ..'\nType : '.. data[13] ..' \n```')
		end
		
		if GetEntityType(attacker) == 1 then
			local weapon = ESX.GetWeaponName(GetSelectedPedWeapon(attacker))
			if weapon ~= 'weapon_unarmed' and weapon ~= 'no_name' and not IsPedInAnyVehicle(attacker) then
				local coords = GetEntityCoords(PlayerPedId())
				local attackerCoords = GetEntityCoords(attacker)
				local victimCoords = GetEntityCoords(victim)
				if SUN.World == 0 and (ESX.GetDistance(coords,attackerCoords) < 80 or ESX.GetDistance(coords,victimCoords) < 80) then
					TriggerEvent('sscombat:toggle',true,3 * 60 * 1000)
					exports['sunset_utils']:addStress('combatmode_refresh')
					if combatTime == 0 then
						combatTime = 3 * 60
						Citizen.CreateThread(function()
							ESX.SetPlayerState('combat',true)					
							while combatTime > 0 do
								--exports['TextUI']:Open('Combat time<br>'.. combatTime .. 's', 'lightred', 'left')
								combatTime = combatTime - 1
								Citizen.Wait(1000)
							end
							--exports['TextUI']:Close()
							ESX.SetPlayerState('combat',false)
						end)
					else
						combatTime = 3 * 60
					end
				end
			end
		end
	elseif name == 'CEventNetworkPlayerEnteredVehicle' then
		Wait(500)
		if data[1] == PlayerId() then
			local vehicle = data[2]
			local plate = GetVehicleNumberPlateText(vehicle)
			if plate and GetPedInVehicleSeat(vehicle,-1) == PlayerPedId() then
				local coords = ESX.GetCoordsString()
				local vehname = 'Not found'
				if DoesEntityExist(vehicle) then 
					vehname = ESX.GetVehicleLabelFromName(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				end
				TriggerServerEvent('DiscordBot:ToDiscord','entervehicle','ENTER','```css\nID : '.. GetPlayerServerId(PlayerId()) .. ' name : '..  GetPlayerName(PlayerId()) ..'\nPlate : '.. plate ..'\nVehicle name : '.. vehname ..'\n'..coords..'\n```')
			end
		end
	end
end)
  

AddEventHandler('esx:onPlayerDeath',function(data)
	local injure = ESX.GetPlayerData().IsInjure
	if data.deathCause == -1553120962 and data.killedByPlayer and GetPlayerFromServerId(data.killerServerId) ~= PlayerId() then
		if data.killedByPlayer then
			local vehicle = GetVehiclePedIsIn(GetPlayerPed(GetPlayerFromServerId(data.killerServerId)))
			if DoesEntityExist(vehicle) then
				if vehicle == GetVehiclePedIsIn(PlayerPedId(),true) then
					return
				end
			end
			if DoesEntityExist(vehicle) then
				ESX.Game.DeleteVehicle(vehicle)
			end
		end
		if not injure then
			sikhDisable = true
			Citizen.Wait(4000)
			TriggerEvent('medic:revive', true)
			Citizen.Wait(3000)
			ESX.SetEntityHealth(PlayerPedId(),lasthpDeath)
			Citizen.Wait(2000)
			sikhDisable = false
		else
			sikhDisable = true
			Citizen.Wait(4000)
			TriggerEvent('medic:revive', true)
			Citizen.Wait(3000)
			ESX.SetEntityHealth(PlayerPedId(),0)
			Citizen.Wait(2000)
			sikhDisable = false
		end
	end
end)
