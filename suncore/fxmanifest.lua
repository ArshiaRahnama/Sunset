fx_version 'adamant'
games {'gta5'}
client_script 'client/*.lua'
server_script '@litesql/lib/MySQL.lua'
server_script 'server/*.lua'
ui_page "html/index.html"

files {
    'html/index.html',
    --'html/js/*.js',
    'data/*.meta',
}
exports {
    'SetPlayerVisible',
    'Whitelist',
}
server_export 'adminmsg'




data_file 'WEAPONINFO_FILE_PATCH' 'data/weaponsnowball.meta'