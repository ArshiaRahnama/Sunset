Config = {}

Config.NPCSpawnDistance = 100.0
Config.ObjectSpawnDistance = 200.0
local poly = lib.zones.poly({
    points = {
        vec(413.8, -1026.1, 29),
        vec(411.6, -1023.1, 129),
    },
    thickness = 2,
})
poly:remove()