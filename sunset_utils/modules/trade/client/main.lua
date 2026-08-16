local inTrade, ready, readyCooldown, addedItem = false, false, false, {}

local function startTrade(target)
    if not inTrade then
        ESX.TriggerServerEvent('trade:start', target)
    end
end
exports('startTrade', startTrade)

local function callback(data)
    if inTrade then
        if data.key == 'money' then
            data.value = tonumber(data.value)
            if data.value >= 0 then
                if data.value > ESX.GetPlayerData().money then
                    data.value = ESX.GetPlayerData().money
                    exports['sun-trade']:sendMessage({
                        id = 'trade',
                        yourMoney = data.value,
                    })
                end
                ESX.TriggerServerEvent('trade:update', {type = 'money', amount = ESX.Math.Round(data.value)})
            end
        elseif data.key == 'cancel' then
            ESX.TriggerServerEvent('trade:cancel')
        elseif data.key == 'message' then
            TriggerServerEvent('trade:updateMessage', data.value)
        elseif data.key == 'ready' then
            if readyCooldown then return ESX.Alert('', 'Spam nakonid', 7000, 'warning') end
            readyCooldown = true
            SetTimeout(5000, function()
                readyCooldown = false
            end)
            local state = not ready
            ready = state
            exports['sun-trade']:sendMessage({
                id = 'trade',
                selfReadyState = state,
            })
            ESX.TriggerServerEvent('trade:update', {type = 'ready', state = state})
        elseif data.key == 'addItem' then
            local data = data.value
            local doesInList = false
            for k, v in pairs(addedItem) do
                if (data.serial and data.serial == v.serial) or (data.type == 'item' and v.name == data.name) then
                    doesInList = true
                end
            end
            if not doesInList then
                data.count = data.max
                ESX.TriggerServerEvent('trade:update', {type = 'addItem', data = data})
            end
        elseif data.key == 'removeItem' then
            local data = data.value
            local doesInList = false
            for k, v in pairs(addedItem) do
                if (data.serial and data.serial == v.serial) or (data.type == 'item' and v.name == data.name) then
                    doesInList = true
                end
            end
            if doesInList then
                data.count = 1
                ESX.TriggerServerEvent('trade:update', {type = 'removeItem', data = data})
            end
        elseif data.key == 'itemCount' then
            local data = data.value
            data.count = tonumber(data.count)
            if data.type == 'item' and data.count > 0 then
                ESX.TriggerServerEvent('trade:update', {type = 'itemCount', data = data})
            end
        end
    end
end

local function getInventory()
    local inventory = {}
    for k, v in pairs(ESX.GetPlayerData().inventory) do
        if not v.name:find('key_') then
            local doesInList = false
            for k2, v2 in pairs(addedItem) do
                if  v.name == v2.name then
                    doesInList = true
                end
            end
            if not ESX.blackListItems[v.name] and not doesInList and v.count > 0  and not exports['sunset_clothe']:getClotheData(v.name) and not v.name:find('pack_') then
                table.insert(inventory, {name = v.name, label = v.label, img = ('nui://sun-inventory-hud/ui/img/items/%s.png'):format(v.name), count = ('x%s'):format(v.count), min = 1, max = v.count, type = 'item'})
            end
        end
    end
    for k, v in pairs(ESX.GetPlayerData().loadout) do
        local doesInList = false
        for k2, v2 in pairs(addedItem) do
            if  v.metadata.serial == v2.serial then
                doesInList = true
            end
        end
        if not doesInList then
            table.insert(inventory, {name = v.name, label = v.label, img = ('nui://sun-inventory-hud/ui/img/items/%s.png'):format(v.name), count = ('x%s'):format(1), serial = v.metadata.serial, min = 1, max = 1, type = 'weapon'})
        end
    end
    return inventory
end

local function updateInventory()
    exports['sun-trade']:sendMessage({
        id = 'trade',
        inventory = getInventory()
    })
end

local function fillItems(items)
    if #items < 1 then
        table.insert(items, {})
    end
    return items
end

CreateThread(function()
    waitForLoad()
    ESX.RegisterClientCallback('trade:ask', function(cb, src)
        SetTimeout(tradeConfig.accceptTimeout - 1000, function()
            lib.closeAlertDialog()
        end)
        local alert = lib.alertDialog({
            header = 'Trade',
            content = ('Aya mayel be trade ba [%s] hastid?'):format(src),
            centered = true,
            cancel = true
        })
        cb(alert == 'confirm')
    end)
    exports['sun-trade']:registerUICallback('trade', callback)
end)

RegisterNetEvent('trade:openTradeMenu', function()
    if not inTrade then
        inTrade = true
        addedItem = {}
        ready = false
        exports['sun-trade']:sendMessage({
            id = 'trade',
            display = true,
            focus = true,
            inventory = getInventory()
        })
    end
end)

RegisterNetEvent('trade:close', function()
    if inTrade then
        inTrade = false
        exports['sun-trade']:sendMessage({
            id = 'trade',
            display = false,
        })
    end
end)

RegisterNetEvent('trade:unready', function()
    if inTrade then
        exports['sun-trade']:sendMessage({
            id = 'trade',
            tradeState = {
                self = false,
                otber = false,
            },
        })
    end
end)

RegisterNetEvent('trade:updateMoney', function(money)
    exports['sun-trade']:sendMessage({
        id = 'trade',
        playerMoney = money,
    })
end)

RegisterNetEvent('trade:updateMessage', function(message)
    exports['sun-trade']:sendMessage({
        id = 'trade',
        message = message,
    })
end)

RegisterNetEvent('trade:updateReady', function(self, other)
    if self ~= nil then
        ready = self
    end
    exports['sun-trade']:sendMessage({
        id = 'trade',
        selfReadyState = self,
        otherReadyState = other,
    })
end)

RegisterNetEvent('trade:updateItems', function(src, data)
    if src == ESX.src then
        addedItem = data
        updateInventory()
    end
    exports['sun-trade']:sendMessage({
        id = 'trade',
        [src == ESX.src and 'myTrade' or 'otherTrade'] = fillItems(data),
    })
end)