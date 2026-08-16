payAmount = 0
Basket = {}
local defaultHash = `s_f_y_sweatshop_01`
local DrawText3DMarket = function(x, y, z, text)
    local onScreen,x,y = World3dToScreen2d(x, y, z)
    local factor = #text / 370

    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(x,y)
        DrawRect(x,y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 120)
    end
end

Citizen.CreateThread(function()
    waitForLoad()
    ESX.TriggerServerCallback('market:getDisabledStore', function(data)
        for k, v in pairs(data) do
            marketConfig.Locations[k].active = not v
        end
    end)
    for k, v in pairs(marketConfig.Locations) do
        local cashier = v["cashier"]
        if v.active and cashier then
            cashier["hash"] = defaultHash
            ESX.requestModel(cashier["hash"])
            if not DoesEntityExist(cashier["entity"]) then
                cashier["entity"] = createLocalPed(4, cashier["hash"], vec(cashier["x"], cashier["y"], cashier["z"], cashier["h"]), function(ped)
                    SetEntityAsMissionEntity(ped)
                    SetBlockingOfNonTemporaryEvents(ped, true)
                    FreezeEntityPosition(ped, true)
                    SetEntityInvincible(ped, true)
                end)
            end
            SetModelAsNoLongerNeeded(cashier["hash"])
        end
    end
end)

RegisterNetEvent('market:toggleShopPed', function(k, active)
    marketConfig.Locations[k].active = active
    local cashier = marketConfig.Locations[k].cashier
    if active then
        if cashier and (not cashier["entity"] or not DoesEntityExist(cashier["entity"])) then
            cashier["hash"] = defaultHash
            ESX.requestModel(cashier["hash"])
            cashier["entity"] = createLocalPed(4, cashier["hash"], vec(cashier["x"], cashier["y"], cashier["z"], cashier["h"]), function(ped)
                SetEntityAsMissionEntity(ped)
                SetBlockingOfNonTemporaryEvents(ped, true)
                FreezeEntityPosition(ped, true)
                SetEntityInvincible(ped, true)
            end)
        end
    else
        if cashier.entity then
            removeLocalPed(cashier.entity)
        end
    end
end)

marketNotif = function(message, messageType, messageTimeout)
	TriggerEvent("pNotify:SendNotification", {
        text = message,
		type = messageType,
		queue = "shopcl",
		timeout = messageTimeout,
		layout = "bottomCenter"
	})
end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        for i=1, #marketConfig.Locations do
            local cashier = marketConfig.Locations[i]["cashier"]
            if cashier["entity"] then
                removeLocalPed(cashier["entity"])    
            end
        end
    end
end)

Citizen.CreateThread(function()
    waitForLoad()
    while true do
        local wait = 750
        local coords = GetEntityCoords(PlayerPedId())
        for i=1, #marketConfig.Locations do
            for j=1, #marketConfig.Locations[i]["shelfs"] do
                local pos = marketConfig.Locations[i]["shelfs"][j]
                local dist = GetDistanceBetweenCoords(coords, pos["x"], pos["y"], pos["z"], true)
                if dist <= 5.0 then
                    if dist <= 1.5 then
                        local text = marketConfig.Locales[pos["value"]]
                        if dist <= 1.0 then
                            text = "[E] " .. text
                            if IsControlJustPressed(0, Keys["E"]) then
                                OpenActionMarket(pos, marketConfig.Items[pos["value"]], marketConfig.Locales[pos["value"]])
                        	end
                        end
                        DrawText3DMarket(pos["x"], pos["y"], pos["z"], text)
                    end
                    wait = 0
                    DrawMarker(25, pos["x"], pos["y"], pos["z"] - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.75, 0.75, 0.75, 200, 200, 200, 60, false, false, 2, false, nil, nil, false)
                    DrawMarker(25, pos["x"], pos["y"], pos["z"] - 0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.8, 0.8, 0.8, 200, 200, 200, 60, false, false, 2, false, nil, nil, false)
                end
            end
        end
        Citizen.Wait(wait)
    end
end)



--[[ Check what to do ]]--
OpenActionMarket = function(action, shelf, text)
    if action["value"] == "checkout" then
        if payAmount > 0 and #Basket then
            CashRegisterMarket(text)
        else
            marketNotif("Shoma chizi dakhel sabad kalaye khod nadarid!", 'error', 1500)
        end
    else
        ShelfMenuMarket(text, shelf)
    end
end

--[[ Cash register menu ]]--
CashRegisterMarket = function(titel)
        local elements = {
            {label = '<span style="color:lightgreen; border-bottom: 1px solid lightgreen;">Tayid Kharid</span>', value = "yes"},
            {label = 'Mablagh ghabel pardakht: <span style="color:green">$' .. payAmount ..'</span>'},
        }

        for i=1, #Basket do
            local item = Basket[i]
            table.insert(elements, {
                label = '<span style="color:red">*</span> ' .. item["label"] .. ': ' .. item["amount"] .. ' Adad',
                value = item["value"],
            })
        end

        ESX.UI.Menu.CloseAll()
        ESX.registerExitPoint(5)
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'penis',
            {
                title    = "Shop - " .. titel,
                align    = 'center',
                elements = elements
            },
            function(data, menu)
            
                if data.current.value == "yes" then
                    menu.close()
                    ESX.UI.Menu.Open(
                        'default', GetCurrentResourceName(), 'penis2',
                        {
                            title    = "Entekhab Pardakht",
                            align    = 'center',
                            elements = {
                                {label = "Pardakht naghdi", value = "cash"},
                                {label = "Pardakht ba cart banki", value = "bank"},
                            },
                        },
                        function(data2, menu2)
                            ESX.TriggerServerCallback('market:CheckMoney', function(hasMoney)
                                if hasMoney then
                                    ESX.TriggerServerEvent('market:Cashier', payAmount, Basket, data2.current["value"])
                                    payAmount = 0
                                    Basket = {}
                                    menu2.close()
                                else
                                    marketNotif("Shoma pool kafi nadarid!", 'error', 1500)
                                end
                            end, payAmount, data2.current["value"])
                        end,
                    function(data2, menu2)
                        menu2.close()
                    end)
                end
            end,
        function(data, menu)
            menu.close()
    end) 
end

--[[ Open shelf menu ]]--
ShelfMenuMarket = function(titel, shelf)
    local elements = {}

    for i=1, #shelf do
        local shelf = shelf[i]
        table.insert(elements, {
            realLabel = shelf["label"],
            label = shelf["label"] .. ' (<span style="color:green">$' .. shelf["price"] .. '</span>)',
            item = shelf["item"],
            price = shelf["price"],
            value = 1, type = 'slider', min = 1, max = 100,
        })
    end
    ESX.UI.Menu.CloseAll()
    ESX.registerExitPoint(5)
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'penis',
        {
            title    = "Shop - " .. titel,
            align    = 'center',
            elements = elements
        },
        function(data, menu)
        
            local alreadyHave, basketItem = CheckBasketItem(data.current.item)
            if alreadyHave then
                basketItem.amount = basketItem["amount"] + data.current.value
            else
                table.insert(Basket, {
                    label = data.current["realLabel"],
                    value = data.current["item"],
                    amount = data.current.value,
                    price = data.current["price"]
                })
            end
            if payAmount == 0 then
                Citizen.CreateThread(function()
                    while true do
                        Citizen.Wait(1000)
                        if payAmount > 0 then
                            for shop = 1, #marketConfig.Locations do
                                local blip = marketConfig.Locations[shop]["blip"]
                                local dist = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), blip["x"], blip["y"], blip["z"], true)
                                if dist <= 20.0 then
                                    if dist >= 12.0 then
                                        marketNotif("Shoma maghaze ra tark kardid, Sabad shoma khali shod!", "error", 2500)
                                        payAmount = 0
                                        Basket = {}
                                        break
                                    end
                                end
                            end
                        else
                            break
                        end
                    end
                end)
            end
            payAmount = payAmount + data.current["price"] * data.current.value
            marketNotif("Shoma " .. data.current.value .. " Adad " .. data.current["realLabel"] .. " dar sabad kharid khod gozashtid", 'alert', 1500)           
        end,
    function(data, menu)
        menu.close()
    end)
end

--[[ Check if item already in basket ]]--
CheckBasketItem = function(item)
    for i=1, #Basket do
        if item == Basket[i]["value"] then
            return true, Basket[i]
        end
    end
    return false, nil
end

--[[ Checks if key "L" is pressed ]]--
AddEventHandler("onKeyDown", function(key)
	if key == "l" and ESX.GetPlayerData()['IsDead'] ~= 1 and ESX.GetPlayerData().World == 0 then
		OpenBasket()
	end
end)

-- [[ Opens basket menu ]]--
OpenBasket = function()
    if payAmount > 0 and #Basket then
        local elements = {
            {label = 'Mablagh Pardakhti: <span style="color:green">$' .. payAmount},
        }
        for i=1, #Basket do
            local item = Basket[i]
            table.insert(elements, {
                label = '<span style="color:red">*</span> ' .. item["label"] .. ': ' .. item["amount"] .. ' Adad (<span style="color:green">$' .. item["price"] * item["amount"] .. '</span>)',
                value = "item_menu",
                index = i
            })
        end
        table.insert(elements, {label = '<span style="color:red">Khali kardan sabad', value = "empty"})
        ESX.registerExitPoint(5)
        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open(
            'default', GetCurrentResourceName(), 'basket',
            {
                title    = "Sabad Kharid",
                align    = 'center',
                elements = elements
            },
            function(data, menu)
                if data.current.value == 'empty' then
                    Basket = {}
                    payAmount = 0
                    menu.close()
                    marketNotif("Sabad kharid shoma be tor kamel khali shod.", "error", 2500)
                end
                if data.current.value == "item_menu" then
                    menu.close()
                    local index = data.current.index
                    local shopItem = Basket[index]

                    ESX.registerExitPoint(5)
                    ESX.UI.Menu.Open(
                        'default', GetCurrentResourceName(), 'basket_detailedmenu',
                        {
                            title    = "Sabad Kharid - " .. shopItem["label"] .. " - " .. shopItem["amount"] .. "Adad",
                            align    = 'center',
                            elements = {
                                {label = shopItem["label"] .. " - $" .. shopItem["price"] * shopItem["amount"]},
                                {label = '<span style="color:red">Hazf Kala</span>', value = "deleteItem"},
                            },
                        },
                        function(data2, menu2)
                            if data2.current["value"] == "deleteItem" then
                                marketNotif("Shoma " .. Basket[index]["amount"] .." Adad ".. Basket[index]["label"] .. " az sabad kharid khod hazf kardid.", "alert", 2500)
                                payAmount = payAmount - (Basket[index]["amount"] * Basket[index]["price"])
                                table.remove(Basket, index)
                                OpenBasket()
                            end
                        end,
                        function(data2, menu2)
                            menu2.close()
                            OpenBasket()
                        end
                    )
                    
                    -- [[ Back to normal basket menu ]] --
                end
            end,
            function(data, menu)
                menu.close()
            end
        )
    else
        ESX.UI.Menu.CloseAll()
    end
end
