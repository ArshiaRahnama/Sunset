fx_version 'cerulean'
game 'gta5'

--[[

  ESX RP Chat test

--]]


description 'ESX Chat'

version '1.0.0'

client_script 'client/main.lua'

server_scripts {

  '@litesql/lib/MySQL.lua',
  'server/main.lua'

}

ui_page('index.html') --HEAD BAG IMAGE

files {
    'index.html'
}







