local jobCanSearchBag = {
    police = true,
    sheriff = true,
    mt = true,
    fbi = true,
    detective = true,
    justice = true,
}
Citizen.CreateThread(function()
    local peds = {
        `mp_f_freemode_01`,
        `mp_m_freemode_01`,
        `csb_brucie2`,
        `a_m_y_beach_03`,
        `u_m_y_babyd`,
        `csb_undercover`,
        `a_m_m_mlcrisis_01`,
        `a_m_y_musclbeac_02`,
        `csb_jackhowitzer`,
        `csb_ortega`,
        `mp_m_boatstaff_01`,
        `s_m_m_postal_02`,
        `a_m_o_genstreet_01`,
        `a_m_m_tourist_01`,
        `a_m_m_genfat_01`,
        `a_m_y_juggalo_01`,
        `a_m_y_breakdance_01`,
        `u_m_m_rivalpap`,
        `mp_m_g_vagfun_01`,
        `ig_avery`,
        `a_m_y_motox_02`,
        `a_m_y_hippy_01`,
        `s_m_o_busker_01`,
        `cs_movpremmale`,
        `csb_bogdan`,
        `a_m_m_og_boss_01`,
    }
    AddTargetModel(peds, {
        options = {
            {
                icon = "fas fa-dumpster",
                label = "💳نشان دادن کارت شناسایی",
                doesShow = function(ped)
                    return not Entity(ped).state.inventoryName
                end,
                cb = function(_)
                    local targetID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(_))
                    ExecuteCommand('sl ' .. targetID)
                end,
            },
            {
                icon = "fas fa-dumpster",
                label = "🧲بلند کردن",
                doesShow = function(ped)
                    return not Entity(ped).state.inventoryName
                end,
                cb = function(_)
                    local targetID = GetPlayerServerId(NetworkGetPlayerIndexFromPed(_))
                    exports['sun-jobs']:carry(targetID)
                end,
            },
            {
                icon = "fas fa-dumpster",
                label = '🔁معامله',
                doesShow = function(ped)
                    return not Entity(ped).state.inventoryName
                end,
                cb = function(ped)
                    local src = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))
                    if not ESX.GetPlayerData().inCS then
                        exports['sunset_utils']:startTrade(src)
                    end
                end,
            },
            {
                icon = "fas fa-dumpster",
                label = "🔂",
                doesShow = function(ped)
                    return not Entity(ped).state.inventoryName
                end,
                cb = function(ped)
                    exports['sun-inventory-hud']:openOtherPlayerInventory(GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)))
                end,
            },
            {
                icon = "fas fa-dumpster",
                label = '👜گشتن کیف',
                doesShow = function(ped)
                    return not Entity(ped).state.inventoryName and jobCanSearchBag[PlayerJob.name] and ESX.GetPlayerState(GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)), 'bag') and not  ESX.GetPlayerState(GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)), 'admin')
                end,
                cb = function(ped)
                    local id = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))
                    if ESX.GetPlayerState(id, 'bag') then
                        ESX.TriggerServerEvent('inventory-bag:openBag', ESX.GetPlayerState(id, 'bag'), id)
                        exports['sunset_utils']:me('Eghdam be gashtan kif fard mikone', true)
                    end
                end,
            },
            {
                icon = "fas fa-dumpster",
                label = '🏆افتخارات',
                doesShow = function(ped)
                    return not Entity(ped).state.inventoryName and not ESX.GetPlayerState(GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped)), 'hideInfo')
                end,
                cb = function(ped)
                    local src = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ped))
                    exports['sunset_utils']:openOtherSkillMenu(src)
                end,
            },
            {
                icon = 'fas fa-chair',
                label = 'غارت کردن',
                doesShow = function(entity)
                    return Entity(entity).state.inventoryName
                end,
                cb = function(entity)
                    exports['sun-inventory-hud']:openInventory(Entity(entity).state.inventoryName, nil, nil, true)
                end,
            },
            -- {
            --     icon = "fas fa-dumpster",
            --     label = "👋سلام کردن",
            --     cb = function(_)
            --         ExecuteCommand('nearby give2')
            --     end,
            -- },
        },
        job = {"all"},
        distance = 2.5
    })

    local recycles = {
        `prop_fire_hydrant_2`
    }
    AddTargetModel(recycles, {
        options = {
            {
                icon = "fas fa-dumpster",
                label = '🗑️گشتن',
                cb = function(entity)
                    exports['sun-inventory-hud']:openRecycle(entity)
                end,
            },
        },
        job = {"all"},
        distance = 3.5
    })
end)