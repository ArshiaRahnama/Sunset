ESX          = nil
CheckVehicle = false

local PlayerHasProp = false
local drunkMuliplier = 0

local PlayerProps = {}

Emotes = {
	["soda"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Soda", AnimationOptions =
	{
		Prop = 'prop_ecola_can',
		PropBone = 28422,
		PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 130.0},
		EmoteLoop = false,
		Drunk     = false,
		EmoteMoving = true,
	}},
	["coffee"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Coffee", AnimationOptions =
	{
		Prop = 'p_amb_coffeecup_01',
		PropBone = 28422,
		PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
		EmoteLoop = false,
		Drunk     = false,
		EmoteMoving = true,
	}},
	["tea"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Tea", AnimationOptions =
	{
		Prop = 'prop_plastic_cup_02',
		PropBone = 28422,
		PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
		EmoteLoop = true,
		Drunk     = false,
		EmoteMoving = true,
	}},
	["donut"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Donut", AnimationOptions =
   {
       Prop = 'prop_amb_donut',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
	   EmoteMoving = false,
	   Drunk     = false,
       EmoteDuration = 4500
   }},
   ["whiskey"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Whiskey", AnimationOptions =
   {
       Prop = 'prop_drink_whisky',
       PropBone = 28422,
       PropPlacement = {0.01, -0.01, -0.06, 0.0, 0.0, 0.0},
	   EmoteLoop = false,
	   Drunk     = true,
       EmoteMoving = true,
   }},
   ["sandwich"] = {"mp_player_inteat@burger", "mp_player_int_eat_burger", "Sandwich", AnimationOptions =
   {
       Prop = 'prop_sandwich_01',
       PropBone = 18905,
       PropPlacement = {0.13, 0.05, 0.02, -50.0, 16.0, 60.0},
	   EmoteMoving = true,
	   Drunk     = false,
       EmoteDuration = 4500
   }},
   ["wine"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Wine", AnimationOptions =
   {
       Prop = 'prop_drink_redwine',
       PropBone = 18905,
       PropPlacement = {0.10, -0.03, 0.03, -100.0, 0.0, -10.0},
	   EmoteMoving = true,
	   Drunk     = true,
       EmoteLoop = false
   }},
   ["beer"] = {"amb@world_human_drinking@coffee@male@idle_a", "idle_c", "Beer", AnimationOptions =
   {
       Prop = 'prop_amb_beer_bottle',
       PropBone = 28422,
       PropPlacement = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
	   EmoteLoop = false,
	   Drunk     = true,
       EmoteMoving = true,
   }},
   ["smoke"] = {"Scenario", "WORLD_HUMAN_SMOKING", "Smoke"}
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_basicneeds:playAnim')
AddEventHandler('esx_basicneeds:playAnim', function(name)
	if IsPedInAnyVehicle(PlayerPedId()) then return end
	local name = name

	OnEmotePlay(Emotes[name])
	
	if name == "soda" or name == "coffee" or name == "tea" or name == "whiskey" or name == "wine" or name == "beer" then
		Citizen.Wait(15000)
		DestroyAllProps()
		ClearPedTasksImmediately(GetPlayerPed(-1))
	end
	if name == "donut" or name == "sandwich" then
		Citizen.Wait(4000)
		DestroyAllProps()
		ClearPedTasksImmediately(GetPlayerPed(-1))
	end
	if name == "smoke" then
		Citizen.Wait(60000)
		DestroyAllProps()
		ClearPedTasksImmediately(GetPlayerPed(-1))
	end
end)


RegisterNetEvent('esx_customItems:useArmor')
AddEventHandler('esx_customItems:useArmor', function()
	if not exports['sun-jobs']:notBlackListCoords() then return ESX.chatMessage('Shoma nemitavanid dar in location in item ra use konid!') end
	TriggerEvent("mythic_progbar:client:progress", {
		name = "armor_putin",
		duration = 5000,
		label = "Dar hale poshidan armor",
		useWhileDead = false,
		canCancel = true,
		controlDisables = {
			disableMovement = true,
			disableCarMovement = true,
			disableMouse = false,
			disableCombat = true,
		},
		animation = {
            animDict = "rcmfanatic3",
            anim = "kneel_idle_a",
        },
        prop = {
            model = "prop_bodyarmour_03",
        }
	}, function(status)
		if not status then
			ClearPedTasksImmediately(GetPlayerPed(-1))
			ESX.TriggerServerCallback('esx_customItems:removeArmor', function(doesHave)
				if doesHave then
					local job = ESX.GetPlayerData().job.name
					TriggerEvent('skinchanger:getSkin', function(skin)
						if skin.sex == 0 then
							if ESX.militaryJobs2[job] then
								TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 107,  ['bproof_2'] = 0})
							else
								TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 15,  ['bproof_2'] = 2})
							end
						elseif skin.sex == 1 then
							if ESX.militaryJobs2[job] then
								TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 62,  ['bproof_2'] = 1})
							else
								TriggerEvent('skinchanger:loadClothes', skin, {['bproof_1'] = 17,  ['bproof_2'] = 2})
							end
						end
					end)
					ESX.SetPedArmour(GetPlayerPed(-1), 50)
					ESX.ShowNotification("~h~Shoma ba movafaghiat ~g~Armor ~w~use kardid!")
				else
					ESX.ShowNotification("~h~Shoma armor nadarid!")
				end
			end)
		elseif status then
		  	ClearPedTasksImmediately(GetPlayerPed(-1))
		end
	end)

end)

RegisterNetEvent('esx_customItems:checkVehicleDistance')
AddEventHandler('esx_customItems:checkVehicleDistance', function(vehicle)

	CheckVehicle = true
	checkvehicle(vehicle)

end)

RegisterNetEvent('esx_customItems:checkVehicleStatus')
AddEventHandler('esx_customItems:checkVehicleStatus', function(status)

	CheckVehicle = status

end)

function addDrunk()
	drunkMuliplier = drunkMuliplier + 1
	if drunkMuliplier == 5 then
		overdose()
		drunkMuliplier = 0
	end
end

function overdose()

	local playerPed = GetPlayerPed(-1)

	RequestAnimSet("move_injured_generic") 
	while not HasAnimSetLoaded("move_injured_generic") do
	Citizen.Wait(0)
	end    

	ClearPedTasksImmediately(playerPed)
	SetTimecycleModifier("spectator5")
	SetPedMotionBlur(playerPed, true)
	SetPedMovementClipset(playerPed, "move_injured_generic", true)
	SetPedIsDrunk(playerPed, true)
	Citizen.Wait(30000)
	clearEffects()
	
end

function clearEffects()
	Citizen.CreateThread(function()

		local playerPed = GetPlayerPed(-1)

		ClearTimecycleModifier()
		ResetScenarioTypesEnabled()
		ResetPedMovementClipset(playerPed, 0)
		SetPedIsDrunk(playerPed, false)
		SetPedMotionBlur(playerPed, false)
	
	  end)
end

function checkvehicle(vehicle)
	Citizen.CreateThread(function()
		while CheckVehicle do
		  Citizen.Wait(2000)
		
		  local coords = GetEntityCoords(GetPlayerPed(-1))
		  local NearVehicle = GetClosestVehicle(coords.x,  coords.y,  coords.z,  4.0,  0,  71)
			if vehicle ~= NearVehicle then
				ESX.ShowNotification("Mashin mored nazar az shoma ~r~door ~s~shod!")
				TriggerEvent("mythic_progbar:client:cancel")
				CheckVehicle = false
			end

		end
	  end)

end

function OnEmotePlay(EmoteName)
	if not DoesEntityExist(GetPlayerPed(-1)) then
	  return false
	end
  
	  if IsPedArmed(GetPlayerPed(-1), 7) then
		SetCurrentPedWeapon(GetPlayerPed(-1), GetHashKey('WEAPON_UNARMED'), true)
	  end
  
	ChosenDict,ChosenAnimation,ename = table.unpack(EmoteName)
	AnimationDuration = -1
  
	if PlayerHasProp then
	  DestroyAllProps()
	end
  
	if ChosenDict == "Expression" then
	  SetFacialIdleAnimOverride(PlayerPedId(), ChosenAnimation, 0)
	  return
	end
  
	if ChosenDict == "MaleScenario" or "Scenario" then
	  CheckGender()
	  if ChosenDict == "MaleScenario" then
		if PlayerGender == "male" then
		  ClearPedTasks(GetPlayerPed(-1))
		  TaskStartScenarioInPlace(GetPlayerPed(-1), ChosenAnimation, 0, true)
		  IsInAnimation = true
		else
		  EmoteChatMessage("This emote is male only, sorry!")
		end return
	  elseif ChosenDict == "ScenarioObject" then
		BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
		ClearPedTasks(GetPlayerPed(-1))
		TaskStartScenarioAtPosition(GetPlayerPed(-1), ChosenAnimation, BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
		IsInAnimation = true
		return
	  elseif ChosenDict == "Scenario" then
		ClearPedTasks(GetPlayerPed(-1))
		TaskStartScenarioInPlace(GetPlayerPed(-1), ChosenAnimation, 0, true)
		IsInAnimation = true
	  return end 
	end

	  LoadAnim(ChosenDict)
	  if EmoteName.AnimationOptions.Drunk == true then
		addDrunk()
	  end
  
	  if EmoteName.AnimationOptions then
		if EmoteName.AnimationOptions.EmoteLoop then
		  MovementType = 1
		if EmoteName.AnimationOptions.EmoteMoving then
		  MovementType = 51
		end
	elseif EmoteName.AnimationOptions.EmoteMoving then
	  MovementType = 51
	end
	else
	  MovementType = 0
	end
  
	if EmoteName.AnimationOptions then
	  if EmoteName.AnimationOptions.EmoteDuration == nil then 
		EmoteName.AnimationOptions.EmoteDuration = -1
	  else
		AnimationDuration = EmoteName.AnimationOptions.EmoteDuration
	  end
  
	  if EmoteName.AnimationOptions.Prop then
		PropName = EmoteName.AnimationOptions.Prop
		PropBone = EmoteName.AnimationOptions.PropBone
		PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(EmoteName.AnimationOptions.PropPlacement)
		if EmoteName.AnimationOptions.SecondProp then
		  SecondPropName = EmoteName.AnimationOptions.SecondProp
		  SecondPropBone = EmoteName.AnimationOptions.SecondPropBone
		  SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6 = table.unpack(EmoteName.AnimationOptions.SecondPropPlacement)
		  SecondPropEmote = true
		else
		  SecondPropEmote = false
		end
  
		AddPropToPlayer(PropName, PropBone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6)
		if SecondPropEmote then
		  AddPropToPlayer(SecondPropName, SecondPropBone, SecondPropPl1, SecondPropPl2, SecondPropPl3, SecondPropPl4, SecondPropPl5, SecondPropPl6)
		end
	  end
	end
  
	TaskPlayAnim(GetPlayerPed(-1), ChosenDict, ChosenAnimation, 2.0, 2.0, AnimationDuration, MovementType, 0, false, false, false)
	IsInAnimation = true
	MostRecentDict = ChosenDict
	MostRecentAnimation = ChosenAnimation
	return true
  end

  CheckGender = function()
	local hashSkinMale = GetHashKey("mp_m_freemode_01")
	local hashSkinFemale = GetHashKey("mp_f_freemode_01")
  
	if GetEntityModel(PlayerPedId()) == hashSkinMale then
	  PlayerGender = "male"
	elseif GetEntityModel(PlayerPedId()) == hashSkinFemale then
	  PlayerGender = "female"
	end
  end
  
  LoadAnim = function(dict)
	while not HasAnimDictLoaded(dict) do
	  RequestAnimDict(dict)
	  Citizen.Wait(1)
	end
  end
  
  LoadPropDict = function(model)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do
	  Citizen.Wait(1)
	end
  end

  AddPropToPlayer = function(prop1, bone, off1, off2, off3, rot1, rot2, rot3)
	local Player = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(Player))
  
	if not HasModelLoaded(prop1) then
	  LoadPropDict(prop1)
	end
	ESX.Game.SpawnObject(prop1, {
		x = x,
		y = y,
		z = z + 0.02
	}, function(obj)
		prop = obj
		AttachEntityToEntity(prop, Player, GetPedBoneIndex(Player, bone), off1, off2, off3, rot1, rot2, rot3, true, true, false, true, 1, true)
		table.insert(PlayerProps, prop)
		PlayerHasProp = true
	end)
	
  end

  DestroyAllProps = function()
	for _,v in pairs(PlayerProps) do
	  DeleteEntity(v)
	end
	PlayerHasProp = false
  end

AddEventHandler('onKeyUP',function(key)
	if key == 'r' then
		if GetAmmoInPedWeapon(PlayerPedId(),GetSelectedPedWeapon(PlayerPedId())) <= 50 and GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_UNARMED') and GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_BAT') and GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('WEAPON_FLASHLIGHT') then
			TriggerServerEvent('useclip')
		end
	end
end)

RegisterNetEvent('usediastat')
AddEventHandler('usediastat',function()
	local lib, anim = 'anim@mp_player_intcelebrationmale@face_palm', 'face_palm' -- TODO better animations
	local playerPed = PlayerPedId()
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, 10000, 32, 0, false, false, false)

		Citizen.Wait(500)
		while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end

		Citizen.CreateThread(function()
			local timer = true
			SetTimeout(1000*60, function()
				timer = false
			end)
			SetPedMoveRateOverride(PlayerId(), 10.0)
			SetRunSprintMultiplierForPlayer(PlayerId(), 10.49)
			while timer do
				Citizen.Wait(0)
				RestorePlayerStamina(PlayerId(), 1.0)
			end
			SetPedMoveRateOverride(PlayerId(), 0.0)
			SetRunSprintMultiplierForPlayer(PlayerId(), 10.0)
		end)
	end)
end)


RegisterNetEvent('usedesomorphine')
AddEventHandler('usedesomorphine',function()
	local lib, anim = 'anim@mp_player_intcelebrationmale@face_palm', 'face_palm' -- TODO better animations
	local playerPed = PlayerPedId()
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, 10000, 32, 0, false, false, false)

		Citizen.Wait(500)
		while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end

		ESX.SetPedArmour(PlayerPedId(),50)
			
	end)
end)

RegisterNetEvent('titopgold')
AddEventHandler('titopgold',function()
	TriggerServerEvent('InteractSound_SV:PlayWithinDistance',8,"titopgold",0.9)
	ExecuteCommand('me khar keif mishavad be dalil khordan titop talaee')
	exports.dpemotes:PlayEmote("clown")
end)

RegisterNetEvent('usewellbutrin')
AddEventHandler('usewellbutrin',function()
	local lib, anim = 'anim@mp_player_intcelebrationmale@face_palm', 'face_palm' -- TODO better animations
	local playerPed = PlayerPedId()
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, 10000, 32, 0, false, false, false)

		Citizen.Wait(500)
		while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
			Citizen.Wait(0)
			DisableAllControlActions(0)
		end

		while GetEntityHealth(PlayerPedId()) < 200 do
			Citizen.Wait(1000)
			ESX.SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId()) + 1)
		end
			
	end)
end)


--------


local fov_max = 70.0
local fov_min = 5.0 -- max zoom level (smaller fov is more zoom)
local zoomspeed = 10.0 -- camera zoom speed
local speed_lr = 8.0 -- speed by which the camera pans left-right
local speed_ud = 8.0 -- speed by which the camera pans up-down

local binoculars = false
local fov = (fov_max+fov_min)*0.5

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

local keybindEnabled = true -- When enabled, binocular are available by keybind
local binocularKey = Keys["G"]
local storeBinoclarKey = Keys["BACKSPACE"]

--THREADS--


--EVENTS--

-- Activate binoculars
RegisterNetEvent('binoculars:Activate')
AddEventHandler('binoculars:Activate', function()
    if not ESX.GetPlayerData().HandCuffed and not ESX.GetPlayerData().IsInjure and not ESX.GetPlayerData().IsDead then
        binoculars = not binoculars
        Citizen.CreateThread(function()
            while binoculars do
                Citizen.Wait(10)
                local lPed = GetPlayerPed(-1)
                if binoculars and not ( IsPedSittingInAnyVehicle( lPed ) ) then
                    Citizen.CreateThread(function()
                        TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_BINOCULARS", 0, 1)
                        PlayAmbientSpeech1(GetPlayerPed(-1), "GENERIC_CURSE_MED", "SPEECH_PARAMS_FORCE")
                    end)
    
                    Wait(2000)
    
                    SetTimecycleModifier("default")
    
                    SetTimecycleModifierStrength(0.3)
    
                    local scaleform = RequestScaleformMovie("BINOCULARS")
    
                    while not HasScaleformMovieLoaded(scaleform) do
                        Citizen.Wait(10)
                    end
    
                    local lPed = GetPlayerPed(-1)
                    local vehicle = GetVehiclePedIsIn(lPed)
                    local cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
    
                    AttachCamToEntity(cam, lPed, 0.0,0.0,1.0, true)
                    SetCamRot(cam, 0.0,0.0,GetEntityHeading(lPed))
                    SetCamFov(cam, fov)
                    RenderScriptCams(true, false, 0, 1, 0)
                    PushScaleformMovieFunction(scaleform, "SET_CAM_LOGO")
                    PushScaleformMovieFunctionParameterInt(0) -- 0 for nothing, 1 for LSPD logo
                    PopScaleformMovieFunctionVoid()
    
                    while binoculars and not IsEntityDead(lPed) and (GetVehiclePedIsIn(lPed) == vehicle) and true and not ESX.GetPlayerData().HandCuffed and not ESX.GetPlayerData().IsInjure and not ESX.GetPlayerData().IsDead do
                        if IsControlJustPressed(0, storeBinoclarKey) or IsControlJustPressed(0, Keys['X']) then -- Toggle binoculars
                            PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", false)
                            ClearPedTasks(GetPlayerPed(-1))
                            binoculars = false
                        end
    
                        local zoomvalue = (1.0/(fov_max-fov_min))*(fov-fov_min)
                        CheckInputRotation(cam, zoomvalue)
    
                        HandleZoom(cam)
                        HideHUDThisFrame()
                        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
                        Citizen.Wait(1)
                    end
    
                    binoculars = false
                    ClearTimecycleModifier()
                    fov = (fov_max+fov_min)*0.5
                    RenderScriptCams(false, false, 0, 1, 0)
                    SetScaleformMovieAsNoLongerNeeded(scaleform)
                    DestroyCam(cam, false)
                    SetNightvision(false)
                    SetSeethrough(false)
                end
            end
        end)    
    end
end)

--FUNCTIONS--
function HideHUDThisFrame()
	HideHelpTextThisFrame()
	HideHudAndRadarThisFrame()
	HideHudComponentThisFrame(1) -- Wanted Stars
	HideHudComponentThisFrame(2) -- Weapon icon
	HideHudComponentThisFrame(3) -- Cash
	HideHudComponentThisFrame(4) -- MP CASH
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(8)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(13) -- Cash Change
	HideHudComponentThisFrame(11) -- Floating Help Text
	HideHudComponentThisFrame(12) -- more floating help text
	HideHudComponentThisFrame(15) -- Subtitle Text
	HideHudComponentThisFrame(18) -- Game Stream
	HideHudComponentThisFrame(19) -- weapon wheel
end

function CheckInputRotation(cam, zoomvalue)
	local rightAxisX = GetDisabledControlNormal(0, 220)
	local rightAxisY = GetDisabledControlNormal(0, 221)
	local rotation = GetCamRot(cam, 2)
	if rightAxisX ~= 0.0 or rightAxisY ~= 0.0 then
		new_z = rotation.z + rightAxisX*-1.0*(speed_ud)*(zoomvalue+0.1)
		new_x = math.max(math.min(20.0, rotation.x + rightAxisY*-1.0*(speed_lr)*(zoomvalue+0.1)), -89.5)
		SetCamRot(cam, new_x, 0.0, new_z, 2)
	end
end

function HandleZoom(cam)
	local lPed = GetPlayerPed(-1)
	if not ( IsPedSittingInAnyVehicle( lPed ) ) then

		if IsControlJustPressed(0,241) then -- Scrollup
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0,242) then
			fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov)*0.05)
	else
		if IsControlJustPressed(0,17) then -- Scrollup
			fov = math.max(fov - zoomspeed, fov_min)
		end
		if IsControlJustPressed(0,16) then
			fov = math.min(fov + zoomspeed, fov_max) -- ScrollDown
		end
		local current_fov = GetCamFov(cam)
		if math.abs(fov-current_fov) < 0.1 then -- the difference is too small, just set the value directly to avoid unneeded updates to FOV of order 10^-5
			fov = current_fov
		end
		SetCamFov(cam, current_fov + (fov - current_fov)*0.05) -- Smoothing of camera zoom
	end
end