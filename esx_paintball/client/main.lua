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

ESX = nil
local PlayerData = {}
local lobbies = {}
local lasthp, lastArmour = 0, 0
local inStartCode = false
map = nil
roundcount = 0
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end

  if ESX.GetPlayerData() == nil then
    Citizen.Wait(500)
  end

  PlayerData = ESX.GetPlayerData()
end)

timer = 0
losehp = false
local kiri = false
local radius = 150.0
local markercoords = nil
function timerthread()
  Citizen.CreateThread(function()
    while timer > 0 and kiri do
      Wait(1000)
      timer = timer - 1
    end
    Citizen.CreateThread(function()
      while kiri do
        Wait(1)
        local coords = GetEntityCoords(PlayerPedId())
        local distance = GetDistanceBetweenCoords(coords,markercoords)
        if distance > radius then
          losehp = true
        else
          losehp = false
        end
        DrawMarker(28,markercoords, 0, 0, 0, 0, 0, 0, radius, radius, radius, 255, 0, 0, 50, 0, 0, 0, 0, 0, 0, 0)
      end
    end)
    Citizen.CreateThread(function()
      while kiri do
        Wait(math.random(800,1000))
        if losehp and not spectate then
          ESX.SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId()) - 1)
        end
      end
    end)
    while radius > 0 and kiri do
      Wait(100)
      radius = radius - 0.18
    end
  end)
end


Draw = function(text,r,g,b,x,y)
  	SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.50, 0.50)
  	SetTextColour( r,g,b, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
  	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('esx:setGang')
AddEventHandler('esx:setGang', function(gang)
    PlayerData.gang = gang
end)


local MyTeam  = nil
local MatchId = 0
local Teamate = {}
local spectate = false
local ShowText = false
local NotifiText = ""
local UIOpen    = false
local LocationIndex = 0
Config = {
  Join = {
    {
      coords = vec(-1577.43, 5161.16, 23.27),
      access = {
        ["all"] = true,
      }
    },
    {-- Army
      coords = vec(-2375.59, 3222.4, 33.63), 
      access = {
        ["mt"] = true,
      }
    },
    {
      coords = vec(-451.47,1108.32,331.53), 
      access = {
        ["Admins"] = {
          grade = 2,
          gradeType = 3,
        },
      }
    },
    {
      coords = vec(-86.98, -2508.04, 6.22), 
      access = {
        ["police"] = {
          grade = 4,
          grade2 = 11,
          gradeType = 4,
        },
      }
    },
    {
      coords = vec(-115.08, -2537.47, 6.26),
      access = {
        ["offpolice"] = true,
        ["offsheriff"] = true,
        ["offdetective"] = true,
      }
    },
  },

  Clothe = {
    {
      male = {
        ['tshirt_1'] = 127,
        ['tshirt_2'] = 0,
        ['torso_1'] = 324,
        ['torso_2'] = 4,
        ['decals_1'] = 0,
        ['decals_2'] = 0,
        ['arms'] = 100,
        ['arms_2'] = 8,
        ['pants_1'] = 125,
        ['pants_2'] = 4,
        ['shoes_1'] = 61,
        ['shoes_2'] = 0,
        ['helmet_1'] = -1,
        ['helmet_2'] = 0,
        ['chain_1'] = 1,
        ['chain_2'] = 0,
        ['ears_1'] = -1,
        ['ears_2'] = -1,
        ['mask_1'] = 125,
        ['mask_2'] = 21,
        ['bags_1'] = 0,
        ['bags_2'] = 0,
      },
      female = {
        ['tshirt_1'] = 157,
        ['tshirt_2'] = 0,
        ['torso_1'] = 336,
        ['torso_2'] = 4,
        ['decals_1'] = 0,
        ['decals_2'] = 0,
        ['arms'] = 121,
        ['arms_2'] = 8,
        ['pants_1'] = 131,
        ['pants_2'] = 4,
        ['shoes_1'] = 64,
        ['shoes_2'] = 0,
        ['helmet_1'] = -1,
        ['helmet_2'] = 0,
        ['chain_1'] = 1,
        ['chain_2'] = 0,
        ['ears_1'] = -1,
        ['ears_2'] = -1,
        ['mask_1'] = 125,
        ['mask_2'] = 21,
        ['bags_1'] = 0,
        ['bags_2'] = 0,
      },
    },
    {
    male = {
      ['tshirt_1'] = 127,
      ['tshirt_2'] = 2,
      ['torso_1'] = 324,
      ['torso_2'] = 7,
      ['decals_1'] = 0,
      ['decals_2'] = 0,
      ['arms'] = 100,
      ['arms_2'] = 1,
      ['pants_1'] = 125,
      ['pants_2'] = 7,
      ['shoes_1'] = 61,
      ['shoes_2'] = 4,
      ['helmet_1'] = -1,
      ['helmet_2'] = 0,
      ['chain_1'] = 1,
      ['chain_2'] = 0,
      ['ears_1'] = -1,
      ['ears_2'] = -1,
      ['mask_1'] = 125,
      ['mask_2'] = 5,
      ['bags_1'] = 0,
      ['bags_2'] = 0,
    },
      female = {
        ['tshirt_1'] = 157,
        ['tshirt_2'] = 2,
        ['torso_1'] = 336,
        ['torso_2'] = 7,
        ['decals_1'] = 0,
        ['decals_2'] = 0,
        ['arms'] = 121,
        ['arms_2'] = 1,
        ['pants_1'] = 131,
        ['pants_2'] = 7,
        ['shoes_1'] = 64,
        ['shoes_2'] = 4,
        ['helmet_1'] = -1,
        ['helmet_2'] = 0,
        ['chain_1'] = 1,
        ['chain_2'] = 0,
        ['ears_1'] = -1,
        ['ears_2'] = -1,
        ['mask_1'] = 125,
        ['mask_2'] = 5,
        ['bags_1'] = 0,
        ['bags_2'] = 0,
      }, 
    }
  }
}

local Maps = {
  airport = {
    vec(-1052.5, -2763.55, 21.38),
    vec(-1030.87, -2724.91, 20.19),
  vec(-1048.66, -2756.57, 21.38),
	50
  },
  bank = {
    vec(246.29,221.8,106.29),
    vec(235.15,173.08,105.16),
    vec(249.06,217.72,106.29),
    100
  },
  cargo = {
    vec(-1164.92, 4925.73, 223.9),
    vec(-1006.24, 4965.5, 195.4),
    vec(-1107.78,4922.92,217.24),
    150
  },
  jail = {
    vec(2029.71, 2850.61, 1321.62), 
    vec(2013.93, 2713.28, 1321.62),
	  vec(2014.57,2783.8,1352.62),
	100
  },
  jewellery = {
    vec(-619.62,-228.91,38.06),
    vec(-676.72,-282.08,36.02),
	  vec(-631.07,-249.75,39.9),
	70
  },
  bimeh = {
    vec(-1043.55,-282.28,37.87),
    vec(-1065.21,-243.24,39.73),
	  vec(-1068.55,-246.77,39.73),
	70
  },
  army = {
    vec(-1983.68,3292.82,32.92),
    vec(-1922.25,3351.74,32.9),
	  vec(-1960.52,3325.8,32.96),
	60
  },
  banksheriff = {
    vec(-104.32,6470.8,31.63),
    vec(-167.53,6428.68,31.91),
	  vec(-133.64,6441.93,31.53),
	70
  },
  banksahel = {
    vec(-2961.48,477.6,15.7),
    vec(-2962.46,493.43,15.31),
	  vec(-2985.63,492.14,15.29),
	65
  },
  mazebank = {
    vec(-1306.38,-815.76,17.15),
    vec(-1353.63,-832.97,17.29),
	  vec(-1308.16,-827.3,17.15),
	55
  },
  Shop1 = {
    vec(25.0,-1343.34,29.5),
    vec(15.41,-1343.87,29.29),
	  vec(29.22,-1351.32,29.34),
	20
  },
  Shop2 = {
    vec(-60.77,-1734.66,29.3),
    vec(-46.99,-1753.67,29.42),
	  vec(-66.25,-1762.98,29.24),
	35
  },
  Shop3 = {
    vec(-1482.85,-376.32,40.16),
    vec(-1497.55,-376.75,40.78),
	  vec(-1495.42,-388.17,39.86),
	30
  },
  dust1 = {
    vec(2908.38,1299.11,7.08),
    vec(2994.03,1377.18,4.91),
	  vec(2943.84,1355.08,59.69),
	100
  },
  dust2 = {
    vec(2911.96,1269.02,3.59),
    vec(2862.9,1203.69,9.99),
	  vec(2886.87,1243.4,76.8),
	100
  },
  jewellery2 = {
    vec(2762.23,3427.37,56.1),
    vec(2737.41,3469.94,55.71),
	vec(2745.71,3473.85,55.71),
	70
  },
  jewellery3 = {
    vec(773.14,-2066.44,29.37),
    vec(830.5,-2028.14,28.92),
	vec(836.22,-2028.78,29.83),
	90
  },
  jungle = {
    vec(-2448.86,5734.54,1679.9),
    vec(-2289.06,5887.98,1679.9),
	vec(-2366.28,5813.82,1720.45),
	200
  },
  desert = {
    vec(3079.11,7233.88,1689.9),
    vec(3358.92,7038.0,1689.9),
	vec(3205.96,7138.74,1744.45),
	200
  },
  mythic = {
    vec(2370.79,4942.95,42.49),
    vec(2436.13,4959.38,46.35),
	vec(2449.39,4979.5,57.93),
	100
  },
  rocky = { 
    vec(1409.91,2722.24,1321.66),
    vec(1411.16,2842.35,1321.66),
	vec(1411.25,2783.62,1386.70),
	100
  },
  lava = {
    vec(1042.77,2790.03,1287.94),
    vec(1042.87,2665.51,1287.94),
	vec(1043.46,2727.36,1342.20),
	100
  },
  jewellery4 = {
    vec(-250.91, 231.21, 92.03),
    vec(-270.15, 248.09, 90.33),
    vec(-238.78, 244.56, 92.06),
  	60
  },
  jewellery5 = {
    vec(1647.89, 4878.78, 42.16),
    vec(1657.23, 4866.3, 42.03),
    vec(1654.87, 4881.14, 42.16),
	50
  },
  Building = {
    vec(-138.2, -949.45, 114.14),
    vec(-168.05, -1009.39, 114.13),
    vec(-158.55, -981.38, 114.14),
	70
  },

}

-- Register Events
local toggle = false
local cangive = false

RegisterNetEvent('esx:changeworld')
AddEventHandler('esx:changeworld',function(world)
  if world ~= 0 then
    cangive = true
  else
    cangive = false
  end
end)

local Weapon = nil
local disnext = false
local t1c = 0
local t2c = 0
local matchdata = nil
local selectedtime = 120
RegisterNetEvent('PaintBall:Start')
AddEventHandler('PaintBall:Start', function(Team, Map, weapon, Id,rc,t1,t2,data)
  inStartCode = true
  if lasthp == 0 then
    lasthp = GetEntityHealth(PlayerPedId())
    lastArmour = GetPedArmour(PlayerPedId())
  end
  TriggerEvent('medic:revive', true)
  TriggerEvent('status:setupdate',false)
  if t1 then
    t1c = t1
    t2c = t2
  end
  if rc then
    roundcount = rc
  end
  timer = 0
  kiri = false
  TriggerEvent('weaponry:ReduceRecoil2')
if disnext then return end
  disnext = true
  Citizen.SetTimeout(5000,function()
	disnext = false
  end)
  TriggerEvent('esx_inventoryhud:br',true)
  exports["suncore"]:Whitelist(true)
  PaintBallMenu(false)
  spectate = false
  Wait(500)
  map = Map
  radius = Maps[Map][4]
  markercoords = Maps[Map][3]
  --while IsPedDeadOrDying(PlayerPedId(),true) do
  --  Wait(100)
 --   RespawnPed(GetEntityCoords(PlayerPedId()), 206.36)	
 -- end
  local PlayerPed = GetPlayerPed(-1)
  Weapon = ('WEAPON_%s'):format(string.upper(weapon))
  MyTeam = nil
  Wait(10)
  MyTeam = Team
  --print(MyTeam)
  MatchId = Id
  TriggerEvent('skinchanger:getSkin', function(skin)
		if tonumber(skin.sex) == 0 then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Clothe[MyTeam].male)
		else
				TriggerEvent('skinchanger:loadClothes', skin, Config.Clothe[MyTeam].female)
		end
	end)
  TriggerDisableControl()
  Wait(500)
  TriggerEvent('esx:stateweaponcheck', false)
  TriggerEvent('esx:updatecoords',false)
  TriggerEvent('event', true)
  RemoveAllPedWeapons(PlayerPed, false)
  RespawnPed(GetEntityCoords(PlayerPedId()), 206.36)	
  NetworkSetInSpectatorMode(false, 0)
  if toggle then
  toggle = false
  local loc = 0 
  if MyTeam == 1 then
    loc = 2
  else
    loc = 1
  end
    ESX.SetEntityCoords(PlayerPed, Maps[Map][loc])
  else
    toggle = true
    ESX.SetEntityCoords(PlayerPed, Maps[Map][MyTeam])
  end
  while not cangive do Wait(500) end
  TriggerEvent('es_admin:freezePlayer', true)
  Citizen.Wait(4000)
  TriggerEvent('es_admin:freezePlayer', false)
  Wait(1000)
  if IsPedDeadOrDying(PlayerPedId(),true) then
    TriggerEvent('medic:revive', true)
  end
  Wait(500)
  GiveWeaponToPed(PlayerPed, `WEAPON_KNIFE`, 250, false, true)
  GiveWeaponToPed(PlayerPed, Weapon, 250, false, true)
  Wait(1500)
  TriggerEvent('es_admin:freezePlayer', false)
  ESX.SetEntityHealth(PlayerPedId(),200)
  SetCurrentPedWeapon(PlayerPed,Weapon,true)
  exports.suncore:SetPlayerVisible(true)
  if data then
    matchdata = data
  end
  if matchdata then
    local armor = tonumber(matchdata["armor"])
    if armor > 98 then
      armor = 98
    end
    local head = tonumber(matchdata["head"])
    selectedtime = tonumber(matchdata["timer"])
    
    ESX.SetPedArmour(PlayerPedId(),armor)
    if head == 0 then
      --SetPedSuffersCriticalHits(GetPlayerPed(-1), false)
    end
  end
  losehp = false  
  kiri = true
  timer = selectedtime
  timerthread()
  PaintBallUI(true)
  if t1c ~= 0 then
    SendNUIMessage({
      type = 'updatealive1',
      t1 = t1c,
    })
    SendNUIMessage({
      type = 'updatealive2',
      t2 = t2c,
    })
  end
  inStartCode = false
end)

RegisterNetEvent('PaintBall:MyTeamate')
AddEventHandler('PaintBall:MyTeamate', function(teamate)
  for player in pairs(teamate) do
    table.insert(Teamate, teamate[player].source)
  end
end)

RegisterNetEvent('PaintBall:newtimer')
AddEventHandler('PaintBall:newtimer', function()

end)


RegisterNetEvent('PaintBall:startsp')
AddEventHandler('PaintBall:startsp', function(map,t1,t2,rc,data)
  if rc then
    roundcount = rc
  end
  if data then
    matchdata = data
  end
  selectedtime = tonumber(matchdata["timer"])
  local coords = vec(Maps[map][3].x,Maps[map][3].y,Maps[map][3].z + 30)
  radius = Maps[map][4]
  markercoords = Maps[map][3]
  ESX.SetEntityCoords(PlayerPedId(), coords)
  exports.suncore:Whitelist(true)
  exports.suncore:SetPlayerVisible(false)
  TriggerEvent('es_admin:freezePlayer', true)

  PaintBallMenu(false)
  Wait(6000)
  spectate = true
  PaintBallUI(true)
  if t1 then
    t1c = t1
    t2c = t2
  end
    SendNUIMessage({
      type = 'updatealive1',
      t1 = t1c,
    })
    SendNUIMessage({
      type = 'updatealive2',
      t2 = t2c,
    })
  Wait(1000)
  SpectateCitizen()
  timer = 0
  kiri = false
  losehp = false
  Wait(1000)
  kiri = true
  timer = selectedtime
  timerthread()
end)

RegisterNetEvent('Lobby:UpdatePlayer')
AddEventHandler('Lobby:UpdatePlayer', function(LobbyId, source, team, string)
  TriggerEvent('Lobby:UserLeftTeam', LobbyId, team, source)
  TriggerEvent('Lobby:UserJoinTeam', LobbyId, string, team)
end)

AddEventHandler('esx:onPlayerDeath', function(data)
  if MyTeam then
    TriggerServerEvent('PaintBall:OnPlayerDeath', MatchId, MyTeam,data)
    spectate = true
    SpectateCitizen()
  end
end)

RegisterNetEvent('Lobby:CloseLobby')
AddEventHandler('Lobby:CloseLobby', function()
  PaintBallMenu(false)
end)

RegisterNetEvent('PaintBall:SetTeamCount')
AddEventHandler('PaintBall:SetTeamCount', function(UTeam, Count)
  if MyTeam == UTeam then
    ESX.ShowNotification('Az Team Shoma~r~ '.. Count ..' ~s~nafar Zende ast')
  else
    ESX.ShowNotification('Az Team ~y~('.. UTeam ..')~g~ '.. Count ..' ~s~nafar Zende ast')
  end
  if UTeam == 1 then
    SendNUIMessage({
      type = 'updatealive1',
      t1 = Count,
    })
  else
    SendNUIMessage({
      type = 'updatealive2',
      t2 = Count,
    })
  end
end)

RegisterNetEvent('PaintBall:RoundWinner')
AddEventHandler('PaintBall:RoundWinner', function(MyTeam, Winner)
  if MyTeam == Winner then
    ShowText   = true
    NotifiText = "~g~You Won This Round~s~"
  else
    ShowText   = true
    NotifiText = ("~r~Team %s Won Round~s~"):format(Winner)
  end
  Wait(5000)
  ShowText   = false
end)

RegisterNetEvent('Lobby:UserJoinTeam')
AddEventHandler('Lobby:UserJoinTeam', function(lobby, value, team)
  SendNUIMessage({
    action = 'JoinTeam',
    team = team,
    value = value
  })
end)

RegisterNetEvent('Lobby:UserLeftTeam')
AddEventHandler('Lobby:UserLeftTeam', function(lobby, team, player)
  SendNUIMessage({
    action = 'LeftTeam',
    team = team,
    player = player
  })
end)

RegisterNetEvent('PaintBall:End')
AddEventHandler('PaintBall:End', function(myTeam, Winner,tamam)
  while inStartCode do Wait(100) end
  local disableAll = true
  Citizen.CreateThread(function()
    while disableAll do
      Wait(0)
      DisableAllControlActions(0)
    end
  end)
  SetTimeout(10000,function()
    disableAll = false
  end)
  FreezeEntityPosition(PlayerPedId(),false)
  --SetPedSuffersCriticalHits(GetPlayerPed(-1), true)
  matchdata = nil
  ESX.SetPedArmour(PlayerPedId(),0)
  if not spectate then
  TriggerEvent('es_admin:freezePlayer', false)
  else
    SetTimeout(3000,function()
      TriggerEvent('es_admin:freezePlayer', false)
    end)
  end
  Teamate = {}
  MatchId = 0
  ShowText   = true
  timer = 0
  kiri = false
  if myTeam == Winner then
    NotifiText = "~g~You Won This Match~s~"
  else
    NotifiText = ("~r~Team %s Won Match~s~"):format(Winner)
  end
  Wait(500)
  RespawnPed(GetEntityCoords(PlayerPedId()), 206.36)	
  TriggerEvent('medic:revive', true)
  NetworkSetInSpectatorMode(false, 0)
  Wait(500)
  local PlayerPed = GetPlayerPed(-1)
  TriggerEvent('event', false)
  SendNUIMessage({
    type = 'show',
    show = false
  })
  MyTeam     = nil
  Wait(500)
  RemoveAllPedWeapons(PlayerPed, false)
  TriggerEvent('esx:restoreLoadout')
  TriggerEvent('esx:stateweaponcheck', true)
  TriggerEvent('esx:updatecoords',true)
  Wait(1500)
  ESX.SetEntityCoords(PlayerPed, Config.Join[LocationIndex].coords.x, Config.Join[LocationIndex].coords.y, Config.Join[LocationIndex].coords.z + 3.0)
  exports['sunset_clothe']:removeStuffJob()
  exports['sunset_clothe']:removeStuffJob()
  Citizen.Wait(1000)
  exports['sunset_clothe']:loadUsed()
  Wait(5000)
  ShowText   = false
  exports.suncore:SetPlayerVisible(true)
  exports["suncore"]:Whitelist(false)
  TriggerEvent('esx_inventoryhud:br',false)
  TriggerServerEvent('backme')
  toggle = false
  Wait(1500)
  losehp = false
  kiri = false
  NetworkSetInSpectatorMode(false, 0)
  PaintBallUI(false)
  TriggerEvent('status:setupdate',true)
  if tamam and lasthp ~= 0 then
    ESX.SetEntityHealth(PlayerPedId(),lasthp)
    ESX.SetPedArmour(PlayerPedId(), lastArmour)
    lasthp, lastArmour = 0, 0
  end
end)

RegisterNetEvent('Slay')
AddEventHandler('Slay', function()
  ESX.SetEntityHealth(GetPlayerPed(-1), 0)
end)

-- Register NUI Callbacks
RegisterNUICallback('CreateLobby', function(data, cb)
  ESX.TriggerServerCallback('PaintBall:CreateLobby', function(lobid)
    cb(lobid)
  end, data)
end)


RegisterNUICallback('JoinLobby', function(data, cb)
  ESX.TriggerServerCallback('Lobby:GetLobbyPlayers', function(Team)
    local newData = {
      LobbyId = data.LobbyId,
      Source = GetPlayerServerId(PlayerId()),
      Name = GetPlayerName(PlayerId()),
      Team = 0
    }
    TriggerServerEvent('Lobby:JoinLobby', newData)
    local element = {
      [0] = {},
      [1] = {},
      [2] = {}
    };
    for k,v in pairs(Team) do
      for k2,v2 in pairs(v) do
        table.insert(element[k], {id = v2.source, value = v2.value})
      end
    end
    cb(json.encode(element))
  end, data.LobbyId)
end)

RegisterNUICallback('LobbyList', function(data, cb)
  ESX.TriggerServerCallback('Lobby:GetActiveLobbies', function(lbs)
    cb(json.encode(lbs))
  end)
end)

RegisterNUICallback('GetLobbyPassword', function(data, cb)
  local lobbyid = data.LobbyId
  local pass = 1111111111
  ESX.TriggerServerCallback('Lobby:GetActiveLobbies', function(lobbies)
    for k , v in ipairs(lobbies) do
      if tonumber(v.LobbyId) == tonumber(lobbyid) then
        pass = v.pass
        break
      end
    end
    cb(pass)
  end)
end)

RegisterNUICallback('ToggleReadyPlayer', function(data, cb)
  TriggerServerEvent('Lobby:Ready', data)
end)

RegisterNUICallback('JoinTeam', function(data)
  TriggerServerEvent('Lobby:JoinTeam', data)
end)

RegisterNUICallback('LeftTeam', function(data)
  TriggerServerEvent('Lobby:LeftTeam', data)
end)

RegisterNUICallback('SwitchTeam', function(data, cb)
  ESX.TriggerServerCallback('Lobby:SwitchTeamCheck', function(limited)
    if not limited then
      cb(true)
      TriggerServerEvent('Lobby:SwitchTeam', data)
    end
  end, data)
end)

RegisterNUICallback('StartMatch', function(data)
  TriggerServerEvent('Lobby:StartMatch', {LobbyId = data.LobbyId})
end)

RegisterNUICallback('QuitLobby', function(data)
  TriggerServerEvent('Lobby:QuitLobby', data)
  PaintBallMenu(false)
end)

RegisterNetEvent('QuitLobby')
AddEventHandler('QuitLobby', function()
  PaintBallMenu(false)
end)

RegisterNUICallback('QuitFromMenu', function(data)
  PaintBallMenu(false)
end)

function Initialize(scale, text)
	local scaleform = RequestScaleformMovie(scale)

    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
	end

    PushScaleformMovieFunction(scaleform, "SHOW_SHARD_WASTED_MP_MESSAGE")
    PushScaleformMovieFunctionParameterString(text)
	  PopScaleformMovieFunctionVoid()
  	return scaleform
end
lastcoords = {}
function TriggerDisableControl()
  Citizen.CreateThread(function()
    while MyTeam do
      Citizen.Wait(0)
      DisableControlAction(2, Keys['F2'], true) -- HandsUP
      DisableControlAction(2, Keys['F6'], true) -- HandsUP
      DisableControlAction(2, Keys['G'], true) -- HandsUP
      DisableControlAction(2, Keys['E'], true) -- HandsUP
      DisableControlAction(2, Keys['K'], true) -- HandsUP
      DisableControlAction(2, Keys['PAGEUP'], true) -- HandsUP
      if not HasPedGotWeapon(PlayerPedId(),GetHashKey("WEAPON_KNIFE")) and not IsPedDeadOrDying(PlayerPedId(), true) then
        GiveWeaponToPed(PlayerPedId(), `WEAPON_KNIFE`, 250, false, true)
        GiveWeaponToPed(PlayerPedId(), Weapon, 250, false, true)
      end
    end
  end)

  Citizen.CreateThread(function()
    while MyTeam do
      Citizen.Wait(0)
      if ShowText then
        local scaleform = Initialize("mp_big_message_freemode", NotifiText)
        DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255, 0)
      end
    end
  end)
  Citizen.CreateThread(function()
    while MyTeam do
      Citizen.Wait(1000)
      if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()),Maps[map][3],false) > Maps[map][4] then
	  if lastcoords ~= {} then
      ESX.SetEntityCoords(PlayerPedId(),lastcoords)
	  end
      else
        lastcoords = GetEntityCoords(PlayerPedId())
      end
    end
  end)
end

function SpectateCitizen()
  print(json.encode(Teamate))
  exports["suncore"]:Whitelist(true)
  local currect = 1
  local Target  = GetPlayerFromServerId(Teamate[currect])
  local TPed    = GetPlayerPed(Target)

  local function spec()
    NetworkSetInSpectatorMode(false, 0)
    NetworkSetInSpectatorMode(true, TPed)
  end

  local function increase()
    currect = currect + 1
    if currect > #Teamate then
      currect = 1
    end
    Target = GetPlayerFromServerId(Teamate[currect])
    TPed = GetPlayerPed(Target)
    spec()
  end

  local function decrease()
    currect = currect - 1
    if currect > #Teamate then
      currect = #Teamate
    end
    Target = GetPlayerFromServerId(Teamate[currect])
    TPed = GetPlayerPed(Target)
    spec()
  end

  local function alowToSpec()
    return NetworkIsPlayerActive(Target) and not IsPedDeadOrDying(TPed, true) and not (Target == PlayerId())
  end

  local function GetAlivePlayers()
    local count = 0
    for _,p in pairs(Teamate) do
      local Target = GetPlayerFromServerId(p)
      local TPed   = GetPlayerPed(Target)
      if NetworkIsPlayerActive(Target) and not IsPedDeadOrDying(TPed, true) and Target ~= PlayerId() then
        count = count + 1
      end
    end
    return count
  end

  Citizen.CreateThread(function()
    spec()
    while spectate and GetAlivePlayers() > 0 do
      DisableControlAction(0, 37, true)
      Wait(0)
      if not alowToSpec() then
        increase()
      end
      if IsControlJustPressed(1, 40) then
        increase()
      elseif IsControlJustPressed(1, 39) then
        decrease()
      end
      if DoesEntityExist(TPed) then
        local text = {}
        table.insert(text,"ID: "..GetPlayerServerId(Target))
        table.insert(text,"Steam Name: "..GetPlayerName(Target))
        table.insert(text,"Health: ".. (GetEntityHealth(TPed) - 100).."/".. (GetEntityMaxHealth(TPed) - 100))
        table.insert(text,"Armor: "..GetPedArmour(TPed))
        for i, theText in pairs(text) do
          SetTextFont(0)
          SetTextProportional(1)
          SetTextScale(0.0, 0.30)
          SetTextDropshadow(0, 0, 0, 0, 255)
          SetTextEdge(1, 0, 0, 0, 255)
          SetTextDropShadow()
          SetTextOutline()
          SetTextEntry("STRING")
          AddTextComponentString(theText)
          EndTextCommandDisplayText(0.03, 0.4+(i/30))
        end
      end
    end
  end)
end

function PaintBallMenu(display)
  MenuOpen = display
  SetNuiFocus(display, display)
  SendNUIMessage({
    type = 'show',
    show = display,
    create = true
  })
end

function PaintBallUI(display)
  if display then
  SendNUIMessage({
    type = 'start',
    time = selectedtime,
    round = roundcount,
  })
  else
    SendNUIMessage({
      type = 'stop'
    })
  end
end

function UITIME()
  SendNUIMessage({
    type = 'time',
    time = selectedtime
  })
end

RegisterNetEvent('PaintBall:setteamwin')
AddEventHandler('PaintBall:setteamwin',function(t1,t2)
  local game = {}
  Wait(3000)
  SendNUIMessage({
    type = 'update',
    t1 = t1,
    t2 = t2,
  })
end)

RegisterNetEvent('PaintBall:setteamwin2')
AddEventHandler('PaintBall:setteamwin2',function(t1,t2)
  PaintBallMenu(false)
  Wait(1000)
  PaintBallUI(true)
  Wait(3000)
  SendNUIMessage({
    type = 'update',
    t1 = t1,
    t2 = t2,
  })
  SendNUIMessage({
    type = 'updatealive1',
    t1 = t1c,
  })
  SendNUIMessage({
    type = 'updatealive2',
    t2 = t2c,
  })
  timer = 0
  kiri = false
  losehp = false
  Wait(1000)
  timer = 0
  kiri = false
  losehp = false
  Wait(1000)
  kiri = true
  timer = selectedtime
  timerthread()
end)

function CreateBlip(coords, name)
  local blip = AddBlipForCoord(coords)
  SetBlipSprite  (blip, 437)
  SetBlipDisplay (blip, 4)
  SetBlipScale   (blip, 1.2)
  SetBlipCategory(blip, 3)
  SetBlipColour  (blip, 46)
  SetBlipAsShortRange(blip, true)

  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(name)
  EndTextCommandSetBlipName(blip)
end

Citizen.CreateThread(function()
    CreateBlip(Config.Join[1].coords, 'Paint Ball')
    SetNuiFocus(false,false)
    NetworkSetInSpectatorMode(false, 0)
    while true do
        Wait(0)
        local PlayerPed = GetPlayerPed(-1)
        local coords    = GetEntityCoords(PlayerPed)
        for k , v in pairs(Config.Join) do
            if GetDistanceBetweenCoords(coords, v.coords, false) < 100.0 then
                DrawMarker(1, v.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 10.0, 2.0, 0, 0, 0, 100, false, true, 2, false, false, false, false)
                if GetDistanceBetweenCoords(coords, v.coords, true) < 13.0 then
                    LocationIndex = k
                    if not UIOpen then
                        ESX.ShowHelpNotification('~INPUT_CONTEXT~ Baz Kardan Menu PaintBall')
                    end
                    if IsControlJustPressed(1, Keys['E']) then
                        if not ESX.isDead() then
                            local canOpen = false
                            if v.access['all'] then
								canOpen = true
							elseif v.access[PlayerData.job.name] then
								if type(v.access[PlayerData.job.name]) == 'boolean' then
									canOpen = true
								else
									local grade = v.access[PlayerData.job.name]
									if grade.gradeType == 1 then
										if PlayerData.job.grade == grade.grade then
											canOpen = true
										end
									end
									if grade.gradeType == 2 then
										if PlayerData.job.grade <= grade.grade then
											canOpen = true
										end
									end
									if grade.gradeType == 3 then
										if PlayerData.job.grade >= grade.grade then
											canOpen = true
										end
									end
									if grade.gradeType == 4 and grade.grade2 then
										if PlayerData.job.grade >= grade.grade and PlayerData.job.grade <= grade.grade2 then
											canOpen = true
										end
									end
								end
							elseif v.access[PlayerData.gang.name] then
								if type(v.access[PlayerData.gang.name]) == 'boolean' then
									canOpen = true
								else
									local grade = v.access[PlayerData.gang.name]
									if grade.gradeType == 1 then
										if PlayerData.gang.grade == grade.grade then
											canOpen = true
										end
									end
									if grade.gradeType == 2 then
										if PlayerData.gang.grade <= grade.grade then
											canOpen = true
										end
									end
									if grade.gradeType == 3 then
										if PlayerData.gang.grade >= grade.grade then
											canOpen = true
										end
									end
									if grade.gradeType == 4 and grade.grade2 then
										if PlayerData.gang.grade >= grade.grade and PlayerData.gang.grade <= grade.grade2 then
											canOpen = true
										end
									end
								end
                            end
                            if canOpen then
                                if (not PlayerData.job.name:find('off') and PlayerData.job.name ~= 'nojob' and not ESX.basicJobs[PlayerData.job.name]) and not v.access[PlayerData.job.name] then
                                    ESX.ShowNotification('Baraye Play Dar Paintball Bayad Dar Job Khodeton Off-Duty Konid')
                                else
                                    UIOpen = true
                                    PaintBallMenu(true)
                                end
                            end
                        end
                    end
                elseif UIOpen then
                    UIOpen = false
                    PaintBallMenu(false)
                end
            end
        end
    end
end)

function RespawnPed(coords, heading)
  	ped = GetPlayerPed(-1)
	ESX.SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	ESX.SetEntityHealth(ped, 200)
	ESX.SetPedArmour(ped, 0)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	ClearPedBloodDamage(ped)
	ESX.UI.Menu.CloseAll()
end


--new Edit By Ahmad


Drawtext = function(text)
	SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.50, 0.50)
	SetTextColour( 255,0,0, 255 )
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.8, 0.95)
end