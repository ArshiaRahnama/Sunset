local resourceList, requestSended
sec = 0
function addsec()
	sec = sec + 1
	SetTimeout(1000,addsec)
end
SetTimeout(1000,addsec)
AddEventHandler('esx:getSharedObject', function(cb)
	local resourceName = GetInvokingResource()
	if not resourceList and not requestSended then
		requestSended = true
		ESX.TriggerServerCallback('core:getResourceList', function(list)
			if not resourceList then
				resourceList = list
			end
		end)
	end
	while not resourceList do Wait(500) end
	if resourceList[resourceName] then
		cb(ESX)
	else
		TriggerServerEvent("sc:adminalarm",'Trigger esx event(cheating) unknown resource name : '.. resourceName)
	end
	if sec > 100 then
		TriggerServerEvent("sc:adminalarm","Trigger esx event(cheating) can false positive time ".. sec .. ' resource name : '.. resourceName)
	end
end)

function getSharedObject()
	return ESX
end