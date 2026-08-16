-- Add here the items you want to allow to be sold.
-- Images must be included in the img folder in png, jpg or gif format
-- name = name of the item in the database
-- label = name of the item that is shown to the player
-- price_recommended is the recommended price for each item.
list_products = {
}

Config = {
    positionX   = "50%",
    positionY   = "50%",
    size        = "1.0",
}
Config.blackComi = 30

local itemMedic = {
    { name = "adrenaline",     label = "Adrenaline",     img = "nui://sun-inventory-hud/ui/img/items/adrenaline.png",     price_recommended = 3335 },
    { name = "erythropoietin", label = "Erythropoietin", img = "nui://sun-inventory-hud/ui/img/items/erythropoietin.png", price_recommended = 3335 },
    { name = "gelofen",        label = "Gelofen",        img = "nui://sun-inventory-hud/ui/img/items/gelofen.png",        price_recommended = 2500 },
    { name = "estaminofon",    label = "Estaminofon",    img = "nui://sun-inventory-hud/ui/img/items/estaminofon.png",    price_recommended = 1667 },
}

local itemMechanic = {
    { name = "kittire",   label = "Kit repair tire",       img = "nui://sun-inventory-hud/ui/img/items/kittire.png", price_recommended = 2667 },
    { name = "kit50",     label = "Kit repair engine(50)", img = "nui://sun-inventory-hud/ui/img/items/kit50.png",   price_recommended = 3335 },
    { name = "cleaner",   label = "Cleaner",               img = "nui://sun-inventory-hud/ui/img/items/cleaner.png", price_recommended = 1000 },
    { name = "jack",      label = "Jack mashin",           img = "nui://sun-inventory-hud/ui/img/items/jack.png",    price_recommended = 1000 },

    { name = "engine1",     label = "Engine X1",       img = "nui://sun-inventory-hud/ui/img/items/engine1.png",    price_recommended = 13350 },
    { name = "engine2",     label = "Engine X2",       img = "nui://sun-inventory-hud/ui/img/items/engine2.png",    price_recommended = 20000 },
    { name = "engine3",     label = "Engine X3",       img = "nui://sun-inventory-hud/ui/img/items/engine3.png",    price_recommended = 26750 },
    { name = "engine4",     label = "Engine X4",       img = "nui://sun-inventory-hud/ui/img/items/engine4.png",    price_recommended = 33350 },
    { name = "engine5",     label = "Engine X5",       img = "nui://sun-inventory-hud/ui/img/items/engine5.png",    price_recommended = 40000 },
    { name = "engine6",     label = "Engine X6",       img = "nui://sun-inventory-hud/ui/img/items/engine6.png",    price_recommended = 46667 },
    { name = "lockpick",    label = "Sanjagh",         img = "nui://sun-inventory-hud/ui/img/items/lockpick.png",   price_recommended = 40000 },
    { name = "pich",        label = "Pich goushti",    img = "nui://sun-inventory-hud/ui/img/items/pich.png",       price_recommended = 2000  },
}

local itemGang = {
    { name="WEAPON_KNIFE",      label = "Knife",            img = "nui://sun-inventory-hud/ui/img/items/WEAPON_KNIFE.png",      price_recommended = 45000   },
    { name="WEAPON_DAGGER",     label = "Dagger",           img = "nui://sun-inventory-hud/ui/img/items/WEAPON_DAGGER.png",     price_recommended = 40000   },
    { name="WEAPON_MACHETE",    label = "Machete",          img = "nui://sun-inventory-hud/ui/img/items/WEAPON_MACHETE.png",    price_recommended = 60000   },
    { name="WEAPON_KNUCKLE",    label = "Knuckle Dusters",  img = "nui://sun-inventory-hud/ui/img/items/WEAPON_KNUCKLE.png",    price_recommended = 100000  },

    { name="WEAPON_PISTOL",         label = "Pistol",         img = "nui://sun-inventory-hud/ui/img/items/WEAPON_PISTOL.png",        price_recommended = 70000  }, 
    { name="WEAPON_SNSPISTOL",      label = "SNS Pistol",     img = "nui://sun-inventory-hud/ui/img/items/WEAPON_SNSPISTOL.png",     price_recommended = 60000  }, 
    { name="WEAPON_PISTOL50",       label = "Pistol .50",     img = "nui://sun-inventory-hud/ui/img/items/WEAPON_PISTOL50.png",      price_recommended = 140000 },
    { name="WEAPON_HEAVYPISTOL",    label = "Heavy Pistol",   img = "nui://sun-inventory-hud/ui/img/items/WEAPON_HEAVYPISTOL.png",   price_recommended = 120000 },
    { name="WEAPON_COMBATPISTOL",   label = "Combat Pistol",  img = "nui://sun-inventory-hud/ui/img/items/WEAPON_COMBATPISTOL.png",  price_recommended = 90000  }, 
    { name="WEAPON_VINTAGEPISTOL",  label = "Vintage Pistol", img = "nui://sun-inventory-hud/ui/img/items/WEAPON_VINTAGEPISTOL.png", price_recommended = 115000 },
    { name="WEAPON_SNSPISTOL_MK2",  label = "SNS Pistol MK2", img = "nui://sun-inventory-hud/ui/img/items/WEAPON_SNSPISTOL_MK2.png", price_recommended = 130000 }, 
    { name="WEAPON_PISTOL_MK2",     label = "Pistol MK2",     img = "nui://sun-inventory-hud/ui/img/items/WEAPON_PISTOL_MK2.png",    price_recommended = 165000 },

    { name="WEAPON_SMG",             label = "SMG",                    img = "nui://sun-inventory-hud/ui/img/items/WEAPON_SMG.png",            price_recommended = 170000 },
    { name="WEAPON_ASSAULTSMG",      label = "Assault SMG",            img = "nui://sun-inventory-hud/ui/img/items/WEAPON_ASSAULTSMG.png",     price_recommended = 220000 },
    { name="WEAPON_CARBINERIFLE",    label = "Carbine Rifle",          img = "nui://sun-inventory-hud/ui/img/items/WEAPON_CARBINERIFLE.png",   price_recommended = 300000 },
    { name="WEAPON_ASSAULTRIFLE",    label = "Assault Rifle",          img = "nui://sun-inventory-hud/ui/img/items/WEAPON_ASSAULTRIFLE.png",   price_recommended = 300000 },
    { name="WEAPON_ADVANCEDRIFLE",   label = "Advanced Rifle",         img = "nui://sun-inventory-hud/ui/img/items/WEAPON_ADVANCEDRIFLE.png",  price_recommended = 300000 },
    { name="WEAPON_COMBATPDW",       label = "Combat PDW",             img = "nui://sun-inventory-hud/ui/img/items/WEAPON_COMBATPDW.png",      price_recommended = 300000 },
    { name="WEAPON_BULLPUPRIFLE",    label = "Bullpup Rifle",          img = "nui://sun-inventory-hud/ui/img/items/WEAPON_BULLPUPRIFLE.png",   price_recommended = 350000 },
    { name="WEAPON_GUSENBERG",       label = "Gusenberg Sweeper",      img = "nui://sun-inventory-hud/ui/img/items/WEAPON_GUSENBERG.png",      price_recommended = 360000 },
    { name="WEAPON_ASSAULTSHOTGUN",  label = "Assault Shotgun",        img = "nui://sun-inventory-hud/ui/img/items/WEAPON_ASSAULTSHOTGUN.png", price_recommended = 350000 },
    { name="WEAPON_BULLPUPSHOTGUN",  label = "Bullpup Shotgun",        img = "nui://sun-inventory-hud/ui/img/items/WEAPON_BULLPUPSHOTGUN.png", price_recommended = 350000 },
    { name="WEAPON_SAWNOFFSHOTGUN",  label = "Sawed-Off Shotgun",      img = "nui://sun-inventory-hud/ui/img/items/WEAPON_SAWNOFFSHOTGUN.png", price_recommended = 350000 },
    { name="WEAPON_PUMPSHOTGUN",     label = "Pump Shotgun",           img = "nui://sun-inventory-hud/ui/img/items/WEAPON_PUMPSHOTGUN.png",    price_recommended = 350000 },
    { name="WEAPON_SPECIALCARBINE",  label = "Special Carbine",        img = "nui://sun-inventory-hud/ui/img/items/WEAPON_SPECIALCARBINE.png", price_recommended = 350000 },
    { name="WEAPON_CERAMICPISTOL",   label = "Ceramic Pistol",         img = "nui://sun-inventory-hud/ui/img/items/WEAPON_CERAMICPISTOL.png",  price_recommended = 175000 },
    { name="WEAPON_COMPACTRIFLE",    label = "Compact Rifle",          img = "nui://sun-inventory-hud/ui/img/items/WEAPON_COMPACTRIFLE.png",   price_recommended = 500000 },
    { name="WEAPON_DOUBLEACTION",    label = "Double-Action Revolver", img = "nui://sun-inventory-hud/ui/img/items/WEAPON_DOUBLEACTION.png",   price_recommended = 900000 },

    { name="WEAPON_SPECIALCARBINE_MK2",  label = "Special Carbine MK2",  img = "nui://sun-inventory-hud/ui/img/items/WEAPON_SPECIALCARBINE_MK2.png", price_recommended = 600000  },
    { name="WEAPON_ASSAULTRIFLE_MK2",    label = "Assault Rifle MK2",    img = "nui://sun-inventory-hud/ui/img/items/WEAPON_ASSAULTRIFLE_MK2.png",   price_recommended = 600000  },
    { name="WEAPON_CARBINERIFLE_MK2",    label = "Carbine Rifle MK2",    img = "nui://sun-inventory-hud/ui/img/items/WEAPON_CARBINERIFLE_MK2.png",   price_recommended = 600000  },
    { name="WEAPON_PUMPSHOTGUN_MK2",     label = "Pump Shotgun MK2",     img = "nui://sun-inventory-hud/ui/img/items/WEAPON_PUMPSHOTGUN_MK2.png",    price_recommended = 550000  },
    { name="WEAPON_BULLPUPRIFLE_MK2",    label = "Bullpup Rifle MK2",    img = "nui://sun-inventory-hud/ui/img/items/WEAPON_BULLPUPRIFLE_MK2.png",   price_recommended = 550000  },
    { name="WEAPON_SMG_MK2",             label = "SMG MK2",              img = "nui://sun-inventory-hud/ui/img/items/WEAPON_SMG_MK2.png",            price_recommended = 550000  },
    { name="WEAPON_MICROSMG",            label = "Micro SMG",            img = "nui://sun-inventory-hud/ui/img/items/WEAPON_MICROSMG.png",           price_recommended = 650000  },
    { name="WEAPON_APPISTOL",            label = "AP Pistol",            img = "nui://sun-inventory-hud/ui/img/items/WEAPON_APPISTOL.png",           price_recommended = 1500000 },

    { name="WEAPON_TACTICALRIFLE",       label = "Service Carbine",      img = "nui://sun-inventory-hud/ui/img/items/WEAPON_TACTICALRIFLE.png",      price_recommended = 750000 },
    { name="WEAPON_HEAVYRIFLE",          label = "Heavy Rifle",          img = "nui://sun-inventory-hud/ui/img/items/WEAPON_HEAVYRIFLE.png",         price_recommended = 500000 },
    { name="WEAPON_PRECISIONRIFLE",      label = "Precision Rifle",      img = "nui://sun-inventory-hud/ui/img/items/WEAPON_PRECISIONRIFLE.png",     price_recommended = 1000 },


    { name="desomorphine2",  label = "Desomorphine", img = "nui://sun-inventory-hud/ui/img/items/desomorphine2.png", price_recommended = 20000  },
    { name="diastat2",       label = "Diastat",      img = "nui://sun-inventory-hud/ui/img/items/diastat2.png",      price_recommended = 10000  },
    { name="hollysion2",     label = "Hollysion",    img = "nui://sun-inventory-hud/ui/img/items/hollysion2.png",    price_recommended = 20000  },
    { name="wellbutrin2",    label = "Wellbutrin",   img = "nui://sun-inventory-hud/ui/img/items/wellbutrin2.png",   price_recommended = 20000  },
    { name="lsd2",           label = "LSD",          img = "nui://sun-inventory-hud/ui/img/items/lsd2.png",          price_recommended = 100000 },

    { name="ember",      label = "Ember",        img = "nui://sun-inventory-hud/ui/img/items/ember.png",     price_recommended = 100000  },
    { name="trinket1",   label = "Trinket 1",    img = "nui://sun-inventory-hud/ui/img/items/trinket1.png",  price_recommended = 350000  },
    { name="trinket2",   label = "Trinket 2",    img = "nui://sun-inventory-hud/ui/img/items/trinket2.png",  price_recommended = 1000000 },
    { name="trinket3",   label = "Trinket 3",    img = "nui://sun-inventory-hud/ui/img/items/trinket3.png",  price_recommended = 2000000 },

    { name="darkphone",  label = "Dark phone",   img = "nui://sun-inventory-hud/ui/img/items/darkphone.png", price_recommended = 100000  },
    { name="sianor",     label = "Sianor",       img = "nui://sun-inventory-hud/ui/img/items/sianor.png",    price_recommended = 50000   },
    { name="clip",       label = "Kheshab",      img = "nui://sun-inventory-hud/ui/img/items/clip.png",      price_recommended = 1000    },
    { name="uav",        label = "UAV",          img = "nui://sun-inventory-hud/ui/img/items/uav.png",       price_recommended = 100000  },
    { name="rc",         label = "RC Car",       img = "nui://sun-inventory-hud/ui/img/items/rc.png",        price_recommended = 350000  },
    { name="sc",         label = "S C",          img = "nui://sun-inventory-hud/ui/img/items/sc.png",        price_recommended = 10000   },
    { name="jewels",     label = "Javaher",      img = "nui://sun-inventory-hud/ui/img/items/jewels.png",    price_recommended = 1750    },

    { name="blowtorch",    label = "Blowtorch",    img = "nui://sun-inventory-hud/ui/img/items/blowtorch.png",     price_recommended = 6667  },
    { name="raspberry",    label = "Laptop Hack",  img = "nui://sun-inventory-hud/ui/img/items/raspberry.png",     price_recommended = 13334 },
    { name="c4_bank",      label = "C4",           img = "nui://sun-inventory-hud/ui/img/items/c4_bank.png",       price_recommended = 16667 },
    { name="radio",        label = "Radio",        img = "nui://sun-inventory-hud/ui/img/items/radio.png",         price_recommended = 3334  },
    { name="silencer",     label = "Silencer",     img = "nui://sun-inventory-hud/ui/img/items/silencer.png",      price_recommended = 6667  },
    { name="grip",         label = "Grip",         img = "nui://sun-inventory-hud/ui/img/items/grip.png",          price_recommended = 6667  },
    { name="kingkey",      label = "Shah kelid",   img = "nui://sun-inventory-hud/ui/img/items/kingkey.png",       price_recommended = 20000 },
    { name="ghayegh_badi", label = "Ghayegh Badi", img = "nui://sun-inventory-hud/ui/img/items/ghayegh_badi.png",  price_recommended = 10000 },

    { name="yusuf",     label = "Skin Talaee",  img = "nui://sun-inventory-hud/ui/img/items/yusuf.png",     price_recommended = 200000  },
    { name="camo1",     label = "Camo 1",       img = "nui://sun-inventory-hud/ui/img/items/camo1.png",     price_recommended = 200000  },
    { name="camo2",     label = "Camo 2",       img = "nui://sun-inventory-hud/ui/img/items/camo2.png",     price_recommended = 200000  },
    { name="camo3",     label = "Camo 3",       img = "nui://sun-inventory-hud/ui/img/items/camo3.png",     price_recommended = 200000  },
    { name="camo4",     label = "Camo 4",       img = "nui://sun-inventory-hud/ui/img/items/camo4.png",     price_recommended = 250000  },
    { name="camo5",     label = "Camo 5",       img = "nui://sun-inventory-hud/ui/img/items/camo5.png",     price_recommended = 250000  },
    { name="camo6",     label = "Camo 6",       img = "nui://sun-inventory-hud/ui/img/items/camo6.png",     price_recommended = 250000  },
    { name="camo7",     label = "Camo 7",       img = "nui://sun-inventory-hud/ui/img/items/camo7.png",     price_recommended = 300000  },
    { name="camo8",     label = "Camo 8",       img = "nui://sun-inventory-hud/ui/img/items/camo8.png",     price_recommended = 300000  },
    { name="camo9",     label = "Camo 9",       img = "nui://sun-inventory-hud/ui/img/items/camo9.png",     price_recommended = 350000  },
    { name="camo10",    label = "Camo 10",      img = "nui://sun-inventory-hud/ui/img/items/camo10.png",    price_recommended = 350000  },
    { name="camo11",    label = "Camo 11",      img = "nui://sun-inventory-hud/ui/img/items/camo11.png",    price_recommended = 350000  },

    { name="eclip",     label = "Kheshab Ezafe",    img = "nui://sun-inventory-hud/ui/img/items/eclip.png",      price_recommended = 525000 },
    { name="scope",     label = "scope",            img = "nui://sun-inventory-hud/ui/img/items/scope.png",      price_recommended = 350000 },
    { name="mask_shab", label = "Night Vision",     img = "nui://sun-inventory-hud/ui/img/items/mask_shab.png",  price_recommended = 25000  },

    { name="tintblack",  label = "Skin Black",      img = "nui://sun-inventory-hud/ui/img/items/tintblack.png",  price_recommended = 185000 },
    { name="tintcream",  label = "Skin Cream",      img = "nui://sun-inventory-hud/ui/img/items/tintcream.png",  price_recommended = 250000 },
    { name="tintgold",   label = "Skin Gold",       img = "nui://sun-inventory-hud/ui/img/items/tintgold.png",   price_recommended = 300000 },
    { name="tintgreen",  label = "Skin Sabz",       img = "nui://sun-inventory-hud/ui/img/items/tintgreen.png",  price_recommended = 370000 },
    { name="tintorange", label = "Skin Orange",     img = "nui://sun-inventory-hud/ui/img/items/tintorange.png", price_recommended = 430000 },
    { name="tintpink",   label = "Skin Sorati",     img = "nui://sun-inventory-hud/ui/img/items/tintpink.png",   price_recommended = 500000 },
    { name="tintplat",   label = "Skin Plat",       img = "nui://sun-inventory-hud/ui/img/items/tintplat.png",   price_recommended = 550000 },

    { name="firework",              label = "Fire work",        img = "nui://sun-inventory-hud/ui/img/items/firework.png",          price_recommended = 150000  },
    { name="WEAPON_GADGETPISTOL",   label = "Perico Pistol",    img = "nui://sun-inventory-hud/ui/img/items/gadgetpistol.png",      price_recommended = 370000  },
    { name="GADGET_PARACHUTE",      label = "Parachute",        img = "nui://sun-inventory-hud/ui/img/items/GADGET_PARACHUTE.png",  price_recommended = 85000   },
    { name="WEAPON_COMBATSHOTGUN",  label = "Combat Shotgun",   img = "nui://sun-inventory-hud/ui/img/items/combatshotgun.png",     price_recommended = 400000  },
    { name="boombox",               label = "Boom Box",         img = "nui://sun-inventory-hud/ui/img/items/boombox.png",           price_recommended = 4000000 },
    { name="WEAPON_MILITARYRIFLE",  label = "Military Rifle",   img = "nui://sun-inventory-hud/ui/img/items/militaryrifle.png",     price_recommended = 400000  },
    { name="WEAPON_FLARE",          label = "Flare",            img = "nui://sun-inventory-hud/ui/img/items/flare.png",             price_recommended = 130000  },
    { name="tur",                   label = "Turi kabab paz",   img = "nui://sun-inventory-hud/ui/img/items/tur.png",               price_recommended = 10000   },
}

local itemResturan = {
    { name="boar_kebab",     label = "Kababe goraz",          img = "nui://sun-inventory-hud/ui/img/items/boar_kebab.png",     price_recommended = 1667 },
    { name="boar_soup",      label = "Soupe Goraz",           img = "nui://sun-inventory-hud/ui/img/items/boar_soup.png",      price_recommended = 1667 },
    { name="deer_kebab",     label = "Kababe Ahu",            img = "nui://sun-inventory-hud/ui/img/items/deer_kebab.png",     price_recommended = 1667 },
    { name="deer_soup",      label = "Soupe Ahu",             img = "nui://sun-inventory-hud/ui/img/items/deer_soup.png",      price_recommended = 1667 },
    { name="pig_kebab",      label = "Kababe Khuk",           img = "nui://sun-inventory-hud/ui/img/items/pig_kebab.png",      price_recommended = 1667 },
    { name="pig_soup",       label = "Soupe Khuk",            img = "nui://sun-inventory-hud/ui/img/items/pig_soup.png",       price_recommended = 1667 },
    { name="rabbit_kebab",   label = "Kababe Khargush",       img = "nui://sun-inventory-hud/ui/img/items/rabbit_kebab.png",   price_recommended = 1667 },
    { name="rabbit_soup",    label = "Soupe Khargush",        img = "nui://sun-inventory-hud/ui/img/items/rabbit_soup.png",    price_recommended = 1667 },
    { name="kotlet_kebab",   label = "Kotlet",                img = "nui://sun-inventory-hud/ui/img/items/kotlet_kebab.png",   price_recommended = 1667 },
    { name="pigeon_soup",    label = "Soupe Kabutar",         img = "nui://sun-inventory-hud/ui/img/items/pigeon_soup.png",    price_recommended = 1667 },
    { name="sardine_kebab",  label = "Khorake Sardine",       img = "nui://sun-inventory-hud/ui/img/items/sardine_kebab.png",  price_recommended = 1667 },
    { name="sangsar_kebab",  label = "Ghalie Mahi",           img = "nui://sun-inventory-hud/ui/img/items/sangsar_kebab.png",  price_recommended = 1667 },
    { name="ordak_kebab",    label = "Khorake OrdakMahi",     img = "nui://sun-inventory-hud/ui/img/items/ordak_kebab.png",    price_recommended = 1667 },
    { name="ghezel_kebab",   label = "Ghezelala Sukhari",     img = "nui://sun-inventory-hud/ui/img/items/ghezel_kebab.png",   price_recommended = 1667 },
    { name="hamoor_kebab",   label = "Hamoor sorkh shode",    img = "nui://sun-inventory-hud/ui/img/items/hamoor_kebab.png",   price_recommended = 1667 },
    { name="sorkhoo_kebab",  label = "Sorkhoo Kababi",        img = "nui://sun-inventory-hud/ui/img/items/sorkhoo_kebab.png",  price_recommended = 1667 },
    { name="salmon_kebab",   label = "Mahi Salmon Tanuri",    img = "nui://sun-inventory-hud/ui/img/items/salmon_kebab.png",   price_recommended = 1667 },
    { name="shooride_kebab", label = "Shooride sorkh shode",  img = "nui://sun-inventory-hud/ui/img/items/shooride_kebab.png", price_recommended = 1667 },
    { name="tilapia_kebab",  label = "Sandwich Tilapia",      img = "nui://sun-inventory-hud/ui/img/items/tilapia_kebab.png",  price_recommended = 1667 },
    { name="sefid_kebab",    label = "Mahi Sefid Kababi",     img = "nui://sun-inventory-hud/ui/img/items/sefid_kebab.png",    price_recommended = 1667 },
    { name="shir_kebab",     label = "Mahi Shir sorkh shode", img = "nui://sun-inventory-hud/ui/img/items/shir_kebab.png",     price_recommended = 1667 },
    { name="meygoo_kebab",   label = "Meygoo Sukhari",        img = "nui://sun-inventory-hud/ui/img/items/meygoo_kebab.png",   price_recommended = 1667 },
    { name="chicken_kebab",  label = "Morghe Sorkh karde",    img = "nui://sun-inventory-hud/ui/img/items/chicken_kebab.png",  price_recommended = 1667 },
    { name="jooje_kebab",    label = "Jooje Kabab",           img = "nui://sun-inventory-hud/ui/img/items/jooje_kebab.png",    price_recommended = 1667 },
}

local itemCoffee = {
    { name = "beer",        label = "Abjo",         img = "nui://sun-inventory-hud/ui/img/items/beer.png",         price_recommended = 200  },
    { name = "cocacola",    label = "Coca Cola",    img = "nui://sun-inventory-hud/ui/img/items/cocacola.png",     price_recommended = 500  },
    { name = "fanta",       label = "Fanta",        img = "nui://sun-inventory-hud/ui/img/items/fanta.png",        price_recommended = 500  },
    { name = "sprite",      label = "Sprite",       img = "nui://sun-inventory-hud/ui/img/items/sprite.png",       price_recommended = 500  },
    { name = "loka",        label = "Abmive",       img = "nui://sun-inventory-hud/ui/img/items/loka.png",         price_recommended = 350  },
    { name = "chips",       label = "Chips",        img = "nui://sun-inventory-hud/ui/img/items/chips.png",        price_recommended = 500  },
    { name = "marabou",     label = "Shokolat",     img = "nui://sun-inventory-hud/ui/img/items/marabou.png",      price_recommended = 500  },
    { name = "macka",       label = "Sandwitch",    img = "nui://sun-inventory-hud/ui/img/items/macka.png",        price_recommended = 600  },
    { name = "vodka",       label = "Vodka",        img = "nui://sun-inventory-hud/ui/img/items/vodka.png",        price_recommended = 5000 },
    { name = "tequila",     label = "Tequila",      img = "nui://sun-inventory-hud/ui/img/items/tequila.png",      price_recommended = 500  },
    { name = "soda",        label = "Noshabe",      img = "nui://sun-inventory-hud/ui/img/items/soda.png",         price_recommended = 500  },
    { name = "wine",        label = "Sharab",       img = "nui://sun-inventory-hud/ui/img/items/wine.png",         price_recommended = 5000 },
    { name = "burger",      label = "Burger",       img = "nui://sun-inventory-hud/ui/img/items/burger.png",       price_recommended = 750  },
    { name = "cheesebows",  label = "Snack",        img = "nui://sun-inventory-hud/ui/img/items/cheesebows.png",   price_recommended = 500  },
    { name = "pizza",       label = "Pizza",        img = "nui://sun-inventory-hud/ui/img/items/pizza.png",        price_recommended = 1000 },
    { name = "cigar",       label = "Cigar",        img = "nui://sun-inventory-hud/ui/img/items/cigar.png",        price_recommended = 100  },
    { name = "sandwich",    label = "Sandwich",     img = "nui://sun-inventory-hud/ui/img/items/sandwich.png",     price_recommended = 600  },
    { name = "titopgold",   label ="Ti Top Talaee", img = "nui://sun-inventory-hud/ui/img/items/titopgold.png",    price_recommended = 50000},
}

Config.location = { 

-- Medic
    ['medic1'] = {
        db = 'medic1',
        disableBlack = true,
        coords = {
            vec(1147.24,-1542.51,35.38),
            vec(-255.78,6317.53,32.43),
            vec(-1867.36,-338.08,49.52),
            vec(1761.85, 3662.01, 35.64),
        },
        -- access gang , jobs
        access = {
            ["ambulance"] = true,
        },
        owner = {
            ["steam:110000134a5ebfc"] = true,--parsa
            ["steam:11000010b5a1f6c"] = true,--payam
            ["steam:11000013b961c60"] = true--hamid
        },
        label = "Daroo Khane",
        payment = {
            type = 1,   -- 2 => value
            value = "admins",
        },
        -- item nill cant buy item
        --items = nil
        items =  itemMedic
    },

-- Mechanic
    ['mechanic1'] = {
        db = 'mechanic1',
        disableBlack = true,
        coords = {
            vec(1326.42, -772.19, 67.24),
            vec(544.18, -173.65, 54.48),
            vec(1247.2, 2719.94, 38.01),
            vec(-341.97, -140.35, 39.01),
            vec(654.72, 610.75, 129.03), -- mc boef
            vec(-25.94, -1058.96, 28.4), -- mc benny
            vec(144.4, -3050.05, 7.04), -- mc extra
            vec(615.35, 636.21, 129.06), -- mc boef
            vec(946.01, -1746.52, 21.03),
        },
        -- access gang , jobs
        access = {
            ["mechanic"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true,--payam
            ["steam:11000013b961c60"] = true,--hamid 
            ["steam:11000010a3abb87"] = true,
        },
        label = "Mechanic Shop",
        payment = {
            type = 1,   -- 2 => value
            value = "admins",
        },
        -- items = nil  -- (item nill cant buy item)
        items = itemMechanic
    },

-- Gangs
    ['Gangs06'] = { -- Shop 1   Raven           paid and fix
        db = 'Raven',
        coords = {
            vec(1024.32, -2541.08, 28.29),  -- base gang
            vec(-665.65, -935.79, 21.83),   -- gun shop 1
            vec(3905.67, -4690.61, 4.14),   -- jazire 1-1
        },
        -- access gang , jobs
        access = {
            ["Raven"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, --payam
            ["steam:11000014d42d818"] = true, --Name: (Arvin_Dark),SteamName: (rwin)
            ["steam:110000147646da2"] = true, --Name: (steam:110000147646da2),Name: (Michal_Jaiwhite) 
        },
        label = "Raven Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "raven",
            value2 = "Raven",
        },
        items = itemGang,
    },

    ['Gangs08'] = { -- Shop 2   Alghaede        paid and fix
        db = 'Alghaede',
        coords = {
            vec(-625.13, -1632.34, 33.05),  -- base gang
            vec(818.87, -2149.96, 29.62),   -- gun shop 2
            vec(3908.09, -4687.2, 4.08),    -- jazire 1-2
        },
        -- access gang , jobs
        access = {
            ["Alghaede"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, --payam
            ["steam:1100001325e8bcc"] = true, --(steam:1100001325e8bcc),Name: (Aligeforce_Porali),SteamName: (aligeforce)  
        },
        label = "Alghaede Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "alghaede",
            value2 = "Alghaede",
        },
        items = itemGang,
    },

    ['Gangs09'] = { -- Shop 3   Sopranos        paid and fix
        db = 'Sopranos',
        coords = {
            vec(1018.08, -2539.17, 28.69),  -- base gang
            vec(1692.71, 3754.85, 34.71),   -- gun shop 3
            vec(3910.45, -4683.8, 4.04),    -- jazire 1-3
        },
        -- access gang , jobs
        access = {
            ["Sopranos"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, --payam    
            ["steam:110000143d42b05"] = true, --Name: (V1spr_Tayson),SteamName: (v1spr) 
            ["steam:110000141e734bd"] = true, --Name: (Dayi_Amir),SteamName: (Dayi amir)
            ["steam:11000013a4b5a6e"] = true, --Name: (Danial_Dava),SteamName: (Dani)
        },
        label = "Sopranos Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "sopranos",
            value2 = "Sopranos",
        },
        items = itemGang,
    },

    ['Gangs01'] = { -- Shop 4   CHECHEN         paid and fix
        db = 'CHECHEN',
        coords = {
            vec(-869.64, 330.5, 84.17),     -- base gang
            vec(-331.12, 6079.03, 31.45),   -- gun shop 4
            vec(4805.53, -4297.71, 5.21),   -- jazire 2-1
        },
        -- access gang , jobs
        access = {
            ["CHECHEN"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, -- payam 
            ["steam:11000015af8b5a6"] = true, -- Name: (Ehsan_Allahdadi),SteamName: (CLONER01) 
            ["steam:11000013ea2ca20"] = true, -- Name: (Efearless_Efearless),SteamName: (Rejected) 
            ["steam:11000010ec9e7a8"] = true, -- Name: (Satan_Kido),SteamName: (GayKing)
        },
        label = "CHECHEN Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "chechen",
            value2 = "CHECHEN",
        },
        items = itemGang,
    },

    ['Gangs04'] = { -- Shop 5   ULTRA           paid and fix
        db = 'ULTRA',
        coords = {
            vec(307.55, -2559.28, 5.7),    -- base gang
            vec(253.19, -46.34, 69.94),    -- gun shop 5
            vec(4801.02, -4297.35, 5.14),  -- jazire 2-2
        },
        -- access gang , jobs
        access = {
            ["ULTRA"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, -- payam 
            ["steam:11000014d6bcdcb"] = true, -- (steam:11000014d6bcdcb),Name: (Liam_Sanchez),SteamName: (Amin)
            ["steam:11000014734842e"] = true, -- (steam:11000014734842e),Name: (Morfin_Ewewew),SteamName: (MoЯfiN)
        },
        label = "ULTRA Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "ultra",
            value2 = "ULTRA",
        },
        items = itemGang,
    },

    ['Gangs11'] = { -- Shop 6   Syc             paid and fix
        db = 'Syc',
        coords = {
            vec(-81.11, 1003.25, 230.61),   -- base gang
            vec(11.05, -1110.82, 29.8),     -- gun shop 6
            vec(5598.06, -5228.79, 14.22),  -- jazire 3-1
        }, 
        -- access gang , jobs
        access = {
            ["Syc"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, --payam 
            ["steam:1100001474f5d8f"] = true, -- (steam:1100001474f5d8f),Name: (Nima_Ahmadi),SteamName: (nima32gamer)
            ["steam:11000015ba19f5b"] = true, -- (steam:11000015ba19f5b),Name: (Lewis_Hamilton),SteamName: (Mahdi Lewis)
            ["steam:110000118bf57a1"] = true, -- (steam:110000118bf57a1),Name: (King_Razor),SteamName: (King Razor)
        },
        label = "Syc Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "syc",
            value2 = "Syc",
        },
        items = itemGang,
    },

    ['Gangs07'] = { -- Shop 7   FOX             paid and fix
        db = 'FOX',
        coords = {
            vec(-578.42, -2333.4, 13.84),    -- base gang
            vec(2571.39, 294.73, 108.74),    -- gun shop 7
            vec(5599.69, -5224.81, 14.15),   -- jazire 3-2
        },
        -- access gang , jobs
        access = {
            ["FOX"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, -- payam
            ["steam:1100001502b8c54"] = true, -- Name: (Mahdi_Punisher),SteamName: (mahdi.punisher)
            ["steam:110000149006465"] = true, -- Name: (Redza_Yt11),SteamName: (REDZA_YT)
        },
        label = "FOX Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "fox",
            value2 = "FOX",
        },
        items = itemGang,
        ownerCheck = {
            radius = 15,
            gang = 'FOX', -- gang , job
            count = 1,
            grade = 11,
            -- grade2 = 3,
            gradeType = 3,
        },
    },

    ['Gangs10'] = { -- Shop 8   Siege           paid and fix
        db = 'Siege',
        coords = {
            vec(-550.28, 311.33, 83.16),    -- base gang
            vec(-1120.22, 2695.94, 18.55),  -- gun shop 8
            vec(5496.82, -5842.78, 19.04),  -- jazire 4-1
        },
        -- access gang , jobs
        access = {
            ["Siege"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, -- payam 
            ["steam:11000015b8e5ceb"] = true, -- Name: (Hamid_Engineer),SteamName: (Hamid_Engineer) 
            ["steam:11000010a20d292"] = true, -- Name: (Soltan_Phoenix),SteamName: (SAJAD TooTi) 
            ["steam:110000148ff5d94"] = true, -- Name: (Arash_Kamangir),SteamName: (Kamangir) 
        },
        label = "Siege Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "siege",
            value2 = "Siege",
        },
        items = itemGang,
    },

    ['Gangs03'] = { -- Shop 9   Rogue           paid and fix
        db = 'Rogue',
        coords = {
            vec(-1577.39, -240.42, 49.47),  -- base gang
            vec(846.44, -1030.8, 28.22),    -- gun shop 9
            vec(5495.6, -5838.78, 19.04),   -- jazire 4-2
        },
        -- access gang , jobs
        access = {
            ["Rogue"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, -- payam
            ["steam:11000013f4fa8fc"] = true, -- Name: (Eshagh_Pazoki),SteamName: (MrPaZoKi)
            ["steam:11000014214d55d"] = true, -- Name: (Miss_Mari),SteamName: (Miss MaRi)
        },
        label = "Rogue Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "rogue",
            value2 = "Rogue",
        },
        items = itemGang,
    },

    ['Gangs02'] = { -- Shop 10  GroveStreet     paid and fix
        db = 'GroveStreet',
        coords = {
            vec(-1582.1, -81.34, 54.31),    -- base gang
            vec(-1307.46, -389.74, 36.7),   -- gun shop 10
            vec(4908.18, -5755.27, 26.03),  -- jazire 5-1
        },
        -- access gang , jobs
        access = {
            ["GroveStreet"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, --payam 
            ["steam:1100001470d5f3a"] = true, -- (steam:1100001470d5f3a),Name: (Mehrshad_Shafaghat),SteamName: (Mehrshad)
            ["steam:11000014534d12e"] = true, -- (steam:11000014534d12e),Name: (Sina_Lool),SteamName: (LoL)
        },
        label = "GroveStreet Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "grovestreet",
            value2 = "GroveStreet",
        },
        items = itemGang,
        ownerCheck = {
            radius = 15,
            gang = 'GroveStreet', -- gang , job
            count = 1,
            grade = 10,
            -- grade2 = 3,
            gradeType = 3,
        },
    },

    ['Gangs05'] = { -- Shop 11  GOD_OF_GAMERS   
        db = 'GOD_OF_GAMERS',
        coords = {
            -- vec(-1369.47, 87.15, 60.63),    -- base gang 
            -- vec(-3171.04, 1083.29, 20.84),  -- gun shop 11
            -- vec(4910.45, -5751.78, 26.01),  -- jazire 5-2
        },
        -- access gang , jobs
        access = {
            ["GOD_OF_GAMERS"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, --payam 
            ["steam:11000014c7f757d"] = true, -- (steam:11000014c7f757d),Name: (Milad_Inferno),SteamName: (god_of_gamers)
        },
        label = "GOD_OF_GAMERS Shop",
        payment = {
            type = 2,   -- 2 => value
            value = "god_of_gamers",
            value2 = "GOD_OF_GAMERS",
        },
        items = itemGang,
    },

-- resturan
    ['resturan10'] = { -- Shop Share 
        db = 'resturan10', disableBlack = true, --eye = true, eyeRange = 1.5,
        coords = {
            vec(-1345.66, -1066.57, 7.39),  -- Venetain (Baghal Sahel)
            vec(120.11, -1039.82, 29.28),   -- Cafe Bean (Baghal Parking Markazi)
            vec(-583.22, -1061.57, 22.34),  -- Cafe UwU (Baghal Weazel)
            vec(-1652.22, 173.54, 61.73),   -- Shams
            vec(1764.06, 3641.15, 35.64),   -- Administrative
            vec(1780.68, 2559.02, 45.67),   -- prison
        },
        access = {
            ["resturan"] = true,
        },
        owner = {
            ["steam:11000010b5a1f6c"] = true, -- payam
            ["steam:1100001487ded6f"] = true, -- Zedix(Armin_Zedix) (steam:1100001487ded6f)
        },
        label = "Restaurant Shop",
        payment = { -- 2 => value
            type = 3, value = "resturan",
        },
        items =  itemResturan,
        ownerCheck = {
            radius = 20,
            job = 'resturan', -- gang , job
            count = 1,
            grade = 5,
            -- grade2 = 3,
            gradeType = 1,
        },
        color = { R = 12 , G = 123 , B = 86 , A = 255 }, -- a = opasity
        type = 13,            -- model
        radius = 0.5,         -- andaze blip
        range = 1.0,          -- range E
        drawDistance = 2.0,   -- az chand metri bebine
        drawTextRadius = 0.5, -- range neveshtan text
        hideLabel = false     -- true label hide mishe
    },

}

-- Configure the public and log WEBHOOK here

translate = {
    -- Graphical interface translations
    TR_TITLE            = "Shop",
    TR_SUBTITLE         = "Put or buy something for sale",
    TR_OPTIONS_TITLE    = "OPTIONS A.H",
    TR_OPTIONS_1        = "Products :",
    TR_OPTIONS_2        = "My Products:",
    TR_ANNOUNCES        = "products",
    TR_SEARCH           = "Search for a product",
    TR_BY_OWNER         = "By:",
    TR_SIMBOL_MONEY     = "$ ",
    TR_WEIGHT           = "Weight:",
    TR_DISPONIBLE       = "Available:",
    TR_UNITS            = "pcs",
    TR_TOTAL_PRICE      = "Total price:",
    TR_BUTTON_BUY       = "Buy",
    TR_BUTTON_ANNOUNCE  = "Add",
    TR_BUTTON_REMOVE    = "Remove",
    TR_BUTTON_CANCEL    = "Cancel",
    TR_MODAL_TITLE      = "Add Product",
    TR_MODAL_ITEM       = "Item",
    TR_MODAL_AMOUNT     = "Amount:",
    TR_MODAL_PRICE      = "Price per unit",
    TR_MODAL_ANONYMOUS  = "Black money",

    -- Notification translations
    TR_DONT_FULL        = "Your inventory is too full.",
    TR_DONT_MONEY       = "You don't have enough money.",
    TR_SUCESS           = "Purchase successful",
    TR_REMOVED_ITEM     = "Item successfully removed",
    TR_DONT_AMOUNT      = "There aren't that many items for sale.",
    TR_NOT_FOUND        = "Item already sold or not found.",
    TR_ADVERTISE_ITEM   = "Successfully advertised item.",
    TR_DONT_AMOUNT2     = "You don't have that amount.",
    TR_DONT_SELF        = "You cannot buy your own item.",

    -- Translations of the public Webhook.
    TR_WEBHOOK_OWNER    = "Announced by: ",
    TR_WEBHOOK_AMOUNT   = "Available amount: ",
    TR_WEBHOOK_PRICE    = "Price per unit: ",

    -- Translations from Webhook to Log admin.
    TR_WEBHOOK_LOG_BUY          = "Purchased item",
    TR_WEBHOOK_LOG_BUY_BY       = "Purchased by: ",
    TR_WEBHOOK_LOG_BUY_AMOUNT   = "Amount : ",
    TR_WEBHOOK_LOG_BUY_PRICE    = "Price : ",
    TR_WEBHOOK_LOG_REMOVE       = "Item removed : ",
}

-- shop 1   Raven           45.000.000  -- paid
-- shop 2   Alghaede        30.000.000  -- paid
-- shop 3   Sopranos        30.000.000  -- paid
-- shop 4   CHECHEN         25.000.000  -- paid
-- shop 5   ULTRA           60.000.000  -- paid
-- shop 6   Syc             45.000.000  -- paid
-- shop 7   FOX             10.000.000  -- paid
-- shop 8   Siege           15.000.000  -- paid
-- shop 9   Rogue           40.000.000  -- paid
-- shop 10  GroveStreet     70.000.000  -- paid
-- shop 11  GOD_OF_GAMERS   35.000.000  -- not paid

-- Wash Money                   -


-- vec(-665.65, -935.79, 21.83), -- gun shop 1
-- vec(818.87, -2149.96, 29.62), -- gun shop 2
-- vec(1692.71, 3754.85, 34.71), -- gun shop 3
-- vec(-331.12, 6079.03, 31.45), -- gun shop 4
-- vec(253.19, -46.34, 69.94),   -- gun shop 5
-- vec(11.05, -1110.82, 29.8),   -- gun shop 6
-- vec(2571.39, 294.73, 108.74), -- gun shop 7
-- vec(-1120.22, 2695.94, 18.55),-- gun shop 8
-- vec(846.44, -1030.8, 28.22),  -- gun shop 9
-- vec(-1307.46, -389.74, 36.7), -- gun shop 10
-- vec(-3171.04, 1083.29, 20.84),-- gun shop 11

-- vec(3905.67, -4690.61, 4.14),  -- jazire 1-1
-- vec(3908.09, -4687.2, 4.08),   -- jazire 1-2
-- vec(3910.45, -4683.8, 4.04),   -- jazire 1-3

-- vec(4805.53, -4297.71, 5.21),  -- jazire 2-1
-- vec(4801.02, -4297.35, 5.14),  -- jazire 2-2

-- vec(5598.06, -5228.79, 14.22), -- jazire 3-1
-- vec(5599.69, -5224.81, 14.15), -- jazire 3-2

-- vec(5496.82, -5842.78, 19.04), -- jazire 4-1
-- vec(5495.6, -5838.78, 19.04),  -- jazire 4-2

-- vec(4908.18, -5755.27, 26.03), -- jazire 5-1
-- vec(4910.45, -5751.78, 26.01), -- jazire 5-2
