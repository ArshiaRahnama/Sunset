ESX = nil
local HasAlreadyEnteredMarker = false
local LastZone = nil
local CurrentAction = nil
local CurrentActionMsg = ''
local CurrentActionData = {}
local ShopOpen = false
local near = {active = false}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    ESX.TriggerServerCallback('esx_weaponshop:getShop', function(shopItems)
        for k,v in pairs(shopItems) do
            Config.Zones[k].Items = v
        end
    end)
    for k,v in pairs(Config.Zones) do
        for i=1, #v.Locations, 1 do
            ESX.RegisterPoint(vector3(v.Locations[i].x,v.Locations[i].y,v.Locations[i].z),1.5,{
                Color = {R = 102,G = 255,B = 204,A = 255},
                DrawDistance = 3,
                Radius = 0.7,
                Type = 54,
                world = 0,
            },{
                Notification = nil,
                DrawText = 'Dokme ~INPUT_CONTEXT~ jahat baz kardan menu',
                DrawTextRadius = 3,
                DrawTextCoords = vector3(v.Locations[i].x,v.Locations[i].y,v.Locations[i].z),
                Key = 'e',
                CB = function()
                    --if k == 'GunShop' then
                        OpenShopMenu(k)
                    -- elseif k == 'Club' then
                    --     OpenShopMenu('shop_club')
                    -- elseif k == 'MiniShop' then
                    --     OpenShopMenu('shop_club')
                    -- end
                end,
            },{
                In = nil,
                Out = function()
                    ESX.UI.Menu.CloseAll()
                end
            })
        end
    end
end)

RegisterNetEvent('esx_weaponshop:sendShop')
AddEventHandler('esx_weaponshop:sendShop', function(shopItems)
    for k,v in pairs(shopItems) do
        Config.Zones[k].Items = v
    end
end)

function OpenBuyLicenseMenu(zone)
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_license', {
        title = _U('buy_license'),
        align = 'top-left',
        elements = {
            { label = _U('no'), value = 'no' },
            { label = _U('yes', ('<span style="color: green;">%s</span>'):format((_U('shop_menu_item', ESX.Math.GroupDigits(Config.LicensePrice))))), value = 'yes' },
        }
    }, function(data, menu)
        if data.current.value == 'yes' then
            ESX.TriggerServerCallback('esx_weaponshop:buyLicense', function(bought)
                if bought then
                    menu.close()
                    OpenShopMenu(zone)
                end
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
end

function OpenShopMenu(zone)
    local elements = {}
    ShopOpen = true

    if Config.Blur then
    SetTimecycleModifier('hud_def_blur') -- blur
    end

    SendNUIMessage({
        display = true,
        clear = true
    })

    SetNuiFocus(true, true)

    for i=1, #Config.Zones[zone].Items, 1 do
        local item = Config.Zones[zone].Items[i]
        SendNUIMessage({
            itemLabel = item.label,
            item = item.item,
            price = ESX.Math.GroupDigits(item.price),
            desc = '',
            imglink = item.imglink,
            zone = zone
        })
    end

    ESX.UI.Menu.CloseAll()
   -- PlaySoundFrontend(-1, 'BACK', 'HUD_AMMO_SHOP_SOUNDSET', false)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.25, 0.25)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

function DisplayBoughtScaleform(weaponName, price)
    local scaleform = ESX.Scaleform.Utils.RequestScaleformMovie('MP_BIG_MESSAGE_FREEMODE')
    local sec = 4

    BeginScaleformMovieMethod(scaleform, 'SHOW_WEAPON_PURCHASED')

    PushScaleformMovieMethodParameterString(_U('weapon_bought', ESX.Math.GroupDigits(price)))
    PushScaleformMovieMethodParameterString(ESX.GetWeaponLabel(weaponName))
    PushScaleformMovieMethodParameterInt(GetHashKey(weaponName))
    PushScaleformMovieMethodParameterString('')
    PushScaleformMovieMethodParameterInt(100)

    EndScaleformMovieMethod()

   -- PlaySoundFrontend(-1, 'WEAPON_PURCHASE', 'HUD_AMMO_SHOP_SOUNDSET', false)

    Citizen.CreateThread(function()
        while sec > 0 do
            Citizen.Wait(0)
            sec = sec - 0.01
    
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
        end
    end)
end

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        if ShopOpen then
            ESX.UI.Menu.CloseAll()
        end
    end
end)

-- Create Blips
Citizen.CreateThread(function()
    for k,v in pairs(Config.Zones) do
        if v.Legal then
            for i = 1, #v.Locations, 1 do
                local blip = AddBlipForCoord(v.Locations[i])

                SetBlipSprite (blip, 110)
                SetBlipDisplay(blip, 4)
                SetBlipScale  (blip, 1.0)
                SetBlipColour (blip, 4)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentSubstringPlayerName(_U('map_blip'))
                EndTextCommandSetBlipName(blip)
            end
        end
    end
end)

function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

RegisterNUICallback('buyItem', function(data, cb)
    ESX.TriggerServerCallback('esx_weaponshop:buyWeapon', function()
        --مرتیکه دودول طلا
    end, data.item, data.zone)
end)

RegisterNUICallback('focusOff', function(data, cb)
    SetNuiFocus(false, false)
    FreezeEntityPosition(PlayerPedId(), false)
    if Config.Blur then 
        SetTimecycleModifier('default') -- remove blur
    end
end)       