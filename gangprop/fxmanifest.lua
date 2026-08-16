fx_version 'bodacious'
game 'gta5'
lua54 'yes'
server_scripts {
  '@essentialmode/locale.lua',
  'locales/en.lua',
  '@litesql/lib/MySQL.lua',
  'config.lua',
  'server/main.lua'
}

client_scripts {
  '@essentialmode/locale.lua',
  'locales/en.lua',
  'config.lua',
  'client/main.lua'
}
shared_script '@ox_lib/init.lua'