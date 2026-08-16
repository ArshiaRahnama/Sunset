Config = {}
Config.Toggle = true -- use toggle mode. False requires hold of key
Config.UseWhilstWalking = false -- use whilst walking
Config.EnableExtraMenu = true
Config.Fliptime = 15000

Config.MenuItems = {
    {
        id = 'citizen',
        title = 'Fast menu',
        icon = 'user',
        items = {
            {
                id    = 'givenum',
                title = 'Copy phone number',
                icon = 'square-phone',
                type = 'client',
                event = 'sunset_phone:CopyNumber',
                shouldClose = true,
            },
            {
                id    = 'nearplate',
                title = 'Copy near vehicle plate',
                icon = 'car',
                type = 'client',
                event = 'copynearplate',
                shouldClose = true,
            },
            {
                id    = 'HEX',
                title = 'Copy steam hex',
                icon = 'steam',
                type = 'client',
                event = 'copyhex',
                shouldClose = true,
            },
            {
                id    = 'house',
                title = 'Available houses blip',
                icon = 'house',
                type = 'client',
                event = 'togglehouseblip',
                shouldClose = false,
            },
            {
                id    = 'weaponserial',
                title = 'Copy current weapon serial',
                icon = 'gun',
                type = 'client',
                event = 'CopyCurrentWeaponSerial',
                shouldClose = true,
            },
        }
    },
    {
        id = 'gps',
        title = 'GPS Menu',
        icon = 'map-location',
        items = {
            {
                id    = 'sendalert',
                title = 'Send alert',
                icon = 'map-location-dot',
                type = 'client',
                event = 'radio:sendAlert',
                shouldClose = true,
            },
            {
                id    = 'sendalert',
                title = 'Show gps',
                icon = 'location-pin',
                type = 'client',
                event = 'radio:gs',
                shouldClose = true,
            },
        }
    },
}