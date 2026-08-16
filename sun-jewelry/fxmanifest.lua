fx_version 'adamant'

game 'gta5'

client_scripts {
	'@essentialmode/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client/*.lua'
}

server_scripts {
	'@essentialmode/locale.lua',
	'locales/*.lua',
	'config.lua',
	'server/*.lua',
	'@litesql/lib/MySQL.lua',
}




lua54 'yes'
shared_script '@ox_lib/init.lua'
