fx_version 'bodacious'
game 'gta5'

server_scripts {
	"config.lua",
	"server/server.lua",
	"@litesql/lib/MySQL.lua",
}

client_scripts {
	"config.lua",
	"client/utils.lua",
	"client/client.lua"
}