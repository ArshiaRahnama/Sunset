local blips = {
    {title="Mahi foroushi", colour=26, id=317, coords = vector3(-1649.65,150.58, 62.17)},
}

local item = {
    { name = 'mahi_sardine', label = "Mahi Sardine" , price = 435 },
    { name = 'mahi_sangsar', label = "Mahi Sangsar" , price = 560 },
    { name = 'mahi_ordak', label = "Ordak Mahi", price = 570 },
    { name = 'mahi_ghezel', label = "Mahi Ghezel" , price = 585 },
    { name = 'mahi_hamoor', label = "Mahi Hamoor" , price = 600 },
    { name = 'mahi_sorkhoo', label = "Mahi Sorkhoo" , price = 610 },
    { name = 'mahi_salmon', label = "Mahi Salmon" , price = 625 },
    { name = 'mahi_shooride', label = "Mahi Shooride" , price = 640 },
    { name = 'mahi_tilapia', label = "Mahi Tilapia" , price = 660 },
    { name = 'mahi_sefid', label = "Mahi Sefid", price = 680 },
    { name = 'mahi_shir', label = "Shir Mahi" , price = 700 },
    { name = 'mahi_meygoo', label = "Meygoo" , price = 720 },
    { name = 'jolbak', label = "Jolbak", price = 100 },
}



Citizen.CreateThread(function()
	while ESX == nil do
		Citizen.Wait(0)
    end
    ESX.RegisterPoint(vector3(blips[1].coords.x,blips[1].coords.y,blips[1].coords.z - 1),2,{
        Color = {R = 42,G = 255,B = 0,A = 255},
        DrawDistance = 20,
        Radius = 0.5,
        Type = 27
    },{
        Notification = nil,
        DrawText = 'Dokme ~INPUT_CONTEXT~ jahat baz kardan menu foroush mahi',
        DrawTextRadius = 4,
        DrawTextCoords = blips[1].coords,
        Key = 'e',
        CB = function()
            ESX.TriggerServerCallback('esx:getOtherPlayerDataCard', function(data)
                ESX.UI.Menu.CloseAll()
                local elements = {}
                menuOpen = true
                for k, v in pairs(data.inventory) do
                    for c,d in pairs(item) do
                        if v.name:lower() == d.name:lower() then
                            if d and v.count > 0 then
                                table.insert(elements, {
                                    label = d.label .. ' x'.. v.count ..' - <span style="color:green;">'.. d.price ..'$</span>',
                                    name = v.name,
                                    max = v.count
                                })
                            end
                        end
                    end
                end
            
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Mahi', {
                    title    = 'Mahi foroushi',
                    align    = 'top-left',
                    elements = elements
                }, function(data, menu)
                    ESX.UI.Menu.Open(
                    'dialog',
                    GetCurrentResourceName(),
                    'get_count',
                    {
                        title = "Tedad foroush ra vared konid"
                    },
                    function(data1,menu1)
                        menu1.close()
                        if data1.value then
                            count = tonumber(data1.value)
                            if count <= data.current.max then
                                ESX.UI.Menu.CloseAll()
                                ESX.TriggerServerEvent('fishing:sell', data.current.name, count)
                            else
                                ESX.Alert('Error','Shoma in meghdar az in mahi ra nadarid',5000,'error')
                            end
                        end
                    end, function(data1,menu1)
                        menu1.close()
                    end)
                end, function(data, menu)
                    menu.close()
                end)
            end, GetPlayerServerId(PlayerId()))
        end,
    },{
        In = nil,
        Out = ESX.UI.Menu.CloseAll
    })	
end)

local grab = nil
local PlayerProps = {}
local inv = nil
local fishing = false
local tOut = 0
local memeh = false

local spam = false
RegisterNetEvent('fishing:start', function()
    if ESX.GetPlayerData().World ~= 0 then return end
    if spam then return ESX.ShowNotification('Spam nakonid!') end
    spam = true
    Citizen.SetTimeout(5000,function()
        spam = false
    end)

    if not fishing then

        local coords = GetEntityCoords(PlayerPedId()) 
        
        local inwater , waterheight = GetWaterHeight(
            ESX.Math.Round(coords.x, 1),
            ESX.Math.Round(coords.y, 1),
            ESX.Math.Round(coords.z, 1)
        )

        if inwater == 1 then
            if IsPedSwimmingUnderWater(PlayerPedId()) or IsPedSwimming(PlayerPedId()) then return ESX.Alert('Error','Shoma nemitavanid dar in halat mahigir konid!',5000,'error') end
            if IsPedInAnyVehicle(PlayerPedId(), true) then return ESX.Alert('Error','Shoma nemitavanid dar mashin mahigir konid!',5000,'error')  end
            fishing = true
            TaskStartScenarioInPlace(PlayerPedId(), 'WORLD_HUMAN_STAND_FISHING', looped2, true)
            local rand = math.random(10000,20000)
            tOut = ESX.SetTimeout(rand,function()
                exports['xsound']:PlayUrl("fishbob", "./sounds/fishbob.ogg", 0.2)
                memeh = true
                Citizen.CreateThread(function()
                    local time = 2
                    exports['TextUI']:Open('[E] Jahat bardasht mahi<br>'.. time .. 's', 'lightgreen', 'left')
                    function low()
                        if time > 0 and memeh and fishing then
                            time = time - 1
                            if time > 0 then
                                local color = 'lightgreen'
                                if time == 3 then
                                    color = 'lightblue'
                                elseif time == 2 then
                                    color = 'lightred'
                                elseif time == 1 then
                                    color = 'lightgrey'
                                end
                                exports['TextUI']:Open('[E] Jahat bardasht mahi<br>'.. time .. 's', color, 'left')
                            end
                        else
                            return
                        end
                        Citizen.SetTimeout(1000,low)
                    end
                    Citizen.SetTimeout(1000,low)
                end)
                Citizen.Wait(4000)
                if memeh then
                    memeh = false
                    endHandler()
                end
            end)
            TriggerEvent("mythic_progbar:client:progress", {
                name = "fishing",
                duration = 25000,
                label = "Dar hale mahi giri",
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }
            },endHandler)
        else
            ESX.Alert('Error','Shoma dar nazdiki ab nistid!',5000,'error')
        end
    end
end)

local trackedEntities = {
    GetHashKey('prop_fishing_rod_01'),
    GetHashKey('prop_fishing_rod_02')
}

function removeFishingRod()
    for k , v in pairs(ESX.Game.GetObjects()) do
        if DoesEntityExist(v) then
            local model = GetEntityModel(v)
            if model == `prop_fishing_rod_01` or model == `prop_fishing_rod_02` then
                ESX.Game.DeleteObject(v)
            end
        end
    end
end

local dropOffPoint = vector3(-41.83, 228.18, 106.95)

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
        info.blip = AddBlipForCoord(info.coords.x, info.coords.y, info.coords.z)
        SetBlipSprite(info.blip, info.id)
        SetBlipDisplay(info.blip, 4)
        SetBlipScale(info.blip, 1.0)
        SetBlipColour(info.blip, info.colour)
        SetBlipAsShortRange(info.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(info.title)
        EndTextCommandSetBlipName(info.blip)
    end
end)
  
function endHandler()
    fishing = false
    memeh = false
    removeFishingRod()
    ClearPedTasksImmediately(PlayerPedId())
    TriggerEvent('mythic_progbar:client:cancel')
    ESX.ClearTimeout(tOut)
    exports['TextUI']:Close()
    Citizen.Wait(1500)
    exports['TextUI']:Close()
end

--AddEventHandler('KeyDown:x',endHandler)
-- function(status)
--     -- if not status then
--     --     fishing = false
--     --     removeFishingRod()
--     --     ClearPedTasksImmediately(PlayerPedId())
--     --     
--     -- elseif status then
--     --     removeFishingRod()
--     --     fishing = false
--     --     ClearPedTasksImmediately(PlayerPedId())
--     -- end
--     removeFishingRod()
--     fishing = false
--     ClearPedTasksImmediately(PlayerPedId())
-- end

AddEventHandler('KeyDown:e',function()
    if fishing then
        if memeh then
            endHandler()
            if ESX.playMiniGame(15, 1) then
                ESX.TriggerServerEvent('fishing:done')
            end
        else
            endHandler()
        end
    else
        if ESX.DoesHaveItem('gholab',1,nil,nil,false) then
            local coords = GetEntityCoords(PlayerPedId()) 
            local inwater , waterheight = GetWaterHeight(
                ESX.Math.Round(coords.x, 1),
                ESX.Math.Round(coords.y, 1),
                ESX.Math.Round(coords.z, 1)
            )
            if inwater and ESX.GetPlayerData().World == 0 then
                if IsPedSwimmingUnderWater(PlayerPedId()) or IsPedSwimming(PlayerPedId()) then return end
                if IsPedInAnyVehicle(PlayerPedId(), true) then return end
                TriggerEvent('fishing:start')
            end
        end
    end
end)