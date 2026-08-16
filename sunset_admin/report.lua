Config_RPS = {
	AntiSpamTime = 10 * 60 * 1000,
	ReportCats = {
		{"REPORT_COMBAT_LOGOUT", "Combat Logout"},
		{"REPORT_KOS", "K.O.S"},
		{"REPORT_NCZ_SAFEZONE", "N.C.Z & Safe Zone"},
		{"REPORT_POWER_GAMING", "Power Gaming"},
		{"REPORT_VDM", "VDM"},
		{"REPORT_FEAR_RP", "Fear Rp"},
		{"REPORT_SEARCH", "Search"},
		{"REPORT_META_GAMING", "Meta Gaming"},
		{"REPORT_MIX_IC_OOC", "MIX IC OOC"},
		{"REPORT_FAHASHI", "Fahashi"},
		{"REPORT_BUG_GLITCH", "Bug & Glitch"},
		{"HELP", "Soal"},
		{"REPORT_MORE", "More"},
	}
}

local result = ""
local AntiSpamReport = false

local function IsMenuOpen()
	return (JayMenu.IsMenuOpened('report') or string.find(tostring(JayMenu.CurrentMenu() or ""), "REPORT_"))
end

local function OpenMenu()
	if AntiSpamReport then
		ESX.ShowNotification("Shoma Dar Har ~r~".. ESX.Math.Round((Config_RPS.AntiSpamTime / 1000) / 60) .." Daghighe~s~ Faghat Mitavanid 1 ~r~Report~s~ Ersal Konid!")
		return
	end

	if not IsMenuOpen() then
		JayMenu.OpenMenu('report')
	end
end
RegisterCommand('report',OpenMenu)
Citizen.CreateThread(function()
	while ESX == nil do Citizen.Wait(1) end 
	ESX.TriggerServerCallback('sunset_main:GetReportTimeOut', function(timeout)
        if timeout ~= nil and timeout > 0 then
			Config_RPS.AntiSpamTime = timeout * 60 * 1000
        end
    end)
	JayMenu.CreateMenu("report", "Sunset Report Menu", function()
		result = ""
		return true
	end)
	JayMenu.SetTitleColor('report', 255, 113, 0, 255)
	JayMenu.SetSubTitle('report', 'Choose Your Report')
	for k, v in ipairs(Config_RPS.ReportCats) do
		JayMenu.CreateSubMenu(v[1], 'report', v[2])
		JayMenu.SetSubTitle(v[1], v[2])
	end

    while true do
        Citizen.Wait(0)
        if JayMenu.IsMenuOpened('report') then
            for k, v in ipairs(Config_RPS.ReportCats) do
				JayMenu.MenuButton(v[2], v[1])
			end
			JayMenu.Display()
		end

		for k, v in ipairs(Config_RPS.ReportCats) do
			if JayMenu.IsMenuOpened(v[1]) then
				local clicked, hovered = JayMenu.Button("Report Reason", "~HUD_COLOUR_RED~"..v[2])
				if v[1] == "HELP" then
					--TriggerServerEvent('SendReport', v[2],v[2])
					JayMenu.CloseMenu()
					result = ""
					ESX.TriggerServerCallback('helper:findNumber',function(cb)
						if not cb then
							TriggerServerEvent('SendReport', v[2],v[2])
							sendScreenshot()
						end
					end)
					AntiSpamReport = true
					SetTimeout(Config_RPS.AntiSpamTime, function()
						AntiSpamReport = false
					end)
				else
					if v[1] == "REPORT_MORE" then
						local clicked, hovered = JayMenu.Button("Type Your Report")
						if clicked then
							DisplayOnscreenKeyboard(1, "", "", result, "", "", "", 128)
							while (UpdateOnscreenKeyboard() == 0) do
								DisableAllControlActions(0);
								Wait(0);
							end
							if (GetOnscreenKeyboardResult()) then
								result = GetOnscreenKeyboardResult()
							end
						end
					end
					local clicked, hovered = JayMenu.Button("~HUD_COLOUR_GREEN~Send Report")
					if clicked and v[1] == "REPORT_MORE" then
						if #result < 10 then
							ESX.ShowNotification("Lotfan hadaghal ~r~10 character~s~ darbare report khod benevisid!")
						else
							TriggerServerEvent('SendReport', result,v[2])
							sendScreenshot()
							JayMenu.CloseMenu()
							result = ""
							AntiSpamReport = true
							SetTimeout(Config_RPS.AntiSpamTime, function()
								AntiSpamReport = false
							end)
						end
					elseif clicked then
						TriggerServerEvent('SendReport', v[2],v[2])
						sendScreenshot()
						JayMenu.CloseMenu()
						result = ""
						AntiSpamReport = true
						SetTimeout(Config_RPS.AntiSpamTime, function()
							AntiSpamReport = false
						end)
					end
				end
				JayMenu.Display()
			end
		end
    end
end)

RegisterNetEvent('ReportCoolown',function(min)
	ESX.ShowNotification("Shoma ta ~r~".. min .. " daghighe~s~ digar nemitavanid ~r~report~s~ ersal konid!")
end)

RegisterNetEvent('SetReportCoolown',function(min)
	Config_RPS.AntiSpamTime = min * 60 * 1000
end)

RegisterNetEvent('CancelReport',function(min)
	Wait(2000)
	ExecuteCommand('cancelreport')
end)

local reports = {}
local isMenuOpen = false
local isInDetails = false
RegisterCommand('reportm',function(src, args)
	if isAdmin then
		local unvar = args[1]
		isMenuOpen = true
		updateReports(unvar)
		openReportMenu(true)
		Citizen.CreateThread(function()
			while isMenuOpen do 
				if not isInDetails then
					updateReports(unvar)
					openReportMenu(true)
				end
				Citizen.Wait(3000)
			end
		end)
	end
end)

function updateReports(unvar)
	local p = promise.new()
	ESX.TriggerServerCallback('report:getReports', function(cb)
		p:resolve(cb)
	end, unvar)
	reports = Citizen.Await(p)
end

function openReportMenu(state)
	SetNuiFocus(state, state)
	if state then
		SendNUIMessage({
			action = "updateReportList",
			reportList = reports
		})
		SendNUIMessage({
			action = "openReportList",
		})
	end
end

function sendScreenshot()
	ESX.TriggerServerCallback('report:getWebhook',function(hook)
		if hook then
			exports['screenshot-basic']:requestScreenshotUpload(hook, "files[]", function(data)
				local image = json.decode(data)
				TriggerServerEvent('report:setPhoto', image.attachments[1].proxy_url)
			end)
		end
	end)
end

RegisterNUICallback("action", function(data)
	local action = data.action
	if action ~= "solvedreport" and action ~= "morebutton" and action ~= "morebuttonback" then
		SetNuiFocus(false, false)
		isMenuOpen = false
	end

	if action == "closeReport" then
		ExecuteCommand('cr '.. data.id)
	elseif action == 'teleport' then
		ExecuteCommand('goto '.. data.id)
	elseif action == 'spectate' then
		ExecuteCommand('sp '.. data.id)
	elseif action == "morebuttonback" then
		isInDetails = false
	elseif action == "morebutton" then
		isInDetails = true
	end
end)