fx_version 'cerulean'
game 'common'

dependencies {
	'/server:5104',
}

client_script 'ui.lua'
server_script 'dist/build.js'

files {
	'ui/build/index.html',
	'ui/build/**/*'
}

ui_page 'ui/build/index.html'