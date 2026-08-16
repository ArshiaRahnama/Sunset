fx_version 'bodacious'
game 'gta5'

server_scripts {
	'@litesql/lib/MySQL.lua',
  'server.lua'
} 

ui_page 'index.html'

files {
  "index.html",
  "scripts.js",
  "css/style.css"
}
client_script {
  "client.lua",
  "hotwire.lua"
}

export "taskBar"
export "closeGuiFail"
