fx_version 'cerulean'
game 'gta5'



client_scripts {
	'@essentialmode/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

server_scripts {
	'@essentialmode/locale.lua',
	'@litesql/lib/MySQL.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}