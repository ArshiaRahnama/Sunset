ESX = nil

local greenZone = {
	-- drug
	vec(30.96,4348.25,41.51,50.0),		-- mushroom
	vec(2333.42,2578.74,46.44,60.0),	-- marijuana
	vec(3559.76,3674.53,28.12,150.0),	-- opum

}

openui = false
openui2 = false
lvl = 0
locksound = false
local base64MoneyIcon = ''
local gang_xp_config = {}
gang_xp_config[1] = 480
gang_xp_config[2] = 900
gang_xp_config[3] = 1500
gang_xp_config[4] = 2300
gang_xp_config[5] = 4000
gang_xp_config[6] = 6500
gang_xp_config[7] = 8600
gang_xp_config[8] = 11500
gang_xp_config[9] = 15000
gang_xp_config[10] = 18000
gang_xp_config[11] = 21600
gang_xp_config[12] = 26000
gang_xp_config[13] = 31000
gang_xp_config[14] = 37000
gang_xp_config[15] = 45000
gang_xp_config[16] = 53000
gang_xp_config[17] = 65000
gang_xp_config[18] = 77000
gang_xp_config[19] = 93000
gang_xp_config[20] = 110000
-- new level
gang_xp_config[21] = 150000
gang_xp_config[22] = 150000
gang_xp_config[23] = 150000
gang_xp_config[24] = 150000
gang_xp_config[25] = 150000
gang_xp_config[26] = 150000
gang_xp_config[27] = 150000
gang_xp_config[28] = 150000
gang_xp_config[29] = 150000
gang_xp_config[30] = 150000

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

 	while ESX.GetPlayerData().gang == nil do
		Citizen.Wait(10)
	end

 	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setGang')
AddEventHandler('esx:setGang', function(gang)
	ESX.PlayerData.gang = gang
end)

RegisterNetEvent('gangs:xpupdate')
AddEventHandler('gangs:xpupdate', function(oldxp,newxp,needxp,newlvl)
	CreateRankBar(1,needxp,oldxp,newxp,newlvl)
end)
redcolor = false

RegisterNetEvent("gangs:newlevel")
AddEventHandler("gangs:newlevel", function(level,red)
    openui = true
    openui2 = true
    lvl = level
    if red then
        redcolor = true
    end
    Citizen.SetTimeout(10000, function()
        openui2 = false
        if redcolor then
            redcolor = false
        end
    end)
end)


Citizen.CreateThread(function()
	while ESX == nil do Wait(1000) end
	ESX.TriggerServerCallback("gangs:getzone",function(data)
		for k , v in ipairs(data) do
			local Blip = json.decode(v)
			local meleeBlip = AddBlipForRadius(Blip.x, Blip.y, Blip.z, 50.0)
			SetBlipHighDetail(meleeBlip, true)
			SetBlipColour(meleeBlip, 17)
			SetBlipAlpha(meleeBlip, 100)
			SetBlipAsShortRange(meleeBlip, true)
		end
		TriggerEvent('gangs:zoneLoaded',data)
	end)
	for k, v in pairs(greenZone) do
		local meleeBlip = AddBlipForRadius(v)  
		SetBlipHighDetail(meleeBlip, true)
		SetBlipColour(meleeBlip, 11)
		SetBlipAlpha(meleeBlip, 60)
		SetBlipAsShortRange(meleeBlip, true)
	end

		while true do
			Citizen.Wait(0)
			if IsControlJustPressed(0,137) then
				ESX.TriggerServerCallback("gangs:getGangData2",function(data)
					if data ~=nil then
						CreateRankBar(1,gang_xp_config[data.level + 1],data.xp,data.xp,data.level)
					end
				end)
			end
			if openui == true then
		
				if not locksound then
					PlaySoundFrontend(-1, "Bed", "WastedSounds", 1)
					locksound = true
				end
				local scaleform = RequestScaleformMovie("MP_BIG_MESSAGE_FREEMODE")
		
				if HasScaleformMovieLoaded(scaleform) then
					Citizen.Wait(0)
		
					PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
					BeginTextComponent("STRING")
					if redcolor then
						AddTextComponentString("~r~Gang Level Lose ".. lvl)
					else
						AddTextComponentString("~g~Well done Gang Level ".. lvl)
					end
					EndTextComponent()
					PopScaleformMovieFunctionVoid()
		
					Citizen.Wait(500)
		
					PlaySoundFrontend(-1, "TextHit", "WastedSounds", 1)
					while openui2 do
						DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
						Citizen.Wait(0)
					end
					locksound = false
					openui = false
				end
			end
		end
			
end)

	
 function CreateRankBar(XP_StartLimit_RankBar, XP_EndLimit_RankBar, playersPreviousXP, playersCurrentXP, CurrentPlayerLevel, TakingAwayXP)
	RankBarColor = 116 
	RankBarColor = 6 
	if not HasHudScaleformLoaded(19) then							
        RequestHudScaleform(19)										
		while not HasHudScaleformLoaded(19) do						
			Wait(1)													
		end
    end

	BeginScaleformMovieMethodHudComponent(19, "SET_COLOUR")
		PushScaleformMovieFunctionParameterInt(RankBarColor) 
    EndScaleformMovieMethodReturn()

    BeginScaleformMovieMethodHudComponent(19, "SET_RANK_SCORES")		
		PushScaleformMovieFunctionParameterInt(XP_StartLimit_RankBar)	
		PushScaleformMovieFunctionParameterInt(XP_EndLimit_RankBar)		
		PushScaleformMovieFunctionParameterInt(playersPreviousXP)		
		PushScaleformMovieFunctionParameterInt(playersCurrentXP)		
		PushScaleformMovieFunctionParameterInt(CurrentPlayerLevel)		
		PushScaleformMovieFunctionParameterInt(100)						
		EndScaleformMovieMethodReturn()										
end

RegisterNetEvent('gangaccount:setMoney')
AddEventHandler('gangaccount:setMoney', function(gang, money)
	if ESX.PlayerData.gang and ESX.PlayerData.gang.grade >= 12 and 'gang_' .. ESX.PlayerData.gang.name == gang then
		UpdateSocietyMoneyHUDElement(money)
	end
end)

RegisterNetEvent('gangs:inv')
AddEventHandler('gangs:inv', function(gang)
	ESX.UI.Menu.CloseAll()
		ESX.UI.Menu.Open('question', GetCurrentResourceName(), 'Aks_For_Join',
			{
				title 	 = 'Voroud Be Gang',
				align    = 'center',
				question = 'Aya Shoma Mikhahid Vared Gang ('.. gang ..') Shavid?',
				elements = {
					{label = 'Bale', value = 'yes'},
					{label = 'Kheir', value = 'no'},
				}
				}, function(data, menu)
					if data.current.value == 'yes' then
						TriggerServerEvent("gangs:acceptinv")
						ESX.UI.Menu.CloseAll()		
				elseif data.current.value == 'no' then
				menu.close()
                ESX.UI.Menu.CloseAll()													
				end
		end)
end)

function OpenBossMenu(gang, close, options)
	if ESX.PlayerData.gang.grade >= 12 then
		local isBoss = nil
		local options  = options or {}
		local elements = {}
		local gangMoney = nil

		ESX.TriggerServerCallback('gangs:isBoss', function(result)
			isBoss = result
		end, gang)

		while isBoss == nil do
			Citizen.Wait(100)
		end

		if not isBoss then
			return
		end

		while gangMoney == nil do
			Citizen.Wait(1)
			ESX.TriggerServerCallback('gangs:getGangMoney', function(money)
				gangMoney = money
			end, ESX.PlayerData.gang.name)
		end

		local defaultOptions = {
			withdraw  = true,
			deposit   = true,
			wash      = false,
			employees = true,
			grades    = true
		}

		for k,v in pairs(defaultOptions) do
			if options[k] == nil then
				options[k] = v
			end
		end

		if options.withdraw then
			local formattedMoney = _U('locale_currency', ESX.Math.GroupDigits(gangMoney))
			table.insert(elements, {label = ('%s: <span style="color:green;">%s</span>'):format(_U('clean_money'), formattedMoney), value = 'withdraw_society_money'})
		end

		if options.employees then
			table.insert(elements, {label = _U('employee_management'), value = 'manage_employees'})
		end

		table.insert(elements, {label = '⚙️Gang settings⚙️', value = 'gangsetting'})
		--table.insert(elements,{label = 'Kharid naghshe robbery', value = 'robbery'})
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boss_actions_' .. gang:gsub("&","And"), {
			title    = _U('boss_menu'),
			align    = 'top-right',
			elements = elements
		}, function(data, menu)

			if data.current.value == 'withdraw_society_money' then
				OpenMoneyMenu(gang)
			elseif data.current.value == 'manage_employees' then
				OpenManageEmployeesMenu(gang)
			elseif data.current.value == 'gangsetting' then
				gangsetting(gang)
			elseif data.current.value == 'robbery' then
				if ESX.PlayerData.gang.name ~= 'Army' then
					buyTicket()
				end
			end

		end, function(data, menu)
			if close then
				close(data, menu)
			end
		end)
	else
		OpenMoneyMenu(gang)
	end

end

function gangsetting(gang)
	ESX.TriggerServerCallback('gangs:getWashStatus',function(enable)
		local washstr = 'Wash money ' .. (enable == 1 and '✔️' or '❌')
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_setting', {
			title    = _U('employee_management'),
			align    = 'top-right',
			elements = {
				{label = 'Modiriat Rank', value = 'manage_grade'},
				{label = "Rename Grades", value = 'rename_grades'},
				{label = _U('salary_management'), value = 'manage_grades'},
				{label = 'Set Hud Icon', value = 'set_icon'},
				{label = 'Set Log Webhook', value = 'set_webhook'},
				{label = 'Manage Armory Access', value = 'manage_armory'},
				{label = 'Manage Vehicle Access', value = 'manage_veh'},
				{label = 'Manage Crafting Access', value = 'manage_crafting'},
				{label = washstr, value = 'washmoney'},
				{label = 'Manage vehicles', value = 'manage_vehicles'},
			}
		}, function(data, menu)
	
			if data.current.value == 'manage_grades' then
				OpenManageGradesMenu(gang)
			elseif data.current.value == 'rename_grades' then
				ManageGrades()
			elseif data.current.value == 'set_webhook' then
				SetWebhook()
			elseif data.current.value == 'set_icon' then
				SetIcon()
			elseif data.current.value == 'manage_armory' then
				ManageArmory(gang)
			elseif data.current.value == 'manage_veh' then
				ManageVeh(gang)
			elseif data.current.value == 'manage_crafting' then
				ManageCrafting(gang)
			elseif data.current.value == 'washmoney' then
				ESX.TriggerServerEvent('gangs:togglewashmoney')
				menu.close()
				Citizen.Wait(500)
				gangsetting(gang)
			elseif data.current.value == 'manage_grade' then
				manageGrade()
			elseif data.current.value == 'manage_vehicles' then
				manageVehicles()
			end
	
		 end, function(data, menu)
			menu.close()
		end)
	end)
end

function manageGrade(society)
	ESX.TriggerServerCallback('gang:getGrades', function(grades, gangPerms)
		local elements = {}

		for k,v in pairs(grades) do
			table.insert(elements, {label = '(' .. k .. ') | ' .. v.label, grade = k})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'show_grade_list', {
			title    = 'Gang Levels',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local grade = tostring(data.current.grade)
			local elements = {}
			table.insert(elements, {value = 'toggleKey',label = '🔒Hide kardan item haye gheyr ghabel dastresi '.. (doesGradeHavePerm(gangPerms, grade, 'hideLocker') and '✅' or '❌' ),isTrue = doesGradeHavePerm(gangPerms, grade, 'hideLocker') and true or false,var = 'hideLocker'})
			table.insert(elements, {value = 'toggleKey',label = 'Sherkat dar ghore keshi '.. (doesGradeHavePerm(gangPerms, grade, 'ghoreKeshi') and '✅' or '❌' ),isTrue = doesGradeHavePerm(gangPerms, grade, 'ghoreKeshi') and true or false,var = 'ghoreKeshi'})
			table.insert(elements, {value = 'toggleKey',label = 'Gozashtan mashin dar gang '.. (doesGradeHavePerm(gangPerms, grade, 'putVehicle') and '✅' or '❌' ),isTrue = doesGradeHavePerm(gangPerms, grade, 'putVehicle') and true or false,var = 'putVehicle'})
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_grades2', {
				title    = '',
				align    = 'top-left',
				elements = elements
			}, function(data2, menu2)
				if data2.current.value == 'toggleKey' then
					menu2.close()
					menu.close()
					local isTrue = data2.current.isTrue
					ESX.TriggerServerEvent('gang:toggleVar', tostring(grade), data2.current.var, not isTrue)
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		end, function(data, menu)
			menu.close()
		end)
  	end)
end

function doesGradeHavePerm(perms, grade, key)
	return perms and perms[tostring(grade)] and perms[tostring(grade)][key]
end

function manageVehicles()
	ESX.TriggerServerCallback('gangprop:getVehicles', function(ownedCars)
        if #ownedCars == 0 then
            ESX.ShowNotification('~r~Shoma mashini nadarid!')
        else
            local elements = {}
            for k ,v in pairs(ownedCars) do
                if v.gang == ESX.PlayerData.gang.name:lower() then
                    table.insert(elements, {label = ('%s(%s)'):format(ESX.GetVehicleLabelFromHash(v.vehicle.model), v.plate), plate = v.plate})
                end
            end
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicles', {
				title    = 'Gang Vehicles',
				align    = 'top-left',
				elements = elements
			}, function(data, menu)
				local alert = lib.alertDialog({
					header = 'Hello there',
					content = ('Aya mayel be hazf [%s] hastid?'):format(data.current.plate),
					centered = true,
					cancel = true
				})
				if alert == 'confirm' then
					ESX.TriggerServerEvent('garage:setGangVehicle', data.current.plate, false, true)
				end
			end, function(data, menu)
				menu.close()
			end)
        end
    end, 'all')
end

function ManageCrafting()
	ESX.TriggerServerCallback('gang:getGrades', function(grades)
		  local elements = {}

			for k,v in pairs(grades) do
				table.insert(elements, {label = '(' .. k .. ') | ' .. v.label, grade = k})
			end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'show_grade_list', {
			title    = 'Gang Levels',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local grade = tostring(data.current.grade)
			ESX.TriggerServerCallback('gangs:getgradecraft', function(perm)
				ESX.TriggerServerCallback("gangs:getGangData2",function(data)
					if data ~=nil then
						local elements = {}
						local kon = {}
						table.insert(elements, {label = '--- Levels ---', value = 'no'})
						for i = 1, data.level do
							i = tostring(i)
							local access = "❌"
							state = true
							if perm[grade] and (perm[grade][i]) then
								access = "✔️"
								state = false
							end
							if not perm[grade] or not perm[grade]['all'] then
								table.insert(elements, {label = '('.. i ..')' ..'('.. access ..')', value = i ,state = state})
							end
						end
						local access = "❌"
						state = true
						if perm[grade] and perm[grade]['all'] then
							access = "✔️"
							state = false
						end
						table.insert(elements, {label = '⭐Access to all level⭐' ..'('.. access ..')', value = 'all',state = state})
						local access = "❌"
						state = true
						if perm[grade] and perm[grade]['craftwithinventory'] then
							access = "✔️"
							state = false
						end
						table.insert(elements, {label = '⭐Craft with gang inventory⭐' ..'('.. access ..')', value = 'craftwithinventory',state = state})
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_lvl', {
							title    = 'List',
							align    = 'top-left',
							elements = elements
						}, function(data2, menu2)
							if data2.current.value ~= 'no' then
								local st = data2.current.state
								local inventory = 1
								if data2.current.value == 'craftwithinventory' and state then
									local keyboard, count = exports["input"]:Keyboard({
										header = 'In rank be kodam inventory dastresi dashte bashad?', 
										rows = {'Inventory'}
									})
									if keyboard then
										local count = tonumber(count)
										inventory = count or 1
									end
								end
								TriggerServerEvent('gangs:setlevelcraftstate', data2.current.value, grade, data2.current.value == 'craftwithinventory' and state and inventory or st)
								menu2.close()
								ManageCrafting()
							end
						end, function(data2, menu2)
							menu2.close()
						end)
					end
				end)
		  	end)
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function ManageArmory(gang)
	local currentStation = nil
	local elements = {}
	for i=1, exports['gangprop']:getLockerCount() do
		table.insert(elements, {label = 'Locker #' .. i, value = i})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_item', {
		title    = 'Kodam locker ro avaz mikonid?',
		align    = 'top-left',
		elements = elements
	}, function(data2, menu2)
		menu2.close()
		currentStation = data2.current.value
		ESX.TriggerServerCallback('gang:getGrades', function(grades)
			local elements = {}
	
			for k,v in pairs(grades) do
				table.insert(elements, {label = '(' .. k .. ') | ' .. v.label, grade = k})
			end
	
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'show_grade_list', {
				title    = 'Gang Grades',
				align    = 'top-left',
				elements = elements
			}, function(data, menu)
				local grade = data.current.grade
				ESX.TriggerServerCallback('gangs:getgradearmory', function(perm)
					local elements = {}
					local inventory = exports['gangprop']:getGangInventory(1, true)
					local kon = {}
					table.insert(elements, {label = '--- Weapons ---', value = 'no'})
					local access = "❌"
					state = true
					if perm['allweapon'] then
						access = "✔️"
						state = false
					end
					table.insert(elements, {label = '⭐Access to all weapon⭐' ..'('.. access ..')', value = 'allweapon',state = state})
					table.insert(elements, {label = '⭐Change slot⭐' ..'('.. (perm['changeSlot'] and '✔️' or '❌') ..')', value = 'changeSlot',state = not perm['changeSlot']})
					for k , v in ipairs(inventory.weapons) do
						if not kon[v.name] then
							local access = "❌"
							state = true
							if perm[v.name] or perm['allweapon'] then
								access = "✔️"
								state = false
							end
							kon[v.name] = v.name
							table.insert(elements, {label = ESX.GetWeaponLabel(v.name) ..'('.. access ..')', value = v.name ,state = state})
						end
					end
					table.insert(elements, {label = '--- Items ---', value = 'no'})
					local access = "❌"
					state = true
					if perm['allitem'] then
						access = "✔️"
						state = false
					end
					table.insert(elements, {label = '⭐Access to all item' ..'('.. access ..')', value = 'allitem',state = state})
					for k , v in ipairs(inventory.items) do
						local access = "❌"
						state = true
						if perm[v.name] or perm['allitem'] then
							access = "✔️"
							state = false
						end
						table.insert(elements, {label = (ESX.getItem(v.name) and ESX.getItem(v.name).label or v.name) ..'('.. access ..')', value = v.name ,state = state})
					end
					ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_item', {
						title    = 'List',
						align    = 'top-left',
						elements = elements
					}, function(data2, menu2)
						if data2.current.value ~= 'no' then
							local st = data2.current.state
							TriggerServerEvent('gangs:setgunstate', data2.current.value, grade, st, currentStation)
							menu2.close()
							ManageArmoryGrade(gang,grade, currentStation)
						end
					end, function(data2, menu2)
						menu2.close()
					end)
				  end,grade, currentStation)
				
			end, function(data, menu)
				menu.close()
			end)
		end)
	end, function(data2, menu2)
		menu2.close()
	end)
end


function ManageArmoryGrade(gang,grade, currentStation)
	local grade = grade
	ESX.TriggerServerCallback('gangs:getgradearmory', function(perm)
		local elements = {}
		local inventory = exports['gangprop']:getGangInventory(1, true)
		local kon = {}
		table.insert(elements, {label = '--- Weapons ---', value = 'no'})
		local access = "❌"
		state = true
		if perm['allweapon'] then
			access = "✔️"
			state = false
		end
		table.insert(elements, {label = '⭐Access to all weapon⭐' ..'('.. access ..')', value = 'allweapon',state = state})
		table.insert(elements, {label = '⭐Change slot⭐' ..'('.. (perm['changeSlot'] and '✔️' or '❌') ..')', value = 'changeSlot',state = not perm['changeSlot']})
		for k , v in ipairs(inventory.weapons) do
			if not kon[v.name] then
			local access = "❌"
			state = true
			if perm[v.name] or perm['allweapon'] then
					access = "✔️"
					state = false
			end
			kon[v.name] = v.name
			table.insert(elements, {label = ESX.GetWeaponLabel(v.name) ..'('.. access ..')', value = v.name ,state = state})
			end
		end
		table.insert(elements, {label = '--- Items ---', value = 'no'})
		local access = "❌"
		state = true
		if perm['allitem'] then
			access = "✔️"
			state = false
		end
		table.insert(elements, {label = '⭐Access to all item' ..'('.. access ..')', value = 'allitem',state = state})
		for k , v in ipairs(inventory.items) do
			local access = "❌"
			state = true
			if perm[v.name] or perm['allitem'] then
					access = "✔️"
					state = false
			end
			table.insert(elements, {label = v.name ..'('.. access ..')', value = v.name ,state = state})
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_item1', {
			title    = 'List',
			align    = 'top-left',
			elements = elements
		}, function(data2, menu2)
			if data2.current.value ~= 'no' then
				local st = data2.current.state
				TriggerServerEvent('gangs:setgunstate',data2.current.value,grade,st, currentStation)
				menu2.close()
				ManageArmoryGrade(gang,grade, currentStation)
			end
		end, function(data2, menu2)
			menu2.close()
		end)
	end,grade, currentStation)
end

function ManageVeh(gang)
	ESX.TriggerServerCallback('gang:getGrades', function(grades)
		  local elements = {}

			for k,v in pairs(grades) do
				table.insert(elements, {label = '(' .. k .. ') | ' .. v.label, grade = k})
			end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'show_grade_list', {
			title    = 'Gang Grades',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			local grade = tostring(data.current.grade)
			elements = {}
			table.insert(elements, {label = '--- Cars ---', value = 'no'})
			ESX.TriggerServerCallback('gangprop:getVehicles', function(ownedCars)	
				for _,v in pairs(ownedCars) do
					local hashVehicule = v.vehicle.model
					local vehicleName  = ESX.GetVehicleLabelFromHash(hashVehicule)
					local plate        = v.plate				
					local access = "❌"
						state = true
						if v.perm[grade] then
							   access = "✔️"
							   state = false
						end
					labelvehicle = '| '..plate..' | '..vehicleName..' ('.. access ..')'
				   	table.insert(elements, {label = labelvehicle, value = v,state = state})    					
				end
				table.insert(elements, {label = '--- Helis ---', value = 'no'})
				ESX.TriggerServerCallback('gangprop:getVehicles', function(ownedHeli)		
					for _,v in pairs(ownedHeli) do
						local hashVehicule = v.vehicle.model
						local vehicleName  = ESX.GetVehicleLabelFromHash(hashVehicule)
						local plate        = v.plate
						local access = "❌"
							state = true
							if v.perm[grade] then
								access = "✔️"
								state = false
							end
						labelvehicle = '| '..plate..' | '..vehicleName..' ('.. access ..')'
						table.insert(elements, {label = labelvehicle, value = v,state = state})    
					end
					table.insert(elements, {label = '--- Boats ---', value = 'no'})
					ESX.TriggerServerCallback('gangprop:getVehicles', function(ownedHeli)		
						for _,v in pairs(ownedHeli) do
							local hashVehicule = v.vehicle.model
							local vehicleName  = ESX.GetVehicleLabelFromHash(hashVehicule)
							local plate        = v.plate
							local access = "❌"
								state = true
								if v.perm[grade] then
									access = "✔️"
									state = false
								end
							labelvehicle = '| '..plate..' | '..vehicleName..' ('.. access ..')'
							table.insert(elements, {label = labelvehicle, value = v,state = state})    
						end		
						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_item1', {
							title    = 'List',
							align    = 'top-left',
							elements = elements
						}, function(data2, menu2)
							if data2.current.value ~= 'no' then
								local st = data2.current.state
								TriggerServerEvent('gangs:setvehstate',data2.current.value.plate,grade,st)
								menu2.close()
								showcarsgrade(grade)
							end
						end, function(data2, menu2)
							menu2.close()
						end)
					end, 'boat')
				end, 'heli')
			end, 'car')
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function showcarsgrade(grade)
	Wait(500)
	local grade = tostring(grade)
	elements = {}
	table.insert(elements, {label = '--- Cars ---', value = 'no'})
	ESX.TriggerServerCallback('gangprop:getVehicles', function(ownedCars)	
		for _,v in pairs(ownedCars) do
			local hashVehicule = v.vehicle.model
			local vehicleName  = ESX.GetVehicleLabelFromHash(hashVehicule)
			local plate        = v.plate				
			local access = "❌"
				state = true
				if v.perm[grade] then
					   access = "✔️"
					   state = false
				end
			labelvehicle = '| '..plate..' | '..vehicleName..' ('.. access ..')'
			   table.insert(elements, {label = labelvehicle, value = v,state = state})    					
		end
		table.insert(elements, {label = '--- Helis ---', value = 'no'})
		ESX.TriggerServerCallback('gangprop:getVehicles', function(ownedHeli)		
			for _,v in pairs(ownedHeli) do
				local hashVehicule = v.vehicle.model
				local vehicleName  = ESX.GetVehicleLabelFromHash(hashVehicule)
				local plate        = v.plate
				local access = "❌"
					state = true
					if v.perm[grade] then
						access = "✔️"
						state = false
					end
				labelvehicle = '| '..plate..' | '..vehicleName..' ('.. access ..')'
				table.insert(elements, {label = labelvehicle, value = v,state = state})    
			end
			table.insert(elements, {label = '--- Boats ---', value = 'no'})
			ESX.TriggerServerCallback('gangprop:getVehicles', function(ownedHeli)		
				for _,v in pairs(ownedHeli) do
					local hashVehicule = v.vehicle.model
					local vehicleName  = ESX.GetVehicleLabelFromHash(hashVehicule)
					local plate        = v.plate
					local access = "❌"
						state = true
						if v.perm[grade] then
							access = "✔️"
							state = false
						end
					labelvehicle = '| '..plate..' | '..vehicleName..' ('.. access ..')'
					table.insert(elements, {label = labelvehicle, value = v,state = state})    
				end		
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_item1', {
					title    = 'List',
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					if data2.current.value ~= 'no' then
						local st = data2.current.state
						TriggerServerEvent('gangs:setvehstate',data2.current.value.plate,grade,st)
						menu2.close()
						showcarsgrade(grade)
					end
				end, function(data2, menu2)
					menu2.close()
				end)
			end, 'boat')
		end, 'heli')
	end, 'car')
end

function OpenManageEmployeesMenu(gang)

 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_employees_' .. gang, {
		title    = _U('employee_management'),
		align    = 'top-right',
		elements = {
			{label = _U('employee_list'), value = 'employee_list'},
			{label = _U('recruit'),       value = 'recruit'}
		}
	}, function(data, menu)

 		if data.current.value == 'employee_list' then
			OpenEmployeeList(gang)
		elseif data.current.value == 'recruit' then
			OpenRecruitMenu(gang)		
		end

 	end, function(data, menu)
		menu.close()
	end)
end

function OpenManageEmployeesMenugm(gang)

 	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_employees_' .. gang, {
		title    = _U('employee_management'),
		align    = 'top-right',
		elements = {
		--	{label = _U('employee_list'), value = 'employee_list'},
			{label = _U('recruit'),       value = 'recruit'},
		}
	}, function(data, menu)

 		--if data.current.value == 'employee_list' then
	--		OpenEmployeeListgm(gang)
		if data.current.value == 'recruit' then
			OpenRecruitMenugm(gang)
		
		end

 	end, function(data, menu)
		menu.close()
	end)
end
-- Rename
function ManageGrades()
	ESX.TriggerServerCallback('gang:getGrades', function(grades)
		  local elements = {}
		  
			for k,v in pairs(grades) do
				table.insert(elements, {label = '(' .. k .. ') | ' .. v.label, grade = k})
			end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'show_grade_list', {
			title    = 'Gang Grades',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'rename_grade', {
                title    = "Esm jadid rank ra vared konid",

			}, function(data2, menu2)
				
				if not data2.value then
					ESX.ShowNotification("Shoma dar ghesmat esm jadid chizi vared nakardid!")
					return
				end
	
				if data2.value:match("[^%w%s]") or data2.value:match("%d") then
					ESX.ShowNotification("~h~Shoma mojaz be vared kardan ~r~Special ~o~character ~w~ya ~r~adad ~w~nistid!")
					return
				end

				if string.len(ESX.Math.Trim(data2.value)) >= 3 and string.len(ESX.Math.Trim(data2.value)) <= 11 then
					ESX.TriggerServerCallback('gangs:renameGrade', function(refresh)
						menu2.close()
						if refresh then
							menu.close()
							ManageGrades()
						end
					end, data.current.grade, data2.value)
				else
					ESX.ShowNotification("Tedad character esm grade bayad bishtar az ~g~3 ~w~0 va kamtar az ~g~11 ~o~character ~w~bashad!")
				end

            end, function (data2, menu2)
                menu2.close()
            end)
			
		end, function(data, menu)
			menu.close()
		end)
	end)
end

function SetWebhook()
	local list = {
		{
			label = 'Locker',
			key = 'locker',
		},
		{
			label = 'Poul',
			key = 'money',
		},
		{
			label = 'Mashin',
			key = 'vehicle',
		},
		{
			label = 'Token XP',
			key = 'tokenxp',
		},
		{
			label = 'Boss action',
			key = 'boss',
		},
		{
			label = 'Craft',
			key = 'craft',
		},
	}
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wh', {
		title    = 'Kodam Web Hook ro avaz mikoni?',
		align    = 'top-left',
		elements = list
	}, function(data, menu)
		menu.close()
		ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_log', {
			title    = "Link Web Hook Ra Vared Konid",
		}, function(data2, menu2)
			
			if not data2.value then
				ESX.ShowNotification("Shoma Linki Vared Nakardid!")
				return
			end
			local link = data2.value
			menu2.close()
			if data.current.key == 'locker' then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_log2', {
					title    = 'In log baraye locker chand ast?',
				}, function(data2, menu2)
					
					if not data2.value then
						ESX.ShowNotification('Chizi vared nakardid!')
						return
					end
					local location = tonumber(data2.value) or 1
					ESX.TriggerServerEvent('gangs:sethook',data.current.key,link, location)
					ESX.ShowNotification("Webhook Ba Movafaghiat Sabt Shod!")
					menu2.close()
				end, function (data2, menu2)
					menu2.close()
				end)
			else
				ESX.TriggerServerEvent('gangs:sethook',data.current.key,link)
				ESX.ShowNotification("Webhook Ba Movafaghiat Sabt Shod!")
			end
			
		end, function (data2, menu2)
			menu2.close()
		end)
		
	end, function(data, menu)
		menu.close()
	end)
	-- ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_log', {
	-- 	title    = "Link Web Hook Ra Vared Konid",

	-- }, function(data2, menu2)
		
	-- 	if not data2.value then
	-- 		ESX.ShowNotification("Shoma Linki Vared Nakardid!")
	-- 		return
	-- 	end
	-- 	local link = data2.value
	-- 	ESX.TriggerServerCallback('gangs:sethook', function(refresh)
	-- 		menu2.close()
	-- 		ESX.ShowNotification("Web Hook Ba Movafaghiat Sabt Shod!")
	-- 	end, link)
	-- 	menu2.close()
	-- end, function (data2, menu2)
	-- 	menu2.close()
	-- end)
end

function SetInv()

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_perm', {
                title    = "Had Aghal Sathe Dastresi Ra Vared Konids(1 Ta 13)",

			}, function(data2, menu2)
				
				if not data2.value then
					ESX.ShowNotification("Shoma Chizi Vared Nakardid!")
					return
				end
				local perm = data2.value
				if perm < 14 and perm > 0 then
				ESX.TriggerServerCallback('gangs:setinvperm', function(refresh)
						menu2.close()
						ESX.ShowNotification("Permission Ba Movafaghiat Sabt Shod!")
				  end, perm)
				menu2.close()
		         else
		          	ESX.ShowNotification("Permission Vared Shode Eshtebah Ast!")
					return
		         end
            end, function (data2, menu2)
                menu2.close()
            end)
end

function SetIcon()

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'set_icon', {
                title    = "Link Axs Ra Vared Konid",

			}, function(data2, menu2)
				
				if not data2.value then
					ESX.ShowNotification("Shoma Chizi Vared Nakardid!")
					return
				end
				local link = data2.value
				if link:find('http') then
				ESX.TriggerServerCallback('gangs:setgangicon', function(refresh)
						menu2.close()
						ESX.ShowNotification("Link Axs Ba Movafaghiat Sabt Shod!")
				  end, link)
				menu2.close()
		         else
		          	ESX.ShowNotification("Link Vared Shode Eshtebah Ast!")
					return
		         end
            end, function (data2, menu2)
                menu2.close()
            end)
end

function OpenMoneyMenu(gang)
	local elements = {
		{label = _U('deposit_money')	,  	value = 'deposit_money'},
		{label = 'Kharid naghshe robbery', value = 'robbery'},
	}
	if ESX.PlayerData.gang.grade >= 12 then
		table.insert(elements,{label = _U('withdraw_money'), 	value = 'withdraw_money'})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'money_manage_' .. gang, {
	   title    = _U('money_management'),
	   align    = 'top-right',
	   elements = elements
   	}, function(data, menu)

		if data.current.value == 'withdraw_money' then
			
			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'withdraw_society_money_amount_' .. gang, {
				title = _U('withdraw_money')
			}, function(data, menu)

 				local amount = tonumber(data.value)

 				if amount == nil then
					ESX.ShowNotification(_U('invalid_amount'))
				else
					ESX.UI.Menu.CloseAll()
					ESX.TriggerServerEvent('gangs:withdrawMoney', gang, amount)
					OpenBossMenu(gang, close, options)
				end

 			end, function(data, menu)
				menu.close()
			end)

		elseif data.current.value == 'deposit_money' then

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'deposit_money_amount_' .. gang, {
				title = _U('deposit_money')
			}, function(data, menu)
 
				 local amount = tonumber(data.value)
 
				 if amount == nil then
					ESX.ShowNotification(_U('invalid_amount'))
				else
					ESX.UI.Menu.CloseAll()
					ESX.TriggerServerEvent('gangs:depositMoney', gang, amount)
					OpenBossMenu(gang, close, options)
				end
 
			 end, function(data, menu)
				menu.close()
			end)
		elseif data.current.value == 'robbery' then
			if ESX.PlayerData.gang.name ~= 'Army' then
				buyTicket()
			end
	   	end

	end, function(data, menu)
	   menu.close()
   end)
end

function OpenEmployeeList(gang)

 	ESX.TriggerServerCallback('gangs:getEmployees', function(employees)

 		local elements = {
			head = {_U('employee'), _U('grade'), _U('actions')},
			rows = {}
		}

 		for i=1, #employees, 1 do
			local gradeLabel = (employees[i].gang.grade_label == '' and employees[i].gang.label or employees[i].gang.grade_label)

 			table.insert(elements.rows, {
				data = employees[i],
				cols = {
					employees[i].name:gsub('_',' '),
					gradeLabel,
					'{{' .. _U('promote') .. '|promote}} {{' .. _U('fire') .. '|fire}}',
					employees[i].profilePicture
				}
			})
		end
 		ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'employee_list_' .. gang, elements, function(data, menu)
			local employee = data.data

 			if data.value == 'promote' then
				menu.close()
				OpenPromoteMenu(gang, employee)
			elseif data.value == 'fire' then
				menu.close()
				ESX.UI.Menu.Open('question', GetCurrentResourceName(), 'fire',
				{
					title 	 = 'Fire',
					align    = 'center',
					question = 'Aya motmaenid ke mikhahid in fard ra fire konid?',
					elements = {
						{label = 'Bale', value = 'yes'},
						{label = 'Kheir', value = 'no'},
					}
				}, function(data, menu)
					menu.close()
					if data.current.value == 'yes' then
						ESX.ShowNotification(_U('you_have_fired', employee.name))
						ESX.TriggerServerCallback('gangs:setGang', function()
							OpenEmployeeList(gang)
						end, employee.identifier, 'nogang', 0, 'fire')
					elseif data.current.value == 'no' then
						menu.close()
						ESX.UI.Menu.CloseAll()													
					end
				end)
			end
		end, function(data, menu)
			menu.close()
			OpenManageEmployeesMenu(gang)
		end)

 	end, gang)

 end
 
 function OpenEmployeeListgm(gang)

 	ESX.TriggerServerCallback('gangs:getEmployees', function(employees)

 		local elements = {
			head = {_U('employee'), _U('grade'), _U('actions')},
			rows = {}
		}

 		for i=1, #employees, 1 do
			local gradeLabel = (employees[i].gang.grade_label == '' and employees[i].gang.label or employees[i].gang.grade_label)

 			table.insert(elements.rows, {
				data = employees[i],
				cols = {
					employees[i].name,
					gradeLabel,
					'{{' .. _U('promote') .. '|promote}} {{' .. _U('fire') .. '|fire}}'
				}
			})
		end

 		ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'employee_list_' .. gang, elements, function(data, menu)
			local employee = data.data

 			if data.value == 'promote' then
				menu.close()
				OpenPromoteMenu(gang, employee)
			elseif data.value == 'fire' then
				ESX.ShowNotification(_U('you_have_fired', employee.name))

 				ESX.TriggerServerCallback('gangs:setGang', function()
					OpenEmployeeList(gang)
				end, employee.identifier, 'nogang', 0, 'fire')
			end
		end, function(data, menu)
			menu.close()
			OpenManageEmployeesMenugm(gang)
		end)

 	end, gang)

 end

function OpenRecruitMenu(gang)

 	ESX.TriggerServerCallback('gangs:getOnlinePlayers', function(players)

 		local elements = {}

 		for i=1, #players, 1 do
			if players[i].gang.name ~= gang then
				if ESX.Game.PlayerExist(players[i].source) then
					local distance = ESX.GetDistance(GetEntityCoords(PlayerPedId()),GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(players[i].source))))
					if distance <= 20 then
						table.insert(elements, {
							label = players[i].name:gsub('_',' '),
							value = players[i].source,
							name = players[i].name,
							identifier = players[i].identifier
						})
					end
				end
			end
		end

 		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'recruit_' .. gang, {
			title    = _U('recruiting'),
			align    = 'top-right',
			elements = elements
		}, function(data, menu)

 			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'recruit_confirm_' .. gang, {
				title    = _U('do_you_want_to_recruit', data.current.name),
				align    = 'top-right',
				elements = {
					{label = _U('no'),  value = 'no'},
					{label = _U('yes'), value = 'yes'}
				}
			}, function(data2, menu2)
				menu2.close()

 				if data2.current.value == 'yes' then
					ESX.ShowNotification(_U('you_have_hired', data.current.name))

 					ESX.TriggerServerCallback('gangs:setGang', function()
						OpenRecruitMenu(gang)
					end, data.current.identifier, gang, 1, 'hire')
				end
			end, function(data2, menu2)
				menu2.close()
			end)

 		end, function(data, menu)
			menu.close()
		end)

 	end)

end

function OpenRecruitMenugm(gang)

 	ESX.TriggerServerCallback('gangs:getOnlinePlayers', function(players)

 		local elements = {}

 		for i=1, #players, 1 do
			if players[i].gang.name ~= gang then
				table.insert(elements, {
					label = players[i].name,
					value = players[i].source,
					name = players[i].name,
					identifier = players[i].identifier
				})
			end
		end

 		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'recruit_' .. gang, {
			title    = _U('recruiting'),
			align    = 'top-right',
			elements = elements
		}, function(data, menu)

 			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'recruit_confirm_' .. gang, {
				title    = _U('do_you_want_to_recruit', data.current.name),
				align    = 'top-right',
				elements = {
					{label = _U('no'),  value = 'no'},
					{label = _U('yes'), value = 'yes'}
				}
			}, function(data2, menu2)
				menu2.close()

 				if data2.current.value == 'yes' then
					ESX.ShowNotification(_U('you_have_hired', data.current.name))

 					ESX.TriggerServerCallback('gangs:setGang', function()
						OpenRecruitMenugm(gang)
					end, data.current.identifier, gang, 1, 'hire')
				end
			end, function(data2, menu2)
				menu2.close()
			end)

 		end, function(data, menu)
			menu.close()
		end)

 	end)

end


function OpenPromoteMenu(gangname, employee)

 	ESX.TriggerServerCallback('gangs:getGang', function(gang)

 		local elements = {}

 		for i=1, #gang.grades, 1 do
			local gradeLabel = (gang.grades[i].label == '' and gang.label or gang.grades[i].label)
			if gang.grades[i].grade ~= 13 then
 			table.insert(elements, {
				label = gradeLabel,
				value = gang.grades[i].grade,
				selected = (employee.gang.grade == gang.grades[i].grade)
			})
			end
		end

 		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'promote_employee_' .. gangname, {
			title    = _U('promote_employee', employee.name),
			align    = 'top-right',
			elements = elements
		}, function(data, menu)
			menu.close()
			ESX.ShowNotification(_U('you_have_promoted', employee.name, data.current.label))

 			ESX.TriggerServerCallback('gangs:setGang', function()
				OpenEmployeeList(gangname)
			end, employee.identifier, gangname, data.current.value, 'promote')
		end, function(data, menu)
			menu.close()
			OpenEmployeeList(gangname)
		end)

 	end, gangname)

end

function OpenManageGradesMenu(gangname)

 	ESX.TriggerServerCallback('gangs:getGang', function(gang)

 		local elements = {}

 		for i=1, #gang.grades, 1 do
			local gradeLabel = (gang.grades[i].label == '' and gang.label or gang.grades[i].label)

 			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(gradeLabel, _U('money_generic', ESX.Math.GroupDigits(gang.grades[i].salary))),
				value = gang.grades[i].grade
			})
		end

 		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_grades_' .. gang.name, {
			title    = _U('salary_management'),
			align    = 'top-right',
			elements = elements
		}, function(data, menu)

 			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'manage_grades_amount_' .. gang.name, {
				title = _U('salary_amount')
			}, function(data2, menu2)

 				local amount = tonumber(data2.value)

 				if amount == nil then
					ESX.ShowNotification(_U('invalid_amount'))
				elseif amount > Config.MaxSalary then
					ESX.ShowNotification(_U('invalid_amount_max'))
				else
					menu2.close()

 					ESX.TriggerServerCallback('gangs:setGangSalary', function()
						OpenManageGradesMenu(gangname)
					end, gang, data.current.value, amount)
				end

 			end, function(data2, menu2)
				menu2.close()
			end)

 		end, function(data, menu)
			menu.close()
		end)

 	end, gangname)

end

AddEventHandler('gangs:openBossMenu', function(gang, close, options)
	OpenBossMenu(gang, close, options)
end)

AddEventHandler('gangs:openBossMenugm', function(gang, close, options)
	OpenBossMenugm(gang, close, options)
end)

local drawEndCD = false
local spam = false
local fetchBool = false
local jobsGang = {
	TX = true,
	Army = true,
	Mechanics = true,
	Weazels = true,
	Medics = true,
}
function buyTicket()
	if not fetchBool then
		fetchBool = true
		Citizen.CreateThread(function()
			while fetchBool do
				Wait(5000)
				if not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'ssss') then
					fetchBool = false
					break
				end
				buyTicket()
			end
		end)
	end
	local elements = {
		{label = 'قرعه کشی هنوز شروع نشده'},
		{label = 'Bank markazi',value = 'PrincipalBank'},
		{label = 'Bank maze',value = 'fleeca2'},
		{label = 'Bank blain',value = 'blainecounty'},
		{label = 'Bimeh',value = 'bime', value2 = 'lifeInvader'},
		{label = 'Cargo',value = 'cargo'},
		{label = 'Mythic',value = 'mythic'},
		{label = 'Javaheri flat',value = 'flat'},
	}

	ESX.TriggerServerCallback('rob:getcd', function(rob,canrob,canrob2,endGCD)
		if rob.buyticket and ((rob.ghoreStartTS + (5 * 60)) - exports['sunset_utils']:GetServerOSTime()) > 20 then 
			if not rob.ghoreKeshiList[ESX.PlayerData.gang.name] then
				elements[1] = {label = 'شرکت در قرعه کشی',value = 'sherkat'}
			else
				elements[1] = {label = 'افزایش شانس قرعه کشی',value = 'sherkat'}
			end
		else
			table.remove(elements,1)
		end
		table.insert(elements, {label = 'Tedad plan ha : '.. rob.planCount})
		if canrob then
			local jobs = {}
			local p = promise:new()
			ESX.TriggerServerCallback('rob:getall2',function(count)
				p:resolve(count)
			end)
			jobs = Citizen.Await(p)

			for k, v in pairs(elements) do
				if rob[v.value] and rob[v.value] ~= 'sherkat' then
					local canBuy = true
					if v.value == 'PrincipalBank' then
						if rob['PrincipalBank'].cooldown or rob['PrincipalBank2'].cooldown then
							canBuy = false
						end	
					else
						if rob[v.value].cooldown then
							canBuy = false
						end	
					end
					if canBuy then
						if v.value then
							local check = exports['sun-jewelry']:getRob(v.value2 or v.value)
							if check then
								canBuy = (not check.mt or jobs.mt >= check.mt) and (not check.all or jobs.all >= check.all) and (not check.police or jobs.police >= check.police)
							else
								canBuy = false
							end
						end
					end
					v.label = v.label .. ' : ' .. (canBuy and '✔️' or '❌')
				end
			end
			if rob.ghoreKeshiList then
				for k, v in pairs(rob.ghoreKeshiList) do
					table.insert(elements,{label = k .. ' - x'.. v})
				end
			end
			if rob.buyticket then
				table.insert(elements,{label = ((rob.ghoreStartTS + (5 * 60)) - exports['sunset_utils']:GetServerOSTime()).. ' Sanie ta shorue ghore keshi'})
			else
				table.insert(elements,{label = 'Dar hale hazar yek belit dar shahr vojud darad!'})
			end
			if rob.ghoreWinner then
				table.insert(elements,{label = 'Barande ghore keshi ghabl : ' .. rob.ghoreWinner})
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'ssss', {
				title    = 'Ticket',
				align    = 'top-right',
				elements = elements
			}, function(data, menu)
				-- if spam then return ESX.ShowNotification('Spam nakonid!') end
				-- spam = true
				-- Citizen.SetTimeout(5000,function()
				-- 	spam = false
				-- end)
				-- ESX.TriggerServerCallback('rob:getcd', function(rob,canrob,canrob2,endGCD)
				-- 	if canrob then
				-- 		if rob.buyticket then
				-- 			local canbuy = true
				-- 			if data.current.value == 'PrincipalBank' then
				-- 				if rob['PrincipalBank'].cooldown or rob['PrincipalBank2'].cooldown then
				-- 					canbuy = false
				-- 				end	
				-- 			else
				-- 				if rob[data.current.value].cooldown then
				-- 					canbuy = false
				-- 				end	
				-- 			end
				-- 			if canbuy then
				-- 				local enoughPD = false
				-- 				local p = promise:new()
				-- 				if data.current.pd then
				-- 					ESX.TriggerServerCallback('rob:getpolice',function(count)
				-- 						if count >= data.current.pd then
				-- 							p:resolve(true)
				-- 						else
				-- 							p:resolve(false)
				-- 						end
				-- 					end)
				-- 				elseif data.current.sh then
				-- 					ESX.TriggerServerCallback('rob:getsheriff',function(count)
				-- 						if count >= data.current.sh then
				-- 							p:resolve(true)
				-- 						else
				-- 							p:resolve(false)
				-- 						end
				-- 					end)
				-- 				elseif data.current.shared then
				-- 					ESX.TriggerServerCallback('rob:getall',function(count)
				-- 						if count >= data.current.shared then
				-- 							p:resolve(true)
				-- 						else
				-- 							p:resolve(false)
				-- 						end
				-- 					end)
				-- 				end
				-- 				enoughPD = Citizen.Await(p)
				-- 				if enoughPD then
				-- 					TriggerServerEvent('cd:buyTicket',data.current.value,data.current.label)
				-- 				else
				-- 					ESX.ShowNotification('Police kafi jahat start in robbery vojoud nadarad!')
				-- 				end
				-- 			else
				-- 				ESX.ShowNotification('In robbery dar cooldown ast!')
				-- 			end
				-- 		else
				-- 			ESX.ShowNotification('Yek naghshe dar hale hazer kharide shode,lotfan sabur bashid', 3000)
				-- 		end
				-- 	else
				-- 		if not drawEndCD then
				-- 			drawEndCD = true
				-- 			Citizen.CreateThread(function()
				-- 				while drawEndCD and endGCD > 0 do
				-- 					Citizen.Wait(1000)
				-- 					endGCD = endGCD - 1
				-- 					ESX.ShowMissionText(endGCD .. 's ta payan global cooldown!')
				-- 				end
				-- 				drawEndCD = false
				-- 			end)
				-- 		end
				-- 		ESX.ShowNotification('Yek robbery dar shahr dar hal anjam ast,', 3000)
				-- 	end
				-- end)  
				if data.current.value == 'sherkat' and canrob and not jobsGang[ESX.PlayerData.gang.name] then
					local keyboard, count = exports["input"]:Keyboard({
						header = 'Che tedad plan ro mizarid?', 
						rows = {'Tedad'}
					})
					if keyboard then
						local count = tonumber(count)
						if tonumber(count) then
							if ESX.doesHaveGangPerm('ghoreKeshi') and count > 0 then
								ESX.TriggerServerEvent('cd:regiserGhore', tonumber(count))
								buyTicket()
							else
								ESX.Alert('', 'Shoma dastresi be sherkat dar ghore keshi nadarid.', 7000, 'error')
							end
						end
					end
				end
			end, function(data, menu)
				menu.close()
			end)
		else
			if not drawEndCD then
				drawEndCD = true
				Citizen.CreateThread(function()
					while drawEndCD and endGCD > 0 do
						Citizen.Wait(1000)
						endGCD = endGCD - 1
						ESX.ShowMissionText(endGCD .. 's ta payan global cooldown!')
					end
					drawEndCD = false
				end)
			end
			ESX.ShowNotification('Yek robbery dar shahr dar hal anjam ast,', 3000)
		end
	end) 
end

exports('isInGreenZone',function()
	local coords = GetEntityCoords(PlayerPedId())
	for k, v in pairs(greenZone) do
		if ESX.GetDistance(coords,v.xyz) < v.w then
			return true
		end
	end
end)

RegisterNetEvent('cd:startNewPlanSession',function()
	if ESX.PlayerData.gang.name ~= 'nogang' and not jobsGang[ESX.PlayerData.gang.name] then
		TriggerEvent('chat:addMessage',{
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 150, 0, 0.4); border-radius: 3px;"><i class="far fa-newspaper"></i> Robbery Plan:<br>  {1}</div>',
			args = { '', 'Ghore keshi robbery ta 5 daghighe digar start mishavad!' }
		})
	end
end)