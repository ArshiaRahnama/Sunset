fx_version 'adamant'

game 'gta5'
lua54 'yes'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'config.lua',
	'client/main.lua',
	'client/data.lua',
}

files {
    'html/*.html',
    'html/js/*.js',
    'html/css/*.css',
    'html/img/*.svg',
	'html/css/*.ttf',
}

ui_page 'html/index.html'