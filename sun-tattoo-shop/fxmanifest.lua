fx_version 'adamant'

game 'gta5'

server_scripts {
	'@essentialmode/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua',
	'client/tattooList.lua',
}

client_scripts {
	'@essentialmode/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/tattooList.lua',
	'client/main.lua'
}


files {
	'data/*.xml',
}

data_file 'PED_OVERLAY_FILE'     'data/*.xml'