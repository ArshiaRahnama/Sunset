fx_version 'cerulean'
game 'gta5'

ui_page 'html/index.html'
client_scripts {
    'Config.lua',
    'Client/*.lua'
}

server_scripts{
    '@litesql/lib/MySQL.lua',
    'Config.lua',
    'Server/*.lua',
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