ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

local ncz = { -- 1 alarm  2 jail  3 cs
-- Parking
	{ coords = vec(248.05, -756.24, 30.83), 	radius = 120, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 1 asli
	{ coords = vec(130.07, -1059.32, 29.19), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 2
 	{ coords = vec(371.81, 280.06, 103.37), 	radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 3
	{ coords = vec(-283.54, -913.2, 31.09), 	radius = 100, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 4 JobCenter
	{ coords = vec(1721.55, 3705.22, 34.64), 	radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 5
	{ coords = vec(146.43, 6618.51, 31.79), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 6
	{ coords = vec(-1584.53, 5071.95, 32.07), 	radius = 100, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 7-13-17-18 Paintball
	{ coords = vec(1204.66, -1392.69, 35.23),	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 8
	{ coords = vec(613.03, 104.22, 92.87),		radius = 35,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 9
	{ coords = vec(-2037.6, -467.59, 11.33),	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 10
	{ coords = vec(570.23, -3033.7, 6.07),		radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 11
	{ coords = vec(-743.63, -1305.8, 5.0),		radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking 12
	
-- NCZ
	{ coords = vec(2544.91, -384.8, 92.99), 	radius = 120, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- FBi new
	{ coords = vec(1362.22, -737.72, 67.23), 	radius = 70,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Mechanics
	{ coords = vec(655.82, 607.13, 128.68), 	radius = 100, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- mechanic 2
	{ coords = vec(1241.73, 2713.29, 37.8), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Mechanics sandy
	{ coords = vec(142.04, -3029.54, 7.04), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Mechanics tune
	{ coords = vec(373.13, -1637.87, 32.53), 	radius = 55,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Taxirani
	{ coords = vec(1849.18, 3662.18, 34.17), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking sheriff
	{ coords = vec(446.5, -982.35, 30.69), 		radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Parking police
	{ coords = vec(1177.15, -1505.12, 34.69), 	radius = 90,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- bimarestan 1
	{ coords = vec(-1860.91, -333.34, 49.25), 	radius = 100, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- bimarestan 2
	{ coords = vec(-1623.03, -899.12, 8.99), 	radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Car Dealer 
	{ coords = vec(-571.31, -910.4, 23.88), 	radius = 55,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Weazel News
	{ coords = vec(-827.53, -713.56, 39.96), 	radius = 70,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Weazel News
	{ coords = vec(-267.7, -1998.23, 29.64), 	radius = 110, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Game Net
	{ coords = vec(1760.13,3639.81,34.83), 		radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- administrative
	
-- Safe Zone
	{ coords = vec(-1227.29, -1490.86, 4.36), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Drag Dealer 
	{ coords = vec(1590.73, -1982.18, 94.96), 	radius = 100, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Zamine Ephedra
	{ coords = vec(-1069.24, -1672.49, 4.48), 	radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Lablatori Ephedra
	{ coords = vec(-1919.41, -788.06, 2.41), 	radius = 90,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Lablatori crack
	{ coords = vec(-1848.97, -867.74, 2.79), 	radius = 70,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Lablatori crack
	{ coords = vec(-1996.47, -698.64, 2.39), 	radius = 70,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Lablatori crack
	{ coords = vec(-2065.33, -1025.49, 14.77), 	radius = 80,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Lablatori crack
	{ coords = vec(3559.76, 3674.53, 28.12), 	radius = 150, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Lablatori Teryak
	{ coords = vec(1975.16, 3816.25, 33.43), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Lablatori Heroine
	{ coords = vec(1851.71, 4914.63, 45.08), 	radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Zamin Cocain
	{ coords = vec(2224.2, 5566.53, 54.03), 	radius = 80,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Zamin Shahdane
	{ coords = vec(2333.42, 2578.74, 46.44), 	radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- labratori marijuana
	{ coords = vec(34.05, 4346.43, 41.79), 		radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Zamin MashRome
	{ coords = vec(-1800.82, 1990.44, 125.46), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Zamin KhashKhash
	{ coords = vec(135.7, -3196.17, 5.95), 		radius = 35,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Extra drug
	{ coords = vec(66.37, -1891.93, 21.70), 	radius = 130, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Base Gang haye 5 Tai
	{ coords = vec(1544.69, -2124.29, 77.1), 	radius = 75,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- zob yaghi

-- Robs
	{ coords = vec(-1109.09, 4917.86, 216.0), 	radius = 80,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- cargo
	{ coords = vec(2433.24, 4960.87, 60.71), 	radius = 100, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Mythic
	{ coords = vec(-648.44, -231.64, 37.65), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Javaheri shahr
	{ coords = vec(-610.05, -284.45, 38.87), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Javaheri shahr
	{ coords = vec(2714.25, 3490.49, 61.82), 	radius = 80,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- javahery Shams
	{ coords = vec(-352.35, -59.37, 49.01),		radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- mini 1
	{ coords = vec(300.85, -284.57, 53.23),		radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- mini 2
	{ coords = vec(-2948.73, 481.46, 14.26),	radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- mini 3
	{ coords = vec(-1206.53, -338.2, 37.76),	radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- mini 4
	{ coords = vec(1172.57, 2716.0, 38.99),		radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- mini 5
	{ coords = vec(28.63, -1340.3, 29.5), 		radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 1
	{ coords = vec(-717.58, -915.21, 19.22), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 5
	{ coords = vec(377.39, 327.57, 103.57), 	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 7
	{ coords = vec(1165.75, -323.95, 69.21), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 8
	{ coords = vec(-3044.46, 588.64, 7.91), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 10
	{ coords = vec(-3246.35, 1005.67, 12.83), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 11
	{ coords = vec(-1818.63, 793.18, 138.07), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 13
	{ coords = vec(544.52, 2665.95, 42.16), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 14
	{ coords = vec(2675.14, 3280.85, 55.24), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 16
	{ coords = vec(1701.44, 4927.42, 42.06), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 19
	{ coords = vec(1728.79, 6414.22, 35.04), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop 20
	{ coords = vec(1136.25, -981.58, 46.42), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop
	{ coords = vec(1964.35, 3741.78, 32.34), 	radius = 18,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop
	{ coords = vec(-2967.92, 390.25, 15.04), 	radius = 18,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop
	{ coords = vec(-1223.27, -907.42, 12.33), 	radius = 18,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop
	{ coords = vec(-51.15, -1754.98, 29.42), 	radius = 18,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop
	{ coords = vec(2552.77, 385.75, 108.62), 	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop
	{ coords = vec(-1486.96, -379.36, 40.16), 	radius = 18,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Shop

-- Jobs
	{ coords = vec(715.02, -969.01, 30.4), 		radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Khayat 1
	{ coords = vec(1965.59, 5174.12, 47.83), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Khayat 2
	{ coords = vec(424.96, -805.36, 29.49), 	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Khayat 3
	{ coords = vec(897.72, -1566.67, 30.83), 	radius = 100, punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Miner 1
	{ coords = vec(2954.34, 2790.31, 41.34), 	radius = 70,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Miner 2
	{ coords = vec(292.16, 2858.42, 43.64), 	radius = 70,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Miner 3
	{ coords = vec(2481.64, 1528.89, 34.88),	radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Miner 4
	{ coords = vec(1083.99, -1989.29, 50.01), 	radius = 80,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Miner 5
	{ coords = vec(1203.09, -1288.89, 35.28), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Chob Bor 1
	{ coords = vec(-553.34, 5324.29, 70.38), 	radius = 90,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Chob Bor 2
	{ coords = vec(559.36, -2327, 5.84), 		radius = 35,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Sherkat Naft 1
	{ coords = vec(610.7, 2859.63, 39.99), 		radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Sherkat Naft 2
	{ coords = vec(2739.54, 1438.33, 33.06), 	radius = 80,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Sherkat Naft 3
	{ coords = vec(265.78, -3013.19, 5.73), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Sherkat Naft 4
	{ coords = vec(500.88, -2156.28, 5.83), 	radius = 35,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Sherkat Naft 5
	{ coords = vec(-1044.07, -2005.36, 22.56), 	radius = 37,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Ghasabi 1
	{ coords = vec(-64.27, 6241.11, 31.24), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Ghasabi 2
	
-- Other
	{ coords = vec(1323.92, -1653.31, 52.28), 	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- TatoShop
	{ coords = vec(323.02, 182.49, 103.59), 	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- TatoShop
	{ coords = vec(-1150.85,-1426.93,4.95), 	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- TatoShop
	{ coords = vec(-188.66, -1169.35, 23.67), 	radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- impound

	{ coords = vec(595.72, 2745.13, 42.02),		radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- AH 4
	{ coords = vec(-1624.29, 216.67, 60.6),		radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- AH 7 
	{ coords = vec(73.19, -1576.56, 29.61),		radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- AH 8
	{ coords = vec(-1026.95, -2130.03, 13.59),	radius = 30,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- AH 9 
	{ coords = vec(-591.33, -1064.22, 14.51),	radius = 60,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- caffe owoo
	{ coords = vec(-413.06, 1156.75, 329.69), 	radius = 80,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Admins aria
    { coords = vec(-775.11, 310.35, 85.7), 		radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
    { coords = vec(-1439.96, -548.0, 34.74), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
    { coords = vec(-830.35, -1217.11, 6.93), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
    { coords = vec(-878.61, -2110.67, 9.92), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
    { coords = vec(766.78, -1761.85, 29.42), 	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
    { coords = vec(959.9, -202.63, 73.08), 		radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
	{ coords = vec(-1295.2, 300.57, 64.95), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
	{ coords = vec(1603.25, 3587.55, 35.43), 	radius = 50,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
	{ coords = vec(-93.08, 6351.42, 31.49), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman
	{ coords = vec(1125.3, 2641.75, 38.14), 	radius = 40,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- Aparteman

-- Gun Shop
	{ coords = vec(-660.44, -939.02, 21.83), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 1
	{ coords = vec(817.29, -2138.53, 29.29), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 2
	{ coords = vec(1699.79, 3752.72, 34.71), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 3
	{ coords = vec(-328.4, 6083.13, 31.45), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 4
	{ coords = vec(242.57, -35.93, 69.76), 		radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 5
	{ coords = vec(16.59, -1111.12, 29.8), 		radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 6
	{ coords = vec(2569.89, 303.99, 108.61), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 7
	{ coords = vec(-1110.71, 2694.16, 18.55), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 8
	{ coords = vec(841.06, -1026.7, 29.19), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 9
	{ coords = vec(-1319.58, -397.47, 36.59), 	radius = 25,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 10
	{ coords = vec(-3151.77, 1076.15, 20.68), 	radius = 20,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- gunshop 11

	{ coords = vec(-1216.78, -1544.5, 4.7), 	radius = 100,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- GYM

	{ coords = vec(419.33, 6538.61, 27.73), 	radius = 70,   punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- farm 1
	{ coords = vec(116.88, 6373.04, 31.38), 	radius = 80,   punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- farm 2-3 
	{ coords = vec(1836.57, 3919.39, 33.25), 	radius = 100,  punish = 1, count = 0, reason = "Eghdam Be LockPick" }, -- farm 4-5-6
}

function checkncz()
	local coords = GetEntityCoords(PlayerPedId())
	local zone = nil
	for k , v in pairs(ncz) do
		local distance = GetDistanceBetweenCoords(coords,v.coords)
		if distance <= v.radius then
			zone = v
		end	
	end
	return zone
end
exports('checkncz',checkncz)

local txd = CreateRuntimeTxd('Lockpick')
local tx = CreateRuntimeTextureFromImage(txd, 'Lockpick', "background.png")

local yyy1 = 0.36
local yyy2 = 0.36
local yyy3 = 0.36
local yyy4 = 0.36

local rrr1 = 152
local ggg1 = 212
local bbb1 = 224

local rrr2 = 152
local ggg2 = 212
local bbb2 = 224

local rrr3 = 152
local ggg3 = 212
local bbb3 = 224

local rrr4 = 152
local ggg4 = 212
local bbb4 = 224

local otwiera = false
local pin1 = false
local pin2 = false
local pin3 = false
local pin4 = false

local igrekPin1 = (math.random(3250, 3550) * 0.0001)
local igrekPin2 = (math.random(3250, 3550) * 0.0001)
local igrekPin3 = (math.random(3250, 3550) * 0.0001)
local igrekPin4 = (math.random(3250, 3550) * 0.0001)

function endthis(remove)
	if otwiera then
		otwiera = false
		pin1 = false
		pin2 = false
		pin3 = false
		pin4 = false
		rrr1 = 152
		ggg1 = 212
		bbb1 = 224
		rrr2 = 152
		ggg2 = 212
		bbb2 = 224
		rrr3 = 152
		ggg3 = 212
		bbb3 = 224
		rrr4 = 152
		ggg4 = 212
		bbb4 = 224
		yyy1 = 0.36
		yyy2 = 0.36
		yyy3 = 0.36
		yyy4 = 0.36
		DisableControlAction(0, 73, false)
		igrekPin1 = (math.random(3250, 3550) * 0.0001)
		igrekPin2 = (math.random(3250, 3550) * 0.0001)
		igrekPin3 = (math.random(3250, 3550) * 0.0001)
		igrekPin4 = (math.random(3250, 3550) * 0.0001)
		ClearPedTasksImmediately(GetPlayerPed(-1))
		timer = 0
		if remove then	
			if ESX.DoesHaveItem('lockpick',1,nil,nil,false) then
				TriggerServerEvent('lockpick:remove')
			else
				ESX.TriggerServerEvent('ss_cs:csMe',150,'Bug abuse #1')
			end
		end
		ESX.ShowNotification('lock pick namovafagh boud')
		ESX.SetPlayerData('cantsoot',0)
	end
end

RegisterNetEvent('lockpick:open')
AddEventHandler('lockpick:open', function()
	local data = checkncz()
	if data then
		if data.punish == 10 then
			TriggerServerEvent("sc:adminalarm",'Man darhale '..data.reason .. ' hastam lotfan be dadam beresin')
		end
		return
	end
	local coords = GetEntityCoords(GetPlayerPed(-1))
	local valid = IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 5.0)
	if otwiera then return end
	if valid then
		local coords    = GetEntityCoords(PlayerPedId())
		local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 10.0, 0, 71)
		if vehicle == 0 then ESX.ShowNotification('Mashini yaft nashod') end
		if exports.esx_vehiclecontrol:IsGOV(vehicle) then return end
		local lock = GetVehicleDoorLockStatus(vehicle)
		local plate = ESX.GetPlate(vehicle)
		ESX.TriggerServerCallback('lockpick:checkNearOwner', function(can)
			if can then
				if lock == 1 or lock == 0 then return ESX.ShowNotification('Dar mashin mored nazar baz ast') end
				if GetPedInVehicleSeat(vehicle,1) ~= 0 then return ESX.ShowNotification('Yek fard savar mashin ast') end
				TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
				ESX.SetPlayerData('cantsoot',1)
				otwiera = true
				yyy1 = 0.36
				yyy2 = 0.36
				yyy3 = 0.36
				yyy4 = 0.36
		
				rrr1 = 152
				ggg1 = 212
				bbb1 = 224
		
				rrr2 = 152
				ggg2 = 212
				bbb2 = 224
		
				rrr3 = 152
				ggg3 = 212
				bbb3 = 224
		
				rrr4 = 152
				ggg4 = 212
				bbb4 = 224
		
				pin1 = false
				pin2 = false
				pin3 = false
				pin4 = false
		
				igrekPin1 = (math.random(3250, 3550) * 0.0001)
				igrekPin2 = (math.random(3250, 3550) * 0.0001)
				igrekPin3 = (math.random(3250, 3550) * 0.0001)
				igrekPin4 = (math.random(3250, 3550) * 0.0001)
				Citizen.CreateThread(function()
					local timer = exports['sun-jobs']:getVehicleInsuranceData(vehicle) and 15 or 30
					while timer > 0 do
						if GetPedInVehicleSeat(vehicle,1) ~= 0 then return endthis() end
						local lock = GetVehicleDoorLockStatus(vehicle)
						if lock == 1 or lock == 0 then return endthis() end
						timer = timer - 1
						Wait(1000)
					end
					endthis(true)
				end)
				Citizen.CreateThread(function()
					while otwiera do
						Citizen.Wait(0)
						DrawRect(0.9325, 0.7725, 0.113, 0.1915, 0, 0, 0, 255)
						DrawSprite('Lockpick', 'Lockpick', 0.9325, 0.7725, 0.113, 0.1915, 0.0, 255, 255, 255, 180)
				
						DrawRect(0.972, yyy1 + 0.4, 0.004, 0.04, rrr1, ggg1, bbb1, 180)
				
						DrawRect(0.959, yyy2+ 0.4, 0.004, 0.04, rrr2, ggg2, bbb2, 180)
				
						DrawRect(0.9455, yyy3 + 0.4, 0.004, 0.04, rrr3, ggg3, bbb3, 180)
				
						DrawRect(0.932, yyy4 + 0.4, 0.004, 0.04, rrr4, ggg4, bbb4, 180)
				
						
						-- Ekranda çıan yazı 3D
						local coords = GetEntityCoords(GetPlayerPed(-1))
						ESX.Game.Utils.DrawText3D(coords, "[~g~G~s~] - Baraye forou bordan~n~[~g~H~s~] - Baraye negah dashtan pin~n~[~g~X~s~] - Baraye cancel kardan", 0.6)
						
						-- "X"
						DisableControlAction(0, 73, true)
				
						if IsDisabledControlJustPressed(0, 73) then
							endthis()
						end
					end
				end)
				
				Citizen.CreateThread(function()
					while otwiera do
						Citizen.Wait(0)
						if not pin1 and not pin2 and not pin3 and not pin4 then
							if (yyy1 <= igrekPin1) and (igrekPin1 - 0.004 <= yyy1) then
								rrr1 = 76
								ggg1 = 175
								bbb1 = 0
								if IsControlJustPressed(0, 74) then
									TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinSucc', 0.8)
									pin1 = true
									yyy1 = 0.33
									rrr1 = 14
									ggg1 = 113
									bbb1 = 139
								end
							else
								rrr1 = 152
								ggg1 = 212
								bbb1 = 224
								if IsControlJustPressed(0, 74) then
									TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinFail', 0.8)
									rrr1 = 175
									ggg1 = 0
									bbb1 = 0
									Citizen.Wait(50)
									rrr1 = 152
									ggg1 = 212
									bbb1 = 224
									Citizen.Wait(50)
									rrr1 = 175
									ggg1 = 0
									bbb1 = 0
									Citizen.Wait(50)
									rrr3 = 152
									ggg3 = 212
									bbb3 = 224
								end
							end
						elseif pin1 and not pin2 and not pin3 and not pin4 then
							if (yyy2 <= igrekPin2) and (igrekPin2 - 0.004 <= yyy2) then
								rrr2 = 76
								ggg2 = 175
								bbb2 = 0
								if IsControlJustPressed(0, 74) then
									TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinSucc', 0.8)
									pin2 = true
									yyy2 = 0.33
									rrr2 = 14
									ggg2 = 113
									bbb2 = 139
								end
							else
								rrr2 = 152
								ggg2 = 212
								bbb2 = 224
								if IsControlJustPressed(0, 74) then
									TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinFail', 0.8)
									rrr2 = 175
									ggg2 = 0
									bbb2 = 0
									Citizen.Wait(50)
									rrr2 = 152
									ggg2 = 212
									bbb2 = 224
									Citizen.Wait(50)
									rrr2 = 175
									ggg2 = 0
									bbb2 = 0
									Citizen.Wait(50)
									rrr2 = 152
									ggg2 = 212
									bbb2 = 224
									pin1 = false
								end
							end
						elseif pin1 and pin2 and not pin3 and not pin4 then
							if (yyy3 <= igrekPin3) and (igrekPin3 - 0.004 <= yyy3) then
								rrr3 = 76
								ggg3 = 175
								bbb3 = 0
								if IsControlJustPressed(0, 74) then
									TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinSucc', 0.8)
									pin3 = true
									yyy3 = 0.33
									rrr3 = 14
									ggg3 = 113
									bbb3 = 139
								end
							else
								rrr3 = 152
								ggg3 = 212
								bbb3 = 224
								if IsControlJustPressed(0, 74) then
									TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinFail', 0.8)
									rrr3 = 175
									ggg3 = 0
									bbb3 = 0
									Citizen.Wait(50)
									rrr3 = 152
									ggg3 = 212
									bbb3 = 224
									Citizen.Wait(50)
									rrr3 = 175
									ggg3 = 0
									bbb3 = 0
									Citizen.Wait(50)
									rrr3 = 152
									ggg3 = 212
									bbb3 = 224
									pin2 = false
								end
							end
						elseif pin1 and pin2 and pin3 and not pin4 then
							if (yyy4 <= igrekPin4) and (igrekPin4 - 0.004 <= yyy4) then
								rrr4 = 76
								ggg4 = 175
								bbb4 = 0
								if IsControlJustPressed(0, 74) then
									TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinSucc', 0.8)
									pin4 = true
									yyy4 = 0.33
									rrr4 = 14
									ggg4 = 113
									bbb4 = 139
								end
							else
								rrr4 = 152
								ggg4 = 212
								bbb4 = 224
								if IsControlJustPressed(0, 74) then
									TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 3.0, 'PinFail', 0.8)
									rrr4 = 175
									ggg4 = 0
									bbb4 = 0
									Citizen.Wait(50)
									rrr4 = 152
									ggg4 = 212
									bbb4 = 224
									Citizen.Wait(50)
									rrr4 = 175
									ggg4 = 0
									bbb4 = 0
									Citizen.Wait(50)
									rrr4 = 152
									ggg4 = 212
									bbb4 = 224
									pin3 = false
								end
							end
						end
					end
				end)
				
				Citizen.CreateThread(function()
					while otwiera do
						Citizen.Wait(0)
						if not pin1 and not pin2 and not pin3 and not pin4 then
							if IsControlJustPressed(0, 183) then
								if (yyy1 - 0.003) >= (0.36 - 0.04) then
									yyy1 = yyy1 - 0.003
									Citizen.Wait(10)
									if (yyy1 - 0.003) >= (0.36 - 0.04) then
										yyy1 = yyy1 - 0.003
										Citizen.Wait(10)
										if (yyy1 - 0.003) >= (0.36 - 0.04) then
											yyy1 = yyy1 - 0.003
											Citizen.Wait(10)
											if (yyy1 - 0.003) >= (0.36 - 0.04) then
												yyy1 = yyy1 - 0.003
												Citizen.Wait(10)
												if (yyy1 - 0.003) >= (0.36 - 0.04) then
													yyy1 = yyy1 - 0.003
													Citizen.Wait(10)
												end
											end
										end
									end
								end
							end
						elseif pin1 and not pin2 and not pin3 and not pin4 then
							if IsControlJustPressed(0, 183) then
								if (yyy2 - 0.003) >= (0.36 - 0.04) then
									yyy2 = yyy2 - 0.003
									Citizen.Wait(10)
									if (yyy2 - 0.003) >= (0.36 - 0.04) then
										yyy2 = yyy2 - 0.003
										Citizen.Wait(10)
										if (yyy2 - 0.003) >= (0.36 - 0.04) then
											yyy2 = yyy2 - 0.003
											Citizen.Wait(10)
											if (yyy2 - 0.003) >= (0.36 - 0.04) then
												yyy2 = yyy2 - 0.003
												Citizen.Wait(10)
												if (yyy2 - 0.003) >= (0.36 - 0.04) then
													yyy2 = yyy2 - 0.003
													Citizen.Wait(10)
												end
											end
										end
									end
								end
							end
						elseif pin1 and pin2 and not pin3 and not pin4 then
							if IsControlJustPressed(0, 183) then
								if (yyy3 - 0.003) >= (0.36 - 0.04) then
									yyy3 = yyy3 - 0.003
									Citizen.Wait(10)
									if (yyy3 - 0.003) >= (0.36 - 0.04) then
										yyy3 = yyy3 - 0.003
										Citizen.Wait(10)
										if (yyy3 - 0.003) >= (0.36 - 0.04) then
											yyy3 = yyy3 - 0.003
											Citizen.Wait(10)
											if (yyy3 - 0.003) >= (0.36 - 0.04) then
												yyy3 = yyy3 - 0.003
												Citizen.Wait(10)
												if (yyy3 - 0.003) >= (0.36 - 0.04) then
													yyy3 = yyy3 - 0.003
													Citizen.Wait(10)
												end
											end
										end
									end
								end
							end
						elseif pin1 and pin2 and pin3 and not pin4 then
							if IsControlJustPressed(0, 183) then
								if (yyy4 - 0.003) >= (0.36 - 0.04) then
									yyy4 = yyy4 - 0.003
									Citizen.Wait(10)
									if (yyy4 - 0.003) >= (0.36 - 0.04) then
										yyy4 = yyy4 - 0.003
										Citizen.Wait(10)
										if (yyy4 - 0.003) >= (0.36 - 0.04) then
											yyy4 = yyy4 - 0.003
											Citizen.Wait(10)
											if (yyy4 - 0.003) >= (0.36 - 0.04) then
												yyy4 = yyy4 - 0.003
												Citizen.Wait(10)
												if (yyy4 - 0.003) >= (0.36 - 0.04) then
													yyy4 = yyy4 - 0.003
													Citizen.Wait(10)
												end
											end
										end
									end
								end
							end
						elseif pin1 and pin2 and pin3 and pin4 then
							otwiera = false
							pin1 = false
							pin2 = false
							pin3 = false
							pin4 = false
							rrr1 = 152
							ggg1 = 212
							bbb1 = 224
							rrr2 = 152
							ggg2 = 212
							bbb2 = 224
							rrr3 = 152
							ggg3 = 212
							bbb3 = 224
							rrr4 = 152
							ggg4 = 212
							bbb4 = 224
							yyy1 = 0.36
							yyy2 = 0.36
							yyy3 = 0.36
							yyy4 = 0.36
				
							
							local playerPed = PlayerPedId()
							local coords    = GetEntityCoords(playerPed)
							local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
							local plate = GetVehicleNumberPlateText(vehicle)
				
							SetVehicleDoorsLocked(vehicle, 1)
							PlayVehicleDoorOpenSound(vehicle, 0)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)
							ClearPedTasksImmediately(playerPed)
							DisableControlAction(0, 73, false)
							ESX.ShowNotification('lock pick movafagh boud!')
							NetworkRequestControlOfEntity(vehicle)
		
							local timeout = 2000
							while timeout > 0 and not NetworkHasControlOfEntity(vehicle) do
								Wait(100)
								timeout = timeout - 100
							end
						
							SetEntityAsMissionEntity(vehicle, true, true)
							
							local timeout = 2000
							while timeout > 0 and not IsEntityAMissionEntity(vehicle) do
								Wait(100)
								timeout = timeout - 100
							end
							SetVehicleAlarmTimeLeft(vehicle, 100000)
							local shanskiri = math.random(1,100)
							if shanskiri > 50 then
								local playerCoords = GetEntityCoords(PlayerPedId())
								TriggerEvent('skinchanger:getSkin', function(skin)
									playerGender = skin.sex
								end)
								streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
								streetName = GetStreetNameFromHashKey(streetName)
								TriggerServerEvent('esx_outlawalert:carJackInProgress', {
									x = ESX.Math.Round(playerCoords.x, 1),
									y = ESX.Math.Round(playerCoords.y, 1),
									z = ESX.Math.Round(playerCoords.z, 1)
								}, streetName, ESX.GetVehicleLabelFromHash(GetEntityModel(vehicle)), playerGender)
							end
							TriggerServerEvent('lockpick:alarm',ESX.Math.Trim(plate),ESX.GetVehicleLabelFromHash(GetEntityModel(vehicle)))
							igrekPin1 = (math.random(3250, 3550) * 0.0001)
							igrekPin2 = (math.random(3250, 3550) * 0.0001)
							igrekPin3 = (math.random(3250, 3550) * 0.0001)
							igrekPin4 = (math.random(3250, 3550) * 0.0001)
						end
					end
				end)
				
				Citizen.CreateThread(function()
					while otwiera do
						Citizen.Wait(10)
						if not pin1 then
							if yyy1 < 0.36 then
								yyy1 = yyy1 + 0.0004
							end
						end
						if not pin2 then
							if yyy2 < 0.36 then
								yyy2 = yyy2 + 0.0004
							end
						end
						if not pin3 then
							if yyy3 < 0.36 then
								yyy3 = yyy3 + 0.0004
							end
						end
						if not pin4 then
							if yyy4 < 0.36 then
								yyy4 = yyy4 + 0.0004
							end
						end
					end
				end)
			else
				ESX.Alert('','Saheb mashin nazdik ast!',7000,'error')
			end
		end,plate,ESX.GetPlayersToSend(10))	
	else
		ESX.ShowNotification('Mashini nazdik shoma nist!')
	end
end)
