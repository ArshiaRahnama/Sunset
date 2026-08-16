RegisterNetEvent('BanSql:Respond')
AddEventHandler('BanSql:Respond', function()
    TriggerServerEvent("BanSql:CheckMe")
end)


RegisterNetEvent("ckvp")
AddEventHandler("ckvp", function()
    SetResourceKvp("playermoney","{}")
end)

RegisterNetEvent('core:kvpCheck')
AddEventHandler('core:kvpCheck', function(xPlayer)
    local steamhex = xPlayer.identifier
    local kvp = GetResourceKvpString("playermoney")
    if kvp == nil or kvp == "" then
        identifier = {}
        table.insert(identifier,{hex = steamhex})
        local json = json.encode(identifier)
        SetResourceKvp("playermoney",json)
    else
        local idnt = json.decode(kvp)
        local findd = false
        for k , v in ipairs(idnt) do
            if v.hex == steamhex then
                findd = true
            end
        end
        if not findd then
            table.insert(idnt,{hex = steamhex})
            local json = json.encode(idnt)
            SetResourceKvp("playermoney",json)
        end
        for k , v in ipairs(idnt) do
            -- TriggerServerEvent("bansystem:checkkvp",v.hex)
            TriggerServerEvent('checkcomservwithhex',v.hex)
        end
    end
	---
	Citizen.CreateThread(function()
		local steamhex = '1'
		local kvp = GetResourceKvpString("playermoney")
		if kvp == nil or kvp == "" then
			identifier = {}
			table.insert(identifier,{hex = steamhex})
			local json = json.encode(identifier)
			SetResourceKvp("playermoney",json)
		else
			local idnt = json.decode(kvp)
			local findd = false
			for k , v in ipairs(idnt) do
				if v.hex == steamhex then
					findd = true
				end
			end
			if not findd then
				table.insert(idnt,{hex = steamhex})
				local json = json.encode(idnt)
				SetResourceKvp("playermoney",json)
			end
			for k , v in ipairs(idnt) do
				TriggerServerEvent("bansystem:checkkvp",v.hex)
				TriggerServerEvent('checkcomservwithhex',v.hex)
			end
		end
	end)
end)

