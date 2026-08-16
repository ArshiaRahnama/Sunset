fx_version 'bodacious'
game 'gta5'

server_script 'server/main.lua'
client_script 'client/main.lua'

ui_page 'html/ui.html'

files {
	-- Main Files
	'html/ui.html',
	'html/fonts/*.otf',
    'html/css/index.css',
	'html/js/script.js',
	'html/js/main.js',
	-- Images
	'html/css/*.png',
	'html/css/Robb/*.png',
	'html/css/Job/*.png',
	'html/images/Assets/*.*',
}

server_exports {
	'GetCounts',
	'GetAdmins',
	'GetJob',
	'GetJobs',
	'GetGang',
	'GetGangs'
}








