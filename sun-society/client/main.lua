ESX, jobPermissions = nil, nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

local cleanJob = {
	wash = true,
	carbimeh =  true,
}

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
	if ESX.PlayerData.job.name ~= 'nojob' then
		local p = promise.new()
		ESX.TriggerServerCallback('esx_society:getJobPerm',function(cb)
			p:resolve(cb)
		end)
		jobPermissions = Citizen.Await(p) or {}
	end
end)

function OpenBossMenu(society, close, options)
	local isBoss = nil
	local isBoss2 = nil
	local isBoss3 = false
	local jobPerms = {}
	local options  = options or {}
	elements = {}

	ESX.TriggerServerCallback('esx_society:isBoss', function(result)
		isBoss = result
	end, society)
	
	ESX.TriggerServerCallback('esx_society:isBoss2', function(result,jp,bos)
		jobPerms = jp
		isBoss3 = bos
		isBoss2 = result
	end, society)

	while isBoss == nil do
		Citizen.Wait(100)
	end

	if not isBoss then
		return
	end

	local defaultOptions = {
		withdraw  = false,
		deposit   = true,
		employees = true,
		grades    = false
	}

	for k,v in pairs(defaultOptions) do
		if options[k] == nil then
			options[k] = v
		end
	end
	if isBoss2 and (not cleanJob[society] or society == 'wash' or society == 'carbimeh') then
		local p = promise.new()
		ESX.TriggerServerCallback('esx_society:getSocietyMoney', function(money)
			local formattedMoney = _U('locale_currency', ESX.Math.GroupDigits(money))
			table.insert(elements ,{label = 'Society Money: <span style="color:green;">$'.. money .. '</span>', value = nil})
			p:resolve()
		end, ESX.PlayerData.job.name)
		Citizen.Await(p)
	end
	
	if isBoss2 and (not cleanJob[society] or society == 'wash' or society == 'carbimeh') then
		table.insert(elements, {label = _U('withdraw_society_money'), value = 'withdraw_society_money'})
	end

	if (not cleanJob[society] or society == 'wash' or society == 'carbimeh') then
		table.insert(elements, {label = _U('deposit_society_money'), value = 'deposit_money'})
	end

	if isBoss2 or (jobPerms and jobPerms[tostring(ESX.PlayerData.job.grade)] and jobPerms[tostring(ESX.PlayerData.job.grade)].employeeManagement) then
		table.insert(elements, {label = _U('employee_management'), value = 'manage_employees'})
	end
	if isBoss2 and isBoss3 then
		table.insert(elements, {label = 'Modiriat rank', value = 'manage_grade'})
	end

	admin = false
	isaccpet = false
	ESX.TriggerServerCallback('esx_aduty:getAdminPerm', function(aperm)
		if aperm >= 8 then
			admin = true				
		end
		isaccpet = true
	end)
	while not isaccpet do
		Wait(1)
	end
	if admin then
		table.insert(elements, {label = 'Modiriat Salary', value = 'manage_grades'})
	end
	--end
	if isBoss2 and not cleanJob[society] then
		table.insert(elements, {label = 'Modiriat Lebas', value = 'manage_outfit'})
	end
	if isBoss2 and not cleanJob[society] then
		table.insert(elements, {label = 'Modiriat Mashin', value = 'manage_vehicle'})
	end
	if isBoss2 and not cleanJob[society] then
		table.insert(elements, {label = 'Modiriat Dastresi item', value = 'manage_inventory'})
	end
	if isBoss2 and (society == 'police' or society == 'sheriff' or society == 'fbi' or society == 'mt' or society == 'justice' or society == 'detective')  and not cleanJob[society] then
		table.insert(elements, {label = 'Modiriat Dastresi aslahe', value = 'manage_armory'})
	end
	if isBoss2 and society == 'police' then
		table.insert(elements, {label = 'Change to sheriff', value = 'toggle_mili',type = 2})
		table.insert(elements, {label = 'Change to MT', value = 'toggle_mili',type = 3})
		table.insert(elements, {label = 'Change to CID', value = 'toggle_mili',type = 4})
	end
	if isBoss2 and society == 'sheriff' then
		table.insert(elements, {label = 'Change to police', value = 'toggle_mili',type = 1})
		table.insert(elements, {label = 'Change to MT', value = 'toggle_mili',type = 3})
		table.insert(elements, {label = 'Change to CID', value = 'toggle_mili',type = 4})
	end
	if isBoss2 and society == 'mt' then
		table.insert(elements, {label = 'Change to police', value = 'toggle_mili',type = 1})
		table.insert(elements, {label = 'Change to sheriff', value = 'toggle_mili',type = 2})
		table.insert(elements, {label = 'Change to CID', value = 'toggle_mili',type = 4})
	end
	if isBoss2 and society == 'detective' then
		table.insert(elements, {label = 'Change to police', value = 'toggle_mili',type = 1})
		table.insert(elements, {label = 'Change to sheriff', value = 'toggle_mili',type = 2})
		table.insert(elements, {label = 'Change to MT', value = 'toggle_mili',type = 3})
	end
	if isBoss2 and not cleanJob[society] then
		table.insert(elements, {
			label = 'Ezafe kardan division',
			value = 'adddivision'
		})
		table.insert(elements, {
			label = 'Hazf kardan division',
			value = 'deletedivision'
		})
	end
	local p = promise.new()
	ESX.TriggerServerCallback('esx_society:getDispatchType',function(cb)
		p:resolve(cb)
	end)
	local dispatchStatus = Citizen.Await(p)
	if isBoss2 and (society == 'taxi' or society == 'mechanic' or society == 'ambulance') then
		table.insert(elements, {label = 'Olaviat system dispatch('.. (dispatchStatus and 'fasele' or 'tartib saf') ..')', value = 'dispatch_toggle'})
	end
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'boss_actions_' .. society, {
		title    = _U('boss_menu'),
		align    = 'top-left',
		elements = elements
	}, function(data, menu)

		if data.current.value == 'withdraw_society_money' then

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'withdraw_society_money_amount_' .. society, {
				title = _U('withdraw_amount')
			}, function(data, menu)

				local amount = tonumber(data.value)

				if amount == nil then
					ESX.ShowNotification(_U('invalid_amount'))
				else
					menu.close()
					TriggerServerEvent('esx_society:withdrawMoney', society, amount)
					OpenBossMenu(society, close, options)
					
				end

			end, function(data, menu)
				menu.close()
			end)

		elseif data.current.value == 'deposit_money' then
			OpenDepositMoney(society, close, options)
		elseif data.current.value == 'manage_grade' then
			ManageGrade(society)
		elseif data.current.value == 'manage_employees' then
			OpenManageEmployeesMenu(society)
		elseif data.current.value == 'manage_grades' then
			OpenManageGradesMenu(society)
		elseif data.current.value == 'manage_outfit' then
			OpenManageClotheMenu(society)
		elseif data.current.value == 'manage_vehicle' then
			OpenManageVehicleMenu(society)
		elseif data.current.value == 'manage_inventory' then
			OpenManageInvMenu(society)
		elseif data.current.value == 'manage_armory' then
			OpenManageArmoryMenu(society)
		elseif data.current.value == 'adddivision' then
			adddivision(society)
		elseif data.current.value == 'deletedivision' then
			deldivision(society)
		elseif data.current.value == 'toggle_mili' then
			ESX.TriggerServerEvent('esx_society:toggle_mili',data.current.type)
		elseif data.current.value == 'dispatch_toggle' then
			TriggerServerEvent('esx_society:toggleDispatch')
			menu.close()
			OpenBossMenu(society, close, options)
		end

	end, function(data, menu)
		if close then
			close(data, menu)
		end
	end)

end

function OpenDepositMoney(society, close, options)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'deposit_money_amount_' .. society, {
		title = _U('deposit_amount')
	}, function(data, menu)

		local amount = tonumber(data.value)

		if amount == nil then
			ESX.ShowNotification(_U('invalid_amount'))
		else
			menu.close()
			TriggerServerEvent('esx_society:depositMoney', society, amount)
			OpenBossMenu(society, close, options)
		end

	end, function(data, menu)
		menu.close()
	end)
end

function OpenManageEmployeesMenu(society)
    if society == 'taxi' or society == 'police' or society == 'ambulance' or society == 'mechanic' or society == 'sheriff' or society == 'mt' or society == 'fbi' or society == 'offfbi' or society == 'offsheriff' or society == 'offmechanic' or society == 'offambulance' or society == 'offpolice' or society == 'offmt' or society == 'offtaxi' or society == 'weazel' or society == 'offweazel' or society == 'resturan' or society == 'offresturan' or society == 'wash' or society == 'carbimeh' or society == 'justice' or society == 'offjustice' or society == 'detective' or society == 'offdetective' then 
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_employees_' .. society, {
		title    = _U('employee_management'),
		align    = 'top-left',
		elements = {
			{label = 'List A\'aza', value = 'employee_list'},
			{label = 'List A\'aza(Off Duty)', value = 'employee_listoff'},
			{label = 'Estekhdam',       value = 'recruit'}
		}
	}, function(data, menu)

		if data.current.value == 'employee_list' then
			OpenEmployeeList(society,society)
		end
		
		if data.current.value == 'employee_listoff' then
			OpenEmployeeList('off' .. society,society)
		end

		if data.current.value == 'recruit' then
			OpenRecruitMenu(society)
		end

	end, function(data, menu)
		menu.close()
	end)
	else
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_employees_' .. society, {
		title    = _U('employee_management'),
		align    = 'top-left',
		elements = {
			{label = 'List A\'aza', value = 'employee_list'},
			{label = 'Estekhdam',       value = 'recruit'}
		}
	}, function(data, menu)

		if data.current.value == 'employee_list' then
			OpenEmployeeList(society)
		end

		if data.current.value == 'recruit' then
			OpenRecruitMenu(society)
		end

	end, function(data, menu)
		menu.close()
	end)
	end
end

function OpenEmployeeList(society,societyreal)
	ESX.TriggerServerCallback('esx_society:getEmployees', function(employees)

		local elements = {
			head = {_U('employee'), _U('grade'), _U('actions')},
			rows = {}
		}
		for i=1, #employees, 1 do
			local gradeLabel = (employees[i].job.grade_label == '' and employees[i].job.label or employees[i].job.grade_label)
			table.insert(elements.rows, {
				data = employees[i],
				cols = {
					employees[i].name,
					gradeLabel,
					(society == 'police' or society == 'sheriff' or society == 'mt' or society == 'detective' or society == 'car' or society == 'mechanic') and '{{' .. _U('promote') .. '|promote}} {{Swap|swap}} {{' .. _U('fire') .. '|fire}}' or '{{' .. _U('promote') .. '|promote}} {{' .. _U('fire') .. '|fire}}',
					employees[i].profilePicture
				}
			})
		end

		ESX.UI.Menu.Open('list', GetCurrentResourceName(), 'employee_list_' .. society, elements, function(data, menu)
			local employee = data.data

			if data.value == 'promote' then
				menu.close()
				OpenPromoteMenu(society, employee)
			elseif data.value == 'swap' then
				menu.close()
				OpenPromoteMenu(society, employee,true)
			elseif data.value == 'fire' then
				menu.close()
				local alert = lib.alertDialog({
					header = 'Fire',
					content = ('Aya mayel be fire %s hastid?'):format(employee.name),
					centered = true,
					cancel = true
				})
				if alert == 'confirm' then
					ESX.ShowNotification(_U('you_have_fired', employee.name))

					ESX.TriggerServerCallback('esx_society:setJob', function()
						OpenEmployeeList(society)
					end, employee.identifier, 'nojob', 0, 'fire')
				end
			end
		end, function(data, menu)
			menu.close()
			OpenManageEmployeesMenu(societyreal)
		end)

	end, society)

end

function OpenRecruitMenu(society)

	ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)

		local elements = {}

		for i=1, #players, 1 do
			if players[i].job.name ~= society then
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

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'recruit_' .. society, {
			title    = _U('recruiting'),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'recruit_confirm_' .. society, {
				title    = _U('do_you_want_to_recruit', data.current.name),
				align    = 'top-left',
				elements = {
					{label = _U('no'),  value = 'no'},
					{label = _U('yes'), value = 'yes'}
				}
			}, function(data2, menu2)
				menu2.close()

				if data2.current.value == 'yes' then
					ESX.ShowNotification(_U('you_have_hired', data.current.name))

					ESX.TriggerServerCallback('esx_society:setJob', function()
						OpenRecruitMenu(society)
					end, data.current.identifier, society, 1, 'hire')
				end
			end, function(data2, menu2)
				menu2.close()
			end)

		end, function(data, menu)
			menu.close()
		end)

	end)

end

function OpenPromoteMenu(society, employee,swap)
	local society2 = society
	if swap then
		local p = promise.new()
		local elements = {}
		if society == 'police' or society == 'sheriff' or society == 'mt' or society == 'detective' then
			elements = {
				{label = 'Police', value ='police'},
				{label = 'Sheriff', value ='sheriff'},
				{label = 'MT', value ='mt'},
				{label = 'CID', value ='detective'}
			}
		end
		if society == 'car' or society == 'mechanic' then
			elements = {
				{label = 'Mechanic', value ='mechanic'},
				{label = 'Car', value ='car'}
			}
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'swap', {
			title    ='Be koja swap she?',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			p:resolve(data.current.value)
		end, function(data, menu)
			menu.close()
			p:resolve(false)
		end)
		society2 = Citizen.Await(p)
		if not society2 then return end
	end
	ESX.TriggerServerCallback('esx_society:getJob', function(job)

		local elements = {}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)

			table.insert(elements, {
				label = gradeLabel,
				value = job.grades[i].grade,
				selected = (employee.job.grade == job.grades[i].grade)
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'promote_employee_' .. society, {
			title    = _U('promote_employee', employee.name),
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			menu.close()
			ESX.ShowNotification(_U('you_have_promoted', employee.name, data.current.label))

			ESX.TriggerServerCallback('esx_society:setJob', function()
				OpenEmployeeList(society)
			end, employee.identifier, society, data.current.value, 'promote',society2)
		end, function(data, menu)
			menu.close()
			OpenEmployeeList(society)
		end)

	end, society2)
end

function OpenManageGradesMenu(society)

	ESX.TriggerServerCallback('esx_society:getJob', function(job)

		local elements = {}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)

			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(gradeLabel, _U('money_generic', ESX.Math.GroupDigits(job.grades[i].salary))),
				value = job.grades[i].grade
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_grades_' .. society, {
			title    = 'Modiriat salary',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'manage_grades_amount_' .. society, {
				title = 'Mablagh salary'
			}, function(data2, menu2)

				local amount = tonumber(data2.value)

				if amount == nil then
					ESX.ShowNotification(_U('invalid_amount'))
				elseif amount > Config.MaxSalary then
					ESX.ShowNotification(_U('invalid_amount_max'))
				else
					menu2.close()

					ESX.TriggerServerCallback('esx_society:setJobSalary', function()
						OpenManageGradesMenu(society)
					end, society, data.current.value, amount)
				end

			end, function(data2, menu2)
				menu2.close()
			end)

		end, function(data, menu)
			menu.close()
		end)

	end, society)

end

function OpenManageVehicleMenu(society)

	ESX.TriggerServerCallback('esx_society:getJob', function(job)

		local elements = {}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)

			table.insert(elements, {
				label = gradeLabel,
				value = job.grades[i].grade
			})
		end

		for i=1, #job.divisions, 1 do
			local gradeLabel = job.divisions[i].name

			table.insert(elements, {
				label = gradeLabel,
				value = gradeLabel
			})
		end


		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_dev_' .. society, {
			title    = 'Modiriat Mashin',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			grade = data.current.value
				openmenuveh(society,grade)
		end, function(data, menu)
			menu.close()
		end)

	end, society)

end

function adddivision(society)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'manage_dev_name2_' .. society, {
		title = 'Esm division ra vared konid'
	}, function(data3, menu3)

		local name = tostring(data3.value)
		if name == nil then
			ESX.ShowNotification('Esm mored nazar ghabel ghabul nist')
		elseif name == "" then
			ESX.ShowNotification('Esm mored nazar ghabel ghabul nist')
		elseif #name > 15 then
			ESX.ShowNotification('character esm bishtar az 15 tast')
		
		else
			menu3.close()
			TriggerServerEvent('esx_society:adddivision',name)
		end

	end, function(data3, menu3)
		menu3.close()
	end)
end

function deldivision(society)
	ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'manage_dev_name2_' .. society, {
		title = 'Esm division ra vared konid'
	}, function(data3, menu3)

		local name = tostring(data3.value)
		if name == nil then
			ESX.ShowNotification('Esm mored nazar ghabel ghabul nist')
		elseif name == "" then
			ESX.ShowNotification('Esm mored nazar ghabel ghabul nist')
		elseif #name > 15 then
			ESX.ShowNotification('character esm bishtar az 15 tast')
		
		else
			menu3.close()
			TriggerServerEvent('esx_society:deldivision',name)
		end

	end, function(data3, menu3)
		menu3.close()
	end)
end



function openmenuveh(society,grade)
	ESX.TriggerServerCallback('esx_society:getJobvehicle', function(vehicle)
		local elements2 = {}
		for k , v in ipairs(vehicle) do
			local vehperm = json.decode(v.perm)
			local access = "❌"
			 state = true
			if vehperm[tostring(grade)] == "true" then
				access = "✔️"
				state = false
			end
			table.insert(elements2, {
				label = v.label  .. "(".. access ..")",
				value = v.label,
				state = state
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_vehicle1' .. society, {
			title    = 'List mashin ha',
			align    = 'top-left',
			elements = elements2
		}, function(data2, menu2)
			TriggerServerEvent('esx_society:setvehstate',data2.current.value,grade,data2.current.state)
			menu2.close()
			openmenuveh(society,grade)
		end, function(data2, menu2)
			menu2.close()
		end)

	end)
end

function OpenManageInvMenu(society)

	ESX.TriggerServerCallback('esx_society:getJob', function(job)

		local elements = {}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)
			table.insert(elements, {
				label = gradeLabel,
				value = job.grades[i].grade,
				perm =  job.grades[i].inventoryperm,
				division = false
			})
		end

		for i=1, #job.divisions, 1 do
			local gradeLabel = job.divisions[i].name
			table.insert(elements, {
				label = gradeLabel,
				value = gradeLabel,
				perm = job.divisions[i].inventoryperm,
				division = true
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_dev_' .. society, {
			title    = 'Modiriat Inventory',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			grade = data.current.value
				openmenuinv(society,grade,data.current.perm,data.current.division)
		end, function(data, menu)
			menu.close()
		end)

	end, society)

end

function openmenuinv(society,grade,perm,division)
	ESX.TriggerServerCallback('inventory-job:getInventory', function(data)
		local elements2 = {}
		local perm = json.decode(perm)
		for k, v in pairs(data.items) do
			v.label = ESX.getItemLabel(v.name)
			if v.label then
				local access = "❌"
				state = true
				if perm[string.lower(v.name)] then
					access = "✔️"
					state = false
				end
				table.insert(elements2, {
					label = v.label  .. "(".. access ..")",
					value = v.name,
					state = state,
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_item1' .. society, {
			title    = 'List item ha',
			align    = 'top-left',
			elements = elements2
		}, function(data2, menu2)
			TriggerServerEvent('esx_society:setitemstate',data2.current.value,grade,data2.current.state,division)
			menu2.close()
			grade = tostring(grade)
			perm[data2.current.value] = data2.current.state
			openmenuinv(society,grade,json.encode(perm),division)
		end, function(data2, menu2)
			menu2.close()
		end)

	end, society)
end

function OpenManageArmoryMenu(society)

	ESX.TriggerServerCallback('esx_society:getJob', function(job)

		local elements = {}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)
			table.insert(elements, {
				label = gradeLabel,
				value = job.grades[i].grade,
				perm =  job.grades[i].armoryperm,
				division = false
			})
		end

		for i=1, #job.divisions, 1 do
			local gradeLabel = job.divisions[i].name
			table.insert(elements, {
				label = gradeLabel,
				value = gradeLabel,
				perm = job.divisions[i].armoryperm,
				division = true
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_dev_' .. society, {
			title    = 'Modiriat Armory',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			grade = data.current.value
				openmenuarmory(society,grade,data.current.perm,data.current.division)
		end, function(data, menu)
			menu.close()
		end)

	end, society)

end

function openmenuarmory(society,grade,perm,division)
    ESX.TriggerServerCallback('inventory-job:getInventory', function(data)
        local elements2 = {}
        local perm = json.decode(perm)
		local aded = {}
        for k, v in pairs(data.weapons) do
			if not aded[v.name] then
				aded[v.name] = true
				local access = "❌"
				state = true
				if v.name and perm[string.lower(v.name)] then
					access = "✔️"
					state = false
				end
				if ESX.GetWeaponLabel(v.name) then
					table.insert(elements2, {
						label = ESX.GetWeaponLabel(v.name)  .. "(".. access ..")",
						value = v.name,
						state = state,
					})
				end
			end
        end

        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_item1' .. society, {
            title    = 'List gun ha',
            align    = 'top-left',
            elements = elements2
        }, function(data2, menu2)
            TriggerServerEvent('esx_society:setgunstate',data2.current.value,grade,data2.current.state,division)
            menu2.close()
            grade = tostring(grade)
            perm[string.lower(data2.current.value)] = data2.current.state
            openmenuarmory(society,grade,json.encode(perm),division)
        end, function(data2, menu2)
            menu2.close()
        end)

    end,society)
end

function ManageGrade(society, grade, label)
	ESX.TriggerServerCallback('esx_society:getJob', function(job,perms)

		local elements = {}
		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)

			table.insert(elements, {
				label = gradeLabel .. '('.. job.grades[i].grade ..')',
				value = job.grades[i].grade,
				name = job.grades[i].name,
				selected = grade == tostring(job.grades[i].grade),
			})
		end
		for i=1, #job.divisions, 1 do
			local gradeLabel = job.divisions[i].name

			table.insert(elements, {
				label = gradeLabel,
				value = gradeLabel,
				division = true,
				selected = grade == tostring(gradeLabel)
			})
		end
		table.insert(elements, {
			label = 'Add grade',
			value = 'add',
		})
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_grades_' .. society, {
			title    = 'Grades',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			if data.current.value == 'add' then
				menu.close()
				ESX.TriggerServerEvent('esx_society:newGrade')
			else
				grade = data.current.value
				local elements = {
					{value = 'changeLabel' ,label = 'Taghir label'},
					{value = 'deleteGrade' ,label = 'Hazf'},
					{value = 'upgrade' ,label = 'Upgrade🔼'},
					{value = 'downgrade' ,label = 'Downgrade🔽'},
				}
				if data.current.division then
					table.insert(elements, {label = 'Set Icon', value = 'icon'})
				end
				table.insert(elements,{value = 'toggleBoss',label = 'Boss : '.. (data.current.name == 'boss' and '✅' or '❌' )})
				table.insert(elements,{value = 'toggleEmployee',label = 'Employee management : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].employeeManagement and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].employeeManagement and true or false})
				table.insert(elements,{value = 'toggleKey',label = 'Fire Employee '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].fire and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].fire and true or false,var = 'fire'})
				if not cleanJob[society] then
					table.insert(elements,{value = 'toggleDivision',label = '/setdivision : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].setDivision and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].setDivision and true or false})
				end
				if society == 'mechanic' then
					table.insert(elements,{value = 'toggleCustom',label = 'Custom : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].vehicleCustom and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].vehicleCustom and true or false})
				elseif society == 'police' or society == 'sheriff' or society == 'mt' or society == 'detective' then
					table.insert(elements,{value = 'toggleKey',label = 'Vacuim '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].vacium and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].vacium and true or false,var = 'vacium'})
					table.insert(elements,{value = 'toggleKey',label = 'Check bullet '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].checkBullet and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].checkBullet and true or false,var = 'checkBullet'})
					table.insert(elements,{value = 'toggleKey',label = 'Teleporter '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].teleporter and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].teleporter and true or false,var = 'teleporter'})
					table.insert(elements,{value = 'toggleKey',label = '/changejob '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].changejob and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].changejob and true or false,var = 'changejob'})
					table.insert(elements,{value = 'toggleKey',label = '/resetplan '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].resetplan and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].resetplan and true or false,var = 'resetplan'})
				elseif society == 'resturan' then
					table.insert(elements,{value = 'toggleKey',label = 'Estefade az locker(craft) '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].craftWithLocker and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].craftWithLocker and true or false,var = 'craftWithLocker'})
					table.insert(elements,{value = 'toggleKey',label = 'Item haye craft shode be locker bere '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].craftedItemLocker and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].craftedItemLocker and true or false,var = 'craftedItemLocker'})
					local configResturan = exports['sunset_utils']:getResturanConfig()
					for k, v in pairs(configResturan.craft.items) do
						table.insert(elements,{value = 'toggleKey',label = 'Craft '.. v.label .. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)][v.label] and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)][v.label] and true or false,var = v.label})
					end
				elseif society == 'fbi' then
					table.insert(elements,{value = 'toggleKey',label = '/findplate '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].findPlate and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].findPlate and true or false,var = 'findPlate'})
					table.insert(elements,{value = 'toggleKey',label = '/findnumber '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].findNumber and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].findNumber and true or false,var = 'findNumber'})
					table.insert(elements,{value = 'toggleKey',label = '/banbank '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].banBank and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].banBank and true or false,var = 'banBank'})
					table.insert(elements,{value = 'toggleKey',label = '/banplate '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].banPlate and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].banPlate and true or false,var = 'banPlate'})
					table.insert(elements,{value = 'toggleKey',label = '/fwarn '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].fbiWarn and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].fbiWarn and true or false,var = 'fbiWarn'})
					table.insert(elements,{value = 'toggleKey',label = '/banparking '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].banParking and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].banParking and true or false,var = 'banParking'})
					table.insert(elements,{value = 'toggleKey',label = '/checkacc '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].checkacc and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].checkacc and true or false,var = 'checkacc'})
				elseif society == 'weazel' or society == 'taxi' then
					table.insert(elements,{value = 'toggleKey',label = '/ad '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].ad and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].ad and true or false,var = 'ad'})	
					table.insert(elements,{value = 'toggleKey',label = '/news '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].news and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].news and true or false,var = 'news'})
				end
				if society == 'fbi' or society == 'justice' then
					table.insert(elements,{value = 'toggleKey',label = '/regfbi '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].regfbi and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].regfbi and true or false,var = 'regfbi'})
				end
				if ESX.militaryJobs2[society] then
					table.insert(elements,{value = 'toggleKey',label = 'Open CAD '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].openCAD and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].openCAD and true or false,var = 'openCAD'})
					table.insert(elements,{value = 'toggleKey',label = 'Add data(CAD) '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].addDataCAD and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].addDataCAD and true or false,var = 'addDataCAD'})
					table.insert(elements,{value = 'toggleKey',label = 'Remove data(CAD) '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].removeDataCAD and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].removeDataCAD and true or false,var = 'removeDataCAD'})
					table.insert(elements,{value = 'toggleKey',label = 'Buy Weapon : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].buyWeapon and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].buyWeapon and true or false,var = 'buyWeapon'})
				end
				if society ~= 'wash' and society ~= 'carbimeh' then
					table.insert(elements,{value = 'toggleEdivision',label = '/edivision(Extra division) : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].edivision and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].edivision and true or false,var = 'edivision'})
				end
				table.insert(elements,{value = 'toggleKey',label = 'Taghir slot inventory : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].updateSlot and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].updateSlot and true or false,var = 'updateSlot'})
				if society == 'resturan' or society == 'taxi' then
					table.insert(elements,{value = 'toggleKey',label = 'Post : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].delivery and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].delivery and true or false,var = 'delivery'})
				end
				if society == 'taxi' then
					table.insert(elements,{value = 'toggleKey',label = 'Peyk : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].peyk and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].peyk and true or false,var = 'peyk'})
				end
				if society == 'ambulance' then
					table.insert(elements,{value = 'toggleKey',label = 'Jarahi plastic : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].plasticSurgery and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].plasticSurgery and true or false,var = 'plasticSurgery'})
				end
				table.insert(elements,{value = 'toggleKey',label = 'Buy Item : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].buyItem and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)].buyItem and true or false,var = 'buyItem'})
				for k, v in pairs(exports['sunset_utils']:getLicenseConfig().licenses) do
					if v.viewAccess.all or v.viewAccess[society] then
						table.insert(elements,{value = 'toggleKey',label = ('View %s license'):format(v.label) .. ' : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)]['view_license_'.. k] and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)]['view_license_'.. k] and true or false,var = 'view_license_'.. k})
					end
					if v.addAccess.all or v.addAccess[society] then
						table.insert(elements,{value = 'toggleKey',label = ('Add %s license'):format(v.label) .. ' : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)]['add_license_'.. k] and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)]['add_license_'.. k] and true or false,var = 'add_license_'.. k})
					end
					if v.removeAccess.all or v.removeAccess[society] then
						table.insert(elements,{value = 'toggleKey',label = ('Remove %s license'):format(v.label) .. ' : '.. (perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)]['remove_license_'.. k] and '✅' or '❌' ),isTrue = perms and perms[tostring(data.current.value)] and perms[tostring(data.current.value)]['remove_license_'.. k] and true or false,var = 'remove_license_'.. k})
					end
				end
				if label then
					for k, v in pairs(elements) do
						if ESX.Math.Trim(v.label) == ESX.Math.Trim(label:gsub('❌', '✅')) then
							v.selected = true
							break
						end
					end
				end
				ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_grades2_' .. society, {
					title    = 'Taghir esm',
					align    = 'top-left',
					elements = elements
				}, function(data2, menu2)
					if data2.current.value == 'changeLabel' and not data2.current.division then
						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'manage_grades_name2_' .. society, {
							title = 'Esm jadid ra vared konid'
						}, function(data2, menu2)
			
							local name = tostring(data2.value)
			
							if name == nil then
								ESX.ShowNotification('Esm mored nazar ghabel ghabul nist')
							elseif name == "" then
								ESX.ShowNotification('Esm mored nazar ghabel ghabul nist')
							elseif #name > 15 then
								ESX.ShowNotification('character esm bishtar az 15 tast')
							
							else
								menu2.close()
								ESX.TriggerServerCallback('esx_society:savename', function()
								end,grade,name)
							end
			
						end, function(data2, menu2)
							menu2.close()
						end)
					elseif data2.current.value == 'deleteGrade' and not data2.current.division then
						menu2.close()
						menu.close()
						ESX.TriggerServerEvent('esx_society:deleteGrade',tonumber(grade))
					elseif data2.current.value == 'toggleBoss' then
						menu2.close()
						menu.close()
						local boss = data.current.name == 'boss'
						ESX.TriggerServerEvent('esx_society:toggleBoss',tonumber(grade),not boss)
					elseif data2.current.value == 'upgrade' and not data2.current.division then
						menu2.close()
						menu.close()
						ESX.TriggerServerEvent('esx_society:upgrade',tonumber(grade))
					elseif data2.current.value == 'downgrade' and not data2.current.division then
						menu2.close()
						menu.close()
						ESX.TriggerServerEvent('esx_society:downgrade',tonumber(grade))
					elseif data2.current.value == 'toggleEmployee' then
						menu2.close()
						menu.close()
						local isTrue = data2.current.isTrue
						ESX.TriggerServerEvent('esx_society:toggleEmployee',tostring(grade),not isTrue)
					elseif data2.current.value == 'toggleDivision' then
						menu2.close()
						menu.close()
						local isTrue = data2.current.isTrue
						ESX.TriggerServerEvent('esx_society:toggleDivision',tostring(grade),not isTrue)
					elseif data2.current.value == 'toggleCustom' then
						menu2.close()
						menu.close()
						local isTrue = data2.current.isTrue
						ESX.TriggerServerEvent('esx_society:toggleCustom',tostring(grade),not isTrue)
					elseif data2.current.value == 'toggleEdivision' then
						menu2.close()
						menu.close()
						local isTrue = data2.current.isTrue
						ESX.TriggerServerEvent('esx_society:toggleVar',tostring(grade),data2.current.var,not isTrue)
					elseif data2.current.value == 'toggleKey' then
						menu2.close()
						menu.close()
						local isTrue = data2.current.isTrue
						ESX.TriggerServerEvent('esx_society:toggleVar',tostring(grade),data2.current.var,not isTrue)
					elseif data2.current.value == 'icon' then
						menu2.close()
						menu.close()
						local input = lib.inputDialog('Link icon ra vared konid', {{type = 'textarea', label = 'Link', required = true}})
						if input[1] and input[1]:find('http') then
							TriggerServerEvent('society:setDivisionIcon', tostring(grade), input[1])
						end
					end
					ManageGrade(society, tostring(grade), data2.current.label)
				end, function(data2, menu2)
					menu2.close()
				end)
			end
		end, function(data, menu)
			menu.close()
		end)

	end, society)

end

function OpenManageClotheMenu(society)

	ESX.TriggerServerCallback('esx_society:getJob', function(job)

		local elements = {}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)

			table.insert(elements, {
				label = gradeLabel,
				value = job.grades[i].grade,
				skin_male = json.decode(job.grades[i].skin_male),
				skin_female = json.decode(job.grades[i].skin_female),
				division = false
			})
		end
		
		for i=1, #job.divisions, 1 do
			local gradeLabel = job.divisions[i].name

			table.insert(elements, {
				label = gradeLabel,
				value = gradeLabel,
				skin_male = json.decode(job.divisions[i].skin_male),
				skin_female = json.decode(job.divisions[i].skin_female),
				division = true
			})
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_clothe_' .. society, {
			title    = 'Modiriat Lebas',
			align    = 'top-left',
			elements = elements
		}, function(data, menu)
			grade = data.current.value
			division = data.current.division
			local elements2 = {}
			table.insert(elements2, {
				label = "Poushidan Lebas",
				value = "poushidan",
			})
			table.insert(elements2, {
				label = "Taghir Lebas",
				value = "change",
			})
			skin_male = data.current.skin_male
			skin_female = data.current.skin_female
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'manage_clothe2_' .. society, {
				title    = 'Modiriat Lebas',
				align    = 'top-left',
				elements = elements2
			}, function(data2, menu2)
				if data2.current.value == "poushidan" then
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
						if skin.sex == 0 then
							TriggerEvent('skinchanger:loadClothes', skin, skin_male)
						else
							TriggerEvent('skinchanger:loadClothes', skin, skin_female)
						end
					end)
				elseif data2.current.value == "change" then
					lastskin = {}
					TriggerEvent('skinchanger:getSkin', function(skin)
						lastskin = skin
					end)
							TriggerEvent('esx_skin:openRestrictedMenu', function(data, menu)
								TriggerEvent('skinchanger:getSkin', function(skin)
									ESX.TriggerServerCallback('esx_society:saveskin', function()
									end,grade,skin,division)
								end)		
								TriggerEvent('skinchanger:loadSkin', lastskin)	
								TriggerServerEvent('esx_skin:save', lastskin)
								TriggerEvent("esx:restoreLoadout")											
							end, function(data, menu)						
									menu.close()						
							end, {
								'sex',
								'tshirt_1',
								'tshirt_2',
								'torso_1',
								'torso_2',
								'decals_1',
								'decals_2',
								'mask_1',
								'mask_2',
								'arms',
								'arms_2',
								'pants_1',
								'pants_2',
								'bproof_1',
							    'bproof_2',
								'shoes_1',
								'shoes_2',
								'chain_1',
								'chain_2',
								'bags_1',
								'bags_2',
							    'helmet_1',
								'helmet_2',
								'glasses_1',
								'glasses_2',
								'ear_accessories', 
								'ear_accessories_color',
								
							})
				--	end, function(data3, menu3)
					--	menu3.close()
					--end)
				end
			end, function(data2, menu2)
				menu2.close()
				TriggerEvent("esx:restoreLoadout")				
			end)	
			
			--[[ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'manage_grades_amount_' .. society, {
				title = 'Mablagh salary'
			}, function(data2, menu2)

				local amount = tonumber(data2.value)

				if amount == nil then
					ESX.ShowNotification(_U('invalid_amount'))
				elseif amount > Config.MaxSalary then
					ESX.ShowNotification(_U('invalid_amount_max'))
				else
					menu2.close()

					ESX.TriggerServerCallback('esx_society:setJobSalary', function()
						OpenManageGradesMenu(society)
					end, society, data.current.value, amount)
				end

			end, function(data2, menu2)
				menu2.close()
			end)]]

		end, function(data, menu)
			menu.close()
			TriggerEvent("esx:restoreLoadout")	
		end)

	end, society)

end

AddEventHandler('esx_society:openbossss', function(society, close, options)
	OpenBossMenu(society, close, options)
end)

RegisterCommand('addcarjob',function(source,args)
	ESX.TriggerServerCallback('esx_aduty:getAdminPerm', function(aperm)
    	if aperm >= 13 then
			if IsPedInAnyVehicle(PlayerPedId()) then
				local data = ESX.Game.GetVehicleProperties(GetVehiclePedIsIn(PlayerPedId()))
				local input = lib.inputDialog('Label mashin ra vared konid', {
					{type = 'input', label = 'Label', required = true},
					{type = 'checkbox', label = 'Helicopter'},
				})
				if input and input[1] then
					TriggerServerEvent('addcarjob',data, input[1], input[2] and 'heli')
				end
			else
				ESX.ShowNotification('Savar mashin nisti')
			end
		end
	end)
end, false)

RegisterNetEvent('DeleteCar:Open')
AddEventHandler('DeleteCar:Open', function(data)
	local List = {}
	for k , v in pairs(data) do
		if not k:find('off') and ESX.TableLength(v.vehicles) > 0 then
			table.insert(List,{
				img = 'SS_gold.png',
				text = k, 
				text2 = k, 
				callBack = function()
					exports.icon_menu:ForceCloseMenu()
					OpenJobVehMenu(data,k)
			end})
		end
	end
	exports.icon_menu:OpenMenu(List)
end)

function OpenJobVehMenu(data,job)
	local List = {}
	local jobvehicle = data[job].vehicles
	for k , v in ipairs(jobvehicle) do
		table.insert(List,{
			img = 'SS_gold.png',
			text = v.label, 
			text2 = v.label, 
			callBack = function()
				TriggerServerEvent('esx_society:DeleteCar',job,k,v.label)
				exports.icon_menu:ForceCloseMenu()
		end})
	end
	exports.icon_menu:OpenMenu(List)
end

exports('doesHavePerm', function(key)
	if not jobPermissions then
		local p = promise.new()
		ESX.TriggerServerCallback('esx_society:getJobPerm',function(cb)
			p:resolve(cb)
		end)
		jobPermissions = Citizen.Await(p) or {}
	end
	return (jobPermissions[tostring(ESX.PlayerData.job.grade)] and jobPermissions[tostring(ESX.PlayerData.job.grade)][key]) or (jobPermissions[tostring(ESX.PlayerData.job.ext)] and jobPermissions[tostring(ESX.PlayerData.job.ext)][key])
end)

RegisterNetEvent('society:updatePermissions', function(_jobPermissions)
	jobPermissions = _jobPermissions
end)