configSensor = {}
configSensor.locations = {
    {x = 434.1 , y = -981.39 , z = 30.71 , d = 0.5}, 	-- pd 1
	{x = 434.13 , y = -982.56 , z = 30.71 , d = 0.5},	-- pd 1
	{x = -543.8 , y = -207.46 , z = 37.65 , d = 0.5}, 	-- justic
	{x = -542.8 , y = -206.8 , z = 37.65 , d = 0.5}, 	-- justic 
}
configSensor.soundtime = 5 * 1000
configSensor.sounddistance = 10

cooldown = false

function haveweapon()
    local have = false
    if tablelength(ESX.GetPlayerData().loadout) > 0 then
        have = true
    end
    return have
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
end

sid = GetSoundId()

Citizen.CreateThread(function()
    while true do
        Wait(100)
        for k , v in ipairs(configSensor.locations) do
            local coords = GetEntityCoords(PlayerPedId())
            if Vdist(coords.x,coords.y,coords.z,v.x,v.y,v.z) < v.d and not cooldown then
                if haveweapon() and not ESX.militaryJobs2[ESX.GetPlayerData().job.name] then
                    cooldown = true
                    ESX.TriggerServerEvent('sensor:slarm', ESX.Game.GetPlayersToSend(10))
                    SetTimeout(configSensor.soundtime,function()
                        cooldown = false
                    end)
                end
            end
        end
    end
end)

RegisterNetEvent('sensor:sync')
AddEventHandler('sensor:sync',function(src)
    if not ESX.Game.PlayerExist(src) then return end
    local targetcoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    local coords = GetEntityCoords(PlayerPedId())
    if Vdist(coords.x,coords.y,coords.z,targetcoords.x,targetcoords.y,targetcoords.z) < configSensor.sounddistance then
        TriggerEvent('InteractSound_CL:PlayOnOne','devicealarm',0.05)
    end
end)