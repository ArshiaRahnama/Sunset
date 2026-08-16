configDuty                            = {}
configDuty.DrawDistance               = 10.0
configDuty.Locale                     = 'en'


configDuty.Zones = {
--- Police/sheriff/mt
  { -- PD 1
    Pos  = vec(462.62,-982.06,30.69),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 0, g = 0, b = 255 }, Type  = 20,
    job  = {
      ["police"] = true,
      ["sheriff"] = true,
      ["mt"] = true,
      ["detective"] = true,
    }
  },

  { -- PD 2
    Pos  = vec(628.93,-5.87,82.78),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 0, g = 0, b = 255 }, Type  = 20,
    job  = {
      ["police"] = true,
      ["sheriff"] = true,
      ["mt"] = true,
      ["detective"] = true,
    }
  },

  { -- PD 3
    Pos  = vec(-56.45, -2505.81, 7.39),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 0, g = 0, b = 255 }, Type  = 20,
    job  = {
      ["police"] = true,
      ["sheriff"] = true,
      ["mt"] = true,
      ["detective"] = true,
    }
  },

  { -- Army
    Pos  = vec(-2354.38, 3259.08, 32.81),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 0, g = 0, b = 255 }, Type  = 20,
    job  = {
      ["police"] = true,
      ["sheriff"] = true,
      ["mt"] = true,
      ["detective"] = true,
    }
  },

  { -- detective
    Pos  = vec(857.58, -1294.48, 28.24),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 0, g = 0, b = 255 }, Type  = 20,
    job  = {
      ["police"] = true,
      ["sheriff"] = true,
      ["mt"] = true,
      ["detective"] = true,
    }
  },
  
--- Mechanic
  { -- new city
    Pos  = vec(620.93,628.05,128.97),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 204, g = 204, b = 0 }, Type = 20,
    job  = {
      ["mechanic"] = true,
    }
  },

--- ambulance
  { -- centeral
    Pos  = vec(1147.64,-1546.3,35.38),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 255, g = 0, b = 0 }, Type = 21,
    job  = {
      ["ambulance"] = true,
    }
  },

  { -- md 2
    Pos  = vec(-1855.15,-335.0,49.25),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 255, g = 0, b = 0 }, Type = 21,
    job  = {
      ["ambulance"] = true,
    }
  },

--- Taxi
  { -- center
    Pos  = vec(357.64,-1590.6,29.29),      
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 204, g = 204, b = 0 }, Type = 20,
    job  = {
      ["taxi"] = true,
    }
  },

---fbi 
  { -- fbi justic
    Pos  = vec(-542.69, -198.65, 38.24),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 204, g = 204, b = 0 }, Type = 20,
    job  = {
      ["fbi"] = true,
    }
  },

  ---justice 
  { --  justic
    Pos  = vec(-550.89, -203.98, 38.23),
    Size = { x = 0.7, y = 0.7, z = 0.7 }, Color = { r = 204, g = 204, b = 0 }, Type = 20,
    job  = {
      ["justice"] = true,
    }
  },
}

configDuty.Blips = {
}
