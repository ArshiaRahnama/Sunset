gangKey = nil
local gangZoneList = {}
AddEventHandler('gangs:zoneLoaded',function(data)
    waitForLoad()
    local whiteJob = {
		['police'] = true,
		['sheriff'] = true,
		['fbi'] = true,
        ['mt'] = true,
        ['detective'] = true,
	}
    local unarmed = `weapon_unarmed`
    local taze = `weapon_stungun`
    for k , v in ipairs(data) do
        local Blip = json.decode(v)
        v = vector3(Blip.x,Blip.y,Blip.z)
        table.insert(gangZoneList,v)
    end
    Citizen.CreateThread(function()
        --
        while true do 
            local coords = GetEntityCoords(PlayerPedId())
            -- if not (whiteJob[ESX.PlayerData.job.name] and GetSelectedPedWeapon(PlayerPedId()) == taze) then
            if not (whiteJob[ESX.PlayerData.job.name] and (GetSelectedPedWeapon(PlayerPedId()) == taze or IsPedInAnyVehicle(PlayerPedId()))) then
                for k , v in pairs(gangZoneList) do
                    if ESX.GetDistance(coords,v) < 80 then
                        if not gangKey then
                            gangKey = k
                            Citizen.CreateThread(function()
                                while gangKey and SUN.World == 0 do
                                    Citizen.Wait(0)
                                    if GetSelectedPedWeapon(PlayerPedId()) ~= unarmed then
                                        disableFiring()
                                    end
                                end
                                gangKey = nil
                            end)
                        end
                    elseif gangKey == k then
                        gangKey = nil
                    end
                    Citizen.Wait(10)
                end
            elseif gangKey then
                gangKey = nil
            end
            Citizen.Wait(2000)
        end
    end)
end)