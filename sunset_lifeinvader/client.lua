ESX = nil
blowtorch = false
blowtorch2 = false
importing = false
hacking = false
inzone = false
bliprob = nil
canimport = false
canhack = false
realworld  = true
local coolDown = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    ESX.RegisterPoint(Config.BlowTorchCoords,2,{
		Color = {R = 255,G = 0,B = 0,A = 255},
		DrawDistance = 5,
		Radius = 0.5,
		Type = 19
	},{
		Notification = nil,
		DrawText = 'Dokme ~INPUT_CONTEXT~ jahat baz kardan dar',
		DrawTextRadius = 3,
		DrawTextCoords = Config.BlowTorchCoords,
		Key = 'e',
		CB = function()
			if realworld then
                if not blowtorch then
                    if not blowtorch2 then
                        if coolDown then return ESX.Alert('Error','Spam nakonid!',5000,'error') end 
						coolDown = true
						Citizen.SetTimeout(10 * 1000,function()
							coolDown = false
						end)
                        ESX.TriggerServerCallback('rob:getall2', function(jobs)
                            local check = exports['sun-jewelry']:getRob('lifeInvader')
                            if jobs.mt >= check.mt and jobs.all >= check.all then
                                local selfid = GetPlayerServerId(PlayerId())
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
                                            if nearparty >= Config.PartyNeed then
                                                ESX.TriggerServerCallback('rob:getcd', function(cooldown,canrob)
                                                    if canrob then
                                                        if not cooldown.bime.cooldown then
                                                            ESX.TriggerServerCallback('sunset_lifeinvader:removeblowtorch', function(istrue)
                                                                if istrue == false then
                                                                    ESX.ShowNotification('shoma blowtorch nadarid')
                                                                else
                                                                    TriggerServerEvent("sunset_lifeinvader:startblow")
                                                                    blowtorch2 = true
                                                                    Citizen.SetTimeout(10000,function()
                                                                        blowtorch = true
                                                                        CreateThread(function()
                                                                            while blowtorch do
                                                                                Wait(1000)
                                                                                if #(GetEntityCoords(PlayerPedId()) - Config.Blip) > Config.Distance then
                                                                                    TriggerEvent("mythic_progbar:client:cancel")
                                                                                    blowtorch = false
                                                                                    blowtorch2 = false
                                                                                    TriggerServerEvent("sunset_lifeinvader:cancel1")
                                                                                    break
                                                                                end
                                                                            end
                                                                        end)
                                                                    end)
                                                                    TriggerServerEvent('sunset_lifeinvader:start')
                                                                    -- SetEntityHeading(PlayerPedId(),27.45)
                                                                    -- SetCurrentPedWeapon(PlayerPedId(),GetHashKey("weapon_unarmed"))
                                                                    -- Wait(2000)
                                                                    -- TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_WELDING", 0, true)
                                                                    TriggerEvent("mythic_progbar:client:progress", {
                                                                        name = "process_robbery",
                                                                        duration = 300000,
                                                                        label = "Dar hale baz kardan dar",
                                                                        useWhileDead = false,
                                                                        canCancel = false,
                                                                        controlDisables = {
                                                                            disableMovement = false,
                                                                            disableCarMovement = false,
                                                                            disableMouse = false,
                                                                            disableCombat = true,
                                                                        }
                                                                    }, function(status)
                                                                        if not status then
                                                                            blowtorch = false
                                                                            ClearPedTasksImmediately(GetPlayerPed(-1))
                                                                            ESX.TriggerServerEvent('doorlock:updateState', 6, false,nil)
                                                                            TriggerServerEvent('sunset_lifeinvader:setcanimport')
                                                                        end
                                                                    end)
                                                                end
                                                            end)
                                                        else
                                                            ESX.ShowNotification('Robbery cooldown ast zaman payan cooldown : '.. cooldown.bime.time, 3000)
                                                        end
                                                    else
                                                        ESX.ShowNotification('Yek robbery dar shahr dar hal anjam ast', 3000)
                                                    end
                                                end)     
                                            else
                                                ESX.Alert('Error','Shoma be '.. Config.PartyNeed ..'x party dar nazdiki khod niaz darid ',7000,'warning')
                                            end
                                    else
                                        ESX.Alert('Error','Shoma baraye start in robbery bayad dar party bashid',7000,'warning') 
                                    end
                                end)
                            else
                                ESX.ShowNotification('Tedad police jahat start robbery kam ast')
                            end
                        end)
                    end
                end
            end
		end,
	},{
		In = nil,
		Out = ESX.UI.Menu.CloseAll
	})
    ---
    ESX.RegisterPoint(Config.ImportVirusCoords,2,{
		Color = {R = 255,G = 0,B = 0,A = 255},
		DrawDistance = 5,
		Radius = 0.5,
		Type = 19
	},{
		Notification = nil,
		DrawText = 'Dokme ~INPUT_CONTEXT~ jahat import virus',
		DrawTextRadius = 3,
		DrawTextCoords = Config.ImportVirusCoords,
		Key = 'e',
		CB = function()
			if realworld and canimport and not importing then
                if coolDown then return ESX.Alert('Error','Spam nakonid!',5000,'error') end 
                coolDown = true
                Citizen.SetTimeout(10 * 1000,function()
                    coolDown = false
                end)
                importing = true
                ClearPedTasks(GetPlayerPed(-1))
                LoadAnim('mp_fbi_heist')
                ESX.SetEntityCoords(GetPlayerPed(-1), -1056.76, -233.26, 43.02, false, false, false, false)
                SetEntityHeading(GetPlayerPed(-1), 299.92)
                TaskPlayAnim(GetPlayerPed(-1), 'mp_fbi_heist', 'loop', 2.0, 2.0, -1, 1, 0, false, false, false)
                TriggerEvent("mythic_progbar:client:progress", {
                    name = "process_robbery",
                    duration = 300000,
                    label = "Dar hale import kardan virus",
                    useWhileDead = false,
                    canCancel = false,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }
                }, function(status)
                    importing = false
                    if not status then
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                        TriggerServerEvent('sunset_lifeinvader:sethack')
                    end
                end)
            end
		end,
	},{
		In = nil,
		Out = ESX.UI.Menu.CloseAll
	})
    ---
    ESX.RegisterPoint(Config.Hack,2,{
		Color = {R = 255,G = 0,B = 0,A = 255},
		DrawDistance = 5,
		Radius = 0.5,
		Type = 19
	},{
		Notification = nil,
		DrawText = 'Dokme ~INPUT_CONTEXT~ jahat hack',
		DrawTextRadius = 3,
		DrawTextCoords = Config.Hack,
		Key = 'e',
		CB = function()
			if realworld and not hacking and canhack then
                if coolDown then return ESX.Alert('Error','Spam nakonid!',5000,'error') end 
                coolDown = true
                Citizen.SetTimeout(10 * 1000,function()
                    coolDown = false
                end)
                ESX.TriggerServerCallback('sunset_lifeinvader:removerasp', function(istrue)
                    if istrue == false then
                        ESX.ShowNotification('shoma tablet nadarid')
                    else
                        ESX.TriggerServerCallback('sunset_lifeinvader:checkhack', function(hacking2)
                            if not hacking2 then
                                TriggerServerEvent("sunset_lifeinvader:starhack")
                                hacking = true
                                ClearPedTasks(GetPlayerPed(-1))
                                LoadAnim('mp_fbi_heist')
                                ESX.SetEntityCoords(GetPlayerPed(-1), -1053.68, -230.54, 43.02, false, false, false, false)
                                SetEntityHeading(GetPlayerPed(-1), 213.65)
                                TaskPlayAnim(GetPlayerPed(-1), 'mp_fbi_heist', 'loop', 2.0, 2.0, -1, 1, 0, false, false, false)
                                SetTimeout(85000, function()
                                    ESX.TriggerServerEvent('bime:lastFiveSecond')
                                end)
                                TriggerEvent("mythic_progbar:client:progress", {
                                    name = "process_robbery",
                                    duration = 90000,
                                    label = "Dar hale hack",
                                    useWhileDead = false,
                                    canCancel = false,
                                    controlDisables = {
                                        disableMovement = true,
                                        disableCarMovement = true,
                                        disableMouse = false,
                                        disableCombat = true,
                                    }
                                }, function(status)
                                    importing = false
                                    if not status then
                                        ESX.TriggerServerEvent("sunset_lifeinvader:success")
                                        ClearPedTasksImmediately(GetPlayerPed(-1))
                                    end
                                end)
                            else
                                ESX.ShowNotification('Yek nafar dar hal hack ast!!!', 3000)
                            end
                        end)
                    end
                end)
            end
		end,
	},{
		In = nil,
		Out = ESX.UI.Menu.CloseAll
	})
end)

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(Config.Blip)
    SetBlipSprite(blip, 77)
    SetBlipScale(blip, 0.8)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Life Insurance")
    EndTextCommandSetBlipName(blip)
end)



RegisterNetEvent('esx:changeworld')
AddEventHandler('esx:changeworld',function(world)
    if world == 0 then
        realworld = true
    else
        realworld = false
    end
end)

-- CreateThread(function()
--     while true do
--         Wait(1)
--         --import
--         if (GetDistanceBetweenCoords(coords, Config.Hack , true) < 15.0) and canhack and realworld then
--             DrawMarker(0, Config.Hack, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.6, 255, 0, 0, 255, 1, 0, 0, 0)
--             if (GetDistanceBetweenCoords(coords, Config.Hack , true) < 1.3) then
--                 if inzone3 == true and not hacking then
--                     ESX.ShowHelpNotification('Dokme ~INPUT_CONTEXT~ jahat hack', true, true, 1000)
--                 end
--                 inzone3 = true
--                 if IsControlJustReleased(1, 51) and inzone3 then
                    

--                 end
--             elseif (GetDistanceBetweenCoords(coords, Config.Hack, true) > 1.3) then
--                 inzone3 = false
--             end
--         end
--     end
-- end)

function mycb(success, timeremaining)
    if not hacking then return end
    if success then
        ESX.ShowNotification("hack ba movafaghiat anjam shod")
        TriggerEvent('mhacking:hide')
        TriggerServerEvent("sunset_lifeinvader:success")
        ClearPedTasksImmediately(GetPlayerPed(-1))
    else
        ESX.ShowNotification("hack na movafagh boud")
        TriggerEvent('mhacking:hide')
        ClearPedTasksImmediately(GetPlayerPed(-1))
    end
    hacking = false
end

RegisterNetEvent('sunset_lifeinvader:setblip')
AddEventHandler('sunset_lifeinvader:setblip', function()
    bliprob = AddBlipForCoord(Config.Blip)
    SetBlipSprite(bliprob , 161)
    SetBlipScale(bliprob , 2.0)
    SetBlipColour(bliprob, 3)
    PulseBlip(bliprob)
end)

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(10)
    end
end

RegisterNetEvent('sunset_lifeinvader:setcanimport')
AddEventHandler('sunset_lifeinvader:setcanimport', function(state)
    canimport = state
end)

RegisterNetEvent('sunset_lifeinvader:setcanhack')
AddEventHandler('sunset_lifeinvader:setcanhack', function(state)
    canhack = state
end)

RegisterNetEvent('sunset_lifeinvader:kill')
AddEventHandler('sunset_lifeinvader:kill', function()
    RemoveBlip(bliprob)
end)
