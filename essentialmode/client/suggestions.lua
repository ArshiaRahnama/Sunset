Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/dduty', 'Toggle dispatch duty')	
	TriggerEvent('chat:addSuggestion', '/dlist', 'Show dispatch list')
	TriggerEvent('chat:addSuggestion', '/weapback', 'Toggle weapon on back')
	TriggerEvent('chat:addSuggestion', '/sunsetpay', 'Sunset pay')
	TriggerEvent('chat:addSuggestion', '/fbipay', 'FBI pay')

	--crosshair
	TriggerEvent('chat:addSuggestion', '/cross', 'Toggle crosshair')
	TriggerEvent('chat:addSuggestion', '/crosse', 'Edit crosshair')
	TriggerEvent('chat:addSuggestion', '/crossr', 'Reset crosshair')

	--
	TriggerEvent('chat:addSuggestion', '/resetplan', 'Reset plan')
	TriggerEvent('chat:addSuggestion', '/glist', 'List a\'azaye gang')
	TriggerEvent('chat:addSuggestion', '/flist', 'List a\'azaye job')
	TriggerEvent('chat:addSuggestion', '/admins', 'List admin ha')
	TriggerEvent('chat:addSuggestion', '/f', '',{
		{name = 'msg', help = 'Message' }
	})
	TriggerEvent('chat:addSuggestion', '/dep', '',{
		{name = 'msg', help = 'Message' }
	})
	TriggerEvent('chat:addSuggestion', '/findnumber', '',{
		{name = 'number', help = 'number' }
	})
	TriggerEvent('chat:addSuggestion', '/findplate', '',{
		{name = 'plate', help = 'plate' }
	})
	TriggerEvent('chat:addSuggestion', '/banbank', 'Ban hesab banki',{
		{name = 'identifier', help = 'HEX/Name'},
		{name = 'state', help = '0/1'},
		{name = 'reason', help = 'Reason'}
	})
	TriggerEvent('chat:addSuggestion', '/banplate', 'Ban plate',{
		{name = 'plate', help = 'plate'},
		{name = 'state', help = '0/1'},
		{name = 'reason', help = 'Reason'}
	})

	TriggerEvent('chat:addSuggestion', '/banparking', 'Ban parking',{
		{name = 'hex', help = 'hex'},
		{name = 'state', help = '0/1'},
		{name = 'reason', help = 'Reason'}
	})

	TriggerEvent('chat:addSuggestion', '/fwarn', 'Set warn',{
		{name = 'identifier', help = 'HEX/Name'},
		{name = 'reason', help = 'Reason or 0'}
	})

	TriggerEvent('chat:addSuggestion', '/checkacc', 'Check account',{
		{name = 'identifier', help = 'HEX/Name'}
	})

	TriggerEvent('chat:addSuggestion', '/checkfightban', 'Check fight ban')
	TriggerEvent('chat:addSuggestion', '/checkdysban', 'Check dys ban')

	TriggerEvent('chat:addSuggestion', '/edivision', 'Add/Remove extra division',{
		{name = 'ID', help = 'ID'},
		{name = 'Division', help = 'Division'}
	})

	TriggerEvent('chat:addSuggestion', '/regfbi', 'Register menu',{
		{name = 'ID', help = 'ID'},
	})

	TriggerEvent('chat:addSuggestion', '/p', 'Party chat',{
		{name = 'Message', help = ''},
	})

	TriggerEvent('chat:addSuggestion', '/rlist', 'Namayesh a\'azaye radio')

	TriggerEvent('chat:addSuggestion', '/shophook', 'Tanzim webhook shop haye ekhtesasi')

	TriggerEvent('chat:addSuggestion', '/tabligh', 'Ersal tabligh be weazel news',{
		{name = 'matn', help = 'Matn tabligh'}
	})

	TriggerEvent('chat:addSuggestion', '/ads', 'Namayesh list tablighat')

	TriggerEvent('chat:addSuggestion', '/ad', 'accept or decline tabligh',{
		{name = 'id tabligh', help = 'shomare tabligh'},
		{name = 'view / accept / decline', help = 'namayesh ya accept ya decline tabligh'},
	})

	TriggerEvent('chat:addSuggestion', '/news', 'Khabar',{
		{name = 'Matn', help = 'Mant Khabar' }
	})

	TriggerEvent('chat:addSuggestion', '/vreg', 'Taghir region voice')
	TriggerEvent('chat:addSuggestion', '/vr', 'Reset voice')

	TriggerEvent('chat:addSuggestion', '/showgang', 'Namayes gang ha')

	TriggerEvent('chat:addSuggestion', '/me', 'Me', {
		{name, 'Matn', help = 'Matn'}
	})
	TriggerEvent('chat:addSuggestion', '/do', 'Do', {
		{name, 'Matn', help = 'Matn'}
	})

	TriggerEvent('chat:addSuggestion', '/cm', 'Capture menu')
    TriggerEvent('chat:addSuggestion', '/pvp', 'Join pvp')
    TriggerEvent('chat:addSuggestion', '/die', 'Die(Just pvp)')
    TriggerEvent('chat:addSuggestion', '/detach', 'Detach weapon attachment')
    TriggerEvent('chat:addSuggestion', '/g', 'Gang chat')

	TriggerEvent('chat:addSuggestion', '/takehostage', 'Azad sazi gerogan')
	TriggerEvent('chat:addSuggestion', '/radialmenu', 'END Menu')
	TriggerEvent('chat:addSuggestion', '/bimeh', 'Namayesh vaziat bimeh mashin')
	TriggerEvent('chat:addSuggestion', '/carbimeh', 'Baz kardan menu kharid bimeh',{
		{name = 'ID', help = 'ID'},
	})

	TriggerEvent('chat:addSuggestion', '/delobjectjob', 'Delete kardan object haye spawn shode tavasot job')
	TriggerEvent('chat:addSuggestion', '/mg', 'G')
	TriggerEvent('chat:addSuggestion', '/play', 'View time play')
end)
