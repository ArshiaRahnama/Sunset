local holdingup = false
local hackholdingup = false
local bombholdingup = false
local bank = ""
local savedbank = {}
local secondsRemaining = 0
local dooropen = false
local platingbomb = false
local platingbombtime = 20
local blipRobbery = {}
globalcoords = nil
globalrotation = nil
globalDoortype = nil
globalbombcoords = nil
globalbombrotation = nil
globalbombDoortype = nil
local cnplnt = false



ESX = nil
local coolDown = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    ESX.AddBlipForCoord(vector3(Banks.flat.position.x,Banks.flat.position.y,Banks.flat.position.z),1.0,617,46,'Javaheri flat')
    for k,v in pairs(Banks)do
        local pos2 = vector3(v.position.x,v.position.y,v.position.z)
        ESX.RegisterPoint(pos2,2,{
            Color = {R = 255,G = 0,B = 0,A = 255},
            DrawDistance = 5,
            Radius = 0.5,
            Type = 18
        },{
            Notification = 'Dokme ~INPUT_CONTEXT~ jahat start robbery',
            DrawText = nil,
            DrawTextRadius = nil,
            DrawTextCoords = nil,
            Key = 'e',
            CB = function()
                if not holdingup then
                    if not event then
                        if coolDown then return ESX.Alert('Error','Spam nakonid!',5000,'error') end 
						coolDown = true
						Citizen.SetTimeout(10 * 1000,function()
							coolDown = false
						end)
                        local check = exports['sun-jewelry']:getRob(k)
                        ESX.TriggerServerCallback('rob:getall2', function(jobs)
                            if (not check.mt or jobs.mt >= check.mt) and (not check.all or jobs.all >= check.all) and (not check.police or jobs.police >= check.police) then
                                local selfid = GetPlayerServerId(PlayerId())
                                local party = v.PartNeed
                                -- if k:find("mini") then
                                --     party = 2
                                -- end
                                ESX.TriggerServerCallback('Party:GetParty', function(index,data)
                                    if index[selfid] then
                                        local ind = index[selfid]
                                        local partydata = data[ind]
                                        local nearparty = 0
                                        for k , v in pairs(partydata) do
                                            if ESX.Game.PlayerExist(k) then
                                                local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(k))))
                                                if distance <= 100 then
                                                    nearparty = nearparty + 1
                                                end
                                            end
                                        end
                                        if nearparty >= party then
                                            ESX.TriggerServerCallback('rob:getcd', function(data,canrob,canrob2)
                                                Wait(math.random(100,500))
                                                if data[k].cooldown and k == "PrincipalBank" and not data["PrincipalBank2"].cooldown then
                                                    TriggerServerEvent('esx_holdupbank:rob', k)
                                                elseif (not canrob and not k:find("mini") or k:find("mini") and not canrob2) then
                                                    TriggerEvent('esx:showNotification', 'Yek robbery dar shahr dar hal anjam ast')
                                                elseif data[k].cooldown then
                                                    TriggerEvent('esx:showNotification', 'In rob dar cooldown ast zaman paian cooldown : '.. data[k].time)
                                                else
                                                    TriggerServerEvent('esx_holdupbank:rob', k)
                                                end
                                            end)
                                        else
                                            ESX.Alert('Error','Shoma be '.. party ..'x party dar nazdiki khod niaz darid ',7000,'warning')
                                        end
                                    else
                                        ESX.Alert('Error','Shoma baraye start in robbery bayad dar party bashid',7000,'warning')
                                    end
                                end)
                            else
                                TriggerEvent('esx:showNotification', 'Tedad police mored niaz '.. (check.all + check.mt) ..' nafar ast')
                            end
                        end)
                    end
                end
            end,
        },{
            In = nil,
            Out = ESX.UI.Menu.CloseAll
        })
    end
    --
    for k,v in pairs(Banks)do
        if v.bombposition then
            local pos2 = vector3(v.bombposition.x,v.bombposition.y,v.bombposition.z)
            ESX.RegisterPoint(pos2,2,{
                Color = {R = 255,G = 0,B = 0,A = 255},
                DrawDistance = 5,
                Radius = 0.5,
                Type = 18
            },{
                Notification = 'Dokme ~INPUT_CONTEXT~ jahat start plant bomb',
                DrawText = nil,
                DrawTextRadius = nil,
                DrawTextCoords = nil,
                Key = 'e',
                CB = function()
                    if not bombholdingup then
                        if not event then
                            ESX.TriggerServerCallback('rob:getcd', function(data,canrob)
                                if not canrob and cnplnt == false then
                                    --TriggerServerEvent("sc:adminalarm","Use bank bug abuse")
                                    ESX.ShowNotification('Shoma nemitvanid bomb ra plant konid')
                                else
                                    SetTimeout(120000,function()
                                        cnplnt = false
                                    end)
                                    TriggerServerEvent('esx_holdupbank:plantbomb', k)
                                end
                            end)
                        end
                    end
                end,
            },{
                In = nil,
                Out = ESX.UI.Menu.CloseAll
            })
        end
    end
    --
    for k,v in pairs(Banks)do
        if v.hackposition then
            local pos2 = vector3(v.hackposition.x,v.hackposition.y,v.hackposition.z)
            ESX.RegisterPoint(pos2,2,{
                Color = {R = 255,G = 0,B = 0,A = 255},
                DrawDistance = 5,
                Radius = 0.5,
                Type = 18
            },{
                Notification = 'Dokme ~INPUT_CONTEXT~ jahat start hack',
                DrawText = nil,
                DrawTextRadius = nil,
                DrawTextCoords = nil,
                Key = 'e',
                CB = function()
                    if not hackholdingup then
                        if not event then
                            local check = exports['sun-jewelry']:getRob(k)
                            ESX.TriggerServerCallback('rob:getall2', function(jobs)
                                if (not check.mt or jobs.mt >= check.mt) and (not check.all or jobs.all >= check.all) and (not check.police or jobs.police >= check.police) then
                                    ESX.TriggerServerCallback('rob:getcd', function(data,canrob)
                                        if not data[k].cooldown then
                                            if canrob then
                                                ESX.TriggerServerCallback('rob:getall', function(CopsConnected)
                                                    if CopsConnected >= 0 or (k ~= "PrincipalBank" and CopsConnected >= 8)then
                                                        TriggerServerEvent('esx_holdupbank:hack', k)
                                                    else
                                                        TriggerEvent('esx:showNotification', 'Tedad police mored niaz 10 nafar ast')
                                                    end
                                                end)
                                            else
                                                TriggerEvent('esx:showNotification', 'Yek robbery dar shahr dar hal anjam ast')
                                            end
                                        else
                                            TriggerEvent('esx:showNotification', 'In rob dar cooldown ast zaman paian cooldown : '.. data[k].time)
                                        end
                                    end)
                                else
                                    TriggerEvent('esx:showNotification', 'Tedad police mored niaz 10 nafar ast')
                                end
                            end)
                        end
                    end
                end,
            },{
                In = nil,
                Out = ESX.UI.Menu.CloseAll
            })
        end
    end
    ESX.TriggerServerCallback('esx_robberybank:GetShops',function(data)
		for k,v in pairs(Banks) do
            if k:find('mini') then
                local active = data[k].active
                local ve = v.position
                local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
                SetBlipSprite(blip, 605)--156
                SetBlipScale(blip, 0.8)
                SetBlipColour(blip, 2)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString('Mini bank')
                EndTextCommandSetBlipName(blip)
                v.Blip = blip
            end
		end
	end)
end)

function DisplayHelpText(str)
    SetTextComponentFormat("STRING")
    AddTextComponentString(str)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
        SetTextOutline()
    end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

RegisterNetEvent('esx_holdupbank:currentlyrobbing')
AddEventHandler('esx_holdupbank:currentlyrobbing', function(robb)
    holdingup = true
    bank = robb
    secondsRemaining = Banks[robb].time / 1000
    Timer()
end)

RegisterNetEvent('esx_holdupbank:currentlyhacking')
AddEventHandler('esx_holdupbank:currentlyhacking', function(robb, thisbank)
    hackholdingup = true
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start",7,150, opendoors)
    savedbank = thisbank
    bank = robb
    secondsRemaining = 100
    Timer()
end)

RegisterNetEvent('esx_holdupbank:plantingbomb')
AddEventHandler('esx_holdupbank:plantingbomb', function(robb, thisbank)
    bombholdingup = true

    savedbank = thisbank
    bank = robb
    plantBombAnimation()
    secondsRemaining = 20
    Timer()
end)



function opendoors(success, timeremaining)
    if success then
        print('Success with '..timeremaining..'s remaining.')
        TriggerEvent('mhacking:hide')
        TriggerEvent('esx_holdupbank:hackcomplete')
        cnplnt = true
    else
        hackholdingup = false
        ESX.ShowNotification(_U('hack_failed'))
        print('Failure')
        TriggerServerEvent('esx_holdupbank:hackfaild')
        TriggerEvent('mhacking:hide')
        secondsRemaining = 0
        incircle = false
    end
end

RegisterNetEvent('esx_holdupbank:killblip')
AddEventHandler('esx_holdupbank:killblip', function(rob)
    if rob then
        if blipRobbery[rob] then
            RemoveBlip(blipRobbery[rob])
            blipRobbery[rob] = nil
        end
    else
        for k, v in pairs(blipRobbery) do
            RemoveBlip(v)
        end
        blipRobbery = {}
    end
end)

RegisterNetEvent('esx_holdupbank:setblip')
AddEventHandler('esx_holdupbank:setblip', function(rob, position)
    if blipRobbery[rob] then
        RemoveBlip(blipRobbery[rob])
    end
	Wait(1000)
    blipRobbery[rob] = AddBlipForCoord(position.x, position.y, position.z)
    SetBlipSprite(blipRobbery[rob] , 161)
    SetBlipScale(blipRobbery[rob] , 2.0)
    SetBlipColour(blipRobbery[rob], 3)
    PulseBlip(blipRobbery[rob])
end)

RegisterNetEvent('esx_holdupbank:toofarlocal')
AddEventHandler('esx_holdupbank:toofarlocal', function(robb)
    holdingup = false
    bombholdingup = false
    ESX.ShowNotification(_U('robbery_cancelled'))
    robbingName = ""
    secondsRemaining = 0
    incircle = false
end)

RegisterNetEvent('esx_holdupbank:toofarlocalhack')
AddEventHandler('esx_holdupbank:toofarlocalhack', function(robb)
    holdingup = false
    ESX.ShowNotification(_U('robbery_cancelled'))
    robbingName = ""
    secondsRemaining = 0
    incircle = false
end)

RegisterNetEvent('esx_holdupbank:closedoor')
AddEventHandler('esx_holdupbank:closedoor', function()
    dooropen = false
end)

RegisterNetEvent('esx_holdupbank:robberycomplete')
AddEventHandler('esx_holdupbank:robberycomplete', function(robb)
    holdingup = false
    ESX.ShowNotification(_U('robbery_complete') .. Banks[bank].reward)
    bank = ""
    TriggerServerEvent('esx_holdupbank:closedoor')
    secondsRemaining = 0
    dooropen = false
    incircle = false
end)

RegisterNetEvent('esx_holdupbank:hackcomplete')
AddEventHandler('esx_holdupbank:hackcomplete', function()
    hackholdingup = false
    ESX.ShowNotification(_U('hack_complete'))

    TriggerServerEvent('esx_holdupbank:opendoor', Banks[bank].hackposition.x, Banks[bank].hackposition.y, Banks[bank].hackposition.z, Banks[bank].doortype)
    if Banks[bank].doorid then
        ESX.TriggerServerEvent('doorlock:updateState', Banks[bank].doorid, false,nil)
    end
    bank = ""

    secondsRemaining = 0
    incircle = false
end)
RegisterNetEvent('esx_holdupbank:plantbombcomplete')
AddEventHandler('esx_holdupbank:plantbombcomplete', function(bank)
    bombholdingup = false


    --ESX.ShowNotification(_U('bombplanted_run'))
    ESX.TriggerServerEvent('doorlock:updateState', 2, false,nil)

    incircle = false
end)

RegisterNetEvent('esx_holdupbank:plantedbomb')
AddEventHandler('esx_holdupbank:plantedbomb', function(x,y,z,doortype)
    local coords = vector3(x,y,z) -- fix for vectors
    local obs, distance = ESX.Game.GetClosestObject(doortype, coords)

    --AddExplosion( bank.bombposition.x,  bank.bombposition.y, bank.bombposition.z , 0, 0.5, 1, 0, 1065353216, 0)
    AddExplosion( x,  y, z , 0, 0.5, 1, 0, 1065353216, 0)
    AddExplosion( x,  y, z , 0, 0.5, 1, 0, 1065353216, 0)
    -- AddExplosion( bank.bombposition.x,  bank.bombposition.y, bank.bombposition.z , 0, 0.5, 1, 0, 1065353216, 0)

    local rotation = GetEntityHeading(obs) + 47.2869
    SetEntityHeading(obs,rotation)
    globalbombcoords = coords
    globalbombrotation = rotation
    globalbombDoortype = doortype
    Citizen.CreateThread(function()
        while dooropen do
            Wait(2000)
            local obs, distance = ESX.Game.GetClosestObject(globalbombDoortype, globalbombcoords)
            SetEntityHeading(obs, globalbombrotation)
            Citizen.Wait(0);
        end
    end)
end)


RegisterNetEvent('esx_holdupbank:opendoors')
AddEventHandler('esx_holdupbank:opendoors', function(x,y,z,doortype)
    dooropen = true;

    --ESX.ShowNotification("X: "..x)

    local coords = vector3(x,y,z) -- fix for vectors
    local obs, distance = ESX.Game.GetClosestObject(doortype, coords) -- instant open for people already in site

    local pos = GetEntityCoords(obs);


    local rotation = GetEntityHeading(obs) + 70
    globalcoords = coords
    globalrotation = rotation
    globalDoortype = doortype
    Citizen.CreateThread(function()
        while dooropen do
            Wait(2000)
            local obs, distance = ESX.Game.GetClosestObject(globalDoortype, globalcoords)
            SetEntityHeading(obs, globalrotation)
        end
    end)
end)


RegisterNetEvent('esx_holdupbank:exit')
AddEventHandler('esx_holdupbank:exit', function(bank)
    ESX.SetEntityCoordsNoOffset(GetPlayerPed(-1), bank.hackposition.x , bank.hackposition.y, bank.hackposition.z, 0, 0, 1)
end)
function Timer()
    Citizen.CreateThread(function()
        while holdingup or hackholdingup or bombholdingup do
            Citizen.Wait(0)
            if holdingup then
                Citizen.Wait(1000)
                if(secondsRemaining > 0)then
                    secondsRemaining = secondsRemaining - 1
                end
            end
            if hackholdingup then
                Citizen.Wait(1000)
                if(secondsRemaining > 0)then
                    secondsRemaining = secondsRemaining - 1
                end
            end
            if bombholdingup then
                Citizen.Wait(1000)
                if(secondsRemaining > 0)then
                    secondsRemaining = secondsRemaining - 1
                end
            end
        end
    end)
    Citizen.CreateThread(function()
        while holdingup do
            Citizen.Wait(0)
            drawTxt(0.66, 1.44, 1.0,1.0,0.4, _U('robbery_of') .. secondsRemaining .. _U('seconds_remaining'), 255, 255, 255, 255)
            if bank then
                local pos = GetEntityCoords(GetPlayerPed(-1), true)
                local pos2 = Banks[bank].position
                if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > (Banks[bank].radius or 15.0))then
                    TriggerServerEvent('esx_holdupbank:toofar', bank)
                end
            end
        end
    end)
end
-- Citizen.CreateThread(function()
-- 	for k,v in pairs(Banks)do
-- 		local ve = v.position

-- 		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
-- 		SetBlipSprite(blip, 255)--156
-- 		SetBlipScale(blip, 0.8)
-- 		SetBlipColour(blip, 75)
-- 		SetBlipAsShortRange(blip, true)
-- 		BeginTextCommandSetBlipName("STRING")
-- 		AddTextComponentString(_U('bank_robbery'))
-- 		EndTextCommandSetBlipName(blip)
-- 	end
-- end)
incircle = false
event = false

AddEventHandler('event', function(bool)
    event = bool
end)



function plantBombAnimation()
    local playerPed = GetPlayerPed(-1)

    Citizen.CreateThread(function()
        platingbomb = true
        while platingbomb do
            Wait(1000)

            TaskStartScenarioInPlace(playerPed, "CODE_HUMAN_MEDIC_KNEEL", 0, true)

            if secondsRemaining <= 1 then
                platingbomb = false
                ClearPedTasksImmediately(PlayerPedId())

            end
            Citizen.Wait(0)
        end

    end)
end

RegisterNetEvent('bank:truecan')
AddEventHandler('bank:truecan', function()
    cnplnt = false
end)

RegisterNetEvent('esx_robberybank:SetBlip',function(key,status)
	if status then SetBlipColour(Banks[key].Blip, 2) else SetBlipColour(Banks[key].Blip, 1) end
end)