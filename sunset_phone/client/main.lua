ESX = nil
local FlyMode = false
local notSaveRecent = false
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject',function(Object)
            ESX = Object
        end)
    end
    ESX.RegisterClientCallback('getFlyModeState', function(cb)
        cb(FlyMode)
    end)
end)
local helper = nil
local profileFetchList = {}
local PlayerJob = {}
local patt = "[?!@#]"
PhoneData = {
    MetaData = {},
    isOpen = false,
    PlayerData = nil,
    Contacts = {},
    Tweets = {},
    MentionedTweets = {},
    Hashtags = {},
    Chats = {},
    Invoices = {},
    CallData = {},
    RecentCalls = {},
    Garage = {},
    Mails = {},
    Adverts = {},
    GarageVehicles = {},
    AnimationData = {
        lib = nil,
        anim = nil,
    },
    SuggestedContacts = {
        {
            name = "Weazel News",
            icon = "fa-thin fa-user-police",
            number = 10000000005,
            CD = false,
            CDTime = 60000,
        },
        {
            name = "Taxi",
            icon = "fa-thin fa-user-police",
            number = 10000000004,
            CD = false,
            CDTime = 60000,
        },
        {
            name = "Mechanic",
            icon = "fa-thin fa-user-police",
            number = 10000000003,
            CD = false,
            CDTime = 60000,
        },
        {
            name = "Medic",
            icon = "fa-thin fa-user-police",
            number = 10000000002,
            CD = false,
            CDTime = 30000,
        },
        {
            name = "Police",
            icon = "fa-thin fa-user-police",
            number = 10000000001,
            CD = false,
            CDTime = 60000,
        },
        {
            name = "FBI",
            icon = "fa-thin fa-user-police",
            number = 10000000006,
            CD = false,
            CDTime = 60000,
        },
        {
            name = "Justice",
            icon = "fa-thin fa-user-police",
            number = 10000000008,
            CD = false,
            CDTime = 60000,
        },
        {
            name = "Detective",
            icon = "fa-thin fa-user-police",
            number = 10000000009,
            CD = false,
            CDTime = 60000,
        },
        {
            name = "Medic System",
            icon = "fa-thin fa-user-police",
            number = 10000000007,
            CD = false,
            CDTime = 0,
            Hide = true
        },
    },
    CryptoTransactions = {},
    Images = {},
}

-- Functions

function string:split(delimiter)
    local result = { }
    local from  = 1
    local delim_from, delim_to = string.find( self, delimiter, from  )
    while delim_from do
      table.insert( result, string.sub( self, from , delim_from-1 ) )
      from  = delim_to + 1
      delim_from, delim_to = string.find( self, delimiter, from  )
    end
    table.insert( result, string.sub( self, from  ) )
    return result
end

local function escape_str(s)
	return s
end

local function GenerateTweetId()
    local tweetId = "TWEET-"..math.random(11111111, 99999999)
    return tweetId
end

local function IsNumberInContacts(num)
    local retval = num
    for _, v in pairs(PhoneData.Contacts) do
        if num == v.number then
            retval = v.name
        end
    end
    if retval == num then 
        for _, v in pairs(PhoneData.SuggestedContacts) do
            if num == v.number then
                retval = v.name
            end
        end
    end
    return retval
end

local function CalculateTimeToDisplay()
	hour = GetClockHours()
    minute = GetClockMinutes()

    local obj = {}

	if minute <= 9 then
		minute = "0" .. minute
    end

    obj.hour = hour
    obj.minute = minute

    return obj
end

local function GetClosestPlayer()
    local closestPlayers = ESX.Game.GetClosestPlayer()
    local closestDistance = -1
    local closestPlayer = -1
    local coords = GetEntityCoords(PlayerPedId())
    for i=1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
	end
	return closestPlayer, closestDistance
end

local function GetKeyByDate(Number, Date)
    local retval = nil
    if PhoneData.Chats[Number] ~= nil then
        if PhoneData.Chats[Number].messages ~= nil then
            for key, chat in pairs(PhoneData.Chats[Number].messages) do
                if chat.date == Date then
                    retval = key
                    break
                end
            end
        end
    end
    return retval
end

local function GetKeyByNumber(Number)
    local retval = nil
    if PhoneData.Chats then
        for k, v in pairs(PhoneData.Chats) do
            if v.number == Number then
                retval = k
            end
        end
    end
    return retval
end

local function ReorganizeChats(key)
    local ReorganizedChats = {}
    ReorganizedChats[1] = PhoneData.Chats[key]
    for k, chat in pairs(PhoneData.Chats) do
        if k ~= key then
            ReorganizedChats[#ReorganizedChats+1] = chat
        end
    end
    PhoneData.Chats = ReorganizedChats
end

local function findVehFromPlateAndLocate(plate)
    local gameVehicles = ESX.Game.GetVehicles()
    for i = 1, #gameVehicles do
        local vehicle = gameVehicles[i]
        if DoesEntityExist(vehicle) then
            if ESX.GetPlate(vehicle) == plate then
                local vehCoords = GetEntityCoords(vehicle)
                SetNewWaypoint(vehCoords.x, vehCoords.y)
                return true
            end
        end
    end
end

AddEventHandler('sunset_phone:CopyNumber',function()
    ESX.Alert('OK','Copy shod!',5000,'success')
    exports['esx_carjob']:SetClipboard(PhoneData.PlayerData.phoneNumber)
end)

local function DisableDisplayControlActions()
    DisableControlAction(0, 1, true) -- disable mouse look
    DisableControlAction(0, 2, true) -- disable mouse look
    DisableControlAction(0, 3, true) -- disable mouse look
    DisableControlAction(0, 4, true) -- disable mouse look
    DisableControlAction(0, 5, true) -- disable mouse look
    DisableControlAction(0, 6, true) -- disable mouse look
    DisableControlAction(0, 263, true) -- disable melee
    DisableControlAction(0, 264, true) -- disable melee
    DisableControlAction(0, 257, true) -- disable melee
    DisableControlAction(0, 140, true) -- disable melee
    DisableControlAction(0, 141, true) -- disable melee
    DisableControlAction(0, 142, true) -- disable melee
    DisableControlAction(0, 143, true) -- disable melee
    DisableControlAction(0, 177, true) -- disable escape
    DisableControlAction(0, 200, true) -- disable escape
    DisableControlAction(0, 202, true) -- disable escape
    DisableControlAction(0, 322, true) -- disable escape
    DisableControlAction(0, 245, true) -- disable chat
    if IsControlJustPressed(1, 22) then
        TriggerEvent('KeyDown:space')
    end
end

local function LoadPhone()
    Wait(100)
    print('Phone loaded')
    ESX.TriggerServerCallback('sunset_phone:server:GetPhoneData', function(pData)
        PlayerJob = ESX.GetPlayerData().job
        PhoneData.PlayerData = ESX.GetPlayerData()
       -- local PhoneMeta = {PhoneData.PlayerData.metadata["phone"]}
       local PhoneMeta = {}
        PhoneData.MetaData = PhoneMeta
        if PhoneMeta.profilepicture == nil then
            PhoneData.MetaData.profilepicture = "default"
        else
            PhoneData.MetaData.profilepicture = PhoneMeta.profilepicture
        end

        -- if pData.Applications ~= nil and next(pData.Applications) ~= nil then
        --     for k, v in pairs(pData.Applications) do
        --         Config.PhoneApplications[k].Alerts = v
        --     end
        -- end

        -- for k , v in pairs (Config.PhoneApplications) do
        --     v.Alerts = 10
        -- end
        -- if pData.MentionedTweets ~= nil and next(pData.MentionedTweets) ~= nil then
        --     PhoneData.MentionedTweets = pData.MentionedTweets
        -- end

        if pData.PlayerContacts ~= nil and next(pData.PlayerContacts) ~= nil then
            PhoneData.Contacts = pData.PlayerContacts
        end

        if pData.Chats ~= nil and next(pData.Chats) ~= nil then
            local Chats = {}
            for k, v in pairs(pData.Chats) do
                table.insert(Chats,{
                    name = IsNumberInContacts(v.number),
                    number = v.number,
                    messages = json.decode(v.messages)
                })
            end

            PhoneData.Chats = Chats
        end

        -- if pData.Invoices ~= nil and next(pData.Invoices) ~= nil then
        --     for _, invoice in pairs(pData.Invoices) do
        --         invoice.name = IsNumberInContacts(invoice.number)
        --     end
        --     PhoneData.Invoices = pData.Invoices
        -- end

        -- if pData.Hashtags ~= nil and next(pData.Hashtags) ~= nil then
        --     PhoneData.Hashtags = pData.Hashtags
        -- end

        -- if pData.Tweets ~= nil and next(pData.Tweets) ~= nil then
        --     PhoneData.Tweets = pData.Tweets
        -- end

        -- if pData.Mails ~= nil and next(pData.Mails) ~= nil then
        --     PhoneData.Mails = pData.Mails
        -- end

        if pData.Adverts ~= nil and next(pData.Adverts) ~= nil then
            PhoneData.Adverts = pData.Adverts
        end

        -- if pData.CryptoTransactions ~= nil and next(pData.CryptoTransactions) ~= nil then
        --     PhoneData.CryptoTransactions = pData.CryptoTransactions
        -- end
        if pData.Images ~= nil and next(pData.Images) ~= nil then
            PhoneData.Images = pData.Images
        end
        if GetResourceKvpString('phonebackground') then
            PhoneData.MetaData.background = GetResourceKvpString('phonebackground')
        end
        SendNUIMessage({
            action = "LoadPhoneData",
            PhoneData = PhoneData,
            PlayerData = PhoneData.PlayerData,
            PlayerJob = PhoneData.PlayerData.job,
            applications = Config.PhoneApplications
        })
    end)
end

function InPutLock()
    Citizen.CreateThread(function()
        exports['essentialmode']:disableallControl(true)
        ESX.SetPlayerData('InPhone',true)
        while PhoneData.isOpen do
            Citizen.Wait(5)
            DisableAllControlActions(0)
            EnableControlAction(0, 249, true) -- N  
            EnableControlAction(0, 32, true) -- W
            EnableControlAction(0, 34, true) -- A
            EnableControlAction(0, 31, true) -- S
            EnableControlAction(0, 30, true) -- D
            EnableControlAction(0, 59, true) -- Enable steering in vehicle
            EnableControlAction(0, 71, true) -- Enable driving forward in vehicle
            EnableControlAction(0, 72, true) -- Enable reversing in vehicle
            EnableControlAction(0, 21, true) -- LSHIFT
            EnableControlAction(0, 22, true) -- SPACE
            EnableControlAction(0, 23, true) -- F
            EnableControlAction(0, 75, true) -- Exit Vehicle
        end
        exports['essentialmode']:disableallControl(false)
        ESX.SetPlayerData('InPhone',false)
    end)
end

local function OpenPhone(force)

    if PhoneData.isOpen then return end
    if ESX.DoesHaveItem2('phone',1,nil,nil,false) then
        if not IsPedArmed(PlayerPedId(), 7) or force then
            PhoneData.PlayerData = ESX.GetPlayerData()
            SetNuiFocus(true, true)
            SetNuiFocusKeepInput(true)
            SendNUIMessage({
                action = "open",
                Tweets = PhoneData.Tweets,
                AppData = Config.PhoneApplications,
                CallData = PhoneData.CallData,
                PlayerData = PhoneData.PlayerData,
            })
            PhoneData.isOpen = true
            InPutLock()
            CreateThread(function()
                while PhoneData.isOpen do
                    DisableDisplayControlActions()
                    Wait(1)
                end
            end)

            if not PhoneData.CallData.InCall then
                DoPhoneAnimation('cellphone_text_in')
            else
                DoPhoneAnimation('cellphone_call_to_text')
            end

            SetTimeout(250, function()
                newPhoneProp()
            end)

            ESX.TriggerServerCallback('sunset_phone:server:GetGarageVehicles', function(vehicles)
                for k , v in pairs(vehicles) do
                    local vehicleName
                    local hashVehicule = v.hash
					local aheadVehName = GetDisplayNameFromVehicleModel(hashVehicule)
					local vehicleName  = GetLabelText(aheadVehName)
					if string.lower(tostring(GetLabelText(aheadVehName))) == "null" then
						local newname = ESX.GetVehicleLabelFromName(aheadVehName)
						if newname ~= "Unknown" then
							vehicleName = newname
						end
					else
						vehicleName = GetLabelText(aheadVehName)
					end 
                    v.model = vehicleName
                    v.fullname = vehicleName
                end
                PhoneData.GarageVehicles = vehicles
            end)
        else
            ESX.ShowNotification("Dast shoma ~r~por ast~w~ ~o~nemitavanid~w~ goshi dar biyavarid!")
        end
    else
        ESX.ShowNotification("Shoma ~r~gushi~w~ nadarid!")
    end
end

local function GenerateCallId(caller, target)
    local CallId = math.ceil(((tonumber(caller) + tonumber(target)) / 100 * 1))
    return CallId
end


local function CancelCall()
    TriggerServerEvent('sunset_phone:server:CancelCall', PhoneData.CallData)
    if PhoneData.CallData.CallType == "ongoing" then
        exports['pma-voice']:removePlayerFromCall(PhoneData.CallData.CallId)
        if helper and helper ~= PhoneData.PlayerData.phoneNumber then
            rateMenu(helper)
        end
    end
    PhoneData.CallData.CallType = nil
    PhoneData.CallData.InCall = false
    PhoneData.CallData.AnsweredCall = false
    PhoneData.CallData.TargetData = {}
    PhoneData.CallData.CallId = nil

    if not PhoneData.isOpen then
        StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)
        deletePhone()
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    else
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    end

    TriggerServerEvent('sunset_phone:server:SetCallState', false)

    if not PhoneData.isOpen then
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Phone",
                text = "The call has been ended",
                icon = "fas fa-phone",
                color = "#e84118",
            },
        })
    else
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Phone",
                text = "The call has been ended",
                icon = "fas fa-phone",
                color = "#e84118",
            },
        })

        SendNUIMessage({
            action = "SetupHomeCall",
            CallData = PhoneData.CallData,
        })

        SendNUIMessage({
            action = "CancelOutgoingCall",
        })
    end
    helper = nil
end


local function CallContact(CallData, AA, helper)
    local RepeatCount = 0
    notSaveRecent = helper
    PhoneData.CallData.CallType = "outgoing"
    PhoneData.CallData.InCall = true
    PhoneData.CallData.TargetData = CallData
    PhoneData.CallData.AnsweredCall = false
    PhoneData.CallData.CallId = GenerateCallId(PhoneData.PlayerData.phoneNumber, CallData.number)

    TriggerServerEvent('sunset_phone:server:CallContact', PhoneData.CallData.TargetData, PhoneData.CallData.CallId, AA)
    TriggerServerEvent('sunset_phone:server:SetCallState', true)

    for i = 1, Config.CallRepeats + 1, 1 do
        if not PhoneData.CallData.AnsweredCall then
            if RepeatCount + 1 ~= Config.CallRepeats + 1 then
                if PhoneData.CallData.InCall then
                    RepeatCount = RepeatCount + 1
                    exports['xsound']:PlayUrl("phonecall", "./sounds/phonecall.ogg", 0.5)
                else
                    break
                end
                Wait(3000)
            else
                CancelCall()
                break
            end
        else
            break
        end
    end
end

local function AnswerCall()
    if (PhoneData.CallData.CallType == "incoming" or PhoneData.CallData.CallType == "outgoing") and PhoneData.CallData.InCall and not PhoneData.CallData.AnsweredCall then
        PhoneData.CallData.CallType = "ongoing"
        PhoneData.CallData.AnsweredCall = true
        PhoneData.CallData.CallTime = 0

        SendNUIMessage({ action = "AnswerCall", CallData = PhoneData.CallData})
        SendNUIMessage({ action = "SetupHomeCall", CallData = PhoneData.CallData})

        TriggerServerEvent('sunset_phone:server:SetCallState', true)

        if PhoneData.isOpen then
            DoPhoneAnimation('cellphone_text_to_call')
        else
            DoPhoneAnimation('cellphone_call_listen_base')
        end
        if PhoneData.CallData.TargetData.n2 == '' then PhoneData.CallData.TargetData.n2 = nil end
        CreateThread(function()
            while true do
                if PhoneData.CallData.AnsweredCall then
                    PhoneData.CallData.CallTime = PhoneData.CallData.CallTime + 1
                    SendNUIMessage({
                        action = "UpdateCallTime",
                        Time = PhoneData.CallData.CallTime,
                        Name = PhoneData.CallData.TargetData.n2 or PhoneData.CallData.TargetData.name,
                    })
                else
                    break
                end

                Wait(1000)
            end
        end)

        TriggerServerEvent('sunset_phone:server:AnswerCall', PhoneData.CallData)
        exports['pma-voice']:addPlayerToCall(PhoneData.CallData.CallId)
    else
        PhoneData.CallData.InCall = false
        PhoneData.CallData.CallType = nil
        PhoneData.CallData.AnsweredCall = false

        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Phone",
                text = "You don't have a incoming call...",
                icon = "fas fa-phone",
                color = "#e84118",
            },
        })
    end
end

local function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end


AddEventHandler("KeyDown:f1", function()
    if ESX.GetPlayerData()['IsDead'] ~= 1 and ESX.GetPlayerData()['HandCuffed'] ~= 1 then  
        ESX.closeAll()  
        OpenPhone()
	end
end)

-- NUI Callbacks

RegisterNUICallback('CancelOutgoingCall', function()
    helper = nil
    CancelCall()
    exports['xsound']:Destroy("zangkhor")
end)

RegisterNUICallback('DenyIncomingCall', function()
    helper = nil
    CancelCall()
    exports['xsound']:Destroy("zangkhor")
end)

RegisterNUICallback('CancelOngoingCall', function()
    CancelCall()
    exports['xsound']:Destroy("zangkhor")
end)

RegisterNUICallback('AnswerCall', function()
    AnswerCall()
    exports['xsound']:Destroy("zangkhor")
end)

RegisterNUICallback('ClearRecentAlerts', function(data, cb)
    TriggerServerEvent('sunset_phone:server:SetPhoneAlerts', "phone", 0)
    Config.PhoneApplications["phone"].Alerts = 0
    SendNUIMessage({ action = "RefreshAppAlerts", AppData = Config.PhoneApplications })
end)

RegisterNUICallback('SetBackground', function(data)
    local background = data.background
    SetResourceKvp('phonebackground',background)
end)

RegisterNUICallback('SetFlyMode', function(data)
    FlyMode = data.toggle
end)

RegisterNUICallback('GetMissedCalls', function(data, cb)
    cb(PhoneData.RecentCalls)
end)

RegisterNUICallback('GetSuggestedContacts', function(data, cb)
    cb(PhoneData.SuggestedContacts)
end)

RegisterNUICallback('HasPhone', function(data, cb)
    -- ESX.TriggerServerCallback('sunset_phone:server:HasPhone', function(HasPhone)
    --     cb(HasPhone)
    -- end)
    cb(ESX.DoesHaveItem2('phone',1,nil,nil,true))
end)

function HasPhone()
    return
end

RegisterNUICallback('SetupGarageVehicles', function(data, cb)
    cb(PhoneData.GarageVehicles)
end)

RegisterNUICallback('Close', function()
    if not PhoneData.CallData.InCall then
        DoPhoneAnimation('cellphone_text_out')
        SetTimeout(400, function()
            StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)
            deletePhone()
            PhoneData.AnimationData.lib = nil
            PhoneData.AnimationData.anim = nil
        end)
    else
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
        DoPhoneAnimation('cellphone_text_to_call')
    end
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    SetTimeout(500, function()
        PhoneData.isOpen = false
    end)
end)

RegisterNUICallback('AddNewContact', function(data, cb)
    PhoneData.Contacts[#PhoneData.Contacts+1] = {
        name = data.ContactName,
        number = data.ContactNumber,
    }
    Wait(100)
    cb(PhoneData.Contacts)
    if PhoneData.Chats[data.ContactNumber] ~= nil and next(PhoneData.Chats[data.ContactNumber]) ~= nil then
        PhoneData.Chats[data.ContactNumber].name = data.ContactName
    end
    TriggerServerEvent('sunset_phone:server:AddNewContact', data.ContactName, data.ContactNumber)
end)

-- RegisterNUICallback('GetMails', function(data, cb)
--     cb(PhoneData.Mails)
-- end)

RegisterNUICallback('GetWhatsappChat', function(data, cb)
    if PhoneData.Chats[data.phone] ~= nil then
        cb(PhoneData.Chats[data.phone])
    else
        cb(false)
    end
end)

RegisterNUICallback('GetProfilePicture', function(data, cb)
    local number = data.number
    local p = promise.new()
    table.insert(profileFetchList, {number = number, p = p})
    if #profileFetchList == 1 then
        SetTimeout(7000, function()
            for k, v in pairs(profileFetchList) do
                ESX.TriggerServerCallback('sunset_phone:server:GetPicture', function(picture)
                    v.p:resolve(picture)
                end, v.number)
                Wait(10)
            end
            profileFetchList = {}
        end)
    end
    cb(Citizen.Await(p))
end)

RegisterNUICallback('GetBankContacts', function(data, cb)
    cb(PhoneData.Contacts)
end)


RegisterNUICallback('SharedLocation', function(data)
    local x = data.coords.x
    local y = data.coords.y

    SetNewWaypoint(x, y)
    SendNUIMessage({
        action = "PhoneNotification",
        PhoneNotify = {
            title = "Whatsapp",
            text = "Location has been set!",
            icon = "fab fa-whatsapp",
            color = "#25D366",
            timeout = 1500,
        },
    })
end)

RegisterNUICallback('PostAdvert', function(data)
    TriggerServerEvent('sunset_phone:server:AddAdvert', data.message, data.url)
end)

RegisterNUICallback("DeleteAdvert", function()
    TriggerServerEvent("sunset_phone:server:DeleteAdvert")
end)

RegisterNUICallback('LoadAdverts', function()
    SendNUIMessage({
        action = "RefreshAdverts",
        Adverts = PhoneData.Adverts
    })
end)

RegisterNUICallback('ClearAlerts', function(data, cb)
    local chat = data.number
    local ChatKey = GetKeyByNumber(chat)

    if PhoneData.Chats[ChatKey].Unread ~= nil then
        local newAlerts = (Config.PhoneApplications['whatsapp'].Alerts - PhoneData.Chats[ChatKey].Unread)
        Config.PhoneApplications['whatsapp'].Alerts = newAlerts
        TriggerServerEvent('sunset_phone:server:SetPhoneAlerts', "whatsapp", newAlerts)

        PhoneData.Chats[ChatKey].Unread = 0

        SendNUIMessage({
            action = "RefreshWhatsappAlerts",
            Chats = PhoneData.Chats,
        })
        SendNUIMessage({ action = "RefreshAppAlerts", AppData = Config.PhoneApplications })
    end
end)

RegisterNUICallback('EditContact', function(data, cb)
    local NewName = data.CurrentContactName
    local NewNumber = data.CurrentContactNumber
    local OldName = data.OldContactName
    local OldNumber = data.OldContactNumber

    for k, v in pairs(PhoneData.Contacts) do
        if v.name == OldName and v.number == OldNumber then
            v.name = NewName
            v.number = NewNumber
        end
    end
    if PhoneData.Chats[NewNumber] ~= nil and next(PhoneData.Chats[NewNumber]) ~= nil then
        PhoneData.Chats[NewNumber].name = NewName
    end
    Wait(100)
    cb(PhoneData.Contacts)
    TriggerServerEvent('sunset_phone:server:EditContact', NewName, NewNumber, OldName, OldNumber)
end)

RegisterNUICallback('UpdateProfilePicture', function(data)
    local pf = data.profilepicture
    PhoneData.MetaData.profilepicture = pf
    -- TriggerServerEvent('sunset_phone:server:ChangeProfilePicture', pf)
end)

RegisterNUICallback('GetGalleryData', function(data, cb)
    local data = PhoneData.Images
    cb(data)
end)

RegisterNUICallback('DeleteImage', function(image,cb)
    TriggerServerEvent('sunset_phone:server:RemoveImageFromGallery',image)
    Wait(400)
    TriggerServerEvent('sunset_phone:server:getImageFromGallery')
    cb(true)
end)


RegisterNUICallback('track-vehicle', function(data, cb)
    local veh = data.veh
    if findVehFromPlateAndLocate(veh.plate) then
        QBCore.Functions.Notify("Your vehicle has been marked", "success")
    else
        QBCore.Functions.Notify("This vehicle cannot be located", "error")
    end
end)

RegisterNUICallback('DeleteContact', function(data, cb)
    local Name = data.CurrentContactName
    local Number = data.CurrentContactNumber
    local Account = data.CurrentContactIban

    for k, v in pairs(PhoneData.Contacts) do
        if v.name == Name and v.number == Number then
            table.remove(PhoneData.Contacts, k)
            --if PhoneData.isOpen then
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Phone",
                        text = "You deleted contact!",
                        icon = "fa fa-phone-alt",
                        color = "#04b543",
                        timeout = 1500,
                    },
                })
            break
        end
    end
    Wait(100)
    cb(PhoneData.Contacts)
    if PhoneData.Chats[Number] ~= nil and next(PhoneData.Chats[Number]) ~= nil then
        PhoneData.Chats[Number].name = Number
    end
    TriggerServerEvent('sunset_phone:server:RemoveContact', Name, Number)
end)

RegisterNUICallback('SetAlertWaypoint', function(data)
    local coords = data.alert.coords
    QBCore.Functions.Notify('GPS Location set: '..data.alert.title)
    SetNewWaypoint(coords.x, coords.y)
end)

RegisterNUICallback('SetGPSLocation', function(data, cb)
    local ped = PlayerPedId()

    SetNewWaypoint(data.coords.x, data.coords.y)
    ESX.Alert('GPS','GPS set shod!',5000, 'success')
end)

RegisterNUICallback('ClearGeneralAlerts', function(data)
    SetTimeout(400, function()
        Config.PhoneApplications[data.app].Alerts = 0
        SendNUIMessage({
            action = "RefreshAppAlerts",
            AppData = Config.PhoneApplications
        })
        TriggerServerEvent('sunset_phone:server:SetPhoneAlerts', data.app, 0)
        SendNUIMessage({ action = "RefreshAppAlerts", AppData = Config.PhoneApplications })
    end)
end)

RegisterNUICallback('CanTransferMoney', function(data, cb)
    local amount = tonumber(data.amountOf)
    local iban = data.sendTo
    local PlayerData = ESX.GetPlayerData()

    if (PlayerData.bank - amount) >= 0 then
        ESX.TriggerServerCallback('bank:transfer',function(data)
            Citizen.Wait(500)
            cb({TransferedMoney = data, NewBalance = (ESX.GetPlayerData().bank)})
        end,iban,amount)
    else
        cb({TransferedMoney = false})
    end
end)

RegisterNUICallback('GetWhatsappChats', function(data, cb)
    local chats = ESX.CopyTable(PhoneData.Chats)
    local chats2 = PhoneData.Chats
    for k, v in pairs(chats) do
        chats[k].messages = {}
    end
    ESX.TriggerServerCallback('sunset_phone:server:GetContactPictures', function(Chats)
        table.sort(chats2,function(a,b)
            return a.messages[#a.messages].messages[#a.messages[#a.messages].messages].ts > b.messages[#b.messages].messages[#b.messages[#b.messages].messages].ts
        end)
        for k, v in pairs(chats2) do
            for k2, v2 in pairs(Chats) do
                if v2.number == v.number then
                    v.picture = v2.picture
                end
            end
        end
        cb(chats2)
    end, chats)
end)

RegisterNUICallback('CallContact', function(data, cb)
    ESX.TriggerServerCallback('sunset_phone:server:GetCallState', function(CanCall, IsOnline, HavePhone)
        local status = {
            CanCall = CanCall,
            IsOnline = IsOnline,
            InCall = PhoneData.CallData.InCall,
            HavePhone = HavePhone
        }
        cb(status)
        if CanCall and not status.InCall and (data.ContactData.number ~= PhoneData.PlayerData.phoneNumber) and HavePhone then
            CallContact(data.ContactData, data.Anonymous)
        else
            exports['xsound']:PlayUrl("dastres", "./sounds/dastres.mp3", 0.5)
        end
    end, data.ContactData)
end)

function Call(data,AA, helper)
    ESX.TriggerServerCallback('sunset_phone:server:GetCallState', function(CanCall, IsOnline, HavePhone)
        local status = {
            CanCall = CanCall,
            IsOnline = IsOnline,
            InCall = PhoneData.CallData.InCall,
            HavePhone = HavePhone
        }
        if CanCall and not status.InCall and (data.number ~= data.phoneNumber) and HavePhone then
            CallContact(data, AA, helper)
        else
            exports['xsound']:PlayUrl("dastres", "./sounds/dastres.mp3", 0.5)
        end
        if not HavePhone then
            ESX.ShowNotification('Fard mored nazar mobile nadarad')
        end
    end, data)
    Citizen.Wait(1000)
    OpenPhone(true)
end

function SendLocationEMS()
    SendNUIMessage({
        action = "sendems"
    })
end
exports('SendLocationEMS',SendLocationEMS)
exports('Call',Call)

RegisterNetEvent('StartCall:AA',function(number)
    Call({number = number,name = number},true)
end)
local spam = false

RegisterNUICallback('SendMessage', function(data, cb)
    local ChatMessage = data.ChatMessage
    local ChatDate = data.ChatDate
    local ChatNumber = data.ChatNumber
    local ChatTime = data.ChatTime
    local ChatType = data.ChatType
    local ts = data.Time
    local Ped = PlayerPedId()
    local Pos = GetEntityCoords(Ped)
    local NumberKey = GetKeyByNumber(ChatNumber)
    local ChatKey = GetKeyByDate(NumberKey, ChatDate)
    local isJobs = false
    for k , v in pairs(PhoneData.SuggestedContacts) do
        if v.number == ChatNumber and ChatNumber ~= 10000000007 and not data.force  then
            isJobs = true
            if v.CD then return ESX.ShowNotification('~r~Shoma har '.. tonumber(v.CDTime) / 1000 .. ' sanie mitavanid be '.. v.name .. ' payam dahid~s~') end
            v.CD = true
            Citizen.SetTimeout(v.CDTime,function()
                v.CD = false
            end)
            break
        end
    end
    if isJobs then
        if ChatType == 'message' then
            ChatMessage = PhoneData.PlayerData.name:gsub('_',' ') .. ' | '.. PhoneData.PlayerData.phoneNumber ..' : ' .. ChatMessage
        end
    elseif ChatNumber ~= 10000000007 then
        if spam then 
            SendNUIMessage({
                action = "PhoneNotification",
                PhoneNotify = {
                    title = "Spam",
                    text = "Spam nakonid!",
                    icon = "fa fa-warning",
                    color = "#db3d13",
                    timeout = 3000,
                },
            })
            return
        end
        spam = true
        Citizen.SetTimeout(3000,function()
            spam = false
        end)
    end
    
    if PhoneData.Chats[NumberKey] ~= nil then
        if(PhoneData.Chats[NumberKey].messages == nil) then
            PhoneData.Chats[NumberKey].messages = {}
        end
        if PhoneData.Chats[NumberKey].messages[ChatKey] ~= nil then
            if ChatType == "message" then
                PhoneData.Chats[NumberKey].messages[ChatKey].messages[#PhoneData.Chats[NumberKey].messages[ChatKey].messages+1] = {
                    message = ChatMessage,
                    time = ChatTime,
                    sender = PhoneData.PlayerData.identifier,
                    type = ChatType,
                    data = {},
                    ts = ts,
                }
                if isJobs then
                    SendNUIMessage({
                        action = "sendlocation",
                        number = ChatNumber,
                    })
                end
            elseif ChatType == "location" then
                PhoneData.Chats[NumberKey].messages[ChatKey].messages[#PhoneData.Chats[NumberKey].messages[ChatKey].messages+1] = {
                    message = "Shared Location",
                    time = ChatTime,
                    sender = PhoneData.PlayerData.identifier,
                    type = ChatType,
                    ts = ts,
                    data = {
                        x = Pos.x,
                        y = Pos.y,
                    },
                }
            elseif ChatType == "picture" then
                PhoneData.Chats[NumberKey].messages[ChatKey].messages[#PhoneData.Chats[NumberKey].messages[ChatKey].messages+1] = {
                    message = "Photo",
                    time = ChatTime,
                    sender = PhoneData.PlayerData.identifier,
                    type = ChatType,
                    ts = ts,
                    data = {
                        url = data.url
                    },
                }
            end
            local count = #PhoneData.Chats[NumberKey].messages[ChatKey].messages
            if count > 20 then
                local ziad = count - 20
                while ziad ~= 0 do
                    ziad = ziad - 1
                    table.remove(PhoneData.Chats[NumberKey].messages[ChatKey].messages,1)
                    Wait(1)
                end
            end
            TriggerServerEvent('sunset_phone:server:UpdateMessages', PhoneData.Chats[NumberKey].messages, ChatNumber, false)
            NumberKey = GetKeyByNumber(ChatNumber)
            ReorganizeChats(NumberKey)
        else
            PhoneData.Chats[NumberKey].messages[#PhoneData.Chats[NumberKey].messages+1] = {
                date = ChatDate,
                messages = {},
            }
            ChatKey = GetKeyByDate(NumberKey, ChatDate)
            if ChatType == "message" then
                PhoneData.Chats[NumberKey].messages[ChatKey].messages[#PhoneData.Chats[NumberKey].messages[ChatKey].messages+1] = {
                    message = ChatMessage,
                    time = ChatTime,
                    sender = PhoneData.PlayerData.identifier,
                    type = ChatType,
                    ts = ts,
                    data = {},
                }
                if isJobs then
                    SendNUIMessage({
                        action = "sendlocation",
                        number = ChatNumber,
                    })
                end
            elseif ChatType == "location" then
                PhoneData.Chats[NumberKey].messages[ChatDate].messages[#PhoneData.Chats[NumberKey].messages[ChatDate].messages+1] = {
                    message = "Shared Location",
                    time = ChatTime,
                    sender = PhoneData.PlayerData.identifier,
                    type = ChatType,
                    ts = ts,
                    data = {
                        x = Pos.x,
                        y = Pos.y,
                    },
                }
            elseif ChatType == "picture" then
                PhoneData.Chats[NumberKey].messages[ChatKey].messages[#PhoneData.Chats[NumberKey].messages[ChatKey].messages+1] = {
                    message = "Photo",
                    time = ChatTime,
                    sender = PhoneData.PlayerData.identifier,
                    type = ChatType,
                    ts = ts,
                    data = {
                        url = data.url
                    },
                }
            end
            TriggerServerEvent('sunset_phone:server:UpdateMessages', PhoneData.Chats[NumberKey].messages, ChatNumber, true)
            NumberKey = GetKeyByNumber(ChatNumber)
            ReorganizeChats(NumberKey)
        end
    else
        PhoneData.Chats[#PhoneData.Chats+1] = {
            name = IsNumberInContacts(ChatNumber),
            number = ChatNumber,
            messages = {},
        }
        NumberKey = GetKeyByNumber(ChatNumber)
        PhoneData.Chats[NumberKey].messages[#PhoneData.Chats[NumberKey].messages+1] = {
            date = ChatDate,
            messages = {},
        }
        ChatKey = GetKeyByDate(NumberKey, ChatDate)
        if ChatType == "message" then
            PhoneData.Chats[NumberKey].messages[ChatKey].messages[#PhoneData.Chats[NumberKey].messages[ChatKey].messages+1] = {
                message = ChatMessage,
                time = ChatTime,
                sender = PhoneData.PlayerData.identifier,
                type = ChatType,
                ts = ts,
                data = {},
            }
            if isJobs then
                SendNUIMessage({
                    action = "sendlocation",
                    number = ChatNumber,
                })
            end
        elseif ChatType == "location" then
            PhoneData.Chats[NumberKey].messages[ChatKey].messages[#PhoneData.Chats[NumberKey].messages[ChatKey].messages+1] = {
                message = "Shared Location",
                time = ChatTime,
                sender = PhoneData.PlayerData.identifier,
                type = ChatType,
                ts = ts,
                data = {
                    x = Pos.x,
                    y = Pos.y,
                },
            }
        elseif ChatType == "picture" then
            PhoneData.Chats[NumberKey].messages[ChatKey].messages[#PhoneData.Chats[NumberKey].messages[ChatKey].messages+1] = {
                message = "Photo",
                time = ChatTime,
                sender = PhoneData.PlayerData.identifier,
                type = ChatType,
                ts = ts,
                data = {
                    url = data.url
                },
            }
        end
        TriggerServerEvent('sunset_phone:server:UpdateMessages', PhoneData.Chats[NumberKey].messages, ChatNumber, true)
        NumberKey = GetKeyByNumber(ChatNumber)
        ReorganizeChats(NumberKey)
    end
    ESX.TriggerServerCallback('sunset_phone:server:GetContactPicture', function(Chat)
        SendNUIMessage({
            action = "UpdateChat",
            chatData = Chat,
            chatNumber = ChatNumber,
        })
    end,  PhoneData.Chats[GetKeyByNumber(ChatNumber)])
end)

RegisterNUICallback("TakePhoto", function(data,cb)
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
    CreateMobilePhone(4)
    CellCamActivate(true, true)
    takePhoto = true
    while takePhoto do
        if IsControlJustPressed(1, 27) then -- Toogle Mode
            frontCam = not frontCam
            CellFrontCamActivate(frontCam)
        elseif IsControlJustPressed(1, 177) then -- CANCEL
            DestroyMobilePhone()
            CellCamActivate(false, false)
            cb(json.encode({ url = nil }))
            takePhoto = false
            frontCam = false
            CellFrontCamActivate(frontCam)
            break
        elseif IsControlJustPressed(1, 176) then -- TAKE.. PIC
            ESX.TriggerServerCallback("sunset_phone:server:GetWebhook",function(hook)
                if hook then
                    Citizen.SetTimeout(500,function()
                        frontCam = false
                        CellFrontCamActivate(frontCam)
                        DestroyMobilePhone()
                        CellCamActivate(false, false)
                    end)  
                    exports['screenshot-basic']:requestScreenshotUpload(tostring(hook), "files[]", function(data)
                        local image = json.decode(data)
                        TriggerServerEvent('sunset_phone:server:addImageToGallery', image.attachments[1].proxy_url)
                        Wait(400)
                        TriggerServerEvent('sunset_phone:server:getImageFromGallery')
                        cb(json.encode(image.attachments[1].proxy_url))
                    end)
                end
            end)
            takePhoto = false
        end
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(19)
        HideHudAndRadarThisFrame()
        EnableAllControlActions(0)
        Wait(0)
    end
    Wait(1000)
    OpenPhone()
end)

RegisterNetEvent('sunset_phone:client:AddRecentCall', function(data, time, type)
    if not notSaveRecent then
        PhoneData.RecentCalls[#PhoneData.RecentCalls+1] = {
            name = IsNumberInContacts(data.number),
            time = time,
            type = type,
            number = data.number,
            anonymous = data.anonymous
        }
        TriggerServerEvent('sunset_phone:server:SetPhoneAlerts', "phone")
        Config.PhoneApplications["phone"].Alerts = Config.PhoneApplications["phone"].Alerts + 1
        SendNUIMessage({
            action = "RefreshAppAlerts",
            AppData = Config.PhoneApplications
        })
    end
end)

RegisterNetEvent("qb-phone-new:client:BankNotify", function(text)
    SendNUIMessage({
        action = "PhoneNotification",
        NotifyData = {
            title = "Bank",
            content = text,
            icon = "fas fa-university",
            timeout = 3500,
            color = "#ff002f",
        },
    })
end)

RegisterNetEvent('sunset_phone:client:UpdateMails', function(NewMails)
    SendNUIMessage({
        action = "UpdateMails",
        Mails = NewMails
    })
    PhoneData.Mails = NewMails
end)

RegisterNetEvent('sunset_phone:client:UpdateAdvertsDel', function(Adverts)
    PhoneData.Adverts = Adverts
    SendNUIMessage({
        action = "RefreshAdverts",
        Adverts = PhoneData.Adverts
    })
end)

RegisterNetEvent('sunset_phone:client:UpdateAdverts', function(Adverts, LastAd)
    PhoneData.Adverts = Adverts
    SendNUIMessage({
        action = "PhoneNotification",
        PhoneNotify = {
            title = "Advertisement",
            text = "A new ad has been posted by "..LastAd,
            icon = "fas fa-ad",
            color = "#ff8f1a",
            timeout = 2500,
        },
    })
    SendNUIMessage({
        action = "RefreshAdverts",
        Adverts = PhoneData.Adverts
    })
end)

RegisterNetEvent('sunset_phone:client:CancelCall', function()
    exports['xsound']:Destroy("zangkhor")
    if PhoneData.CallData.CallType == "ongoing" then
        SendNUIMessage({
            action = "CancelOngoingCall"
        })
        exports['pma-voice']:removePlayerFromCall(PhoneData.CallData.CallId)
        if helper and helper ~= PhoneData.PlayerData.phoneNumber then
            rateMenu(helper)
        end
    end
    PhoneData.CallData.CallType = nil
    PhoneData.CallData.InCall = false
    PhoneData.CallData.AnsweredCall = false
    PhoneData.CallData.TargetData = {}

    if not PhoneData.isOpen then
        StopAnimTask(PlayerPedId(), PhoneData.AnimationData.lib, PhoneData.AnimationData.anim, 2.5)
        deletePhone()
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    else
        PhoneData.AnimationData.lib = nil
        PhoneData.AnimationData.anim = nil
    end

    TriggerServerEvent('sunset_phone:server:SetCallState', false)

    if not PhoneData.isOpen then
        SendNUIMessage({
            action = "PhoneNotification",
            NotifyData = {
                title = "Phone",
                content = "The call has been ended",
                icon = "fas fa-phone",
                timeout = 3500,
                color = "#e84118",
            },
        })
    else
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Phone",
                text = "The call has been ended",
                icon = "fas fa-phone",
                color = "#e84118",
            },
        })

        SendNUIMessage({
            action = "SetupHomeCall",
            CallData = PhoneData.CallData,
        })

        SendNUIMessage({
            action = "CancelOutgoingCall",
        })
    end
    helper = nil
end)

RegisterNetEvent('sunset_phone:client:GetCalled', function(CallerNumber, CallId, AnonymousCall,name)
    if FlyMode and not AnonymousCall then return end
    local RepeatCount = 0
    local CallData = {
        number = CallerNumber,
        name = IsNumberInContacts(CallerNumber),
        anonymous = AnonymousCall,
        n2 = name,
    }


    PhoneData.CallData.CallType = "incoming"
    PhoneData.CallData.InCall = true
    PhoneData.CallData.AnsweredCall = false
    PhoneData.CallData.TargetData = CallData
    PhoneData.CallData.CallId = CallId
    TriggerServerEvent('sunset_phone:server:SetCallState', true)

    SendNUIMessage({
        action = "SetupHomeCall",
        CallData = PhoneData.CallData,
    })
    exports['xsound']:PlayUrl("zangkhor", "./sounds/zangkhor.mp3", 0.5)
    for i = 1, Config.CallRepeats + 1, 1 do
        if not PhoneData.CallData.AnsweredCall then
            if RepeatCount + 1 ~= Config.CallRepeats + 1 then
                if PhoneData.CallData.InCall then
                    if HasPhone() then
                        RepeatCount = RepeatCount + 1
                        --TriggerServerEvent("InteractSound_SV:PlayOnSource", "ringing", 0.2)

                        if not PhoneData.isOpen then
                            SendNUIMessage({
                                action = "IncomingCallAlert",
                                CallData = PhoneData.CallData.TargetData,
                                Canceled = false,
                                AnonymousCall = AnonymousCall,
                            })
                        end
                    end
                else
                    SendNUIMessage({
                        action = "IncomingCallAlert",
                        CallData = PhoneData.CallData.TargetData,
                        Canceled = true,
                        AnonymousCall = AnonymousCall,
                    })
                    TriggerServerEvent('sunset_phone:server:AddRecentCall', "missed", CallData)
                    break
                end
                Wait(Config.RepeatTimeout)
            else
                SendNUIMessage({
                    action = "IncomingCallAlert",
                    CallData = PhoneData.CallData.TargetData,
                    Canceled = true,
                    AnonymousCall = AnonymousCall,
                })
                TriggerServerEvent('sunset_phone:server:AddRecentCall', "missed", CallData)
                break
            end
        else
            TriggerServerEvent('sunset_phone:server:AddRecentCall', "missed", CallData)
            break
        end
    end
end)
local GPMsg = {
}
RegisterNetEvent('sunset_phone:client:UpdateMessages', function(ChatMessages, SenderNumber,date,job)
    if FlyMode then return end
    local NumberKey = GetKeyByNumber(SenderNumber)
    local New = true
    for k , v in pairs(PhoneData.Chats) do
        if v.number == SenderNumber then
            New = false
        end
    end
    exports['xsound']:PlayUrl("notification", "./sounds/notification.mp3", 0.1)
    if job then
        --if ChatMessages.sender == PhoneData.PlayerData.identifier then return end
        if not GPMsg[SenderNumber] then
            GPMsg[SenderNumber] = {
                {
                    date = '1',
                    messages = {}
                }
            }
        end
        table.insert(GPMsg[SenderNumber][1].messages,ChatMessages)
        GPMsg[SenderNumber][1].date = date
        ChatMessages = GPMsg[SenderNumber]
    end
    if New then
	    PhoneData.Chats[#PhoneData.Chats+1] = {
            name = IsNumberInContacts(SenderNumber),
            number = SenderNumber,
            messages = {},
        }

        NumberKey = GetKeyByNumber(SenderNumber)

        PhoneData.Chats[NumberKey] = {
            name = IsNumberInContacts(SenderNumber),
            number = SenderNumber,
            messages = ChatMessages
        }

        if PhoneData.Chats[NumberKey].Unread ~= nil then
            PhoneData.Chats[NumberKey].Unread = PhoneData.Chats[NumberKey].Unread + 1
        else
            PhoneData.Chats[NumberKey].Unread = 1
        end

        if PhoneData.isOpen then
            if SenderNumber ~= PhoneData.PlayerData.phoneNumber then
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "New message from "..IsNumberInContacts(SenderNumber).."!",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 1500,
                    },
                })
            else
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "Messaged yourself",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 4000,
                    },
                })
            end

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)

            Wait(100)
            local chats = ESX.CopyTable(PhoneData.Chats)
            local chats2 = PhoneData.Chats
            for k, v in pairs(chats) do
                chats[k].messages = {}
            end
            ESX.TriggerServerCallback('sunset_phone:server:GetContactPictures', function(Chats)
                for k, v in pairs(chats2) do
                    for k2, v2 in pairs(Chats) do
                        if v2.number == v.number then
                            v.picture = v2.picture
                        end
                    end
                end
                SendNUIMessage({
                    action = "UpdateChat",
                    chatData = Chats[GetKeyByNumber(SenderNumber)],
                    chatNumber = SenderNumber,
                    Chats = Chats,
                })
            end, chats)
        else
	    SendNUIMessage({
	        action = "PhoneNotification",
	        PhoneNotify = {
		    title = "Whatsapp",
		    text = "New message from "..IsNumberInContacts(SenderNumber).."!",
		    icon = "fab fa-whatsapp",
		    color = "#25D366",
		    timeout = 3500,
	        },
	    })
            Config.PhoneApplications['whatsapp'].Alerts = Config.PhoneApplications['whatsapp'].Alerts + 1
            TriggerServerEvent('sunset_phone:server:SetPhoneAlerts', "whatsapp")
        end
    else
        PhoneData.Chats[NumberKey].messages = ChatMessages

        if PhoneData.Chats[NumberKey].Unread ~= nil then
            PhoneData.Chats[NumberKey].Unread = PhoneData.Chats[NumberKey].Unread + 1
        else
            PhoneData.Chats[NumberKey].Unread = 1
        end

        if PhoneData.isOpen then
            if SenderNumber ~= PhoneData.PlayerData.phoneNumber then
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "New message from "..IsNumberInContacts(SenderNumber).."!",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 1500,
                    },
                })
            else
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "Messaged yourself",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 4000,
                    },
                })
            end

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)

            Wait(100)
            local chats = ESX.CopyTable(PhoneData.Chats)
            local chats2 = PhoneData.Chats
            for k, v in pairs(chats) do
                chats[k].messages = {}
            end
            ESX.TriggerServerCallback('sunset_phone:server:GetContactPictures', function(Chats)
                for k, v in pairs(chats2) do
                    for k2, v2 in pairs(Chats) do
                        if v2.number == v.number then
                            v.picture = v2.picture
                        end
                    end
                end
                SendNUIMessage({
                    action = "UpdateChat",
                    chatData = Chats[GetKeyByNumber(SenderNumber)],
                    chatNumber = SenderNumber,
                    Chats = Chats,
                })
            end, chats)
        else
            SendNUIMessage({
                action = "PhoneNotification",
                PhoneNotify = {
                    title = "Whatsapp",
                    text = "New message from "..IsNumberInContacts(SenderNumber).."!",
                    icon = "fab fa-whatsapp",
                    color = "#25D366",
                    timeout = 3500,
                },
            })

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)

            Config.PhoneApplications['whatsapp'].Alerts = Config.PhoneApplications['whatsapp'].Alerts + 1
            TriggerServerEvent('sunset_phone:server:SetPhoneAlerts', "whatsapp")
        end
    end
end)

local JobMessages = {}
RegisterNetEvent('sunset_phone:client:UpdateJobMessage', function(ChatMessages, SenderNumber)
    table.insert(JobMessages,ChatMessages)
    ChatMessages = JobMessages
    --print(ChatMessages,SenderNumber)
    local NumberKey = GetKeyByNumber(SenderNumber)
    local New = true
    for k , v in pairs(PhoneData.Chats) do
        if v.number == SenderNumber then
            New = false
        end
    end
    if New then
	    PhoneData.Chats[#PhoneData.Chats+1] = {
            name = IsNumberInContacts(SenderNumber),
            number = SenderNumber,
            messages = {},
        }

        NumberKey = GetKeyByNumber(SenderNumber)

        PhoneData.Chats[NumberKey] = {
            name = IsNumberInContacts(SenderNumber),
            number = SenderNumber,
            messages = ChatMessages
        }

        if PhoneData.Chats[NumberKey].Unread ~= nil then
            PhoneData.Chats[NumberKey].Unread = PhoneData.Chats[NumberKey].Unread + 1
        else
            PhoneData.Chats[NumberKey].Unread = 1
        end

        if PhoneData.isOpen then
            if SenderNumber ~= PhoneData.PlayerData.phoneNumber then
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "New message from "..IsNumberInContacts(SenderNumber).."!",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 1500,
                    },
                })
            else
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "Messaged yourself",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 4000,
                    },
                })
            end

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)

            Wait(100)
            local chats = ESX.CopyTable(PhoneData.Chats)
            local chats2 = PhoneData.Chats
            for k, v in pairs(chats) do
                chats[k].messages = {}
            end
            ESX.TriggerServerCallback('sunset_phone:server:GetContactPictures', function(Chats)
                for k, v in pairs(chats2) do
                    for k2, v2 in pairs(Chats) do
                        if v2.number == v.number then
                            v.picture = v2.picture
                        end
                    end
                end
                SendNUIMessage({
                    action = "UpdateChat",
                    chatData = Chats[GetKeyByNumber(SenderNumber)],
                    chatNumber = SenderNumber,
                    Chats = Chats,
                })
            end, chats)
        else
	    SendNUIMessage({
	        action = "PhoneNotification",
	        PhoneNotify = {
		    title = "Whatsapp",
		    text = "New message from "..IsNumberInContacts(SenderNumber).."!",
		    icon = "fab fa-whatsapp",
		    color = "#25D366",
		    timeout = 3500,
	        },
	    })
            Config.PhoneApplications['whatsapp'].Alerts = Config.PhoneApplications['whatsapp'].Alerts + 1
            TriggerServerEvent('sunset_phone:server:SetPhoneAlerts', "whatsapp")
        end
    else
        PhoneData.Chats[NumberKey].messages = ChatMessages

        if PhoneData.Chats[NumberKey].Unread ~= nil then
            PhoneData.Chats[NumberKey].Unread = PhoneData.Chats[NumberKey].Unread + 1
        else
            PhoneData.Chats[NumberKey].Unread = 1
        end

        if PhoneData.isOpen then
            if SenderNumber ~= PhoneData.PlayerData.phoneNumber then
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "New message from "..IsNumberInContacts(SenderNumber).."!",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 1500,
                    },
                })
            else
                SendNUIMessage({
                    action = "PhoneNotification",
                    PhoneNotify = {
                        title = "Whatsapp",
                        text = "Messaged yourself",
                        icon = "fab fa-whatsapp",
                        color = "#25D366",
                        timeout = 4000,
                    },
                })
            end

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)

            Wait(100)
            local chats = ESX.CopyTable(PhoneData.Chats)
            local chats2 = PhoneData.Chats
            for k, v in pairs(chats) do
                chats[k].messages = {}
            end
            ESX.TriggerServerCallback('sunset_phone:server:GetContactPictures', function(Chats)
                for k, v in pairs(chats2) do
                    for k2, v2 in pairs(Chats) do
                        if v2.number == v.number then
                            v.picture = v2.picture
                        end
                    end
                end
                SendNUIMessage({
                    action = "UpdateChat",
                    chatData = Chats[GetKeyByNumber(SenderNumber)],
                    chatNumber = SenderNumber,
                    Chats = Chats,
                })
            end, chats)
        else
            SendNUIMessage({
                action = "PhoneNotification",
                PhoneNotify = {
                    title = "Whatsapp",
                    text = "New message from "..IsNumberInContacts(SenderNumber).."!",
                    icon = "fab fa-whatsapp",
                    color = "#25D366",
                    timeout = 3500,
                },
            })

            NumberKey = GetKeyByNumber(SenderNumber)
            ReorganizeChats(NumberKey)

            Config.PhoneApplications['whatsapp'].Alerts = Config.PhoneApplications['whatsapp'].Alerts + 1
            TriggerServerEvent('sunset_phone:server:SetPhoneAlerts', "whatsapp")
        end
    end
end)

RegisterNetEvent('sunset_phone:client:RemoveBankMoney', function(amount)
    if amount > 0 then
        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Bank",
                text = "$"..amount.." has been removed from your balance!",
                icon = "fas fa-university",
                color = "#ff002f",
                timeout = 3500,
            },
        })
    end
end)

RegisterNetEvent('sunset_phone:RefreshPhone', function()
    LoadPhone()
    SetTimeout(250, function()
        SendNUIMessage({
            action = "RefreshAlerts",
            AppData = Config.PhoneApplications,
        })
    end)
end)

RegisterNetEvent('sunset_phone:client:AnswerCall', function()
    if (PhoneData.CallData.CallType == "incoming" or PhoneData.CallData.CallType == "outgoing") and PhoneData.CallData.InCall and not PhoneData.CallData.AnsweredCall then
        PhoneData.CallData.CallType = "ongoing"
        PhoneData.CallData.AnsweredCall = true
        PhoneData.CallData.CallTime = 0

        SendNUIMessage({ action = "AnswerCall", CallData = PhoneData.CallData})
        SendNUIMessage({ action = "SetupHomeCall", CallData = PhoneData.CallData})

        TriggerServerEvent('sunset_phone:server:SetCallState', true)

        if PhoneData.isOpen then
            DoPhoneAnimation('cellphone_text_to_call')
        else
            DoPhoneAnimation('cellphone_call_listen_base')
        end
        if PhoneData.CallData.TargetData.n2 == '' then PhoneData.CallData.TargetData.n2 = nil end
        CreateThread(function()
            while true do
                if PhoneData.CallData.AnsweredCall then
                    PhoneData.CallData.CallTime = PhoneData.CallData.CallTime + 1
                    SendNUIMessage({
                        action = "UpdateCallTime",
                        Time = PhoneData.CallData.CallTime,
                        Name = PhoneData.CallData.TargetData.n2 or PhoneData.CallData.TargetData.name,
                    })
                else
                    break
                end

                Wait(1000)
            end
        end)
        exports['pma-voice']:addPlayerToCall(PhoneData.CallData.CallId)
    else
        PhoneData.CallData.InCall = false
        PhoneData.CallData.CallType = nil
        PhoneData.CallData.AnsweredCall = false

        SendNUIMessage({
            action = "PhoneNotification",
            PhoneNotify = {
                title = "Phone",
                text = "You don't have a incoming call...",
                icon = "fas fa-phone",
                color = "#e84118",
            },
        })
    end
end)

RegisterNetEvent('sunset_phone:client:GiveContactDetails', function()
    local player, distance = GetClosestPlayer()
    if player ~= -1 and distance < 2.5 then
        local PlayerId = GetPlayerServerId(player)
        TriggerServerEvent('sunset_phone:server:GiveContactDetails', PlayerId)
    else
        QBCore.Functions.Notify("No one nearby!", "error")
    end
end)

RegisterNetEvent('sunset_phone:refreshImages', function(images)
    table.sort(images, function(a,b) return a.date > b.date end)
    PhoneData.Images = images
end)


-- Threads
local loaded = false
CreateThread(function()
    while ESX == nil do Citizen.Wait(0) end
    Citizen.Wait(5000)
    while not loaded do
        print('Try load')
        LoadPhone()
        Citizen.Wait(5000)
    end
end)

RegisterNUICallback('Loaded', function()
    loaded = true
end)

CreateThread(function()
    while true do
        if PhoneData.isOpen then
            SendNUIMessage({
                action = "UpdateTime",
                InGameTime = CalculateTimeToDisplay(),
            })
        end
        Citizen.Wait(1000)
    end
end)

local inChat = false
RegisterNUICallback('InChat', function(data, cb)
    if not inChat then
        inChat = true
        Citizen.CreateThread(function()
            while inChat and PhoneData.isOpen do
                Citizen.Wait(0)
                DisableAllControlActions(0)
            end
            inChat = false
        end)
    end
end)
RegisterNUICallback('OutChat', function(data, cb)
    inChat = false
end)

RegisterNetEvent('sunset_phone:callHelper',function(number,name)
    helper = number
    Call({number = number,name = name},false, true)
end)
local kireKharAsabNadaram = false
function rateMenu(number)
    if number then
        kireKharAsabNadaram = true
        local elements = {
            {label = '1', value = '1'},
            {label = '2', value = '2'},
            {label = '3', value = '3', selected = true},
            {label = '4', value = '4'},
            {label = '5', value = '5'},
        }
        ESX.UI.Menu.Open('question', GetCurrentResourceName(), 'rate',
        {
            title 	 = ' ',
            align    = 'center',
            question = 'لطفا میزان رضایت خود را از پاسخ دهنده مشخص کنید',
            elements = elements
        }, function(data, menu)
            kireKharAsabNadaram = false
            menu.close()
            ESX.TriggerServerEvent('helper:rate',number,tonumber(data.current.value))
            ESX.Alert('','Ba tashakor az sherkat shoma dar nazar sanji!',5000,'error')
        end, nil, nil, function()
            if kireKharAsabNadaram then
                ESX.TriggerServerEvent('helper:rate', number, 3, true)
            end
        end)
    end
end

exports('close', function()
    SendNUIMessage({
        action = 'close',
    })
end)