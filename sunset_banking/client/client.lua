--================================================================================================
--==                                VARIABLES - DO NOT EDIT                                     ==
--================================================================================================
ESX				= nil
inMenu			= false
local isnearBank, isnearATM = false, false

local atms  = {  
	`prop_atm_01`,
	`prop_atm_02`,
	`prop_atm_03`,
	`prop_fleeca_atm`
}

local banks = {
	{name="Bank", id = 108, x=150.266, y=-1040.203, z=29.374},
	-- {name="Bank", id = 108, x=-1212.980, y=-330.841, z=37.787},
	{name="Bank", id = 108, x=-1307.41, y=-826.29, z=17.15},       
	{name="Bank", id = 108, x=-112.202, y=6469.295, z=31.626},
	-- {name="Bank", id = 108, x=314.187, y=-278.621, z=54.170},
	--{name="Bank", id = 108, x=-351.534, y=-49.529, z=49.042},
	-- {name="Bank", id = 108, x=1175.06, y=2706.64, z=38.0},
	{name="Bank", id = 106, x=237.25, y=217.87, z=106.29}
}	
local boxZone = {
	vector3(150.266, -1040.203, 29.374),
	vector3(-112.202, 6469.295, 31.626),
}
--================================================================================================
--==                                THREADING - DO NOT EDIT                                     ==
--================================================================================================

--===============================================
--==           Base ESX Threading              ==
--===============================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	exports['sunset_target']:AddTargetModel(atms, {
        options = {
            {
                icon = "fas fa-chair",
                label = "🏧عابر بانک",
                cb = function(entity)
					if ESX.GetPlayerData()['IsDead'] ~= 1 then
						inMenu = true
						SetNuiFocus(true, true)
						SendNUIMessage({type = 'openGeneral', bank = true})
						TriggerServerEvent('bank:balance')
					end
                end,
            },
        },
        job = {"all"},
        distance = 3.5
    })
	exports['sunset_target']:addTargetModelWithoutRay(atms, {
        options = {
            {
                icon = "fas fa-chair",
                label = "🏧عابر بانک",
                cb = function(entity)
					if ESX.GetPlayerData()['IsDead'] ~= 1 then
						inMenu = true
						SetNuiFocus(true, true)
						SendNUIMessage({type = 'openGeneral', bank = true})
						TriggerServerEvent('bank:balance')
					end
                end,
            },
        },
        job = {"all"},
        distance = 1.5
    })
	for k, v in pairs(boxZone) do
		exports['sunset_target']:AddCircleZone('atm'..k,v,5,{
			name = 'atm'..k,
		}, {
			options = {
				{
					icon = "fas fa-chair",
					label = "🏧عابر بانک",
					cb = function(entity)
						if ESX.GetPlayerData()['IsDead'] ~= 1 then
							inMenu = true
							SetNuiFocus(true, true)
							SendNUIMessage({type = 'openGeneral', bank = true})
							TriggerServerEvent('bank:balance')
						end
					end,
				},
			},
			job = {"all"},
			distance = 5
		})
	end
end)

--===============================================
--==             Core Threading                ==
--===============================================
-- Citizen.CreateThread(function()
-- 	while true do
-- 		if (isnearATM or isnearBank) and not inMenu then
-- 			Citizen.Wait(10)
-- 			DisplayHelpText("Press ~INPUT_PICKUP~ to access the bank ~b~")
-- 		else
-- 			Citizen.Wait(1000)
-- 		end
-- 	end
-- end)

AddEventHandler("onKeyDown", function(key)
	-- if not (isnearATM or isnearBank) then
	-- 	return
	-- end

	-- if key == "e" and not inMenu then
	-- 	if ESX.GetPlayerData()['IsDead'] ~= 1 then
	-- 		inMenu = true
	-- 		SetNuiFocus(true, true)
	-- 		SendNUIMessage({type = 'openGeneral', bank = isnearBank})
	-- 		TriggerServerEvent('bank:balance')
	-- 	end
	-- else
	if key == "escape" and inMenu then
		if ESX.GetPlayerData()['IsDead'] ~= 1 then
			inMenu = false
			SetNuiFocus(false, false)
			SendNUIMessage({type = 'close'})
		end
	end
end)

--===============================================
--==             Optimize Indicator               ==
--===============================================
-- Citizen.CreateThread(function()
-- 	while true do
-- 	  Citizen.Wait(1000)

-- 	  if nearBank() then isnearBank = true else isnearBank = false end
-- 	  if nearATM() then isnearATM = true else isnearATM = false end

-- 	end
-- end)

--===============================================
--==             Map Blips	                   ==
--===============================================
Citizen.CreateThread(function()
	for k,v in ipairs(banks) do
		if v.id ~= 0 then
			local blip = AddBlipForCoord(v.x, v.y, v.z)
			SetBlipSprite(blip, v.id)
			SetBlipScale(blip, 1.0)
			SetBlipAsShortRange(blip, true)
			SetBlipColour(blip, 25)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString(tostring(v.name))
			EndTextCommandSetBlipName(blip)
		end
	end
end)



--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNetEvent('currentbalance1')
AddEventHandler('currentbalance1', function(balance)
	local id = PlayerId()
	local playerName = GetPlayerName(id)
	SendNUIMessage({
		type = "balanceHUD",
		balance = balance,
		player = playerName
		})
end)
--===============================================
--==           Deposit Event                   ==
--===============================================
RegisterNUICallback('deposit', function(data)
	if dcan then return end
	dcan = true
	SetTimeout(500,function()
		dcan = false
	end)
	ESX.TriggerServerEvent('bank:depositss', tonumber(data.amount))
end)

--===============================================
--==          Withdraw Event                   ==
--===============================================
RegisterNUICallback('withdrawl', function(data)
	if dcan then return end
	dcan = true
	SetTimeout(500,function()
		dcan = false
	end)
	ESX.TriggerServerEvent('bank:withdrawss', tonumber(data.amountw))
end)

--===============================================
--==         Balance Event                     ==
--===============================================
RegisterNUICallback('balance', function()
	TriggerServerEvent('bank:balance')
end)

RegisterNetEvent('balance:back')
AddEventHandler('balance:back', function(balance)
	SendNUIMessage({type = 'balanceReturn', bal = balance})
end)


--===============================================
--==         Transfer Event                    ==
--===============================================
RegisterNUICallback('transfer', function(data)
	if dcan then return end
	dcan = true
	SetTimeout(500,function()
		dcan = false
	end)
	ESX.TriggerServerEvent('bank:transferss', data.to, data.amountt)	
end)




--===============================================
--==               NUIFocusoff                 ==
--===============================================
RegisterNUICallback('NUIFocusOff', function()
	FreezeEntityPosition(PlayerPedId(), false)
	PlaySoundFrontend(-1, "ATM_WINDOW", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
	inMenu = false
	SetNuiFocus(false, false)
	SendNUIMessage({type = 'closeAll'})
end)



--===============================================
--==            Capture Bank Distance          ==
--===============================================
function nearBank()
	local player = PlayerPedId()
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(banks) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 3.5 then
			return true
		end
	end
end

function nearATM()
	local coords = GetEntityCoords(PlayerPedId())

	for i,v in ipairs(atms) do
		local atm = GetClosestObjectOfType(coords.x, coords.y, coords.z, 1.0, v, false, false, false)
		if DoesEntityExist(atm) then
			return true
		end
	end
	
	return false
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end