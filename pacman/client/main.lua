local ClosestDistance = 20.0

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(50)
    end
    SetNuiFocus(false, false)
    exports['sunset_target']:AddTargetModel(ConfigPacman.ArcadeProps, {
        options = {
            {
                icon = "fas fa-chair",
                label = "⍩⃝ شروع پک من",
                cb = function(entity)
                    ESX.TriggerServerCallback('pacman:payToUse', function(success)
                        if success then
                            ESX.ShowAdvancedNotification('Pacman', 'Pacman', 'Shoma mablagh ~g~'..ConfigPacman.Price..'$ ~s~pardakht kardid', 'CHAR_BLANK_ENTRY', 9)
                            Citizen.Wait(1000)
                            StartGame()
                        else
                            ESX.ShowNotification('Shoma poul kafi nadarid!')
                        end
                    end)
                end,
            },
        },
        job = {"all"},
        distance = 2.5
    })
end)

RegisterNUICallback("close", function(data, cb)
    EndGame()
end)

RegisterNUICallback("getscore", function(data, cb)
    ESX.TriggerServerEvent('pacman:PacmanNewScore', data)

    ESX.TriggerServerCallback('pacman:requestPacmanLeaderBoard', function(score)
        local newScore = {}
        for k ,v in pairs(score) do
            table.insert(newScore,v)
        end
        table.sort(newScore, function(a,b)
            return a.score > b.score
        end)
        SendNUIMessage({
            scoreboard = newScore
        })
    end)
end)

RegisterNUICallback("win", function(data, cb)
    ESX.TriggerServerEvent('pacman:winLevel', data)
end)

function StartGame()
    ESX.TriggerServerCallback('pacman:requestPacmanLeaderBoard', function(score)
        local newScore = {}
        for k ,v in pairs(score) do
            table.insert(newScore,v)
        end
        table.sort(newScore, function(a,b)
            return a.score > b.score
        end)
        SendNUIMessage({
            type = "ui",
            display = true,
            scoreboard = newScore
        })
        SetNuiFocus(true, true)
    end)
end

function EndGame()
    SendNUIMessage({
        type = "ui",
        display = false
    })
    SetNuiFocus(false, false)
end


-- Citizen.CreateThread(function()
--     while true do
--         local playerPed = PlayerPedId()
--         local playerCoords = GetEntityCoords(playerPed)
--         local arcadeCoords = nil
--         local closestDistance = nil

--         for _, arcadeProp in pairs(ConfigPacman.ArcadeProps) do
--             local arcade = GetClosestObjectOfType(playerCoords, 20.0, arcadeProp, false)
--             if DoesEntityExist(arcade) then
--                 arcadeCoords = GetEntityCoords(arcade)
--                 local distance = #(playerCoords - arcadeCoords)
--                 if not closestDistance or distance <= closestDistance then
--                     closestDistance = distance
--                 end
--             end
--         end
--         ClosestDistance = closestDistance
--         Citizen.Wait(2000)
--     end
-- end)

-- local CD = false
-- Citizen.CreateThread(function()
--     while true do
--         if ESX and ClosestDistance and ClosestDistance <= 1.5 then
--             ESX.ShowHelpNotification('Dokme ~INPUT_PICKUP~ jahat shorue ~y~Pacman ~s~(~g~'..ConfigPacman.Price..'$~s~)')
--             if IsControlJustPressed(1, 38) then
--                 if not CD then
--                     CD = true
--                     Citizen.SetTimeout(5000,function()
--                         CD = false
--                     end)
--                     ESX.TriggerServerCallback('pacman:payToUse', function(success)
--                         if success then
--                             ESX.ShowAdvancedNotification('Pacman', 'Pacman', 'Shoma mablagh ~g~'..ConfigPacman.Price..'$ ~s~pardakht kardid', 'CHAR_BLANK_ENTRY', 9)
--                             Citizen.Wait(1000)
--                             StartGame()
--                         else
--                             ESX.ShowNotification('Shoma poul kafi nadarid!')
--                         end
--                     end)
--                 end
--             end
--         end
--         Citizen.Wait(ClosestDistance and 0 or 1000)
--     end
-- end)

