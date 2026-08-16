gymConfig = {
    gyms = {
        ['test'] = {
            coords = vec(-1201.84, -1566.46, 4.61, 20.0),
            label = 'Gym HAMID',
            disableBlip = false,
            locations = {
                dumbbells = {
                    coords = {
                        vec(-1209.44, -1558.76, 4.61, 1.0)
                    },
                    label = 'Dambel',
                }
            }
        }
    },
    animations = {
        ['dumbbells'] = {
            model = `prop_barbell_01`,
            idle = {
                dict = 'amb@world_human_muscle_free_weights@male@barbell@idle_a',
                anim = 'idle_a',
            },
            action = {
                dict = 'amb@world_human_muscle_free_weights@male@barbell@base',
                anim = 'base',
            },
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
        ['chinup'] = {
            Type = 1,
            label = 'Barfix',
            Scenario = 'PROP_HUMAN_MUSCLE_CHIN_UPS',
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
        ['situp'] = {
            Type = 0,
            label = 'Deraz Neshast',
            AnimDict = 'amb@world_human_sit_ups@male@idle_a',
            Anim = 'idle_a',
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
        ['weights'] = {
            Type = 1,
            label = 'Barbell forearm',
            Scenario = 'WORLD_HUMAN_MUSCLE_FREE_WEIGHTS',
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
        ['pushup'] = {
            Type = 0,
            label = 'Shena',
            AnimDict = 'amb@world_human_push_ups@male@idle_a',
            Anim = 'idle_d',
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
        ['jog'] = {
            Type = 1,
            label = 'warm up',
            Scenario = 'WORLD_HUMAN_JOG_STANDING',
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
        ['flex'] = {
            Type = 1,
            label = 'Flex',
            Scenario = 'WORLD_HUMAN_MUSCLE_FLEX',
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
        ['yoga'] = {
            Type = 1,
            label = 'Yoga',
            Scenario = 'WORLD_HUMAN_YOGA',
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
        ['bench'] = {
            Type = 1,
            label = 'HALTER CHEST PRESS',
            Scenario = 'PROP_HUMAN_SEAT_MUSCLE_BENCH_PRESS_PRISON',
            set = {
                count = 5,
                time = 10000,
                cb = function()
                    ESX.TriggerServerEvent('gym:addSkill', 0.1)
                    removeStress('gym')
                end,
            }
        },
    },
    objects = {
        {model = `prop_weight_squat`,    label = 'Barbell forearm', AnimName = 'weights', RelativeCoords = vector3(0.0, -0.5, 0.0),      RelativeHeading = -180.0 },
        {model = `prop_muscle_bench_03`, label = 'HALTER CHEST PRESS', AnimName = 'bench',   RelativeCoords = vector3(0.0, -0.15, -0.25),   RelativeHeading = -180.0 },
        {model = `prop_pris_bench_01`,   label = 'HALTER CHEST PRESS', AnimName = 'bench',   RelativeCoords = vector3(0.0, -0.15, -0.25),   RelativeHeading = -180.0 },
        {model = `prop_beach_bars_02`,   label = 'Barfix',   AnimName = 'chinup',  RelativeCoords = vector3(0.0, -0.15, 1.0),     RelativeHeading = 0.0    },
        {model = `prop_pris_bars_01`,    label = 'Barfix',   AnimName = 'chinup',  RelativeCoords = vector3(-1.5, -0.15, 1.0),   RelativeHeading = 0.0    },
    },
    GymExercices = {
        { coords = vector3(-1199.98, -1571.15, 4.61), heading = 215.0,  AnimName = 'chinup'},
        { coords = vector3(-1204.75, -1564.34, 4.61), heading = 35.0,   AnimName = 'chinup'},
        { coords = vector3(-1202.11, -1570.3,  3.61), heading = 300.0,  AnimName = 'pushup'},
        { coords = vector3(-1204.14, -1561.57, 3.61), heading = 300.0,  AnimName = 'pushup'},
        -- { coords = vector3(-1205.69, -1572.13, 4.61), heading = 300.0,  AnimName = 'flex'  },
        { coords = vector3(-1206.39, -1568.3,  4.61), heading = 300.0,  AnimName = 'jog'   },
        { coords = vector3(-1207.9, -1566.22,  4.61), heading = 300.0,  AnimName = 'jog'   },
        { coords = vector3(-1202.63, -1559.31, 4.62), heading = 125.0,  AnimName = 'jog'   },
        { coords = vector3(-1203.5, -1567.67, 4.01),  heading = 220.0,  AnimName = 'situp' },
        { coords = vector3(-1201.58,-1566.17, 4.01),  heading = 220.0,  AnimName = 'situp' },
        { coords = vector3(-1199.38, -1565.37, 4.01), heading = 305.63, AnimName = 'situp' },
    }
}