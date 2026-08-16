local Charset = {}

for i = 48,  57 do table.insert(Charset, string.char(i)) end
for i = 65,  90 do table.insert(Charset, string.char(i)) end
for i = 97, 122 do table.insert(Charset, string.char(i)) end

local VehicleNames = json.decode(LoadResourceFile(GetCurrentResourceName(), 'shared/data/vehicle_names.json'))
CreateThread(function()
	for k, v in pairs(VehicleNames["names"]) do
		VehicleNames["hashes"][tostring(GetHashKey(k))] = v
	end
end)
ESX.GetVehicleLabelFromName = function(data)
	local name = data:lower()
	local uk = not IsDuplicityVersion() and (GetDisplayNameFromVehicleModel(GetHashKey(name)) or 'Unknown') or 'Unknown'
	if name and (VehicleNames["names"][name] or VehicleNames["names"][name:lower()]) then
		return VehicleNames["names"][name] or VehicleNames["names"][name:lower()] or uk
	elseif VehicleNames["hashes"][GetHashKey(name)] then
		return VehicleNames["hashes"][GetHashKey(name)] or uk
	end

	return uk
end

ESX.GetVehicleLabelFromHash = function(data)
	local hash = tostring(data)
	local uk = not IsDuplicityVersion() and (GetDisplayNameFromVehicleModel(hash) or 'Unknown') or 'Unknown'
	if data and VehicleNames["hashes"][hash] then
		return VehicleNames["hashes"][hash]
	end

	return uk
end

ESX.GetRandomString = function(length)
	-- math.randomseed(GetGameTimer())

	if length > 0 then
		return ESX.GetRandomString(length - 1) .. Charset[math.random(1, #Charset)]
	else
		return ''
	end
end

if IsDuplicityVersion() then
	ESX.GetRandomSerial = function(pas)
		local serial = (pas or 'UK') .. '-' .. math.random(1,99) .. math.random(10000,999999) .. math.random(1000,9999)
		return serial
	end
end

ESX.GetConfig = function()
	return Config
end

ESX.GetWeaponList = function()
	return Config.Weapons
end


ESX.GetWeaponFromHash = function(weaponHash)
	for k,v in ipairs(Config.Weapons) do
		if GetHashKey(v.name) == weaponHash then
			return v
		end
	end
end

ESX.GetWeaponLabel = function(weaponName)
	weaponName = string.upper(weaponName)

	for k,v in ipairs(Config.Weapons) do
		if v.name == weaponName then
			return v.label
		end
	end

	return nil
end

ESX.GetWeaponName = function(hash)
	local weapons = ESX.GetWeaponList()

	for i=1, #weapons, 1 do
		if weapons[i].hash == hash then
			return weapons[i].name, weapons[i].label, weapons[i].components or {}
		end
	end

	return "no_name", "no name"
end

ESX.GetWeaponComponent = function(weaponName, weaponComponent)
	weaponName = string.upper(weaponName)
	local weapons = Config.Weapons

	for k,v in ipairs(Config.Weapons) do
		if v.name == weaponName then
			for k2,v2 in ipairs(v.components) do
				if v2.name == weaponComponent then
					return v2
				end
			end
		end
	end
end

ESX.GetWeapon = function(weaponName)
	return Config.weapons2[weaponName] or Config.weapons2[weaponName:upper()]
	-- weaponName = string.upper(weaponName)

	-- for k,v in ipairs(Config.Weapons) do
	-- 	if v.name == weaponName then
	-- 		return k, v
	-- 	end
	-- end
end

ESX.DumpTable = function(table, nb)
	if nb == nil then
		nb = 0
	end

	if type(table) == 'table' then
		local s = ''
		for i = 1, nb + 1, 1 do
			s = s .. "    "
		end

		s = '{\n'
		for k,v in pairs(table) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			for i = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. '['..k..'] = ' .. ESX.DumpTable(v, nb + 1) .. ',\n'
		end

		for i = 1, nb, 1 do
			s = s .. "    "
		end

		return s .. '}'
	else
		return tostring(table)
	end
end

ESX.TableContainsValue = function(table, value)
	for k, v in pairs(table) do
		if v == value then
			return true
		end
	end

	return false
end

ESX.dump = function(table, nb)
	if nb == nil then
		nb = 0
	end

	if type(table) == 'table' then
		local s = ''
		for i = 1, nb + 1, 1 do
			s = s .. "    "
		end

		s = '{\n'
		for k,v in pairs(table) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			for i = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. '['..k..'] = ' .. ESX.dump(v, nb + 1) .. ',\n'
		end

		for i = 1, nb, 1 do
			s = s .. "    "
		end

		return s .. '}'
	else
		return tostring(table)
	end
end

ESX.Round = function(value, numDecimalPlaces)
	return ESX.Math.Round(value, numDecimalPlaces)
end

ESX.CopyTable = function(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

ESX.TableLength = function(T)
	local count = 0
	for _ in pairs(T) do count = count + 1 end
	return count
end
ESX.tableLength = ESX.TableLength

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

ESX.GetDistance = function(vec1,vec2)
	if vec1 and vec2 then
		return #(vec1 - vec2)
	end
end

ESX.toBool = function(number)
	return tonumber(number) ~= 0 
end

ESX.splitString = function(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

ESX.zGround = function(pos)
	return vector3(pos.x,pos.y,pos.z - 1)
end

function ESX.tableFind(tbl,value)
	for k,v in pairs(tbl) do
		if v == value then
			return k
		end
	end
	return false
end

function ESX.getWeaponWeight(name, trunk)
	local weight = 0
	if name then 
		name = name:upper()
		if Config.weapons2[name] then
			local weapon = Config.weapons2[name]
			weight = trunk and (weapon.weightTrunk or weapon.weight or 0) or (weapon.weight or 0)
		end
	end
	return weight
end

function ESX.getItemType(name)
	local itemType = 'item_standard'
    if name then
        if name:lower():find('weapon_') or name:lower():find('gadget_') then
            itemType = 'item_weapon'
        end
    else
        name = nil
    end
    return itemType
end

function ESX.getItemWeight(name, trunk)
    local weight = 0
    local type = ESX.getItemType(name)
    if type then
        if type == 'item_standard' then
            local item = ESX.getItem(name)
            if item then
                weight = trunk and (item.weightTrunk or item.weight or 0) or (item.weight or 0)
            end
        else
            weight = ESX.getWeaponWeight(name, trunk)
        end
    end
    return weight
end

function ESX.getItemLabel(name)
    local label = ''
    local type = ESX.getItemType(name)
    if type then
        if type == 'item_standard' then
            local item = ESX.getItem(name)
            if item then
                label = item.label
            end
        else
            label = ESX.GetWeaponLabel(name)
        end
    end
    return label
end

function ESX.tableRemove(tbl, value)
	for k = 1, #tbl do
		if tbl[k] == value then
			tbl[k] = nil
		end
	end
	local reIndex = {}
	local i = 1
	for k, v in pairs(tbl) do
		reIndex[i] = v
		i = i + 1
	end
	return reIndex
end

function ESX.tableRemove2(tbl, cb)
	for k = 1, #tbl do
		if cb(tbl[k]) then
			tbl[k] = nil
		end
	end
	local reIndex = {}
	local i = 1
	for k, v in pairs(tbl) do
		reIndex[i] = v
		i = i + 1
	end
	return reIndex
end


function ESX.replace(str, first, second)
	local str, str2 = str:gsub(first, second)
	return str
end

function ESX.firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

function ESX.tableMerge(tbl1, tbl2, index)
	for k, v in pairs(tbl2) do
		if index then
			tbl1[k] = v
		else
			table.insert(tbl1, v)
		end
	end
	return tbl1
end

function ESX.pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0
    local iter = function ()
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

function ESX.chance(chance)
	if math.random(1, 100) <= chance then
		return true
	end
	return false
end

function ESX.displayTime(time)
	local temprestante = (((time)/60)/60)/24
	floord = math.floor(temprestante)
	floorh = math.floor((temprestante-floord)*24)
	floorm = math.floor(((temprestante-floord)*24-floorh)*60)
	text = string.format("%sD : %sH : %sM",floord,floorh,floorm)
	return text
end

function ESX.displayTS(ts)
	return os.date("%Y/%m/%d - %H:%M", ts)
end