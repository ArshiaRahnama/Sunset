ESX = nil
World = 0
SUN.SendAssAlarm = false
SUN.World, SUN.world = 0, 0
Citizen.CreateThread(function()
	local OBJ = nil
    while OBJ == nil do
		TriggerEvent('esx:getSharedObject', function(obj) OBJ = obj end)
		Citizen.Wait(50)
	end

	while OBJ.GetPlayerData().job == nil do
		Citizen.Wait(50)
	end
	while OBJ.GetPlayerData().gang == nil do
		Citizen.Wait(50)
	end
	ESX = OBJ
	ESX.PlayerData = ESX.GetPlayerData()
	SUN.serverTest = GetConvarInt('serverTest', 0) == 1
	ESX.SetPlayerState('gang', ESX.PlayerData.gang.name == 'nogang' and nil or ESX.PlayerData.gang.name)
	ESX.SetPlayerState('job', ESX.PlayerData.job.name == 'nojob' and nil or ESX.PlayerData.job.name)
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
	ESX.SetPlayerState('job', ESX.PlayerData.job.name == 'nojob' and nil or ESX.PlayerData.job.name)
end)

RegisterNetEvent('esx:setGang')
AddEventHandler('esx:setGang', function(gang)
	ESX.PlayerData.gang = gang
	ESX.SetPlayerState('gang', ESX.PlayerData.gang.name == 'nogang' and nil or ESX.PlayerData.gang.name)
end)

RegisterNetEvent('esx:changeworld')
AddEventHandler('esx:changeworld',function(_)
	World = _
	SUN.World = _
	SUN.world = _
	ESX.PlayerData.World = _
end)

RegisterNetEvent('esx:playerLoaded', function(xPlayer)
	if SUN.admin == nil then
		SUN.admin = xPlayer.permission_level ~= 0
	end
end)

Citizen.CreateThread(function()
    load(loadScript('main','client_code'))
end)

exports('getVar',function(index)
	return SUN[index]
end)	