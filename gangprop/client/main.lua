local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local armorystation = 1
local hasAlreadyJoined          = false
local set                       = false
local PlayerData                = {}
local GUI                       = {}
local HasAlreadyEnteredMarker   = false
local LastStation               = nil
local LastPart                  = nil
local LastEntity                = nil
local CurrentAction             = nil
local CurrentActionMsg          = ''
local CurrentActionData         = {}
local CopPed                    = 0
local allBlip                   = {}
local Data                      = {}
local blipGangs                 = {}
local Draging = false
local DragStatus = {}
local spawnkey = 0
local inPVPSUN = false
local pvpKillCount = nil
local vehnet = {}
local eventCar = {}
local eventCarBlips = {}
local eventCarBlips2 = {}
local eventInVehicle = false
local eventInVehicleBlip = 0
local _eventCarThread = false
local pvpShopOpen = false
local nearPVPShop = 0
local nearPVPWash = false
local openShopCD = false
local pvpShopOpenTS = 0
local pvpWashOpen = false
blackListWorld = {
    [97] = true,
}
local whiteListWorld = {
    [0] = true,
    [97] = true,
}
blackListWorldSearch = {
    [10] = true,
    [11] = true,
    [12] = true,
    [13] = true,
    [14] = true,
    [15] = true,
    [16] = true,
    [17] = true,
    [18] = true,
    [19] = true,
    [20] = true,
    [21] = true,
    [22] = true,
    [23] = true,
    [24] = true,
    [25] = true,
    [26] = true,
    [27] = true,
    [28] = true,
    [29] = true,
    [30] = true,
    [90] = true,
    [96] = true,
    [98] = true,
    [99] = true,
}
local camera = nil
local GlobalPerview = nil
local localVeh = nil
ESX                             = nil
GUI.Time                        = 0
multi = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function helpNoti(text)
    CurrentActionMsg = text
    Citizen.CreateThread(function()
        while CurrentAction and CurrentActionMsg == text do
            Citizen.Wait(0)
            ESX.ShowHelpNotification(CurrentActionMsg)
        end
    end)
end

local mafia = false
function multiThread()
    Citizen.CreateThread(function()
        local draw = {}
        Citizen.CreateThread(function()
            while multi do
                Citizen.Wait(0)
                for k, v in pairs(draw) do
                    if Config.markerTypes[v.type] then
                        local marker = Config.markerTypes[v.type]
                        local pos = vec(v.pos.x, v.pos.y, v.pos.z)
                        if v.plus then
                            pos = pos + vec(0, 0, v.plus)
                        end
                        DrawMarker(marker.type,  pos, 0.0, 0.0, 0.0, 0, 0.0, 0.0, marker.size,  Config.markerColor[v.key], 100, false, true, 2, false, false, false, false)
                    end
                end
            end
        end)
        while multi do
            Citizen.Wait(1000)
            local coords = GetEntityCoords(PlayerPedId())
            if Data.locker ~= nil then
                for k , v in pairs(Data.locker) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['1'..k] = {
                            type = 'locker',
                            key = k,
                            pos = pos,
                            plus = 1,
                        }
                    else
                        draw['1'..k] = nil
                    end
                end
            end
            if Data.armory ~= nil then
                for k , v in pairs(Data.armory) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['2'..k] = {
                            type = 'armory',
                            key = k,
                            pos = pos,
                            plus = 1,
                        }
                    else
                        draw['2'..k] = nil
                    end
                end
            end
    
            if Data.veh ~= nil then
                for k , v in pairs(Data.veh) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['3'..k] = {
                            type = 'veh',
                            key = k,
                            pos = pos,
                            plus = 1,
                        }
                    else
                        draw['3'..k] = nil
                    end
                end
            end
    
            if Data.vehdel ~= nil then
                for k , v in pairs(Data.vehdel) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['4'..k] = {
                            type = 'vehdel',
                            key = k,
                            pos = pos,
                        }
                    else
                        draw['4'..k] = nil
                    end
                end
            end
    
            --heli
            if Data.heli ~= nil then
                for k , v in pairs(Data.heli) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['5'..k] = {
                            type = 'heli',
                            key = k,
                            pos = pos,
                        }
                    else
                        draw['5'..k] = nil
                    end
                end
            end
    
            if Data.helidel ~= nil then
                for k , v in pairs(Data.helidel) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['6'..k] = {
                            type = 'helidel',
                            key = k,
                            pos = pos,
                            plus = 1,
                        }
                    else
                        draw['6'..k] = nil
                    end
                end
            end
            if Data.boat ~= nil then
                for k , v in pairs(Data.boat) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['7'..k] = {
                            type = 'boat',
                            key = k,
                            pos = pos,
                            plus = 1,
                        }
                    else
                        draw['7'..k] = nil
                    end
                end
            end
    
            if Data.boatdel ~= nil then
                for k , v in pairs(Data.boatdel) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['8'..k] = {
                            type = 'boatdel',
                            key = k,
                            pos = pos,
                            plus = 2
                        }
                    else
                        draw['8'..k] = nil
                    end
                end
            end
    
            --
    
            if Data.boss ~= nil then
                for k , v in pairs(Data.boss) do
                    local pos = v.pos
                    if ESX.GetDistance(coords,  vector3(pos.x,  pos.y,  pos.z)) < Config.DrawDistance2 then
                        draw['9'..k] = {
                            type = 'boss',
                            key = k,
                            pos = pos,
                            plus = 1,
                        }
                    else
                        draw['9'..k] = nil
                    end
                end
            end
        end
    end)
end
function OpenCloakroomMenu()
    ESX.UI.Menu.CloseAll()

    ESX.TriggerServerCallback('gangs:getPackData',function(__)
        local elements = {}
        if __ and ESX.TableLength(__) > 0 then
            for k , v in pairs(__) do
                local price = 0
                for k2 , v2 in pairs(v.data) do
                    local data =  exports['sunset_clothe']:getClotheData(k2)
                    if data then
                        price = price + data.price
                    end
                end
                table.insert(elements,{label = v.label .. ' - $'.. price,name = v.name,value = v.data})
            end
        else
            table.insert(elements,{label = 'Lebasi vojoud nadard'})
        end
        if PlayerData.gang.grade >= 12 then
            table.insert(elements,{label = 'Modiriat lebas',value = 'manage'})
        end
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'cloakroom',
            {
                title    = _U('cloakroom'),
                align    = 'top-right',
                elements = elements,
            },
            function(data, menu)
                menu.close()
                if data.current.value then
                    if data.current.value == 'manage' then
                        openManageClothe()
                    else
                        ESX.TriggerServerEvent('sunset_clothe:buy',nil,data.current.value)
                    end
                end
                CurrentAction     = 'menu_cloakroom'
                helpNoti(_U('open_cloackroom'))
                CurrentActionData = {}
    
            end,
            function(data, menu)
                menu.close()
                CurrentAction     = 'menu_cloakroom'
                helpNoti(_U('open_cloackroom'))
                CurrentActionData = {}
            end)
    end)
end

function openManageClothe()
    ESX.TriggerServerCallback('gangs:getPackData',function(__)
        local elements = {}
        table.insert(elements,{label = 'Ezafe kardan pack' , value = 'adddddddddddddddddasdddddddddddd'})
        __ = __ or {}
        for k , v in pairs(__) do
            table.insert(elements,{label = v.label.. ' - DELETE',name = v.name,value = v.name })
        end
        ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'cloakroom',
        {
            title    = _U('cloakroom'),
            align    = 'top-right',
            elements = elements,
        },
        function(data, menu)
            menu.close()
            if data.current.value == 'adddddddddddddddddasdddddddddddd' then
                local pack = exports['sunset_clothe']:getOwnedPack()
                if #pack > 0 then
                    local elements = {}
                    for k , v in pairs(pack) do
                        table.insert(elements,{label = v.label, value = v.name})
                    end
                    ESX.UI.Menu.Open(
                    'default', GetCurrentResourceName(), 'cloakroom',
                    {
                        title    = _U('cloakroom'),
                        align    = 'top-right',
                        elements = elements,
                    },
                    function(data, menu)
                        menu.close()
                        TriggerServerEvent('gangs:addClothe',data.current.value,data.current.label)
                        openManageClothe()
                    end,
                    function(data, menu)
                        menu.close()
                        CurrentAction     = 'menu_cloakroom'
                        helpNoti(_U('open_cloackroom'))
                        CurrentActionData = {}
                    end)
                else
                    ESX.ShowNotification('Shoma hich packi dar jib nadarid')
                end
            else
                TriggerServerEvent('gangs:removeClothe',data.current.value)
                openManageClothe()
            end
        end,
        function(data, menu)
            menu.close()
            CurrentAction     = 'menu_cloakroom'
            helpNoti(_U('open_cloackroom'))
            CurrentActionData = {}
        end)
    end)
end

function OpenArmoryMenu(station)
    local station = station

    local elements = {
        {label = 'Anbar Gang('.. armorystation ..')', value = 'property_inventory'},
    }
    --[[if Data.bulletproof ~= 0 and armorystation == 1 then]] table.insert(elements, {label = 'Poshidan armor' , value = 'get_armor'}) --end
    --[[if Data.bulletproof ~= 0 and armorystation == 1 then]] table.insert(elements, {label = 'Poshidan armor makhfi' , value = 'get_armor2'}) --end
    for k, v in pairs(Config.vipVest) do
        if ESX.tableFind(v.gang,PlayerData.gang.name) then
            table.insert(elements, {label = v.label or 'Armor VIP' , value = 'get_armor', value2 = k})
        end
    end
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'armory',
    {
        title    = _U('armory'),
        align    = 'top-right',
        elements = elements,
    },
    function(data, menu)

        if data.current.value == "property_inventory" then
            menu.close()
            OpenGangInventoryMenu(station)
        elseif data.current.value == 'get_armor' then

            local ped = GetPlayerPed(-1)
            local armor = GetPedArmour(ped)

            if armor == 100 then
                ESX.ShowNotification("~g~Armor shoma por ast nemitavanid dobare armor kharidari konid!")
            else
                TriggerServerEvent("gangprop:setArmor", false, data.current.value2)
            end
        elseif data.current.value == 'get_armor2' then
            local ped = GetPlayerPed(-1)
            local armor = GetPedArmour(ped)

            if armor == 100 then
                ESX.ShowNotification("~g~Armor shoma por ast nemitavanid dobare armor kharidari konid!")
            else
                TriggerServerEvent("gangprop:setArmor", true)
            end
        end

    end,
    function(data, menu)
        menu.close()
        CurrentAction     = 'menu_armory'
        helpNoti(_U('open_armory'))
        CurrentActionData = {station = station}
    end)
end


function OpenGangInventoryMenu()
    local _data = getGangInventory(armorystation, all)
    local items = exports['sun-inventory-hud']:sortItems(_data)
    exports['sun-inventory-hud']:openOtherInventory({items = items, timeout = 2000, label = 'Gang', maxWeight = _data.maxWeight, type = 'gang'}, function(data)
        if data.type == 'close' then
        elseif data.type == 'update' then
            return exports['sun-inventory-hud']:sortItems(getGangInventory(armorystation, all))
        elseif data.type == 'moveInside' then
            if _data.canChangeSlot then
                ESX.TriggerServerEvent('gang:updateSlot', data.data)
            end
        elseif data.type == 'moveToOther' then
            if ESX.isDead() then return end
            data.data.location = armorystation
            ESX.TriggerServerEvent('gang:inventory:put', data.data, data.canChangeSlot)
        elseif data.type == 'moveToMain' then
            if ESX.isDead() then return end
            data.data.location = armorystation
            ESX.TriggerServerEvent('gang:inventory:get', data.data)
            Wait(500)
            if data.data.droppedTo then
                data.data.inventoryType = 'main'
                exports['sun-inventory-hud']:moveInside(data.data)
            end
        end
    end)
end

function getGangInventory(station, all)
    local p = promise.new()
    ESX.TriggerServerCallback('gangs:getGangInventory', function(inventory)
        ESX.TriggerServerCallback('gangs:getgradearmoryme', function(perm)
            local data = {}
            data.weapons = {}
            data.items = {}
            data.slots = inventory.slots
            data.maxWeight = inventory.maxWeight
            local lock = ESX.doesHaveGangPerm('hideLocker')
            for k , v in ipairs(inventory.weapons) do
                state = false
                if perm[v.name] or perm['allweapon'] or PlayerData.gang.grade >= 12 or all then
                    state = true
                end
                if state then
                    table.insert(data.weapons, v)
                else
                    v.locked = true
                    v.locked2 = lock
                    table.insert(data.weapons, v)
                end
            end
            --
            for k , v in ipairs(inventory.items) do
                state = false
                if perm[v.name] or perm['allitem'] or PlayerData.gang.grade >= 12 or all then
                    state = true
                end
                if state then
                    table.insert(data.items, v)
                else
                    v.locked = true
                    v.locked2 = lock
                    table.insert(data.items, v)
                end
            end
            if perm['changeSlot'] then
                data.canChangeSlot = true
            end
            p:resolve(data)
        end, station)
    end, station or armor, all)
    return Citizen.Await(p)
end

exports('getGangInventory', getGangInventory)

function ListOwnedCarsMenu()
    local elements = {}
    local pvp = ESX.GetPlayerData().World == 97
    if pvp then
        table.insert(elements, {label = 'PVP Cars',value = 'pvp'})
        table.insert(elements, {label = 'Parking Gang'})
    end
    if pvp then
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
            title    = 'Gang Parking',
            align    = 'top-left',
            elements = elements
        }, function(data, menu)
            if data.current.value == 'pvp' then
                menu.close()
                local elements = {}
                for k ,v in pairs(Config.PVPCar) do
                    table.insert(elements,{label = ESX.GetVehicleLabelFromName(v.name) .. ' ' .. v.sc .. ' SC',model = v.name , price = v.sc})
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'spawn_owned_car', {
                        title    = 'PVP Parking',
                        align    = 'top-left',
                        elements = elements
                    }, function(data, menu)
                        if inPVPSUN then
                            ESX.TriggerServerCallback('sc:removeSC',function(buy)
                                if buy and inPVPSUN then
                                    ESX.Game.SpawnVehicle(data.current.model, {
                                        x = Data.vehspawn[spawnkey].pos.x,
                                        y = Data.vehspawn[spawnkey].pos.y,
                                        z = Data.vehspawn[spawnkey].pos.z
                                    }, Data.vehspawn[spawnkey].pos.a, function(callback_vehicle)
                                        SetVehRadioStation(callback_vehicle, "OFF")
                                        TaskWarpPedIntoVehicle(GetPlayerPed(-1), callback_vehicle, -1)
                                    end)
                                else
                                    ESX.ShowNotification('Shoma sc kafi nadarid!')
                                end
                            end,data.current.price)
                        end
                    end, function(data, menu)
                        menu.close()
                    end)
                end
            else
                openGarage('car')
            end
        end, function(data, menu)
            menu.close()
        end)
    else
        openGarage('car')
    end
end

function openGarage(type)
    ESX.TriggerServerCallback('gangprop:getVehicles', function(ownedCars)
        if #ownedCars == 0 then
            ESX.ShowNotification('~r~Shoma mashini nadarid!')
        else
            local vehicles = {}
            local identifier = ESX.GetPlayerData().identifier
            for k ,v in pairs(ownedCars) do
                if v.stored and (v.perm[tostring(PlayerData.gang.grade)] or v.owner == identifier) then
                    table.insert(vehicles, v)
                end
            end
            local k = type == 'car' and 'vehspawn' or type == 'heli' and 'helispawn' or type == 'boat' and 'boatspawn'
            exports['sun-garage']:openSpawnMenu('other', {
                vec(Data[k][spawnkey].pos.x, Data[k][spawnkey].pos.y, Data[k][spawnkey].pos.z, Data[k][spawnkey].pos.a),
            }, vehicles, function(vehicle)
                TriggerServerEvent('gangs:spawnlog', GetVehicleNumberPlateText(vehicle))
            end)
        end
    end, type)
end

function OpenGangActionsMenu()
ESX.UI.Menu.CloseAll()

local elements = {
    {label = 'Cuff',        value = 'handcuff'},
    {label = 'Un cuff',        value = 'uncuff'},
    {label = _U('drag'),            value = 'drag'},
    {label = _U('put_in_vehicle'),  value = 'put_in_vehicle'},
    {label = _U('out_the_vehicle'), value = 'out_the_vehicle'},
    {label = _U('search'), value = 'search'}
}



-- if tonumber(Data.search) == 1 then table.insert(elements, {label = _U('search'), value = 'search'}) end
--if PlayerData.gang.grade >= Data.invperm  then
--table.insert(elements, {label = 'Modiriat A\'aza', value = 'manage_user'})
--end
--if tonumber(Data.carry) == 1 then table.insert(elements, {label = 'Carry', value = 'carry'}) end
ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'citizen_interaction',
    {
        title    = _U('citizen_interaction'),
        align    = 'top-right',
        elements = elements
    },
    function(data2, menu2)
        if GetVehiclePedIsIn(PlayerPedId(),false) ~= 0 then menu2.close() return end
        local player, distance = ESX.Game.GetClosestPlayer()

        if distance ~= -1 and distance <= 3.0 then

            if data2.current.value == 'handcuff' then
                if ESX.GetPlayerData().World ~= 0 then return end
                exports['sunset_utils']:me('Eghdam be cuff fard mikone',false)
                exports['sun-jobs']:cuffplayer(2)
            elseif data2.current.value == 'uncuff' then
                if ESX.GetPlayerData().World ~= 0 then return end
                exports['sun-jobs']:uncuffplayer(2)
            elseif data2.current.value == 'drag' then
                local target, distance = ESX.Game.GetClosestPlayer()
                local target_id = GetPlayerServerId(target)
                exports['sun-jobs']:dragplayer(target_id)
            elseif data2.current.value == 'put_in_vehicle' then
                exports['sun-jobs']:putinvehicle(GetPlayerServerId(player))
            elseif data2.current.value == 'out_the_vehicle' then
                exports['sun-jobs']:putoutvehicle(GetPlayerServerId(player))
            elseif data2.current.value == "search" then
                if blackListWorldSearch[ESX.GetPlayerData().World] then return end
                if GetVehiclePedIsIn(GetPlayerPed(player),false) ~= 0 then ESX.ShowNotification('fard savar mashine') return end
                ESX.TriggerServerCallback('esx:checkemsstatus', function(data,data2)
                    exports['sunset_utils']:me('Eghdam be gashtan fard mikone', false)
                    exports['sun-inventory-hud']:openSearchMenu()
                end,GetPlayerServerId(player))
            elseif data2.current.value == "carry" then
                ESX.TriggerServerCallback('esx:checkemsstatus', function(data,data2)
                    if data and not data2 then
                        ESX.TriggerServerCallback('medic:checksignal', function(can)
                            if not can then
                                exports['sun-jobs']:togglecarry(GetPlayerServerId(player))
                            else
                                ESX.ShowNotification("medic dar rah ast! saboor bashid")
                            end
                        end,GetPlayerServerId(player))

                    else
                        ESX.ShowNotification("fard injure nist")
                    end
                end,GetPlayerServerId(player))

            end
        elseif data2.current.value == "manage_user" then
            TriggerEvent('gangs:openBossMenugm', PlayerData.gang.name, function(data, menu)
                menu.close()
                CurrentAction     = 'menu_boss_actions'
                helpNoti(_U('open_bossmenu'))
                CurrentActionData = {}
            end)
        else
            --ESX.ShowNotification(_U('no_players_nearby'))
        end

    end,
    function(data2, menu2)
        menu2.close()
    end)
end


local blackListItems = {
    ['kit50'] = true,
    ['kit100'] = true,
    ['kittire'] = true,
    ['cleaner'] = true,
    ['medikit2'] = true,
    ['bandage2'] = true,
    ['adrenaline'] = true,
}

local blackListJob = {
    ['police'] = true,
    ['sheriff'] = true,
    ['mt'] = true,
    ['offpolice'] = true,
    ['offsheriff'] = true,
    ['offmt'] = true,
    ['fbi'] = true,
    ['offfbi'] = true,
    ['justice'] = true,
    ['offjustice'] = true,
    ['detective'] = true,
    ['offdetective'] = true,
}

function OpenBodySearchMenu(player)

    ESX.TriggerServerCallback('esx:getOtherPlayerData', function(data)
        
        local elements = {}

        table.insert(elements, {label = "----- Cash -----", value = nil})
        table.insert(elements, {
            label = 'Pol: $0',
            value = '1212',
            itemType = 'item_money1212',
            amount = data.money
        })

        table.insert(elements, {label = '--- Armes ---', value = nil})

        for i=1, #data.loadout, 1 do
            if not IsBlackList(data.loadout[i].name) and not blackListJob[data.job.name] and not data.protectedItems[data.loadout[i].name:lower()] and data.permission_level == 0 then
                -- if data.job.name == "police" and data.loadout[i].name ~= "WEAPON_MICROSMG" then
                --     table.insert(elements, {
                --         label          = _U('confiscate') .. ESX.GetWeaponLabel(data.loadout[i].name),
                --         value          = data.loadout[i].name,
                --         itemType       = 'item_weapon',
                --         amount         = data.ammo,
                --     })
                -- else
                    table.insert(elements, {
                        label          = _U('confiscate') .. ESX.GetWeaponLabel(data.loadout[i].name),
                        value          = data.loadout[i].name,
                        itemType       = 'item_weapon',
                        amount         = data.ammo,
                        data = data.loadout[i],
                    })
                -- end
            end
        end

        table.insert(elements, {label = _U('inventory_label'), value = nil})

        for i=1, #data.inventory, 1 do
            if not exports['sunset_clothe']:getClotheData(data.inventory[i].name) and not string.find(data.inventory[i].name,'pack_') and not data.protectedItems[data.inventory[i].name] and not blackListJob[data.job.name] and data.permission_level == 0 and not blackListItems[data.inventory[i].name] then
                --if data.job.name == "police" or  data.job.name == "sheriff" then
                --    if not blackitem[data.inventory[i].name] then
                        if data.inventory[i].count > 0 then
                            table.insert(elements, {
                                label          = _U('confiscate_inv') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
                                value          = data.inventory[i].name,
                                itemType       = 'item_standard',
                                amount         = data.inventory[i].count,
                            })
                        end
                    -- end
                -- else
                --     if data.inventory[i].count > 0 then
                --         table.insert(elements, {
                --             label          = _U('confiscate_inv') .. data.inventory[i].count .. ' ' .. data.inventory[i].label,
                --             value          = data.inventory[i].name,
                --             itemType       = 'item_standard',
                --             amount         = data.inventory[i].count,
                --         })
                --     end
                -- end
            end
        end

        if data.scMilitary then
            table.insert(elements, {
                label          = 'SC x1',
                value          = 'sc',
                itemType       = 'item_standard',
                amount         = 1,
            })
        end

        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'body_search',
            {
                title    = _U('search'),
                align    = 'top-left',
                elements = elements,
            },
            function(data, menu)

                local itemType = data.current.itemType
                local itemName = data.current.value
                local amount   = data.current.amount

                if data.current.value ~= nil then
                    menu.close()
                    Wait(math.random(0, 500))
                    local coords = GetEntityCoords(GetPlayerPed(-1))
                    local coords2 = GetEntityCoords(GetPlayerPed(player))
                    if math.floor(Vdist2(coords.x, coords.y, coords.z, coords2.x, coords2.y, coords2.z)) < 4 then
                        TriggerServerEvent('esx:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
                        Citizen.Wait(500)
                        OpenBodySearchMenu(player)
                    else
                        ESX.ShowNotification("ah shit")
                    end

                end

            end,
            function(data, menu)
                menu.close()
            end
        )

    end, GetPlayerServerId(player))

end


function OpenGetWeaponMenu(gang)
local gang = gang

ESX.TriggerServerCallback('gangs:getArmoryWeapons', function(weapons)

    local elements = {}

    for i=1, #weapons, 1 do
    if weapons[i].count > 0 then
        table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
    end
    end

    ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'armory_get_weapon',
    {
        title    = _U('get_weapon_menu'),
        align    = 'top-right',
        elements = elements,
    },
    function(data, menu)

        menu.close()

        ESX.TriggerServerCallback('gangs:removeArmoryWeapon', function()
        OpenGetWeaponMenu(gang)
        end, data.current.value, gang)

    end,
    function(data, menu)
        menu.close()
    end
    )

end, gang)

end

function OpenPutWeaponMenu(gang)
local gang = gang
local elements   = {}
local playerPed  = GetPlayerPed(-1)
local weaponList = ESX.GetWeaponList()

for i=1, #weaponList, 1 do

    local weaponHash = GetHashKey(weaponList[i].name)

    if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
    local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
    table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
end

end

ESX.UI.Menu.Open(
'default', GetCurrentResourceName(), 'armory_put_weapon',
{
    title    = _U('put_weapon_menu'),
    align    = 'top-right',
    elements = elements,
},
function(data, menu)

    menu.close()

    ESX.TriggerServerCallback('gangs:addArmoryWeapon', function()
    OpenPutWeaponMenu(gang)
    end, data.current.value, gang)

    end,
function(data, menu)
    menu.close()
end
)

end


function OpenGetStocksMenu(gang)
    local gang = gang
    ESX.TriggerServerCallback('gangs:getStockItems', function(items)
    local elements = {}
    for i=1, #items, 1 do
        table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].label, value = items[i].name})
    end
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'stocks_menu',
        {
        title    = _U('gang_stock'),
        elements = elements
        },
        function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
            'dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
            {
            title = _U('quantity')
            },
            function(data2, menu2)

            local count = tonumber(data2.value)

            if count == nil then
                ESX.ShowNotification(_U('quantity_invalid'))
            else
                menu2.close()
                menu.close()
                TriggerServerEvent('gangs:getStockItem', gang, itemName, count)
                OpenGetStocksMenu(gang)
            end

            end,
            function(data2, menu2)
            menu2.close()
            end
        )

        end,
        function(data, menu)
        menu.close()
        end
    )

    end, gang)

end

function OpenPutStocksMenu(station)
local gang = station

ESX.TriggerServerCallback('gangprop:getPlayerInventory', function(inventory)

    local elements = {}

    for i=1, #inventory.items, 1 do

    local item = inventory.items[i]

    if item.count > 0 then
    table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
    end

    end

    ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'stocks_menu',
    {
    title    = _U('inventory'),
    elements = elements
    },
    function(data, menu)

        local itemName = data.current.value

        ESX.UI.Menu.Open(
        'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
        {
        title = _U('quantity')
        },
        function(data2, menu2)

        local count = tonumber(data2.value)

        if count == nil then
            ESX.ShowNotification(_U('quantity_invalid'))
        else
            menu2.close()
            menu.close()

            TriggerServerEvent('gangs:putStockItems', gang, itemName, count)
            OpenPutStocksMenu(station)
        end

        end,
        function(data2, menu2)
        menu2.close()
        end
    )

    end,
    function(data, menu)
    menu.close()
    end
)

end)

end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
    if PlayerData.gang.name ~= 'nogang' then
        ESX.TriggerServerCallback('gangs:getGangData', function(data)
        if data ~= nil then
            Data.gang_name    = data.gang_name
            Data.blip         = json.decode(data.blip)
            blipManager(Data.blip)

            Data.armory       = json.decode(data.armory)
            Data.locker       = json.decode(data.locker)
            Data.boss         = json.decode(data.boss)
            Data.vehicles     = json.decode(data.vehicles)
            Data.veh          = json.decode(data.veh)
            Data.vehdel       = json.decode(data.vehdel)
            Data.vehspawn     = json.decode(data.vehspawn)
            --heli
            Data.heli          = json.decode(data.heli)
            Data.helidel       = json.decode(data.helidel)
            Data.helispawn     = json.decode(data.helispawn)
            --boat
            Data.boat          = json.decode(data.boat)
            Data.boatdel       = json.decode(data.boatdel)
            Data.boatspawn     = json.decode(data.boatspawn)
            --
            Data.vehprop      = json.decode(data.vehprop)
            Data.search       = data.search
            Data.carry       = data.carry
            Data.armoryperm       = data.armoryperm
            Data.invperm       = data.invperm
            Data.bulletproof  = data.bulletproof
            Data.gangsblip  = data.gangsblip
            -- if (Data.armory and #Data.armory > 1) or (Data.locker and #Data.locker > 1) or (Data.boss and #Data.boss> 1 )  or (Data.veh and #Data.veh > 1) or (Data.vehdel and #Data.vehdel > 1) or (Data.vehspawn and #Data.vehspawn > 1) or (Data.heli and #Data.heli > 1) or (Data.helidel and #Data.helidel > 1) or  (Data.helispawn and #Data.helispawn > 1) or (Data.boat and #Data.boat > 1) or (Data.boatdel and #Data.boatdel > 1) or (Data.boatspawn and #Data.boatspawn > 1) then
            --     if not multi then
            --         multi = true
            --         multiThread()
            --     end
            -- else
            --     multi = false
            -- end
            multi = false
            Wait(1000)
            multi = true
            multiThread()
            if PlayerData.gang.name == 'Mafia' then
                if not mafia then
                    mafia = true
                    mafiaThread()
                end
            end
            ESX.SetPlayerData('CanGangLog', data.logpower)
        else
            ESX.ShowNotification('Gang Shoma Disable Shode Ast Lotfan Be Staff Morajee Konid!')
        end
        end, PlayerData.gang.name)
    else
        multi = false
    end
    Citizen.Wait(10000)
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)


RegisterNetEvent('esx:setGang')
AddEventHandler('esx:setGang', function(gang)
    thread = false
    PlayerData.gang = gang
    Data = {}
    if PlayerData.gang.name ~= 'nogang' then
        ESX.TriggerServerCallback('gangs:getGangData', function(data)
        if data ~= nil then
            Data.blip         = json.decode(data.blip)
            blipManager(Data.blip)

            Data.gang_name    = data.gang_name
            Data.armory       = json.decode(data.armory)
            Data.locker       = json.decode(data.locker)
            Data.boss         = json.decode(data.boss)
            Data.vehicles     = json.decode(data.vehicles)
            Data.veh          = json.decode(data.veh)
            Data.vehdel       = json.decode(data.vehdel)
            Data.vehspawn     = json.decode(data.vehspawn)
            Data.vehprop      = json.decode(data.vehprop)
            --heli
            Data.heli          = json.decode(data.heli)
            Data.helidel       = json.decode(data.helidel)
            Data.helispawn     = json.decode(data.helispawn)
            --boat
            Data.boat          = json.decode(data.boat)
            Data.boatdel       = json.decode(data.boatdel)
            Data.boatspawn     = json.decode(data.boatspawn)
            --
            Data.carry       = data.carry
            Data.search = data.search
            Data.bulletproof  = data.bulletproof
            Data.armoryperm  = data.armoryperm
            Data.invperm       = data.invperm
            ESX.SetPlayerData('CanGangLog', data.logpower)
            Data.gangsblip  = data.gangsblip
            multi = false
            Wait(1000)
            multi = true
            multiThread()
            if PlayerData.gang.name == 'Mafia' then
                if not mafia then
                    mafia = true
                    mafiaThread()
                end
            end
        else
            ESX.ShowNotification('You Gang has been expired, Contact admins for recharge!')
        end
        end, PlayerData.gang.name)
    else
        for _, blip in pairs(allBlip) do
        RemoveBlip(blip)
        end
        allBlip = {}
    end
end)

-- Create blips
function blipManager(blip)
    for _, blip in pairs(allBlip) do
        RemoveBlip(blip)
    end
    allBlip = {}
    for k, v in pairs(blip) do
        local blipCoord = AddBlipForCoord(v.pos.x, v.pos.y)
        table.insert(allBlip, blipCoord)
        SetBlipSprite (blipCoord, 674)
        SetBlipDisplay(blipCoord, 4)
        SetBlipScale  (blipCoord, 1.2)
        SetBlipColour (blipCoord, Config.blipColor[k])
        SetBlipAsShortRange(blipCoord, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString('Gang '.. k)
        EndTextCommandSetBlipName(blipCoord)
    end
end

local targetdrug = nil
AddEventHandler('gangprop:hasEnteredMarker', function(station, part,isdrug)

        if part:find('extra') then
            CurrentActionData = {station = station}
            if part:find('marijuana') then
                targetdrug = 'marijuana'
            elseif part:find('crack') then
                targetdrug = 'crack'
            elseif part:find('meth') then
                targetdrug = 'meth'
            elseif part:find('heroine') then
                targetdrug = 'heroine'
            end
            CurrentAction     = 'menu_harvest'
            helpNoti('Dokme ~INPUT_CONTEXT~ jahat tabdil('.. targetdrug ..')')
        end
        if station == 'Cartel' and isdrug then
            CurrentAction     = 'harvest_cartel'
            helpNoti('Dokme ~INPUT_CONTEXT~ jahat tabdil('.. part .. ')')
            CurrentActionData = {station = station}
            targetdrug = part
        end

        if part == 'Cloakroom' then
            CurrentAction     = 'menu_cloakroom'
            helpNoti(_U('open_cloackroom'))
            CurrentActionData = {station = station}
        end

        if part == 'GiveItem' then
            CurrentAction     = 'menu_item'
            helpNoti('Dokme ~INPUT_CONTEXT~ jahat daryaft peroxide')
            CurrentActionData = {station = station}
        end


        if part == 'Armory' then
            CurrentAction     = 'menu_armory'
            helpNoti( _U('open_armory'))
            CurrentActionData = {station = station}
        end

        if part == 'VehicleSpawner' then
            CurrentAction     = 'menu_vehicle_spawner'
            helpNoti(_U('vehicle_spawner'))
            CurrentActionData = {station = station}
        end

        if part == 'VehicleDeleter' then

            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)

            if IsPedInAnyVehicle(playerPed,  false) then

                local vehicle = GetVehiclePedIsIn(playerPed, false)

                if DoesEntityExist(vehicle) then
                    CurrentAction     = 'delete_vehicle'
                    helpNoti(_U('store_vehicle'))
                    CurrentActionData = {vehicle = vehicle, station = station}
                end

            end

        end
        --heli
        if part == 'HeliSpawner' then
            CurrentAction     = 'menu_heli_spawner'
            helpNoti(_U('vehicle_spawner'))
            CurrentActionData = {station = station}
        end

        if part == 'HeliDeleter' then

            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)

            if IsPedInAnyVehicle(playerPed,  false) then

                local vehicle = GetVehiclePedIsIn(playerPed, false)

                if DoesEntityExist(vehicle) then
                    CurrentAction     = 'delete_vehicle'
                    helpNoti(_U('store_vehicle'))
                    CurrentActionData = {vehicle = vehicle, station = station}
                end

            end

        end

        --boat
        if part == 'boatSpawner' then
            CurrentAction     = 'menu_boat_spawner'
            helpNoti(_U('vehicle_spawner'))
            CurrentActionData = {station = station}
        end

        if part == 'boatDeleter' then

            local playerPed = GetPlayerPed(-1)
            local coords    = GetEntityCoords(playerPed)

            if IsPedInAnyVehicle(playerPed,  false) then

                local vehicle = GetVehiclePedIsIn(playerPed, false)

                if DoesEntityExist(vehicle) then
                    CurrentAction     = 'delete_vehicle'
                    helpNoti(_U('store_vehicle'))
                    CurrentActionData = {vehicle = vehicle, station = station}
                end

            end

        end
        --
        if part == 'BossActions' then
            CurrentAction     = 'menu_boss_actions'
            helpNoti(_U('open_bossmenu'))
            CurrentActionData = {station = station}
        end

end)

AddEventHandler('gangprop:hasExitedMarker', function(station, part)
    ESX.UI.Menu.CloseAll()
    CurrentAction = nil
end)



local giveitemmafia = vector3(1393.37,1140.28,108.75)

local extramarijuana = vector3(-1039.45,312.18,60.62) -- Old Mafia Base : 1392.13,1134.79,108.75       Base Mafia : -86.51,1002.9,229.61

local extracrack = vector3(-1029.79,315.49,60.62)   --  Old Mafia Base : 1395.16,1130.64,108.75         Base Mafia : -85.1,996.28,229.61

local extraheroine = vector3(-1026.32,305.9,60.62)   -- Old Mafia Base : 1393.11,1128.67,108.75         base mafia : -85.48,1001.15,229.61

local extrameth = vector3(-1035.94,302.55,60.62)   --   Old Mafia Base :  1392.14,1130.23,108.75        base mafia :  -83.94,1003.85,229.67
-- public
local extramarijuana2 = vector3(152.57,-3192.12,4.99)

local extracrack2 = vector3(152.69,-3188.61,4.99)

local extraheroine2 = vector3(121.23,-3186.86,4.99)

local extrameth2 = vector3(121.23,-3191.14,4.99)
--

local lsd = vector3(-1858.51,2056.43,134.46)

local hollysion = vector3(-1856.86,2055.09,134.46)

local diastat = vector3(-1855.3212890625,2057.0119628906,134.46003723145)

local wellbutrin = vector3(-1855.8325195312,2060.2834472656,134.46003723145)

local desomorphine = vector3(-1858.3026123047,2059.4514160156,134.46008300781)

function mafiaThread()
    Citizen.CreateThread(function()
        while mafia do
            local coords    = GetEntityCoords(PlayerPedId())
            if ESX.GetDistance(coords,  extracrack,  true) < Config.DrawDistance then
                DrawMarker(Config.MarkerType, extracrack, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                DrawMarker(Config.MarkerType, extraheroine, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                DrawMarker(Config.MarkerType, extramarijuana, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                DrawMarker(Config.MarkerType, extrameth, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
                if Data.gang_name ~= nil and Data.gang_name == 'Mafia' then
                    if GetDistanceBetweenCoords(coords,  extrameth,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    currentStation = Data.gang_name
                    currentPart    = 'extra_meth'
                    end
                    if GetDistanceBetweenCoords(coords,  extracrack,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    currentStation = Data.gang_name
                    currentPart    = 'extra_crack'
                    end
                    if GetDistanceBetweenCoords(coords,  extraheroine,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    currentStation = Data.gang_name
                    currentPart    = 'extra_heroine'
                    end
                    if GetDistanceBetweenCoords(coords,  extramarijuana,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    currentStation = Data.gang_name
                    currentPart    = 'extra_marijuana'
                    end
                end
            else
                Citizen.Wait(3000)
            end
            Citizen.Wait(1)
        end
    end)
end
-- Display markers
Citizen.CreateThread(function()
    while true do

        Wait(1)

        local playerPed = GetPlayerPed(-1)
        local coords    = GetEntityCoords(playerPed)
        
        if ESX.GetDistance(coords,  extracrack2,  true) < Config.DrawDistance then
            DrawMarker(Config.MarkerType, extracrack2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            DrawMarker(Config.MarkerType, extraheroine2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            DrawMarker(Config.MarkerType, extramarijuana2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
            DrawMarker(Config.MarkerType, extrameth2, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        else
            Citizen.Wait(3000)
        end

        -- if Data.gang_name ~= nil and Data.gang_name == 'Cartel' and PlayerData.gang.grade >= 11 then
        --     if GetDistanceBetweenCoords(coords,  lsd,  true) < Config.DrawDistance then
        --         DrawMarker(Config.MarkerType, lsd, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        --         DrawMarker(Config.MarkerType, desomorphine, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        --         DrawMarker(Config.MarkerType, hollysion, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        --         DrawMarker(Config.MarkerType, diastat, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        --         DrawMarker(Config.MarkerType, wellbutrin, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.MarkerSize.x, Config.MarkerSize.y, Config.MarkerSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        --     end
        -- end
    end
end)


-- Enter / Exit marker events
Citizen.CreateThread(function()

    while true do

        Citizen.Wait(500)
        local isdrug = false
        if PlayerData.gang ~= nil then
            local playerPed      = GetPlayerPed(-1)
            local coords         = GetEntityCoords(playerPed)
            local isInMarker     = false
            local currentStation = nil
            local currentPart    = nil
            --

            --public drug
            if GetDistanceBetweenCoords(coords,  extrameth2,  true) < Config.MarkerSize.x then
                isInMarker     = true
                currentStation = 'no'
                currentPart    = 'extra_meth'
            end
            if GetDistanceBetweenCoords(coords,  extracrack2,  true) < Config.MarkerSize.x then
                isInMarker     = true
                currentStation = 'no'
                currentPart    = 'extra_crack'
            end
            if GetDistanceBetweenCoords(coords,  extraheroine2,  true) < Config.MarkerSize.x then
                isInMarker     = true
                currentStation = 'no'
                currentPart    = 'extra_heroine'
            end
            if GetDistanceBetweenCoords(coords,  extramarijuana2,  true) < Config.MarkerSize.x then
                isInMarker     = true
                currentStation = 'no'
                currentPart    = 'extra_marijuana'
            end
            --drug
            if Data.gang_name ~= nil and Data.gang_name == 'Cartel' and PlayerData.gang.grade >= 11 then
                if GetDistanceBetweenCoords(coords,  lsd,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    isdrug = true
                    currentStation = Data.gang_name
                    currentPart    = 'lsd'
                end

                if GetDistanceBetweenCoords(coords,  diastat,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    isdrug = true
                    currentStation = Data.gang_name
                    currentPart    = 'diastat'
                end
                if GetDistanceBetweenCoords(coords,  hollysion,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    isdrug = true
                    currentStation = Data.gang_name
                    currentPart    = 'hollysion'
                end
                if GetDistanceBetweenCoords(coords,  wellbutrin,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    isdrug = true
                    currentStation = Data.gang_name
                    currentPart    = 'wellbutrin'
                end
                if GetDistanceBetweenCoords(coords,  desomorphine,  true) < Config.MarkerSize.x then
                    isInMarker     = true
                    isdrug = true
                    currentStation = Data.gang_name
                    currentPart    = 'desomorphine'
                end
            end
            --
            if Data.locker ~= nil then
                for k , v in pairs(Data.locker) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.markerTypes['locker'].size.x then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'Cloakroom'
                    end
                end
            end

            if Data.armory ~= nil then
                for k , v in pairs(Data.armory) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.markerTypes['armory'].size.x then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'Armory'
                        armorystation = v.station
                    end
                end
            end

            if Data.veh ~= nil then
                for k , v in pairs(Data.veh) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.markerTypes['veh'].size.x then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'VehicleSpawner'
                        spawnkey = k
                    end
                end
            end

            if Data.vehspawn ~= nil then
                for k , v in pairs(Data.vehspawn) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.MarkerSize.x  then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'VehicleSpawnPoint'
                    end
                end
            end

            if Data.vehdel ~= nil then
                for k , v in pairs(Data.vehdel) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.markerTypes['vehdel'].size.x then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'VehicleDeleter'
                    end
                end
            end
            --heli
            if Data.heli ~= nil then
                for k , v in pairs(Data.heli) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.markerTypes['heli'].size.x then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'HeliSpawner'
                        spawnkey = k
                    end
                end
            end

            if Data.helispawn ~= nil then
                for k , v in pairs(Data.helispawn) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.MarkerSize.x  then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'HeliSpawnPoint'
                    end
                end
            end

            if Data.helidel ~= nil then
                for k , v in pairs(Data.helidel) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < (Config.markerTypes['helidel'].radius or Config.markerTypes['helidel'].size.x) then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'HeliDeleter'
                    end
                end
            end

            --boat
            if Data.boat ~= nil then
                for k , v in pairs(Data.boat) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.markerTypes['boat'].size.x then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'boatSpawner'
                        spawnkey = k
                    end
                end
            end

            if Data.boatspawn ~= nil then
                for k , v in pairs(Data.boatspawn) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.MarkerSize.x then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'boatSpawnPoint'
                    end
                end
            end

            if Data.boatdel ~= nil then
                for k , v in pairs(Data.boatdel) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < 5 then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'boatDeleter'
                    end
                end
            end
            --
            if Data.boss ~= nil and PlayerData.gang ~= nil  then
                for k , v in pairs(Data.boss) do
                    local pos = v.pos
                    if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < Config.markerTypes['boss'].size.x then
                        isInMarker     = true
                        currentStation = Data.gang_name
                        currentPart    = 'BossActions'
                    end
                end
            end

            local hasExited = false

            if isInMarker and not HasAlreadyEnteredMarker or (isInMarker and (LastStation ~= currentStation or LastPart ~= currentPart)) then
                if
                    (LastStation ~= nil and LastPart ~= nil) and
                    (LastStation ~= currentStation or LastPart ~= currentPart)
                then
                    TriggerEvent('gangprop:hasExitedMarker', LastStation, LastPart)
                    hasExited = true
                end
                HasAlreadyEnteredMarker = true
                LastStation             = currentStation
                LastPart                = currentPart
                TriggerEvent('gangprop:hasEnteredMarker', currentStation, currentPart,isdrug)
            end

            if not hasExited and not isInMarker and HasAlreadyEnteredMarker then

                HasAlreadyEnteredMarker = false

                TriggerEvent('gangprop:hasExitedMarker', LastStation, LastPart)
            end
        else
            Citizen.Wait(3000)
        end
    end
end)




AddEventHandler('KeyDown:e',function()
    if CurrentAction ~= nil then
        if (PlayerData.gang ~= nil or CurrentActionData.station == 'no') and (PlayerData.gang.name == CurrentActionData.station or CurrentActionData.station == 'no') and (GetGameTimer() - GUI.Time) > 150 then
            if CurrentAction == 'menu_cloakroom' then
                if IsPedInAnyVehicle(PlayerPedId()) then return end
                OpenCloakroomMenu()
                ESX.registerExitPoint(5)
            elseif CurrentAction == 'menu_harvest' then
                time = 5000
                if targetdrug == 'marijuana' then
                    time = 3000
                end
                TriggerEvent("mythic_progbar:client:progress", {
                    name = "process_drug",
                    duration = time,
                    label = "Dar hale tabdil",
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "amb@prop_human_bum_bin@idle_a",
                        anim = "idle_a",
                    }
                }, function(status)
                    if not status then

                        TriggerServerEvent('gangprop:tabdil',targetdrug)

                    elseif status then

                        ClearPedTasksImmediately(PlayerPedId())

                    end
                end)

            elseif CurrentAction == 'harvest_cartel' then
                TriggerEvent("mythic_progbar:client:progress", {
                    name = "process_drug_cartel",
                    duration = 6000,
                    label = "Dar hale tabdil",
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "amb@prop_human_bum_bin@idle_a",
                        anim = "idle_a",
                    }
                }, function(status)
                    if not status then

                        TriggerServerEvent('gangprop:tabdilcartel',targetdrug)

                    elseif status then

                        ClearPedTasksImmediately(PlayerPedId())

                    end
                end)
            elseif CurrentAction == 'menu_armory' then
                if IsPedInAnyVehicle(PlayerPedId()) then return end
                OpenArmoryMenu(CurrentActionData.station)
            elseif CurrentAction == 'menu_vehicle_spawner' then
                if IsPedInAnyVehicle(PlayerPedId()) then return end
                if whiteListWorld[ESX.GetPlayerData().World] then
                    ESX.registerExitPoint(5)
                    ListOwnedCarsMenu()
                end
            elseif CurrentAction == 'menu_heli_spawner' then
                if IsPedInAnyVehicle(PlayerPedId()) then return end
                ESX.registerExitPoint(5)
                if whiteListWorld[ESX.GetPlayerData().World] then
                    openGarage('heli')
                end
            elseif CurrentAction == 'menu_boat_spawner' then
                if IsPedInAnyVehicle(PlayerPedId()) then return end
                ESX.registerExitPoint(5)
                if whiteListWorld[ESX.GetPlayerData().World] then
                    openGarage('boat')
                end
            elseif CurrentAction == 'delete_vehicle' then
                StoreOwnedCarsMenu()
            elseif CurrentAction == 'menu_item' then
                TriggerServerEvent('gangprop:giveitemmafia')
            elseif CurrentAction == 'menu_boss_actions' then
                if IsPedInAnyVehicle(PlayerPedId()) then return end
                ESX.UI.Menu.CloseAll()
                TriggerEvent('gangs:openBossMenu', CurrentActionData.station, function(data, menu)
                    menu.close()
                    CurrentAction     = 'menu_boss_actions'
                    helpNoti(_U('open_bossmenu'))

                    CurrentActionData = {}
                end)
                ESX.registerExitPoint(5)
            end
            if CurrentAction ~= 'menu_harvest' then
                -- CurrentAction = nil
            end
            GUI.Time      = GetGameTimer()
        end
    end
    if nearPVPShop ~= 0 then
        if IsPedInAnyVehicle(PlayerPedId()) then return end
        --::reopen::
        if openShopCD then return end
        openShopCD = true
        Citizen.SetTimeout(2000,function()
            openShopCD = false
        end)
        ESX.TriggerServerCallback('gangprop:getShop',function(open,data)
            if open and data then
                local guns = {}
                for k,v in pairs(data.weapons) do
                    if v.count > 0 then
                        table.insert(guns,v)
                    end
                end
                if ESX.TableLength(guns) > 0 then
                    List = {}
                    for k,v in pairs(guns) do
                        table.insert(List,{
                            img = '',
                            text = ESX.GetWeaponLabel(v.name:upper()), 
                            text2 = 'Price : ' .. v.price .. ' SC', 
                            callBack = function()
                                exports.icon_menu:ForceCloseMenu()
                                ESX.TriggerServerEvent('gangprop:buyWeapon',nearPVPShop,v.name)
                                openShopCD = true
                                Citizen.SetTimeout(2000,function()
                                    openShopCD = false
                                end)
                                Citizen.Wait(3000)
                                --goto reopen
                                TriggerEvent('KeyDown:e')
                        end})
                    end
                    exports.icon_menu:OpenMenu(List, configs)
                else
                    ESX.ShowNotification('Guni haye in shop be etmam reside!')
                end
            end
        end,nearPVPShop)
    elseif nearPVPWash then
        if IsPedInAnyVehicle(PlayerPedId()) then return end
        if openShopCD then return end
        openShopCD = true
        Citizen.SetTimeout(2000,function()
            openShopCD = false
        end)
        if pvpShopOpen then
            local guns = {}
            for k,v in pairs(ESX.GetPlayerData().loadout) do
                if v.metadata.serial:find('PV') then
                    table.insert(guns,v)
                end
            end
            if ESX.TableLength(guns) > 0 then
                List = {}
                for k,v in pairs(guns) do
                    local price = nil
                    for k2,v2 in pairs(Config.PVPWash.weapons) do
                        if v2.name:lower() == v.name:lower() then
                            price = v2.price
                            break
                        end
                    end
                    if price then
                        table.insert(List,{
                            img = '',
                            text = ESX.GetWeaponLabel(v.name:upper()), 
                            text2 = 'Price : ' .. price.. ' Black money', 
                            callBack = function()
                                exports.icon_menu:ForceCloseMenu()
                                ESX.TriggerServerEvent('gangprop:washWeapon',v.name, v.metadata.serial)
                                openShopCD = true
                                Citizen.SetTimeout(2000,function()
                                    openShopCD = false
                                end)
                                Citizen.Wait(3000)
                                --goto reopen
                                TriggerEvent('KeyDown:e')
                        end})
                    end
                end
                exports.icon_menu:OpenMenu(List, configs)
            else
                ESX.ShowNotification('Shoma guni nadarid!')
            end
        else
            ESX.ShowNotification('Dar hale hazer gun shopi baz nist!')
        end
    end
end)


function StoreOwnedCarsMenu()
    local playerPed    = GetPlayerPed(-1)
    local coords       = GetEntityCoords(playerPed)
    local vehicle      = CurrentActionData.vehicle
    local vehicleProps = ESX.Game.GetVehicleProperties(vehicle)
    local engineHealth = GetVehicleEngineHealth(vehicle)
    local plate        = vehicleProps.plate
    if GetPedInVehicleSeat(vehicle, -1) ~= playerPed then return end
    --ESX.TriggerServerCallback('garage:storeVehicle', function(valid)
    --  if valid then
            putaway(vehicle, vehicleProps)
    --  else
    --    ESX.ShowNotification('Shoma nemitavanid in mashin ro dar Parking Park konid')
    --  end
    --end, vehicleProps)
end

-- Repair Vehicles
function reparation(apprasial, vehicle, vehicleProps)
    ESX.UI.Menu.CloseAll()
    
    local elements = {
        {label = 'Park kardane mashin va Pardakhte: ' .. ' ($'.. tonumber(apprasial)/2 .. ')', value = 'yes'},
        {label = 'Tamas Ba mechanic', value = 'no'}
    }
    
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'delete_menu', {
        title    = 'Mashine shoma Zarbe Khorde',
        align    = 'top-left',
        elements = elements
    }, function(data, menu)
        menu.close()
        
        if data.current.value == 'yes' then

            ESX.TriggerServerCallback('garage:checkRepairCost', function(hasEnoughMoney)
                if hasEnoughMoney then
                    TriggerServerEvent('garage:payhealth', tonumber(apprasial)/2)
                    putaway(vehicle, vehicleProps)
                else
                    ESX.ShowNotification('Shoma Poole Kafi nadarid')
                end
            end, tonumber(apprasial))

        elseif data.current.value == 'no' then
            ESX.ShowNotification('Darkhaste Mechanic')
        end
    end, function(data, menu)
        menu.close()
    end)
end

-- Put Away Vehicles
function putaway(vehicle, vehicleProps)
    local damages = exports['sun-garage']:getVehicleDamages(vehicle)
    local metaData = ESX.Game.getVehicleMetaData(vehicle)
    ESX.Game.DeleteVehicle(vehicle)
    TriggerServerEvent('gangs:spawnlog2', vehicleProps.plate)
    TriggerServerEvent('garage:setVehicleState', vehicleProps.plate, true,json.encode(damages))
    ESX.TriggerServerEvent('parking:setVehicleMetaData2', vehicleProps.plate, metaData)
    ESX.ShowNotification('Mashin dar Garage Park shod')
    if ESX.doesHaveGangPerm('putVehicle') then
        ESX.TriggerServerCallback('garage:vehiclePutGangCheck', function(state)
            if state == 1 then
                local alert = lib.alertDialog({
                    header = 'Park mashin shakhsi',
                    content = 'Aya mayel be park movaghat mashin khod dar gang hastid?',
                    centered = true,
                    cancel = true
                })
                if alert == 'confirm' then
                    ESX.TriggerServerEvent('garage:setGangVehicle', vehicleProps.plate, true)
                end
            end
        end, vehicleProps.plate)
    end
end

AddEventHandler('KeyDown:f5',function()
    local temp = ESX.GetPlayerData()
    if PlayerData.gang ~= nil and PlayerData.gang.label == 'gang' then
        if temp.IsDead ~= true and temp.IsInjure ~= true and temp.HandCuffed ~= true then
            if GetVehiclePedIsIn(PlayerPedId(),false) == 0 and not blackListWorld[ESX.GetPlayerData().World] then  
                OpenGangActionsMenu()
            end
        end
    end
end)

RegisterNetEvent("setArmorHandler")
AddEventHandler("setArmorHandler",function(invis, vipKey)
    local ped = GetPlayerPed(-1)
    if not invis then
        ESX.SetPlayerData('armorInvis', false)
        local vipSkinNum = nil
        if vipKey then
            vipSkinNum = Config.vipVest[vipKey].num
        end
        TriggerEvent('skinchanger:getSkin', function(skin)
            if vipSkinNum then
                local vip = vipSkinNum[skin.sex + 1]
                TriggerEvent('skinchanger:setVipVest', vip)
            end
            if skin.sex == 0 then
                TriggerEvent('skinchanger:loadClothes', skin, (vipSkinNum and vipSkinNum[1]) and {['bproof_1'] = vipSkinNum[1][1],  ['bproof_2'] = vipSkinNum[1][2]} or {['bproof_1'] = 15,  ['bproof_2'] = 2})
            elseif skin.sex == 1 then
                TriggerEvent('skinchanger:loadClothes', skin, (vipSkinNum and vipSkinNum[2]) and {['bproof_1'] = vipSkinNum[2][1],  ['bproof_2'] = vipSkinNum[2][2]} or {['bproof_1'] = 17,  ['bproof_2'] = 2})
            end
        end)
    else
        ESX.SetPlayerData('armorInvis', true)
    end
    ESX.SetPedArmour(ped, ESX.GetPlayerData().MaxArmour or 100) 
end)

-- Blips

function createBlip(id,color)
    local ped = GetPlayerPed(id)
    local blip = GetBlipFromEntity(ped)

    if not DoesBlipExist(blip) then -- Add blip and create head display on player
        blip = AddBlipForEntity(ped)
        SetBlipSprite(blip, 1)
        SetBlipColour(blip, color)
        SetBlipNameToPlayerName(blip, id) -- update blip name
        SetBlipScale(blip, 0.85) -- set scale
        SetBlipAsShortRange(blip, true)

        table.insert(blipsGangs, blip) -- add blip to array so we can remove it later
    end
end


AddEventHandler('playerSpawned', function(spawn)
    
if not hasAlreadyJoined then
    if PlayerData.gang.name == "mafia" then
    -- TriggerServerEvent('gangprop:spawned')
    end
end
hasAlreadyJoined = true
end)



local blackListedWeapons = {
        'WEAPON_STUNGUN',
        'WEAPON_NIGHTSTICK',
        --'WEAPON_SPECIALCARBINE',
        'WEAPON_BZGAS',
        'WEAPON_SMOKEGRENADE',
}

function IsBlackList(weaponName)
for k,v in pairs(blackListedWeapons) do
    if weaponName == v then
    return true
    end
end

return false
end

RegisterCommand('cm',function()
    if Data.boss ~= nil then
        local near = false
        local coords = GetEntityCoords(PlayerPedId())
        for k , v in pairs(Data.boss) do
        local pos = v.pos
        if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < 50 then
            near = true
        end
        end
        if near then
            if ESX.GetPlayerData().World == 0 or ESX.GetPlayerData().World == 96 then
                TriggerEvent('Cap:OpenMenu')
            end
        else
            ESX.Alert('Error','Shoma bayad nazdik khane gang khod bashid!',5000,'error')
        end
    else
        ESX.Alert('Error','Shoma ozv gangi nistid!',5000,'error')
    end
end)

local spam = false
local lasthp = 0
local pvpcount = 0

RegisterNetEvent('UpdatePVP')
AddEventHandler('UpdatePVP', function(count)
pvpcount = count
end)

local inpvp = false

RegisterCommand('pvp',function()
    if spam then return ESX.ShowNotification('Spam nakonid') end
    if LocalPlayer.state.adrenaline then
        return ESX.Alert('', 'Shoma nemitavanid ba adrenaline be pvp beravid', 5000, 'error')
    end
    if Data.boss ~= nil then
        local near = false
        local coords = GetEntityCoords(PlayerPedId())
        for k , v in pairs(Data.boss) do
            local pos = v.pos
            if GetDistanceBetweenCoords(coords,  pos.x,  pos.y,  pos.z,  true) < 50 and k == 1 then
                near = true
            end
        end
        if near then
            if ESX.GetPlayerData().World == 0 then
                if ESX.GetPlayerData().IsDead or ESX.GetPlayerData().IsInjure or ESX.GetPlayerData().HandCuffed then
                    ESX.Alert('Error','Shoma nemitounid be pvp zone join bedid!',5000,'error')
                else
                    TriggerServerEvent('gangprop:joinpvp')
                    inpvp = true
                    CheckGangBase()
                    ExecuteCommand('ooc Man raftam pvp zone')
                    ESX.Alert('Success','Shoma be pvp zone peyvastid!',5000,'success')
                    ESX.TriggerServerCallback('gangprop:GetPVPNew',function(cb)
                        if cb and cb > 10 then
                            time = 0
                            TriggerEvent('gangprop:pvpNew',cb)
                        end
                    end)
                    spam = true
                    lasthp = GetEntityHealth(PlayerPedId())
                    SetTimeout(30000,function()
                        spam = false
                    end)
                    if pvpKillCount == nil then
                        local session = GetResourceKvpInt('pvpKillSession')
                        if session == 0 then
                            pvpKillCount = GetResourceKvpInt('pvpKillCount') or 0
                            SetResourceKvpInt('pvpKillSession',ESX.GetPlayerData().isvip)
                        else
                            if session == ESX.GetPlayerData().isvip then
                                pvpKillCount = GetResourceKvpInt('pvpKillCount') or 0
                            else
                                pvpKillCount = 0
                                SetResourceKvpInt('pvpKillSession',ESX.GetPlayerData().isvip)
                            end
                        end
                    end
                    TriggerEvent('pma-voice:mutePlayer',true)
                    Wait(5000)
                    TriggerEvent('esx:restoreLoadout')
                    Citizen.CreateThread(function()
                        while inPVPSUN do
                            ESX.ShowMissionText('PVP ZONE | '.. pvpcount .. ' Players')
                        --   for k , v in pairs(GetGamePool('CPed')) do
                        --       local coords = GetEntityCoords(v)
                        --       DrawLightWithRange(coords.x,coords.y,coords.z + 1,80,0,0,2.0,20.0)
                        --   end
                            if GetPedConfigFlag(PlayerPedId(),2) ~= 1 then
                                SetPedSuffersCriticalHits(PlayerPedId(), false)
                            end
                            ESX.Game.Utils.DrawText2D(('~r~PVP Kill : %s'):format(pvpKillCount),0.65,0.95,0.4)
                            Wait(1)
                        end
                    end)
                end
            elseif ESX.GetPlayerData().World == 97 then
                spam = true
                TriggerServerEvent('gangprop:DropAllItem')
                SetTimeout(30000,function()
                    spam = false
                end)
                TriggerServerEvent('gangprop:BackToReal')
                inpvp = false
                TriggerEvent('pma-voice:mutePlayer',false)
                ESX.Alert('Success','Shoma be world asli bargashtid!',5000,'success')
                Wait(5000)
                if lasthp ~= 0 then
                    ESX.SetEntityHealth(PlayerPedId(),lasthp)
                end
                SetPedSuffersCriticalHits(PlayerPedId(), true)
                TriggerEvent('gangprop:stopShop')
                TriggerEvent('gangprop:stopWash')
            else
                TriggerServerEvent("sc:adminalarm","PVP Portal glitch World : ".. ESX.GetPlayerData().World)
            end
        else
            ESX.Alert('Error','Shoma bayad nazdik khane gang(1) khod bashid!',5000,'error')
        end
    else
        ESX.Alert('Error','Shoma ozv gangi nistid!',5000,'error')
    end
end)


AddEventHandler('gang:die',function()
    if Data.boss ~= nil then
        if ESX.GetPlayerData().World == 97 then
            ESX.SetEntityHealth(PlayerPedId(),0)
        end
    else
        ESX.Alert('Error','Shoma ozv gangi nistid!',5000,'error')
    end
end)

RegisterNetEvent('gangprop:tptogang')
AddEventHandler('gangprop:tptogang',function()
    for k , v in pairs(Data.boss) do
        local pos = v.pos
        ESX.Game.Teleport(PlayerPedId(),pos)
        break
    end
end)

RegisterNetEvent('gang:tpToArmory', function(index)
    local pos = Data.armory[tonumber(index)].pos
    ESX.Game.Teleport(PlayerPedId(),pos)
end)

AddEventHandler('PlayEmote',function(name) 
    if name == 'cpr' and (ESX.GetPlayerData().World == 97 or ESX.GetPlayerData().isInIslandZone) then
        local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
        if not (closestPlayer == -1 or closestDistance > 1.0) then
            ESX.UI.Menu.CloseAll()		
            IsBusy = true
            local closestPlayerPed = GetPlayerPed(closestPlayer)
            ESX.TriggerServerCallback("esx:getOtherPlayerData", function(data)									
                if data.gang.name == ESX.GetPlayerData().gang.name then
                    ESX.TriggerServerCallback("esx:checkemsstatus", function(IsDead,IsDead2)									
                        if IsDead and not IsDead2 then
                            TriggerEvent("mythic_progbar:client:progress", {
                                name = "rev",
                                duration = 10000,
                                label = "",
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
                                    ESX.TriggerServerEvent('gangprop:rev', GetPlayerServerId(closestPlayer))
                                elseif status then
                                    ClearPedTasksImmediately(GetPlayerPed(-1))
                                end
                            end)
                        end
                    end, GetPlayerServerId(closestPlayer))
                end
            end, GetPlayerServerId(closestPlayer))
        end
    end
end)


function CheckGangBase()
    ESX.TriggerServerCallback("gangs:getzone",function(data)
        Citizen.CreateThread(function()
            local near = 0
            Citizen.CreateThread(function()
                while inpvp do
                    Wait(1)
                    if near ~= 0 then
                       exports['sunset_utils']:disableFiring()
                    end
                end
            end)
            while inpvp do
                Wait(1000)
                for k , v in ipairs(data) do
                    local Blip = json.decode(v)
                    local distance = ESX.GetDistance(vector3(Blip.x, Blip.y, Blip.z), GetEntityCoords(PlayerPedId()))
                    if distance <= 100 then
                        near = k 
                    elseif near == k then
                        near = 0
                    end
                end
            end
        end)
    end)
end

local gcoolDown = false
RegisterCommand('g',function(source, args)
    if PlayerData.gang.name ~= 'nogang' then
        if gcoolDown then return ESX.Alert('Error','Spam nakonid!',5000,'error') end 
        gcoolDown = true
        Citizen.SetTimeout(5 * 1000,function()
            gcoolDown = false
        end)
        local message = table.concat(args, " ")
        TriggerServerEvent('g:chat', "^1[" ..PlayerData.gang.grade_label .. "]: ^3" .. GetPlayerName(PlayerId()) .. " ^4(( " .. "^0^*" .. message .. "^4 ))")
    end
end)

RegisterNetEvent('gangprop:checkSerial',function(serial)
    ESX.TriggerServerCallback('SSCAD:GetWeapons',function(data)
        local data = data[serial]
        if data.saveddata.status ~= 0 or ESX.TableLength(data.saveddata.tickets) > 0 then
            TriggerEvent('chatMessage', "^5[CAD]^0", {255, 0, 0}, ' ^0In ^1aslahe^2('.. ESX.GetWeaponLabel(data.name) ..' | '.. serial ..')^0 yek record dar ^5cad^0 darad!')
            TriggerServerEvent('sunset_policejob:weaponAlarm',serial,ESX.GetWeaponLabel(data.name))
        end
    end,serial)
end)

RegisterNetEvent('gangprop:pvpNew',function(time)
    time = time or (1 * 60)
    Citizen.CreateThread(function()
        while time > 0 do
            Citizen.Wait(1000)
            time = time - 1
            for k , v in pairs(Data.boss) do
                local pos = v.pos
                local distance = ESX.GetDistance(GetEntityCoords(PlayerPedId()),vec(pos.x,pos.y,pos.z))
                if distance > 50 and ESX.GetPlayerData().World == 97 then
                    ESX.Game.Teleport(PlayerPedId(),pos)
                end
                break
            end
        end
    end)
    Citizen.CreateThread(function()
        while time > 0 do
            Citizen.Wait(0)
            ESX.Game.Utils.DrawText2D(('~r~PVP Cooldown %ss'):format(time),0.65,0.90,0.4)
        end
    end)
    TriggerServerEvent('gangprop:setPVPNew',exports['sunset_utils']:GetServerOSTime() + time)
end)


RegisterNetEvent('gangprop:pvpNewStuff',function()
    if ESX.DoesHaveItem('sc',1,nil,nil,false) then
        ESX.TriggerServerEvent('core:dropItem', 'item_standard', 'sc', 1, nil, GetEntityCoords(PlayerPedId()), GetEntityForwardVector(PlayerPedId()))
    end
end)


RegisterNetEvent('esx:changeworld')
AddEventHandler('esx:changeworld',function(world)
    ESX.UI.Menu.CloseAll()
    if world == 97 then
        inPVPSUN = true
        ESX.TriggerServerCallback('gangprop:getShops',function(open,data,ts,wash)
            if open then
                pvpShopOpenTS = ts
                shopThread(data)
            end
            washThread(wash)
        end)
    else
        if inPVPSUN then
            TriggerServerEvent('gangprop:DropAllItem')
            SetPedSuffersCriticalHits(PlayerPedId(), true)
            ESX.UI.Menu.CloseAll()
        end
        inPVPSUN = false
        pvpShopOpen = false
        pvpWashOpen = false
    end
end)

AddEventHandler('gangprop:addKill', function(data)
    if inPVPSUN then
        if data.killedByPlayer then
            ESX.TriggerServerEvent('gangprop:kill',data.killerServerId)
        end
    end
end)

RegisterNetEvent('gangprop:newKill',function()
    if pvpKillCount == nil then
        local session = GetResourceKvpInt('pvpKillSession')
        if session == 0 then
            pvpKillCount = GetResourceKvpInt('pvpKillCount') or 0
            SetResourceKvpInt('pvpKillSession',ESX.GetPlayerData().isvip)
        else
            if session == ESX.GetPlayerData().isvip then
                pvpKillCount = GetResourceKvpInt('pvpKillCount') or 0
            else
                pvpKillCount = 0
                SetResourceKvpInt('pvpKillSession',ESX.GetPlayerData().isvip)
            end
        end
    end
    pvpKillCount = pvpKillCount + 1
    SetResourceKvpInt('pvpKillCount',pvpKillCount)
end)

RegisterCommand('addcarevent',function()
    if IsPedInAnyVehicle(PlayerPedId()) then
        local vehicle = GetVehiclePedIsIn(PlayerPedId())
        if vehicle ~= 0 then
            vehnet = NetworkGetNetworkIdFromEntity(vehicle)
            TriggerEvent('chatMessage', "[SYSTEM]", {255, 0, 0}, ' ^0Network id '.. vehnet ..' set shod!')
        end
    else
        ESX.ShowNotification('Shoma savar mashini nistid!')
    end
end)

RegisterCommand('setcarevent',function()
    if vehnet then
        local coords = GetEntityCoords(PlayerPedId())
        TriggerServerEvent('gangprop:addCarEvent',vehnet,coords)
    else
        ESX.ShowNotification('Shoma mashini set narkdid!')
    end
end)

RegisterNetEvent('gangprop:updateEventCar',function(cars)
    eventCar = cars
    local world = ESX.GetPlayerData().World
    for k , v in pairs(eventCar.cars) do
        if v.coords and v.world == world then
            if not NetworkDoesEntityExistWithNetworkId(v.net) and v.exist then
                if eventCarBlips[v.net] then
                    SetBlipCoords(eventCarBlips[v.net],v.coords)
                else
                    local blip = AddBlipForCoord(v.coords)
                    SetBlipSprite(blip, 85)
                    SetBlipFlashes(blip, true)
                    SetBlipColour(blip,v.color.id)
                    SetBlipDisplay(blip,2)
                    SetBlipScale(blip, 1.5)
                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentSubstringPlayerName('Event car')
                    EndTextCommandSetBlipName(blip)
                    eventCarBlips[v.net] = blip
                end
            elseif eventCarBlips[v.net] then
                RemoveBlip(eventCarBlips[v.net])
                eventCarBlips[v.net] = nil
            end
        end
    end
    if not _eventCarThread then
        local sKon = false
        for k , v in pairs(eventCar.cars) do
            if v.world == world then
                sKon = true
            end
        end
        eventCarThread()
    end
end)

function eventCarThread()
    if not _eventCarThread then
        _eventCarThread = true
        Citizen.CreateThread(function()
            while _eventCarThread do
                for k , v in pairs(eventCar.cars) do
                    if NetworkDoesEntityExistWithNetworkId(v.net) then
                        local veh = NetworkGetEntityFromNetworkId(v.net)
                        if GetBlipFromEntity(veh) == 0 then
                            blip = AddBlipForEntity(veh)
                            SetBlipSprite(blip, 85)
                            SetBlipFlashes(blip, true)
                            SetBlipColour(blip,v.color.id)
                            -- SetBlipFlashTimer(blip,5000)
                            SetBlipDisplay(blip,2)
                            SetBlipScale(blip, 1.5)
                            BeginTextCommandSetBlipName('STRING')
                            AddTextComponentSubstringPlayerName('Event car')
                            EndTextCommandSetBlipName(blip)
                            table.insert(eventCarBlips2,blip)
                        end
                    end
                end
                Citizen.Wait(5000)
            end
        end)
    end
end


RegisterNetEvent('gangprop:stopEventCar',function()
    _eventCarThread = false
    Citizen.Wait(15000)
    for k ,v in pairs(eventCarBlips2) do
        RemoveBlip(v)
    end
    for k ,v in pairs(eventCarBlips) do
        RemoveBlip(v)
    end
    eventCarBlips = {}
    eventCarBlips2 = {}
end)


AddEventHandler('enterVehicle',function(vehicle,isDriver)
    if _eventCarThread and isDriver then
        local net = NetworkGetNetworkIdFromEntity(vehicle)
        for k , v in pairs(eventCar.cars) do
            if v.net == net then
                eventInVehicle = true
                eventInVehicleBlip = AddBlipForCoord(v.targetCoords)
                SetBlipSprite(eventInVehicleBlip, 1)
                SetBlipColour(eventInVehicleBlip,v.color.id)
                SetBlipDisplay(eventInVehicleBlip,2)
                SetBlipScale(eventInVehicleBlip, 1.5)
                SetBlipRoute(eventInVehicleBlip,true)
                BeginTextCommandSetBlipName('STRING')
                AddTextComponentSubstringPlayerName('Event car')
                EndTextCommandSetBlipName(eventInVehicleBlip)
                Citizen.CreateThread(function()
                    while eventInVehicle do
                        Citizen.Wait(0)
                        local coords = GetEntityCoords(PlayerPedId())
                        if ESX.GetDistance(coords,v.targetCoords) < 15 and GetVehiclePedIsIn(PlayerPedId()) == vehicle then
                            ESX.Game.DeleteVehicle(vehicle)
                            ESX.TriggerServerEvent('gangprop:carEnd',v.color.label)
                            break
                        end
                        SetVehicleFixed(vehicle)
                    end
                end)
                break
            end
        end
    end
end)

AddEventHandler('exitVehicle',function(vehicle,isDriver)
    if isDriver and eventInVehicle then
        eventInVehicle = false
        RemoveBlip(eventInVehicleBlip)
    end
end)

RegisterNetEvent('gangprop:startShop',function(data,ts)
    if ESX.GetPlayerData().World == 97 then
        shopThread(data)
        pvpShopOpenTS = ts
    end
end)

function shopThread(data)
    if not pvpShopOpen then
        pvpShopOpen = true
        local data2 = {}
        for k , v in pairs(data) do
            if v.open then
                data2[k] = v
                local coords = v.coords
                v.coords = vector3(coords.x,coords.y,coords.z - 1)
                local coords = v.coords
                local blip = AddBlipForCoord(coords.x, coords.y)
                SetBlipSprite(blip, 59)
                SetBlipDisplay(blip, 2)
                SetBlipScale(blip, 1.5)
                SetBlipColour(blip, 46)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('PVP Shop('.. k ..' - '.. v.weaponKey ..')')
                EndTextCommandSetBlipName(blip)
                RegisterNetEvent('gangprop:removeShopBlip:'..k,function()
                    if DoesBlipExist(blip) then
                        RemoveBlip(blip)
                    end
                end)
                v.blip = blip
                ESX.Game.CreateMarker(coords,255,255,0,255,2.0,5)
            end
        end
        
        Citizen.CreateThread(function()
            while pvpShopOpen do
                Citizen.Wait(500)
                local coords = GetEntityCoords(PlayerPedId())
                local near = 0
                for k , v in pairs(data2) do
                    local distance = ESX.GetDistance(coords,v.coords)
                    if distance < 3 then
                        near = k
                    end
                end
                if nearPVPShop ~= 0 and near == 0 then
                    exports.icon_menu:ForceCloseMenu()
                end
                nearPVPShop = near
            end
            for k,v in pairs(data) do
                RemoveBlip(v.blip)
                ESX.Game.DeleteMarker(v.coords)
            end
        end)
        Citizen.CreateThread(function()
            local time = 0
            Citizen.CreateThread(function()
                while pvpShopOpen do
                    ESX.Game.Utils.DrawText2D(('~r~Shop end time %ss'):format(time),0.9,0.95,0.4)
                    Citizen.Wait(0)
                end
            end)
            while pvpShopOpen do
                local os = exports['sunset_utils']:GetServerOSTime() - pvpShopOpenTS
                time = (Config.PVPShop.openTime * 60) - os
                Citizen.Wait(1000)
            end
        end)
    end
end

RegisterNetEvent('gangprop:stopShop',function()
    pvpShopOpen = false
    nearPVPShop = 0
end)

AddEventHandler('gangprop:getGangLocation',function(cb)
    for k , v in pairs(Data.boss) do
        local pos = v.pos
        cb(pos)
        break
    end
end)

function washThread(data)
    if not pvpWashOpen then
        pvpWashOpen = true
        local data2 = {}
        for k , v in pairs(data) do
            if v.open then
                data2[k] = v
                local coords = v.coords
                v.coords = vector3(coords.x,coords.y,coords.z - 1)
                local coords = v.coords
                local blip = AddBlipForCoord(coords.x, coords.y)
                SetBlipSprite(blip, 84)
                SetBlipDisplay(blip, 2)
                SetBlipScale(blip, 1.5)
                SetBlipColour(blip, 1)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('PVP Gun Wash('.. k ..')')
                EndTextCommandSetBlipName(blip)
                v.blip = blip
                ESX.Game.CreateMarker(coords,255,0,0,255,2.0,5)
            end
        end
        
        Citizen.CreateThread(function()
            while pvpWashOpen do
                Citizen.Wait(500)
                local coords = GetEntityCoords(PlayerPedId())
                local near = 0
                for k , v in pairs(data2) do
                    local distance = ESX.GetDistance(coords,v.coords)
                    if distance < 3 then
                        near = k
                    end
                end
                if nearPVPWash and near == 0 then
                    exports.icon_menu:ForceCloseMenu()
                end
                nearPVPWash = near ~= 0
            end
            for k,v in pairs(data) do
                RemoveBlip(v.blip)
                ESX.Game.DeleteMarker(v.coords)
            end
        end)
    end
end

RegisterNetEvent('gangprop:stopWash',function(data)
    if pvpWashOpen then
        exports.icon_menu:ForceCloseMenu()
        pvpWashOpen = false
        nearPVPWash = false
        Citizen.Wait(1000)
        if data then 
            washThread(data)
        end
    end
end)

AddEventHandler('exitVehicle',function(vehicle,driver)
	if driver and inPVPSUN and _eventCarThread then 
        ESX.TriggerServerEvent('gangprop:addVehicle',NetworkGetNetworkIdFromEntity(vehicle))
    end
end)

AddEventHandler('enterVehicle',function(vehicle,driver)
	if driver and inPVPSUN and _eventCarThread then 
        ESX.TriggerServerEvent('gangprop:removeVehicle',NetworkGetNetworkIdFromEntity(vehicle))
    end
end)

function stopCam()
	if camera then
		ClearFocus()
		RenderScriptCams(false, false, 0, true, false)
		DestroyCam(camera, false)
		camera = nil
	end
	if localVeh then
		DeleteVehicle(localVeh)
		localVeh = nil
	end
	if GlobalPerview then
		ESX.ClearTimeout(GlobalPerview)
		GlobalPerview = nil
	end
end

exports('getLockerCount', function()
    return ESX.tableLength(Data.armory)
end)