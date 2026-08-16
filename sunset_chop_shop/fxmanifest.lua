fx_version 'adamant'

game 'gta5'

version '1.0.0'

shared_scripts {
	'config.lua'
}

server_scripts {
	'@litesql/lib/MySQL.lua',
	'server/*.lua',
}

client_scripts {
	'client/*.lua'
}

files {
	'background.png'
}

















