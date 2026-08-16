ESX                  = nil
local FirstSpawn     = true
local LastSkin       = nil
local PlayerLoaded   = false
local cam            = nil
local isCameraActive = false
local zoomOffset     = 0.0
local camOffset      = 0.0
local heading = 90.0
local tempClothe = {
    [0] = '{"lipstick_4":0,"age_2":0,"neck_thickness":10,"beard_4":0,"nose_1":10,"blemishes_1":0,"hair_color_1":0,"tshirt_2":0,"bags_2":0,"bags_1":0,"cheeks_2":2,"lipstick_3":0,"hair_1":1,"lip_thickness":-1,"shoes_2":0,"helmet_1":-1,"nose_3":10,"moles_1":0,"makeup_1":0,"shoes_1":34,"eye_color":0,"glasses_1":-1,"chin_2":8,"makeup_4":0,"eyebrows_1":0,"bodyb_3":-1,"bodyb_4":0,"lipstick_2":0,"eyebrows_6":0,"arms":15,"chin_1":5,"lipstick_1":0,"pants_2":4,"face_2":21,"bproof_2":0,"bracelets_1":-1,"eyebrows_2":10,"jaw_1":4,"makeup_3":0,"blush_3":0,"arms_2":0,"chain_2":0,"eyebrows_3":0,"bracelets_2":0,"blush_2":0,"cheeks_3":2,"chest_2":0,"bodyb_1":0,"bodyb_2":0,"age_1":0,"cheeks_1":10,"blemishes_2":0,"pants_1":61,"blush_1":0,"decals_1":0,"jaw_2":10,"beard_3":0,"face_3":5,"torso_1":15,"sex":0,"eyebrows_5":0,"nose_2":10,"hair_color_2":0,"hair_2":0,"nose_5":10,"complexion_2":1,"decals_2":0,"tshirt_1":15,"mask_2":0,"ears_1":-1,"glasses_2":-1,"chin_4":4,"makeup_2":0,"chest_3":0,"watches_1":-1,"watches_2":-1,"beard_2":10,"nose_6":10,"torso_2":0,"ears_2":-1,"helmet_2":-1,"chest_1":0,"bproof_1":0,"moles_2":1,"mask_1":0,"sun_2":0,"complexion_1":0,"nose_4":10,"beard_1":0,"eyebrows_4":0,"face_1":0,"skin":12,"chin_3":4,"chain_1":0,"eye_squint":0,"sun_1":0}',
    [1] = '{"lipstick_4":0,"age_2":0,"neck_thickness":10,"beard_4":0,"nose_1":10,"blemishes_1":0,"hair_color_1":0,"tshirt_2":0,"bags_2":0,"bags_1":0,"cheeks_2":2,"lipstick_3":0,"hair_1":1,"lip_thickness":-1,"shoes_2":0,"helmet_1":-1,"nose_3":10,"moles_1":0,"makeup_1":0,"shoes_1":35,"eye_color":0,"glasses_1":-1,"chin_2":8,"makeup_4":0,"eyebrows_1":0,"bodyb_3":-1,"bodyb_4":0,"lipstick_2":0,"eyebrows_6":0,"arms":15,"chin_1":5,"lipstick_1":0,"pants_2":0,"face_2":21,"bproof_2":0,"bracelets_1":-1,"eyebrows_2":10,"jaw_1":4,"makeup_3":0,"blush_3":0,"arms_2":0,"chain_2":0,"eyebrows_3":0,"bracelets_2":0,"blush_2":0,"cheeks_3":2,"chest_2":0,"bodyb_1":0,"bodyb_2":0,"age_1":0,"cheeks_1":10,"blemishes_2":0,"pants_1":15,"blush_1":0,"decals_1":0,"jaw_2":10,"beard_3":0,"face_3":6,"torso_1":15,"sex":1,"eyebrows_5":0,"nose_2":10,"hair_color_2":0,"hair_2":0,"nose_5":10,"complexion_2":1,"decals_2":0,"tshirt_1":15,"mask_2":0,"ears_1":-1,"glasses_2":-1,"chin_4":4,"makeup_2":0,"chest_3":0,"watches_1":-1,"watches_2":-1,"beard_2":0,"nose_6":10,"torso_2":0,"ears_2":-1,"helmet_2":-1,"chest_1":0,"bproof_1":0,"moles_2":1,"mask_1":0,"sun_2":0,"complexion_1":0,"nose_4":10,"beard_1":0,"eyebrows_4":0,"face_1":0,"skin":12,"chin_3":4,"chain_1":0,"eye_squint":0,"sun_1":0}'
}
local blacklist2 = {
    -- MALE
      [0] = {
    
      -- Lebas Zir 1
        ["tshirt_1"] = { 
          [123] = true, -- mask oxygen
          [184] = true, -- pd clothe
          [185] = true, -- pd clothe
          [188] = true, -- pd clothe
          [189] = true, -- pd clothe
          [190] = true, -- pd clothe
          [191] = true, -- pd clothe
          [192] = true, -- pd clothe
          [193] = true, -- pd clothe
          [194] = true, -- pd clothe
          [195] = true, -- pd clothe
          [196] = true, -- pd clothe
          [197] = true, -- pd clothe
          [198] = true, -- pd clothe
          [199] = true, -- pd clothe
          [200] = true, -- pd clothe
          [201] = true, -- pd clothe
          [202] = true, -- pd clothe
          [203] = true, -- pd clothe
          [204] = true, -- pd clothe
          [205] = true, -- pd clothe
          [206] = true, -- pd clothe
          [207] = true, -- pd clothe
          [208] = true, -- pd clothe
          [209] = true, -- pd clothe
          [210] = true, -- pd clothe
          [211] = true, -- pd clothe
          [212] = true, -- pd clothe
          [213] = true, -- pd clothe
          [214] = true, -- pd clothe
          [215] = true, -- pd clothe
          [216] = true, -- pd clothe
          [217] = true, -- pd clothe
          [218] = true, -- pd clothe
          [219] = true, -- pd clothe
          [220] = true, -- pd clothe
          [221] = true, -- pd clothe
          [222] = true, -- pd clothe
          [223] = true, -- pd clothe
          [224] = true, -- pd clothe
          [225] = true, -- pd clothe
          [226] = true, -- pd clothe
        },
    
      -- Lebas Ro 1
        ["torso_1"] = {
            [421] = true, -- PD Clothes
            [422] = true, -- PD Clothes
            [423] = true, -- PD Clothes
            [424] = true, -- PD Clothes
            [425] = true, -- PD Clothes
            [426] = true, -- PD Clothes
            [427] = true, -- PD Clothes
            [428] = true, -- PD Clothes
            [429] = true, -- PD Clothes
            [430] = true, -- PD Clothes
            [431] = true, -- PD Clothes
            [432] = true, -- PD Clothes
            [433] = true, -- PD Clothes
            [434] = true, -- PD Clothes
            [435] = true, -- PD Clothes
            [436] = true, -- PD Clothes
            [437] = true, -- PD Clothes
            [438] = true, -- PD Clothes
            [439] = true, -- PD Clothes
            [440] = true, -- PD Clothes
            [441] = true, -- PD Clothes
            [442] = true, -- PD Clothes
            [443] = true, -- PD Clothes
            [444] = true, -- PD Clothes
            [445] = true, -- PD Clothes
            [446] = true, -- ADMINS
            [447] = true, -- ya hossein
            [449] = true, -- PD Clothes
            [450] = true, -- PD Clothes
            [451] = true, -- PD Clothes
            [452] = true, -- PD Clothes
            [453] = true, -- PD Clothes
            [454] = true, -- PD Clothes
            [455] = true, -- PD Clothes
            [456] = true, -- PD Clothes
            [457] = true, -- PD Clothes
            [458] = true, -- PD Clothes
            [459] = true, -- PD Clothes
            [460] = true, -- PD Clothes
        },
    
      -- Shalvar 1
        ["pants_1"] = {
            [1000] = true, -- adam fazayi
        },
    
      -- Kolah 1
        ["helmet_1"] = {
            [116] = true, -- PD
            [117] = true, -- PD
            [118] = true, -- PD
            [119] = true, -- PD
            [122] = true, -- MD
        },
    
      -- Gardan 1  
        ["chain_1"] = {
          [125] = true, -- IAA
          [126] = true, -- MD
          [127] = true, -- MD
          [128] = true, -- IAA
          [148] = true, -- PD
          [196] = true, -- PD
          [197] = true, -- PD
          [198] = true, -- PD
          [199] = true, -- PD
          [200] = true, -- PD
          [201] = true, -- PD
          [202] = true, -- PD
          [203] = true, -- PD
          [204] = true, -- PD
          [205] = true, -- PD
          [206] = true, -- PD
          [207] = true, -- PD
          [208] = true, -- PD
          [209] = true, -- PD
          [210] = true, -- PD
          [211] = true, -- PD
          [212] = true, -- PD
          [213] = true, -- PD
          [214] = true, -- PD
          [215] = true, -- PD
          [216] = true, -- PD
          [217] = true, -- PD
          [218] = true, -- PD
          [219] = true, -- PD
          [220] = true, -- PD
          [221] = true, -- PD
          [222] = true, -- PD
          [223] = true, -- PD
          [224] = true, -- PD
          [225] = true, -- PD
          [226] = true, -- PD
          [227] = true, -- PD
          [228] = true, -- PD
          [229] = true, -- PD
          [230] = true, -- PD
          [231] = true, -- PD
          [232] = true, -- PD
          [233] = true, -- PD
        },
    
      -- Kif 1
        ["bags_1"] = {
          [1000] = true, -- kiff police
        },
      
      -- Khalkoobi 1
      ["decals_1"] = {
        [70] = true, -- noose
        [72] = true, -- police
        [77] = true, -- police
        [120] = true, -- police
        [121] = true, -- police
        [122] = true, -- police
        [123] = true, -- police
        [124] = true, -- police
        [125] = true, -- police
        [126] = true, -- police
        [127] = true, -- police
        [128] = true, -- police
        [129] = true, -- police
        [130] = true, -- police
        [131] = true, -- police
        [132] = true, -- police
        [133] = true, -- police
        [134] = true, -- police
        [135] = true, -- police
        [136] = true, -- police
        [137] = true, -- police
        [138] = true, -- police
        [139] = true, -- police
        [140] = true, -- police
        [141] = true, -- police
        [142] = true, -- police
        [143] = true, -- police
        [144] = true, -- police
        [145] = true, -- police
        [146] = true, -- police
        [147] = true, -- police
        [148] = true, -- police
        [149] = true, -- police
        [150] = true, -- police
        [151] = true, -- police
        [152] = true, -- police
        [153] = true, -- police
        [154] = true, -- police
        [155] = true, -- police
        [156] = true, -- police
        [157] = true, -- police
        [158] = true, -- police
        [159] = true, -- police
        [160] = true, -- police
        [161] = true, -- police
        [162] = true, -- police
        [163] = true, -- police
        [164] = true, -- police
        [165] = true, -- police
        [166] = true, -- police
        [167] = true, -- police
        [168] = true, -- police
        [169] = true, -- police
        [170] = true, -- police
        [171] = true, -- police
        [172] = true, -- police
        [173] = true, -- police
        [174] = true, -- police
        [175] = true, -- police
        [176] = true, -- police
      },
    
      },
    
    -- Female
      [1] = { 
    
      -- Lebas Zir 1
        ["tshirt_1"] = { 
          [35] = true, -- tazer
          [105] = true, -- bomb
          [105] = true, -- tazer
          [153] = true, -- oxygen
          [159] = true, -- pd
          [160] = true, -- pd
          [189] = true, -- pd
          [190] = true, -- pd
          [222] = true, -- pd
        },
    
      -- Lebas Ro 1
        ["torso_1"] = {
            [1000] = true, -- PD Clothes
        },
    
      -- Shalvar 1
        ["pants_1"] = {
            [1000] = true, -- adam fazayi
        },
    
        ["helmet_1"] = {
          [115] = true, -- PD
          [116] = true, -- PD
          [117] = true, -- PD
          [118] = true, -- PD
          [121] = true, -- MD
        },
    
      -- Gardan 1  
        ["chain_1"] = {
          [1000] = true, -- iaa
        },
        
      -- Khalkoobi 1
      ["decals_1"] = {
        [65] = true, -- para medic
        [66] = true, -- para medic
        [79] = true, -- noose
        [81] = true, -- police
        [86] = true, -- police
        [128] = true, -- police
        [129] = true, -- police
        [130] = true, -- police
        [131] = true, -- police
        [132] = true, -- police
        [133] = true, -- police
        [134] = true, -- police
        [135] = true, -- police
        [136] = true, -- police
        [137] = true, -- police
        [138] = true, -- police
        [139] = true, -- police
        [140] = true, -- police
        [141] = true, -- police
        [142] = true, -- police
        [143] = true, -- police
        [144] = true, -- police
        [145] = true, -- police
        [146] = true, -- police
        [147] = true, -- police
        [148] = true, -- police
        [149] = true, -- police
        [150] = true, -- police
        [151] = true, -- police
        [152] = true, -- police
        [153] = true, -- police
        [154] = true, -- police
        [155] = true, -- police
        [156] = true, -- police
        [157] = true, -- police
        [158] = true, -- police
        [159] = true, -- police
        [160] = true, -- police
        [161] = true, -- police
        [162] = true, -- police
        [163] = true, -- police
        [164] = true, -- police
        [165] = true, -- police
        [166] = true, -- police
        [167] = true, -- police
        [168] = true, -- police
        [169] = true, -- police
        [170] = true, -- police
        [171] = true, -- police
        [172] = true, -- police
        [173] = true, -- police
        [174] = true, -- police
        [175] = true, -- police
      },
    
      }
}
    
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function OpenMenu(submitCb, cancelCb, restrict,shop)

    local playerPed = PlayerPedId()

    TriggerEvent('skinchanger:getSkin', function(skin)
        LastSkin = skin
    end)

    TriggerEvent('skinchanger:getData', function(components, maxVals)

            local elements    = {}
            local _components = {}

            -- Restrict menu
            if restrict == nil then
                for i=1, #components, 1 do
                    _components[i] = components[i]
                end
            else
                for i=1, #components, 1 do

                    local found = false

                    for j=1, #restrict, 1 do
                        if components[i].name == restrict[j] then
                            found = true
                        end
                    end

                    if found then
                        table.insert(_components, components[i])
                    end

                end
            end

            -- Insert elements
            for i=1, #_components, 1 do

                local value       = _components[i].value
                local componentId = _components[i].componentId

                if componentId == 0 then
                    value = GetPedPropIndex(playerPed,  _components[i].componentId)
                end

                local data = {
                    label     = _components[i].label,
                    name      = _components[i].name,
                    value     = value,
                    min       = _components[i].min,
                    textureof = _components[i].textureof,
                    zoomOffset= _components[i].zoomOffset,
                    camOffset = _components[i].camOffset,
                    type      = 'slider'
                }

                for k,v in pairs(maxVals) do
                    if k == _components[i].name then
                        data.max = v
                    end
                end

                table.insert(elements, data)

            end

            CreateSkinCam()
            zoomOffset = _components[1].zoomOffset
            camOffset = _components[1].camOffset

            ESX.UI.Menu.Open(
                'default', GetCurrentResourceName(), 'skin',
                {
                    title = _U('skin_menu'),
                    align = 'top-right',
                    elements = elements
                },
                function(data, menu)

                    TriggerEvent('skinchanger:getSkin', function(skin)
                        LastSkin = skin
                    end)

                    submitCb(data, menu)
                    DeleteSkinCam()
                end,
                function(data, menu)

                    menu.close()

                    DeleteSkinCam()

                    TriggerEvent('skinchanger:loadSkin', LastSkin)

                    if cancelCb ~= nil then
                        cancelCb(data, menu)
                    end

                end,
                function(data, menu)

                    TriggerEvent('skinchanger:getSkin', function(skin)

                            zoomOffset = data.current.zoomOffset
                            camOffset = data.current.camOffset

                            if skin[data.current.name] ~= data.current.value then
                                -- Change skin element
                                --if blacklist[skin.sex][data.current.name] and not blacklist[skin.sex][data.current.name][data.current.value] then
                                --if not blacklist[skin.sex][data.current.name][data.current.value] then
                                --TriggerEvent('skinchanger:change', data.current.name, data.current.value)
                                --end
                                -- else
                                if shop then
                                    if blacklist2[skin.sex] and blacklist2[skin.sex][data.current.name] then
                                        if not blacklist2[skin.sex][data.current.name][data.current.value] then
                                            TriggerEvent('skinchanger:change', data.current.name, data.current.value)
                                        end
                                    else
                                        TriggerEvent('skinchanger:change', data.current.name, data.current.value)
                                    end
                                else
                                    TriggerEvent('skinchanger:change', data.current.name, data.current.value)
                                end
                                --end

                                -- Update max values
                                TriggerEvent('skinchanger:getData', function(components, maxVals)

                                        for i=1, #elements, 1 do

                                            local newData = {}

                                            newData.max = maxVals[elements[i].name]

                                            if elements[i].textureof ~= nil and data.current.name == elements[i].textureof then
                                                newData.value = 0
                                            end

                                            menu.update({name = elements[i].name}, newData)

                                        end

                                        menu.refresh()

                                end)

                            end

                    end)

                end,
                function()
                    DeleteSkinCam()
                end
            )

    end)

end

function CreateSkinCam()
    if not DoesCamExist(cam) then
        cam = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)
    end
    SetCamActive(cam, true)
    RenderScriptCams(true, true, 500, true, true)
    isCameraActive = true
    SetCamRot(cam, 0.0, 0.0, 270.0, true)
    SetEntityHeading(playerPed, 90.0)
end

function DeleteSkinCam()
    isCameraActive = false
    SetCamActive(cam, false)
    RenderScriptCams(false, true, 500, true, true)
    cam = nil
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        if isCameraActive then
            DisableControlAction(2, 30, true)
            DisableControlAction(2, 31, true)
            DisableControlAction(2, 32, true)
            DisableControlAction(2, 33, true)
            DisableControlAction(2, 34, true)
            DisableControlAction(2, 35, true)

            DisableControlAction(0, 25,   true) -- Input Aim
            DisableControlAction(0, 24,   true) -- Input Attack

            local playerPed = PlayerPedId()
            local coords    = GetEntityCoords(playerPed)

            local angle = heading * math.pi / 180.0
            local theta = {
                x = math.cos(angle),
                y = math.sin(angle)
            }
            local pos = {
                x = coords.x + (zoomOffset * theta.x),
                y = coords.y + (zoomOffset * theta.y),
            }

            local angleToLook = heading - 140.0
            if angleToLook > 360 then
                angleToLook = angleToLook - 360
            elseif angleToLook < 0 then
                angleToLook = angleToLook + 360
            end
            angleToLook = angleToLook * math.pi / 180.0
            local thetaToLook = {
                x = math.cos(angleToLook),
                y = math.sin(angleToLook)
            }
            local posToLook = {
                x = coords.x + (zoomOffset * thetaToLook.x),
                y = coords.y + (zoomOffset * thetaToLook.y),
            }

            SetCamCoord(cam, pos.x, pos.y, coords.z + camOffset)
            PointCamAtCoord(cam, posToLook.x, posToLook.y, coords.z + camOffset)

            SetTextComponentFormat("STRING")
            AddTextComponentString(_U('use_rotate_view'))
            DisplayHelpTextFromStringLabel(0, 0, 0, -1)
        else
            Citizen.Wait(500)
        end
    end
end)

Citizen.CreateThread(function()
    local angle = 90
    while true do
        Citizen.Wait(5)
        if isCameraActive then
            if IsControlPressed(0, 108) then
                angle = angle - 1
            elseif IsControlPressed(0, 109) then
                angle = angle + 1
            end
            if angle > 360 then
                angle = angle - 360
            elseif angle < 0 then
                angle = angle + 360
            end
            heading = angle + 0.0
        else
            Citizen.Wait(500)
        end
    end
end)

function OpenSaveableMenu(submitCb, cancelCb, restrict,shop)
    TriggerEvent('skinchanger:getSkin', function(skin)
        LastSkin = skin
    end)
    OpenMenu(function(data, menu)
        menu.close()
        DeleteSkinCam()
        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerServerEvent('esx_skin:save', skin)
            if submitCb ~= nil then
                submitCb(data, menu)
            end
        end)
    end, cancelCb, restrict,shop)
end

AddEventHandler('playerSpawned', function()
    while not PlayerLoaded do
        Citizen.Wait(0)
    end
    if FirstSpawn then
        FirstSpawn = false
        Citizen.Wait(2000)
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            if skin == nil then
                TriggerEvent('skinchanger:loadSkin', {sex = 0})
            else
                --local clothe = json.decode(tempClothe[__.sex])
                --TriggerEvent('skinchanger:loadClothes',__,clothe)
                -- print(ESX.dump(__))
                local sex = skin.sex
                for k,v in pairs(json.decode(tempClothe[sex])) do
                    if
                        (k ~= 'sex'				and
                        k ~= 'face_1'			and
                        k ~= 'face_2'			and
                        k ~= 'face_3'           and
                        k ~= 'skin'				and
                        k ~= 'nose_1'			and
                        k ~= 'nose_2'			and
                        k ~= 'nose_3'			and
                        k ~= 'nose_4'			and
                        k ~= 'nose_5'			and
                        k ~= 'nose_6'			and
                        k ~= 'cheeks_1'			and
                        k ~= 'cheeks_2'			and
                        k ~= 'cheeks_3'			and
                        k ~= 'lip_thickness'	and
                        k ~= 'jaw_1'			and
                        k ~= 'jaw_2'			and
                        k ~= 'chin_1'			and
                        k ~= 'chin_2'			and
                        k ~= 'chin_3'			and
                        k ~= 'chin_4'			and
                        k ~= 'neck_thickness'	and
                        k ~= 'age_1'			and
                        k ~= 'age_2'			and
                        k ~= 'eye_color'		and
                        k ~= 'eye_squint'		and
                        k ~= 'beard_1'			and
                        k ~= 'beard_2'			and
                        k ~= 'beard_3'			and
                        k ~= 'beard_4'			and
                        k ~= 'hair_1'			and
                        k ~= 'hair_2'			and
                        k ~= 'hair_color_1'		and
                        k ~= 'hair_color_2'		and
                        k ~= 'eyebrows_1'		and
                        k ~= 'eyebrows_2'		and
                        k ~= 'eyebrows_3'		and
                        k ~= 'eyebrows_4'		and
                        k ~= 'eyebrows_5'		and
                        k ~= 'eyebrows_6'		and
                        k ~= 'makeup_1'			and
                        k ~= 'makeup_2'			and
                        k ~= 'makeup_3'			and
                        k ~= 'makeup_4'			and
                        k ~= 'lipstick_1'		and
                        k ~= 'lipstick_2'		and
                        k ~= 'lipstick_3'		and
                        k ~= 'lipstick_4'		and
                        k ~= 'blemishes_1'		and
                        k ~= 'blemishes_2'		and
                        k ~= 'blemishes_3'		and
                        k ~= 'blush_1'			and
                        k ~= 'blush_2'			and
                        k ~= 'blush_3'			and
                        k ~= 'complexion_1'		and
                        k ~= 'complexion_2'		and
                        k ~= 'sun_1'			and
                        k ~= 'sun_2'			and
                        k ~= 'moles_1'			and
                        k ~= 'moles_2'			and
                        k ~= 'chest_1'			and
                        k ~= 'chest_2'			and
                        k ~= 'chest_3'			and
                        k ~= 'bodyb_1'			and
                        k ~= 'bodyb_2'			and
                        k ~= 'bodyb_3'			and
                        k ~= 'bodyb_4'          )
                        -- k ~= 'arms'			    and
                        -- k ~= 'arms_2'			)
                    then
                        skin[k] = v
                    end
                end
                TriggerEvent('skinchanger:loadSkin', skin)
                Citizen.Wait(2000)
                TriggerEvent('skinchanger:loadSkin', skin)
                Citizen.Wait(5000)
                print('load 1')
                TriggerEvent('clothe:load')      
                -- TriggerServerEvent('sunset_clothe:giveStarter')   
            end
            exports['sunset_helper']:clotheCheck()
        end)
    end
end)

RegisterNetEvent('esx_skin:reloadMe')
AddEventHandler('esx_skin:reloadMe', function()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        if skin == nil then
            TriggerEvent('skinchanger:loadSkin', {sex = 0})
        else
            TriggerEvent('skinchanger:loadSkin', skin)
        end
    end)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerLoaded = true
end)

AddEventHandler('esx_skin:getLastSkin', function(cb)
    cb(LastSkin)
end)

AddEventHandler('esx_skin:setLastSkin', function(skin)
    LastSkin = skin
end)

RegisterNetEvent('esx_skin:openMenu')
AddEventHandler('esx_skin:openMenu', function(submitCb, cancelCb)
    OpenMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent('esx_skin:openSaveableMenu')
AddEventHandler('esx_skin:openSaveableMenu', function(submitCb, cancelCb)
    OpenSaveableMenu(submitCb, cancelCb, nil)
end)

RegisterNetEvent('esx_skin:openRestrictedMenu')
AddEventHandler('esx_skin:openRestrictedMenu', function(submitCb, cancelCb, restrict,shop)
    OpenSaveableMenu(submitCb, cancelCb, restrict,shop)
end)

RegisterNetEvent('esx_skin:requestSaveSkin')
AddEventHandler('esx_skin:requestSaveSkin', function()
    TriggerEvent('skinchanger:getSkin', function(skin)
        TriggerServerEvent('esx_skin:responseSaJ8cVtCRVveSkin', skin)
    end)
end)

