fx_version 'bodacious'
game 'gta5'

client_script 'client.lua'
server_scripts {'@litesql/lib/MySQL.lua','server.lua'}
ui_page 'html/index.html'

files {
	'html/index.html',
    'html/style.css',
	'html/app.js',
    'html/Job/*.png'
}

export {
    'LoadNotif',
    'UnLoadNotif',
    'GetData'
}






