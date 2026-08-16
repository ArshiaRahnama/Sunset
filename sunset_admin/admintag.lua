admintag = {}
RegisterNetEvent("updatetag")
AddEventHandler("updatetag",function(data)
    admintag = data
end)

playersInfo = {}
Citizen.CreateThread(function()
    while true do
        for _, player in ipairs(GetActivePlayers()) do

            local coords = GetEntityCoords(GetPlayerPed(-1))
            local coords2 = GetEntityCoords(GetPlayerPed(player))
            local distance = math.floor(Vdist2(coords.x, coords.y, coords.z, coords2.x, coords2.y, coords2.z))   
            local svid = GetPlayerServerId(player)         
            playersInfo[svid] = {}
            playersInfo[svid]["info"] = {}
            playersInfo[svid].info["ped"] = GetPlayerPed(player)
            playersInfo[svid].info["distance"] = distance
            playersInfo[svid].info["name"] = GetPlayerName(player)
        end
        Citizen.Wait(2000)
    end
end)
local svid = GetPlayerServerId(PlayerId())
Citizen.CreateThread(function()
    Wait(50)
    while true do
        for k, v in pairs(admintag) do
                local data = playersInfo[v.source]
                if data and data.info.distance < 80.0 and IsEntityVisible(data.info.ped) and DoesEntityExist(data.info.ped) then
                    local x2, y2, z2
                    x2, y2, z2 = table.unpack(GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(v.source)), true))
                    DrawText3D(x2, y2, z2+1.1, data.info.name, 255,215,0)        
                end  
        end
        Citizen.Wait(5)
    end
end)

function DrawText3D(x,y,z, text, r,g,b) 
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)

    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end