configAsghar = {
    Price = 15000,
    ReviveTime = 15, -- seconds until you are revived
    Hospitals = {

        { -- MD 1
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(1122.7, -1539.66, 34.87), heading = 12.99 },
            },
            Access = {
                ['all'] = true,
            }
        },

        { -- MD 2
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false }, -- hospitall new 2
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(-1873.46, -321.98, 49.25), heading = 234.91 },
            },
            Access = {
                ['all'] = true,
            }
        },

        { -- MD palato
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false }, -- hospitall new
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(-247.19, 6314.1, 32.43), heading = 45.36},
            },
            Access = {
                ['all'] = true,
            }
        },

        { -- fbi justic
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false }, -- police st2
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(1765.61, 2599.49, 45.73), heading = 182.89},
            },
            Access = {
                ['all'] = false,
                ['fbi'] = true,
                ['justice'] = true,
            }
        },

        { -- fbi prison
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false }, -- police st2
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(-569.91, -196.49, 43.37), heading = 210.65},
            },
            Access = {
                ['all'] = false,
                ['fbi'] = true,
                ['justice'] = true,
            }
        },

        { -- PD 1
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(441.43, -974.68, 25.7), heading = 183.56},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

        { -- PD 2
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(613.71, 11.71, 87.82), heading = 250.65},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

        { -- PD 3
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(-64.79, -2517.69, 7.39), heading = 330.19},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

        { -- PD 4 ist Bazresi
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(1543.3, 824.76, 82.13), heading = 235.49},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

        { -- PD 5
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(-1079.38, -836.91, 4.88), heading = 213.19},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

        { -- PD 6 Army
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(-2355.75, 3252.01, 32.81), heading = 67.34},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

        { -- PD 7 Detective
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(847.09, -1279.6, 28.25), heading = 179.06},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

        { -- SH Sandy
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(1826.47, 3681.95, 34.19), heading = 223.72},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

        { -- SH Paleto
            Bed = { coords = vec(255.84, -1352.3, 25.52), heading = 317.0, occupied = false },
            Peds = { pedHash = -730659924, doctor = { coords = vec(255.2, -1351.74, 23.55), heading = 232.59 },
                reception = { coords = vec(-448.45, 6016.94, 32.29), heading = 230.12},
            },
            Access = {
                ['all'] = false,
                ['police'] = true,
                ['sheriff'] = true,
                ['mt'] = true,
                ['detective'] = true,
            }
        },

    },
}

asgharStrings = {
    ['get_help'] = [[Press %s to get help for ~g~$%s]],
    ['not_enough'] = [[You don't have enough money!]],
    ['getting_help'] = [[You are getting help, %s seconds left!]],
    ['occupied'] = [[The bed is occupied! Come back later]]
}