fx_version 'cerulean'
game 'gta5'


ui_page 'html/index.html'

client_scripts {
    'Client/*.lua',
    '@icon_menu/lib/IconMenu.lua'
}

server_scripts {
	"@litesql/lib/MySQL.lua",
    'Server/*.lua'
}

shared_scripts {
    "Config.lua"
}

files {
    'html/index.html',
    'html/css/*.css',
    'html/*.css',
    'html/js/*.js',
    'html/js/*.js.map',
    'html/img/*.png',
    'html/img/*.jpg',
    'html/img/*.gif',
    -- 'html/_sounds/*.mp3',
}