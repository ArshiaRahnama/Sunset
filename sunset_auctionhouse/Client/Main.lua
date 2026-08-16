ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
    for k , v in pairs(coords) do
        if not v.hide then 
            local blip = AddBlipForCoord(v.coords)
            SetBlipSprite  (blip, 304)
            SetBlipDisplay (blip, 4)
            SetBlipScale   (blip, 1.0)
            SetBlipCategory(blip, 3)
            SetBlipColour  (blip, 2)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("Auction House")
            EndTextCommandSetBlipName(blip)
        end
    end
    
    Wait(5000)
    SendNUIMessage({
        config = Config,
        translate = translate,
        NameResource = GetCurrentResourceName()
    })
    for k , v in pairs(coords) do
        ESX.RegisterPoint(v.coords + vector3(0,0,1),3,{
			Color = {R = 0,G = 0,B = 0,A = 255},
			DrawDistance = 10,
			Radius = 1.0,
			Type = 54
		},{
			Notification = nil,
			DrawText = 'Dokme ~INPUT_CONTEXT~ jahat baz kardan Auction House',
			DrawTextRadius = 4,
			DrawTextCoords = v.coords + vector3(0,0,1),
			Key = 'e',
			CB = function()
				TriggerServerEvent('market:open')
			end,
		},{
			In = nil,
			Out = ESX.UI.Menu.CloseAll
		})
    end
end)
local near = false
local cane = false
local key = 0


RegisterNetEvent('ah:loadMarket')
AddEventHandler('ah:loadMarket', function(identifier, result)
    SendNUIMessage({
        open = true,
        list_products = list_products,
        products = result,
        identifier = identifier
    })

    SetNuiFocus(true, true)
end)

RegisterNetEvent('ah:loadPlayerMarket')
AddEventHandler('ah:loadPlayerMarket', function(inventory, result)
    SendNUIMessage({
        myProductsOpen = true,
        list_products = list_products,
        inventory = inventory,
        myProducts = result
    })
end)

RegisterNetEvent('ah:updatePlayerMarket')
AddEventHandler('ah:updatePlayerMarket', function()
    TriggerServerEvent('ah:loadPlayerMarket')
end)


RegisterNetEvent('ah:updateMarket')
AddEventHandler('ah:updateMarket', function()
    TriggerServerEvent('ah:loadMarket')
end)

RegisterNetEvent('ah:marketNotify')
AddEventHandler('ah:marketNotify', function(color, Notify)
    SendNUIMessage({
        Notify = Notify,
        color = color
    })
end)

RegisterNetEvent('ah:marketRefused')
AddEventHandler('ah:marketRefused', function()
    SendNUIMessage({
        Refused = true
    })
end)

RegisterNUICallback('loadAnuncios', function(data, cb)
    TriggerServerEvent('ah:loadMarket')

    cb('ok')
end)

RegisterNUICallback('loadMyAnuncios', function(data, cb)
    TriggerServerEvent('ah:loadPlayerMarket')

    cb('ok')
end)

RegisterNUICallback('anunciarItem', function(data, cb)
    ESX.TriggerServerEvent('ah:advertiseItem', data)

    cb('ok')
end)

RegisterNUICallback('buyItem', function(data, cb)
    ESX.TriggerServerEvent('ah:buyItem', data)
    cb('ok')
end)

RegisterNUICallback('removeItem', function(data, cb)
    ESX.TriggerServerEvent('ah:removeItem', data)
    cb('ok')
end)

RegisterNUICallback('sendNotify', function(data, cb)
    TriggerEvent('ah:marketNotify', data.color, data.Notify)

    cb('ok')
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false, false)
    TriggerEvent('ah:onClose')
    cb('ok')
end)