fx_version 'bodacious'
game 'gta5'

client_script 'client/main.lua'

server_scripts {
    '@litesql/lib/MySQL.lua',
    'server/client_source.lua',
    'server/classes/capture.lua',
    'server/main.lua',
}

ui_page {
    'html/ui.html'
}

files {
    "html/ui.html",
    'html/assets/script.js',
    'html/assets/imgs/benzin.jpg',
    'html/assets/imgs/drug.jpg',
    'html/assets/imgs/weapon.jpg',
    'html/assets/imgs/proccess.png',
    'html/assets/imgs/black_market.jpg'
}