local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX                           = nil
local HasAlreadyEnteredMarker = false
local LastZone                = nil
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local near = {active = false}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    Citizen.Wait(5000)

    ESX.TriggerServerCallback('esx_blackmarket:requestDBItems', function(ShopItems)
        for k,v in pairs(ShopItems) do
            Config.Zones[k].Items = v
        end
    end)
    for k,v in pairs(Config.Zones) do
        for i=1, #v.Pos, 1 do
            ESX.RegisterPoint(vector3(v.Pos[i].x,v.Pos[i].y,v.Pos[i].z),1.5,{
                Color = {R = 255,G = 0,B = 0,A = 255},
                DrawDistance = 3,
                Radius = 0.7,
                Type = 54,
                world = 0,
            },{
                Notification = nil,
                DrawText = 'Dokme ~INPUT_CONTEXT~ jahat baz kardan menu',
                DrawTextRadius = 3,
                DrawTextCoords = vector3(v.Pos[i].x,v.Pos[i].y,v.Pos[i].z),
                Key = 'e',
                CB = function()
                    OpenShopMenu(k)
                end,
            },{
                In = nil,
                Out = ESX.UI.Menu.CloseAll
            })
        end
    end
end)

function OpenShopMenu(zone)
    local elements = {}
    for i=1, #Config.Zones[zone].Items, 1 do
        local item = Config.Zones[zone].Items[i]
        if item.limit == -1 then
            item.limit = 100
        end
        if item.tc == 1 then
            table.insert(elements, {
                label      = ('%s - <span style="color:yellow;">%s</span>'):format(item.label, _U('shop_itemtc', ESX.Math.GroupDigits(item.price))),
                label_real = item.label,
                item       = item.item,
                price      = item.price,

                -- menu properties
                value      = 1,
                type       = 'slider',
                min        = 1,
                max        = item.limit
            })
        elseif item.tc == 3 then
            table.insert(elements, {
                label      = ('%s - <span style="color:green;">%s</span>'):format(item.label, _U('shop_itemtc3', ESX.Math.GroupDigits(item.price),ESX.Math.GroupDigits(item.price2))),
                label_real = item.label,
                item       = item.item,
                price      = item.price,

                -- menu properties
                value      = 1
            })
        else
            table.insert(elements, {
                label      = ('%s - <span style="color:green;">%s</span>'):format(item.label, _U('shop_item', ESX.Math.GroupDigits(item.price))),
                label_real = item.label,
                item       = item.item,
                price      = item.price,

                -- menu properties
                value      = 1,
                type       = 'slider',
                min        = 1,
                max        = item.limit
            })
        end
    end

	table.insert(elements, {
		label      = ('%s - <span style="color:green;">%s</span>'):format('Mojavez aslahe(DYS)', _U('shop_item', ESX.Math.GroupDigits(50000))),
		label_real = 'Mojavez aslahe(DYS)',
		item       = 'dys',
		price      = 50000,

		-- menu properties
		value      = 1
	})
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop', {
        title    = _U('shop'),
        align    = 'bottom-right',
        elements = elements
    }, function(data, menu)
        ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
            title    = _U('shop_confirm', data.current.value, data.current.label_real, ESX.Math.GroupDigits(data.current.price * data.current.value)),
            align    = 'bottom-right',
            elements = {
                {label = _U('no'),  value = 'no'},
                {label = _U('yes'), value = 'yes'}
            }
        }, function(data2, menu2)
            if data2.current.value == 'yes' then
                TriggerServerEvent('esx_blackmarket:buyItem', data.current.item, data.current.value, zone)
            end

            menu2.close()
        end, function(data2, menu2)
            menu2.close()
        end)
    end, function(data, menu)
        menu.close()

        CurrentAction     = 'shop_menu'
        CurrentActionMsg  = _U('press_menu')
        CurrentActionData = {zone = zone}
    end)
end
