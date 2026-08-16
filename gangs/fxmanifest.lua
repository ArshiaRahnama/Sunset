fx_version 'bodacious'
game 'gta5'
lua54 'yes'

server_scripts {
	'@litesql/lib/MySQL.lua',
	'@essentialmode/locale.lua',
	'addonaccount/addonaccount.lua',
	'addonaccount/addon_main.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua',

}
server_exports {
	'getgangxp'
}

client_scripts {
	'@ox_lib/init.lua',
	'@essentialmode/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua',
	'client/ped.lua',
	-- 'asb.lua'
}
