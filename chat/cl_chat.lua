ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local active = true
local chatInputActive = false
local chatInputActivating = false
local muted  = false

RegisterNetEvent('chatMessage')
RegisterNetEvent('chat:addTemplate')
RegisterNetEvent('chat:addMessage')
RegisterNetEvent('chat:addSuggestion')
RegisterNetEvent('chat:removeSuggestion')
RegisterNetEvent('chat:clear')

-- internal events
RegisterNetEvent('__cfx_internal:serverPrint')

RegisterNetEvent('_chat:messageEnteredOps')

--deprecated, use chat:addMessage
AddEventHandler('chatMessage', function(author, color, text)
    if not active then return end
    local args = { text }
    if author ~= "" then
        table.insert(args, 1, author)
    end
    SendNUIMessage({
        type = 'ON_MESSAGE',
        message = {
            color = color,
            multiline = true,
            args = args
        }
    })
end)

-- AddEventHandler('__cfx_internal:serverPrint', function(msg)
--     SendNUIMessage({
--         type = 'ON_MESSAGE',
--         message = {
--             color = { 0, 0, 0 },
--             multiline = true,
--             args = { msg }
--         }
--     })
-- end)

AddEventHandler('__cfx_internal:serverPrint', function(msg)
    SendNUIMessage({
        type = 'ON_MESSAGE',
        message = {
            color = { 0, 255, 0 },
            multiline = true,
            args = { msg }
        }
    })
end)

AddEventHandler('chat:addMessage', function(message)
    if not active then return end
    SendNUIMessage({
        type = 'ON_MESSAGE',
        message = message
    })
end)

AddEventHandler('chat:addSuggestion', function(name, help, params)
    TriggerEvent('chat:removeSuggestion',name)
    SendNUIMessage({
        type = 'ON_SUGGESTION_ADD',
        suggestion = {
            name = name,
            help = help,
            params = params or nil
        }
    })
end)

AddEventHandler('chat:removeSuggestion', function(name)
    SendNUIMessage({
        type = 'ON_SUGGESTION_REMOVE',
        name = name
    })
end)

AddEventHandler('chat:addTemplate', function(id, html)
    if not active then return end
    SendNUIMessage({
        type = 'ON_TEMPLATE_ADD',
        template = {
            id = id,
            html = html
        }
    })
end)

AddEventHandler('chat:clear', function(name)
    SendNUIMessage({
        type = 'ON_CLEAR'
    })
end)

RegisterNetEvent("chat:setMuteStatus")
AddEventHandler("chat:setMuteStatus", function(status)
    muted = status
end)

RegisterNUICallback('chatResult', function(data, cb)
    chatInputActive = false
    SetNuiFocus(false)
    setChatDecor(false)
    if not data.canceled then
        local id = PlayerId()
        --deprecated
        local r, g, b = 0, 0x99, 255
        data.message = data.message:gsub('%^',''):gsub('~','')
        if data.message:sub(2):len() > 300 and ESX.GetPlayerData().job.name ~= 'weazel' then
            return
        end
        TriggerServerEvent('chat:logMessage', data.message)
        if data.message:sub(1, 1) == '/' then
            if not muted then
                ExecuteCommand(data.message:sub(2))
            else
                if data.message:sub(1, 4) == '/ooc' or data.message:sub(1, 2) == '/b' or data.message:sub(1, 2) == '/s' or data.message:sub(1, 3) == '/mp' or data.message:sub(1, 3) == '/me' or data.message:sub(1, 4) == '/do' then
                    TriggerEvent('chat:addMessage', {
                        color = { 255, 0, 0},
                        multiline = true,
                        args = {"[SYSTEM]", "^0Shoma nemitavanid hengami ke ^1mute ^0hastid chat konid!"}
                    })
                else
                    ExecuteCommand(data.message:sub(2))
                end
            end
        else

            if not muted then
                TriggerServerEvent('_chat:messageEnteredOps', GetPlayerName(id), { r, g, b }, data.message)
            else

                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {"[SYSTEM]", "^0Shoma nemitavanid hengami ke ^1mute ^0hastid chat konid!"}
                })

            end

        end
    end

    cb('ok')
end)

RegisterNUICallback('loaded', function(data, cb)
    TriggerServerEvent('chat:init');

    cb('ok')
end)

AddEventHandler("onKeyDown", function(key)
  if ESX.GetPlayerData().InPhone then return end
  if key == "t" then
    if not chatInputActive then
        chatInputActive = true
        chatInputActivating = true

        SendNUIMessage({
            type = 'ON_OPEN'
        })
    end

    if chatInputActivating then
        SetNuiFocus(true)
        chatInputActivating = false
        setChatDecor(true)
    end
  end
end)

Citizen.CreateThread(function()
    SetTextChatEnabled(false)
    SetNuiFocus(false)
end)


function setChatDecor(state)
    --ESX.TriggerServerEvent('chat:typing',state)
    ESX.SetPlayerState('typing',state)
end


RegisterCommand('togglechat2', function()
    if ESX.GetPlayerData().permission_level >= 20 or ESX.GetPlayerData().job.name == 'weazel' then
        active = not active
        local state = active and 'active' or 'deactive'
        ESX.ShowNotification('chat ' .. state)
    end
end, false)
