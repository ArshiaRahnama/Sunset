lua54 'yes'
fx_version 'bodacious'

game 'gta5'

server_scripts {
	'@litesql/lib/MySQL.lua',
	'@essentialmode/locale.lua',
	'include-sv.lu*',
	'config.lu*',
	'config_server.lu*',

	'common/main.lu*',
	'common/functions.lu*',
	
	'server/main.lu*',
	'server/functions.lu*',
	'server/load.lu*',
	'modules/**/config.lu*',
	'modules/**/config_server.lu*',
	'modules/**/common/**/*.lua',
	'modules/**/server/**/*.lua',
}

client_scripts {
	'@ox_lib/init.lua',
	'config.lu*',
	'include.lu*',
	'@essentialmode/locale.lua',
	'common/main.lu*',
	'common/functions.lu*',
	
	'client/load.lu*',
	'client/main.lu*',
	'client/events.lu*',
	'client/functions.lu*',
	
	'modules/*/config.lu*',
	'modules/**/client/**/config.lua',
	'modules/**/common/**/*.lua',
	'modules/**/client/**/*.lua',
}
