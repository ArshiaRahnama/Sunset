local Ipls = {
   -- bike = {name = "bike", fuc = exports.bob74_ipl:GetBikerClubhouse2Object()},
   -- executive3 = {name = "executive3", fuc = exports.bob74_ipl:GetExecApartment3Object() },
   -- executive2 = {name = "executive2", fuc = exports.bob74_ipl:GetExecApartment2Object() },
   -- executive1 = {name = "executive1", fuc = exports.bob74_ipl:GetExecApartment1Object() }
}

ConfigTeleporter = {
------------------------------------------------ # police --------------------------------------------------------------------
    { -- Police Fast Teleporter
        positions = {
            { coords = vec(479.12,-981.93,30.69,271.09),   label = "[1] Mission Row"    },
            { coords = vec(625.12,-18.98,82.78,337.18),    label = "[2] Vinewood"       },
            { coords = vec(-48.23,-2512.5,7.39,234.2),     label = "[3] Shipping Yard"  },
            { coords = vec(829.65,-1305.43,28.24,280.13),  label = "[4] Detective"      },
            { coords = vec(-1085.9,-849.71,4.88,218.86),   label = "[5] Vespucci"       },
            { coords = vec(387.05,793.23,190.49,356.55),   label = "[6] Park Ranger"    },
            { coords = vec(1826.6,3680.09,38.86,208.09),   label = "[1] Sandy Shores"   },
            { coords = vec(-452.94,5999.43,37.01,224.88),  label = "[2] Paleto Bay"     },
            { coords = vec(-2360.91, 3249.16, 32.81, 333.0),   label = "[0] Army"           },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["police"] = 0, ["sheriff"] = 0, ["detective"] = 0, ["mt"] = 0, ["fbi"] = 5 }
    },
    { -- Police Station 5 Asansor 1
        positions = {
            { coords = vec(-1096.15,-850.15,38.24,307.98), label = "[6] Ceiling"                },
            { coords = vec(-1096.33,-850.09,34.36,220.06), label = "[5] DB-Captain Office"      },
            { coords = vec(-1095.78,-850.78,30.76,219.22), label = "[4] OPS Center-Lt's Office" },
            { coords = vec(-1095.77,-850.76,26.83,308.95), label = "[3] Gym-Briefing Room"      },
            { coords = vec(-1095.93,-850.2,23.04,62.8),    label = "[2] Cafeteria"              },
            { coords = vec(-1096.06,-850.37,19.0,39.67),   label = "[1] Main Hall"              },
            { coords = vec(-1095.87,-850.64,4.88,35.21),   label = "[-1] Jail"                  },
            { coords = vec(-1095.75,-850.87,10.28,39.32),  label = "[-2] Lab-Evidence Room"     },
            { coords = vec(-1095.95,-850.48,13.69,36.53),  label = "[-3] Garage-Armory"         },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["police"] = 0, ["sheriff"] = 0, ["detective"] = 0, ["mt"] = 0, ["fbi"] = 5 }
    },
    { -- Police Station 5 Asansor 2
        positions = {
            { coords = vec(-1065.97,-833.77,27.04,313.32),  label = "[3] Gym-Briefing Room"  },
            { coords = vec(-1065.59,-834.07,19.04,312.44),  label = "[1] Main Hall"          },
            { coords = vec(-1065.98,-833.52,5.48,310.44),   label = "[-1] Jail"              },
            { coords = vec(-1065.7,-833.6,11.04,45.36),     label = "[-2] Lab-Evidence Room" },
            { coords = vec(-1065.58,-834.08,14.88,312.0),   label = "[-3] Garage-Armory"     },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["police"] = 0, ["sheriff"] = 0, ["detective"] = 0, ["mt"] = 0, ["fbi"] = 5 }
    },
    { -- Pd 2 Helli
        positions = { 
            { coords = vec(641.34,12.17,82.79,162.61), label = "Down" },
            { coords = vec(565.95,4.88,103.23,268.69), label = "Up"   },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["police"] = 0, ["sheriff"] = 0, ["detective"] = 0, ["mt"] = 0, ["fbi"] = 5 }
    },
    { -- Pd 5 to meeting
        positions = { 
            { coords = vec(-1042.47,-828.28,10.88,135.18), label = "[5] Vespucci" },
            { coords = vec(2154.62,2920.91,-61.9,86.27),   label = "Meeting"      },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["police"] = 0, ["sheriff"] = 0, ["detective"] = 0, ["mt"] = 0, ["fbi"] = 5 }
    },

------------------------------------------------ # FBI ------------------------------------------------------------------------
    { -- FBI Public Asansor
        positions = { 
            { coords = vec(136.16,-761.89,242.15,162.37), label = "[1] FBI Office"  },
            { coords = vec(136.15,-761.69,45.75,162.26),  label = "[0] Main"        },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false
    },
    { -- FBI Public Asansor new 
        positions = { 
            { coords = vec(2504.26,-433.44,106.91,317.45), label = "[1] FBI Office" }, 
            { coords = vec(2504.26,-433.38,99.11,309.56),  label = "[0] Main"       }, 
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false
    },
    { -- FBI Private Asansor
        positions = { 
            { coords = vec(141.11,-735.78,262.84,161.42), label = "[3] Helli"       },
            { coords = vec(115.23,-741.36,258.15,334.9),  label = "[2] FBI Office2" },
            { coords = vec(138.98,-762.76,45.75,159.74),  label = "[0] Main"        },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["police"] = 0, ["sheriff"] = 0, ["detective"] = 0, ["mt"] = 0, ["fbi"] = 0 }  
    }, 
    { -- FBI Private Asansor new
    positions = { 
            { coords = vec(2512.18,-336.02,115.59,130.58), label = "[3] Helli"    }, 
            { coords = vec(2504.56,-341.95,105.69,129.6),  label = "[2] Jail"     }, 
            { coords = vec(2504.66,-341.91,101.89,136.51), label = "[1] 3 Floor"  }, 
            { coords = vec(2504.5,-342.09,94.09,137.6),    label = "[0] Main"     }, 
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["police"] = 0, ["sheriff"] = 0, ["detective"] = 0, ["mt"] = 0, ["fbi"] = 0 }  
    }, 
    { -- FBI justice Asansor 
    positions = { 
            { coords = vec(-520.45, -189.47, 46.17, 209.19),   label = "[1] Up"    }, 
            { coords = vec(-516.72, -210.89, 38.17, 117.25),   label = "[2] Down"  }, 
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["fbi"] = 0, ["justice"] = 0 }
    },
    { -- Army Asansor 
    positions = { 
            { coords = vec(-2361.13, 3248.69, 92.9, 325.24),   label = "[1] Up"    }, 
            { coords = vec(-2435.49, 3289.02, 34.89, 149.75),  label = "[2] Down"  }, 
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["fbi"] = 5 }
    },
    { -- FBI Private Statins
        positions = { 
            { coords = vec(120.49, -725.88, 242.15, 244.2),    label = "FBI Statins 1"   },
            { coords = vec(2497.23, -349.39, 94.09, 312.26),   label = "FBI Statins 2"   },
            { coords = vec(-560.12, -209.53, 43.37, 67.28),    label = "FBI justic"      },
            { coords = vec(1841.0, 2571.95, 46.01, 88.85),     label = "FBI Prison"      },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["fbi"] = 0, ["justice"] = 0 }
    },
    { -- FBI Private Statins for fbi > 10
        positions = { 
            { coords = vec(127.14, -729.11, 242.15, 68.33),     label = "FBI Statins 1"   },
            { coords = vec(2494.76, -347.19, 94.09, 316.05),    label = "FBI Statins 2"   },
            { coords = vec(-575.36, -218.68, 43.37, 292.95),    label = "FBI justic"      },
            { coords = vec(1127.21, -1570.45, 35.38, 283.16),   label = "FBI Medic 1"     },
            { coords = vec(-1825.24, -347.07, 49.25, 147.6),    label = "FBI Medic 2"     },
            { coords = vec(579.2, 601.67, 129.05, 298.04),      label = "FBI Mechanic 1"  },
            { coords = vec(463.18, -989.9, 30.69, 90.22),       label = "FBI PD 1"        },
            { coords = vec(627.06, -10.61, 82.78, 257.54),      label = "FBI PD 2"        },
            { coords = vec(-1062.76, -822.23, 27.03, 92.22),    label = "FBI PD 5"        },
            { coords = vec(368.01, -1586.63, 29.29, 223.67),    label = "FBI Taxi 1"      },
            { coords = vec(-818.46, -1353.17, 8.57, 279.93),    label = "FBI Taxi 2"      },
            { coords = vec(-565.29, -928.64, 33.34, 184.21),    label = "FBI Weazel"      },
            { coords = vec(1779.34, 3652.62, 35.64, 120.2),     label = "Administatior"   },
            { coords = vec(-2351.6, 3252.36, 92.9, 328.47),     label = "Army"            },
            { coords = vec(-579.42, -1059.36, 26.61, 262.34),   label = "Resturan"        },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["fbi"] = 5 }  
    },

------------------------------------------------ # Ambulance (Medic) ----------------------------------------------------------
    { -- ambulance Fast Teleporter
        positions = { 
            { coords = vec(1132.67,-1547.43,35.38,358.36), label = "Station 1"        },
            { coords = vec(-1828.42,-358.77,49.25,51.16),  label = "Station 2"        },
            { coords = vec(-258.42, 6315.61, 32.43, 131.55),   label = "Station 4 Palato" },
            { coords = vec(1735.99, 3640.48, 35.64, 303.33),   label = "Administatior"    },
            { coords = vec(1770.24, 2575.17, 45.73, 358.09),   label = "Prison"           },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false,key = { ["ambulance"] = 0, ["fbi"] = 5 }  
    },
    { -- ambulance Heli
        positions = { 
            { coords = vec(1132.58,-1549.86,35.38,176.4), label = "Down"  },
            { coords = vec(1125.43,-1521.6,45.33,280.21), label = "Up"    },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["ambulance"] = 0, ["fbi"] = 5 }  
    },      
------------------------------------------------ # Taxi -----------------------------------------------------------------------
    { -- Taxi Fast Teleporter
        positions = { 
            { coords = vec(371.8, -1612.32, 29.29, 228.58),     label = "Station Main"     }, -- TX 1
            { coords = vec(-804.28, -1352.68, 5.15, 142.28),    label = "Taxi Area"        }, -- TX 2
            { coords = vec(-378.59, 6061.15, 31.46, 221.58),    label = "Palato"           },
            { coords = vec(-289.28, -1080.58, 23.03, 245.73),   label = "Job Center"       },
            { coords = vec(-425.09, 1224.22, 325.76, 349.19),   label = "Admin Area"       },
            { coords = vec(-297.17, 303.4, 90.72, 0.02),        label = "Vinewood"         }, -- balaye bank markazi
            { coords = vec(-2222.99, -365.83, 13.32, 254.2),    label = "Pacific"          }, -- nazdike md2
            { coords = vec(-1125.93, 2694.7, 18.8, 46.3),       label = "Zancudo"          }, -- gun shop 8 
            { coords = vec(453.05, -607.7, 28.59, 263.54),      label = "Textile"          }, -- poshte md ghadim
            { coords = vec(1737.47, 3637.74, 35.64, 296.45),    label = "Administatior"    }, -- Administatior  
            { coords = vec(885.84, -181.47, 73.6, 239.66),      label = "Trangerine"       }, -- tx Old 
            { coords = vec(-1015.5, -3024.74, 13.95, 331.34),   label = "Air"              }, -- air 
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["taxi"] = 0, ["fbi"] = 5 }  
    },

------------------------------------------------ # mechanic ------------------------------------------------------------------- 
    { -- mechanic Fast Teleporter
        positions = { 
            { coords = vec(591.88,616.28,135.1,231.83),    label = "Station 1 City"   },
            { coords = vec(1350.65,-773.89,67.25,110.59),  label = "Station 2 City"   },
            { coords = vec(1231.4,2733.0,38.22,0.49),      label = "Station 3 Sandy"  },
            { coords = vec( 98.79,6620.76,32.44,223.35),   label = "Station 4 Palato" },
            { coords = vec(146.6,-3007.91,7.04,271.38),    label = "Station 5 Tuner"  },
            { coords = vec(-1634.71,-922.69,8.55,54.69),   label = "Car Dealer"       },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["mechanic"] = 0, ["car"] = 0, ["fbi"] = 5 }  
    },

------------------------------------------------ # Weazel News ---------------------------------------------------------------- 
    { -- Weazel Fast Teleporter
        positions = { 
            { coords = vec(-559.55,-916.18,23.82,359.09), label = "Station 1 City" },
            { coords = vec(-817.11,-705.44,23.78,90.44),  label = "Station 2 City" },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["weazel"] = 0, ["fbi"] = 5 }  
    },
    { -- Weazel Teleporter
        positions = { 
            { coords = vec(-817.2,-709.41,32.34,86.01), label = "[1] Up"    },
            { coords = vec(-817.5,-709.59,28.06,87.62), label = "[0] Main"  },
            { coords = vec(-817.2,-709.49,23.78,86.18), label = "[-1] Down" },
        }, 
        color = {r = 237, g = 228, b = 47}, scale = {p1 = 1.0, p2 = 1.0, p3 = 1.0}, vehicle = false, key = { ["weazel"] = 0, ["fbi"] = 5 }  
    },
}


local function selectHandler(location)
    local entity
    if location.vehicle then
       local ped = PlayerPedId()
       if IsPedInAnyVehicle(ped) then
            local vehicle = GetVehiclePedIsIn(ped)
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                entity = vehicle
            else
                ESX.chatMessage("Shoma ranande mashin nistid!")
            end
       else
        entity = ped
       end
    else
        local ped = PlayerPedId()
        if IsPedOnFoot(ped) then
            entity = ped
        else
            ESX.chatMessage("Shoma nemitavanid ba vasile naghlie vared shavid!")
        end  
    end

    return entity
end


local function CheckLock(location)
    if location.key then
        local access = true
        if ESX.PlayerData.job.name == 'sheriff' or ESX.PlayerData.job.name == 'police' or ESX.PlayerData.job.name == 'mt' or ESX.PlayerData.job.name == 'detective' then
            local p = promise.new()
            ESX.TriggerServerCallback('esx_society:doesHavePerm',function(cb)
                p:resolve(cb)
            end,'teleporter')
            access = Citizen.Await(p)
        end
        if location.key[ESX.PlayerData.job.name] and access then
            if ESX.PlayerData.job.grade < location.key[ESX.PlayerData.job.name] then 
                return true 
            else 
                return false 
            end
        elseif location.key[string.lower(ESX.PlayerData.gang.name)] then
            if ESX.PlayerData.gang.grade < location.key[string.lower(ESX.PlayerData.gang.name)] then 
                return true 
            else 
                return false 
            end 
        else
            return true
        end
    else 
        return false
    end
end


Citizen.CreateThread(function ()
    waitForLoad()

    local configs = {
        positionX   = "45%",
        positionY   = "50%",
        size        = "0.8", -- size in proportion
        maxHeight   = "80vh", -- maximum menu size ( recommended 30vh to 80vh )
        itemColor = "rgba(0, 0, 0, 0.8)", -- background color of the items
        itemSelectedColor = "rgba(233, 79, 55, 1.0)", -- background color of the selected item
    }

    
    for _,location in ipairs(ConfigTeleporter) do
        for __,position in ipairs(location.positions) do
            ESX.RegisterPoint(position.coords.xyz,1.5,{
                Color = {R = 0,G = 255,B = 0,A = 255},
                DrawDistance = 5,
                Radius = 0.5,
                Type = 21
            },{
                Notification = nil,
                DrawText = 'Dokme ~INPUT_CONTEXT~ Jahat Baz Kardan',
                DrawTextRadius = 2,
                DrawTextCoords = position.coords.xyz,
                Key = 'e',
                CB = function()
                    if LocalPlayer.state.blockTeleporter then return end
                    if not CheckLock(location) then
                    
                        local List = {}
                        for k , v in ipairs(location.positions) do
                            if k ~= __ then
                                table.insert(List,{
                                    img = 'SS_white.png',
                                    text = v.label, 
                                    text2 = '', 
                                    callBack = function()
                                        local entity = selectHandler(location)
                                        if entity then 
                                            exports.icon_menu:ForceCloseMenu()
                                            LocalPlayer.state.teleporting = true
                                            TriggerEvent("mythic_progbar:client:progress", {
                                                name = "entering_ipl",
                                                duration = 3000,
                                                label = "",
                                                useWhileDead = false,
                                                canCancel = true,
                                                controlDisables = {
                                                    disableMovement = true,
                                                    disableCarMovement = true,
                                                    disableMouse = false,
                                                    disableCombat = true,
                                                }
                                            }, function(status)
                                                if not status then
                                                    TriggerEvent('carry:GetData',function(data,drag)
                                                        if data.InProgress or drag then
                                                            TriggerEvent('onKeyDown','l')
                                                            Citizen.Wait(500)
                                                            -- ESX.TriggerServerEvent('ss_cs:csMe',300,'Bug abuse #2')
                                                            ESX.Alert('', 'Shoma nemitavanid dar in halat az az asansor estefade konid!', 10000, 'error')
                                                        else
                                                            exports.icon_menu:ForceCloseMenu()
                                                            DoScreenFadeOut(0)
        
                                                            ESX.Game.Teleport(entity,v.coords.xyz,function()
                                                                SetEntityHeading(entity,v.coords.w)
                                                            end)
        
                                                            Citizen.Wait(500)
                                                            DoScreenFadeIn(500)
                                                        end
                                                        LocalPlayer.state.teleporting = nil
                                                    end)
                                                else
                                                    LocalPlayer.state.teleporting = nil
                                                end
                                            end)
                                        end
                                end}) 
                            end
                        end
                        exports.icon_menu:OpenMenu(List, configs)
                    else
                        ESX.chatMessage("Shoma dastresi be in teleporter ra nadarid!")    
                    end

                end,
            },{
                In = nil,
                Out = function()
                    ESX.UI.Menu.CloseAll()
                    exports.icon_menu:ForceCloseMenu()
                end,
            })
            
        end    
        
    end
end)

RegisterCommand('getint', function(source, args)
    local ped = GetPlayerPed(-1)
    local interior = GetInteriorFromEntity(ped)
    print(interior)
end, false)

local function interior(int, state)
    if Ipls[int] then
        intHandler(Ipls[int].name, state)
    end
end

local function intHandler(name, state)
    local interior = Ipls[name].fuc
    if name == "bike" then
        if state then
            interior.Ipl.Interior.Load()
            interior.LoadDefault()
        else
            interior.Ipl.Interior.Remove()
            interior.Walls.Clear(false)
            interior.Furnitures.Clear(false)
            interior.Decoration.Clear(false)
            interior.Mural.Clear(false)
            interior.GunLocker.Clear(false)
            interior.ModBooth.Clear(false)
            interior.Meth.Clear(false)
            interior.Cash.Clear(false)
            interior.Weed.Clear(false)
            interior.Coke.Clear(false)
            interior.Counterfeit.Clear(false)
            interior.Documents.Clear(false)
            RefreshInterior(interior.interiorId)
        end
    elseif name == "executive3" then
        if state then
            interior.LoadDefault()
        else
            interior.Style.Clear(false)
            interior.Strip.Enable({interior.Strip.A, interior.Strip.B, interior.Strip.C}, false)
            interior.Booze.Enable({interior.Booze.A, interior.Booze.B, interior.Booze.C}, false)
            interior.Smoke.Clear(true)
        end
    elseif name == "executive2" then
        if state then
           interior.LoadDefault()
        else
            interior.Style.Clear(false)
            interior.Strip.Enable({interior.Strip.A, interior.Strip.B, interior.Strip.C}, false)
            interior.Booze.Enable({interior.Booze.A, interior.Booze.B, interior.Booze.C}, false)
            interior.Smoke.Clear(true)
        end
    elseif name == "executive1" then
        if state then
            interior.LoadDefault()
        else
            interior.Style.Clear(false)
            interior.Strip.Enable({interior.Strip.A, interior.Strip.B, interior.Strip.C}, false)
            interior.Booze.Enable({interior.Booze.A, interior.Booze.B, interior.Booze.C}, false)
            interior.Smoke.Clear(true)
        end
    end
end
