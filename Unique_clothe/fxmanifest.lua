fx_version 'bodacious'
game 'gta5'


server_scripts {
  '@litesql/lib/MySQL.lua',
  'config.lua',
  'server/main.lua',
}

client_scripts {
  '@essentialmode/locale.lua',
  'client/main.lua',
}