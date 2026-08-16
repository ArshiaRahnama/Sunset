lua54 'yes'
fx_version 'bodacious'

game 'gta5'
description 'Sunset BoomBox'

client_script '@sunset_utils/include.lua'
server_scripts {
	'@essentialmode/locale.lua',
	'config.lu*',
	'locales/en.lu*',
	'server/main.lu*'
}

client_script {
	'@essentialmode/locale.lua',
	'client/main.lu*',
	'config.lu*',
	'locales/en.lu*',
}

ui_page('html/index.html')

files {
	'html/index.html',
	'html/js/app.js'
}
