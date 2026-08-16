  
local holdingUp = false
local store = ""
local blipRobbery = nil
ESX = nil

local realworld  = true

RegisterNetEvent('esx:changeworld')
AddEventHandler('esx:changeworld',function(world)
	if world == 0 then
		realworld = true
	else
		realworld = false
	end
end)

local coolDown = false
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	for k,v in pairs(Stores) do
		local storePos = vector3(v.position.x,v.position.y,v.position.z)
		ESX.RegisterPoint(storePos,1,{
			Color = {R = 255,G = 0,B = 0,A = 255},
			DrawDistance = 5,
			Radius = 0.5,
			Type = 17
		},{
			Notification = 'Dokme ~INPUT_CONTEXT~ jahat start robbery',
			DrawText = nil,
			DrawTextRadius = nil,
			DrawTextCoords = nil,
			Key = 'e',
			CB = function()
				if realworld then
					if IsPedArmed(PlayerPedId(), 4) then
						if coolDown then return ESX.Alert('Error','Spam nakonid!',5000,'error') end 
						coolDown = true
						Citizen.SetTimeout(10 * 1000,function()
							coolDown = false
						end)
						--ESX.TriggerServerCallback('Party:GetParty', function(index,data)
						--	if index[GetPlayerServerId(PlayerId())] then
						if ESX.serverNum == 0 or ESX.serverNum == 2 then
							ESX.UI.Menu.Open('question', GetCurrentResourceName(), 'askType', {
								title 	 = '',
								align    = 'center',
								question = 'Robbery ba gerogan shoroe shavad?',
								elements = {
									{label = 'Kheir', pursuit = false},
									{label = 'Bale', pursuit = true}
								}
							}, function(data, menu)
								menu.close()
								ESX.TriggerServerCallback('rob:getcd', function(cooldown, canrob)
									if not pursuit or not cooldown.soghra.cooldown then
										TriggerServerEvent('esx_holdup:robberyStarted', k, data.current.pursuit)
									else
										xPlayer.chatMessage('Halate gerogan dar cooldown ast.')
									end
								end)
							end, function(data, menu)
								menu.close()
							end)
						else
							TriggerServerEvent('esx_holdup:robberyStarted', k)
						end
						--	else
						--		ESX.Alert('Error','Shoma baraye start in robbery bayad dar party bashid',7000,'warning') 
						--	end
						--end)
					else
						ESX.ShowNotification(_U('no_threat'))
					end
				end
			end,
		},{
			In = nil,
			Out = ESX.UI.Menu.CloseAll
		})
	end
	--
	ESX.TriggerServerCallback('esx_holdup:GetShops',function(data)
		for k,v in pairs(Stores) do
			-- print(data[k].active)
			-- local blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
			-- SetBlipSprite(blip, 156)
			-- SetBlipScale(blip, 0.8)
			-- SetBlipAsShortRange(blip, true)
			-- BeginTextCommandSetBlipName("STRING")
			-- AddTextComponentString(_U('shop_robbery'))
			-- EndTextCommandSetBlipName(blip)
			local active = data[k].active
			v.Blip = AddBlipForCoord(v.position.x, v.position.y, v.position.z)
			SetBlipSprite(v.Blip, v.blipSprite or 52)
			SetBlipDisplay(v.Blip, 4)
			SetBlipScale(v.Blip, 0.8)
			if active then SetBlipColour(v.Blip, v.blipColor or 2) else SetBlipColour(v.Blip, 1) end
			SetBlipAsShortRange(v.Blip, true)
			BeginTextCommandSetBlipName("shopblip")
			AddTextEntry("shopblip", v.label or "Shop")
			EndTextCommandSetBlipName(v.Blip)
		end
	end)
	--
end)

function drawTxt(x,y, width, height, scale, text, r,g,b,a, outline)
	SetTextFont(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropshadow(0, 0, 0, 0,255)
	SetTextDropShadow()
	if outline then SetTextOutline() end

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_holdup:currentlyRobbing')
AddEventHandler('esx_holdup:currentlyRobbing', function(currentStore)
	holdingUp, store = true, currentStore
	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(10)
			local playerPos = GetEntityCoords(PlayerPedId(), true)
			if holdingUp then
				if Stores[store].realposition then
					local storePos = Stores[store].realposition
					if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > Stores[store].distance then
						TriggerServerEvent('esx_holdup:tooFar', store)
					end
				else
					local storePos = Stores[store].position
					if Vdist(playerPos.x, playerPos.y, playerPos.z, storePos.x, storePos.y, storePos.z) > Stores[store].distance then
						TriggerServerEvent('esx_holdup:tooFar', store)
					end
				end
			end
		end
	end)
end)

RegisterNetEvent('esx_holdup:killBlip')
AddEventHandler('esx_holdup:killBlip', function()
	RemoveBlip(blipRobbery)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	local newjob = job.name
	local whitejob = {
		['police'] = true,
		['sheriff'] = true,
		['fbi'] = true,
		['mt'] = true,
		['justice'] = true,
	}
	if not whitejob[newjob] then
		TriggerEvent('esx_holdup:killBlip')
		TriggerEvent('esx_holdupbank:killblip')
		TriggerEvent('jewelry:killblip')
		TriggerEvent('sunset_lifeinvader:kill')
	end
end)

RegisterNetEvent('esx_holdup:setBlip')
AddEventHandler('esx_holdup:setBlip', function(position, pursuit)
	blipRobbery = AddBlipForCoord(position.x, position.y, position.z)

	SetBlipSprite(blipRobbery, 161)
	SetBlipScale(blipRobbery, 2.0)
	SetBlipColour(blipRobbery, pursuit and 46 or 3)

	PulseBlip(blipRobbery)
end)

RegisterNetEvent('esx_holdup:tooFar')
AddEventHandler('esx_holdup:tooFar', function()
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_cancelled'))
end)

RegisterNetEvent('esx_holdup:robberyComplete')
AddEventHandler('esx_holdup:robberyComplete', function(award)
	holdingUp, store = false, ''
	ESX.ShowNotification(_U('robbery_complete', award))
end)

RegisterNetEvent('esx_holdup:startTimer')
AddEventHandler('esx_holdup:startTimer', function()
	local timer = Stores[store].secondsRemaining

	Citizen.CreateThread(function()
		while timer > 0 and holdingUp do
			Citizen.Wait(1000)

			if timer > 0 then
				timer = timer - 1
			end
		end
	end)

	Citizen.CreateThread(function()
		while holdingUp do
			Citizen.Wait(0)
			drawTxt(0.66, 1.44, 1.0, 1.0, 0.4, _U('robbery_timer', timer), 255, 255, 255, 255)
		end
	end)
end)

RegisterNetEvent('esx_holdup:SetBlip',function(key,status)
	if status then SetBlipColour(Stores[key].Blip, Stores[key].blipColor or 2) else SetBlipColour(Stores[key].Blip, 1) end
end)