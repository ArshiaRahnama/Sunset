
-- Add here the items you want to allow to be sold.
-- Images must be included in the img folder in png, jpg or gif format
-- name = name of the item in the database
-- label = name of the item that is shown to the player
-- price_recommended is the recommended price for each item.

list_products = {
    { name = "sc",                  label = "S C",              img = "nui://sun-inventory-hud/ui/img/items/sc.png",            price_recommended = 10000   }, --, minimum = 5000
    -- { name = "water",               label = "Ab",               img = "nui://sun-inventory-hud/ui/img/items/water.png",         price_recommended = 350     },
    -- { name = "loka",                label = "Abmive",           img = "nui://sun-inventory-hud/ui/img/items/loka.png",          price_recommended = 350     },
    -- { name = "burger",              label = "Burger",           img = "nui://sun-inventory-hud/ui/img/items/burger.png",        price_recommended = 750     },
    -- { name = "tea",                 label = "Chaee",            img = "nui://sun-inventory-hud/ui/img/items/tea.png",           price_recommended = 250     },
    -- { name = "fanta",               label = "Fanta",            img = "nui://sun-inventory-hud/ui/img/items/fanta.png",         price_recommended = 500     },
    -- { name = "coffee",              label = "Ghahve",           img = "nui://sun-inventory-hud/ui/img/items/coffee.png",        price_recommended = 500     },
    -- { name = "cocacola",            label = "Coca Cola",        img = "nui://sun-inventory-hud/ui/img/items/cocacola.png",      price_recommended = 500     },
    -- { name = "pizza",               label = "Pizza",            img = "nui://sun-inventory-hud/ui/img/items/pizza.png",         price_recommended = 1000    },
    -- { name = "bread",               label = "Noon",             img = "nui://sun-inventory-hud/ui/img/items/bread.png",         price_recommended = 400     },
    -- { name = "soda",                label = "Noshabe",          img = "nui://sun-inventory-hud/ui/img/items/soda.png",          price_recommended = 500     },
    -- { name = "wine",                label = "Sharab",           img = "nui://sun-inventory-hud/ui/img/items/wine.png",          price_recommended = 5000    },
    -- { name = "sprite",              label = "Sprite",           img = "nui://sun-inventory-hud/ui/img/items/sprite.png",        price_recommended = 500     },
    -- { name = "cigar",               label = "Cigar",            img = "nui://sun-inventory-hud/ui/img/items/cigar.png",         price_recommended = 100     },
    -- { name = "phone",               label = "Goshi",            img = "nui://sun-inventory-hud/ui/img/items/phone.png",         price_recommended = 3500    },
    -- { name = "beer",                label = "Abjo",             img = "nui://sun-inventory-hud/ui/img/items/beer.png",          price_recommended = 200     },
    -- { name = "sandwich",            label = "Sandwich",         img = "nui://sun-inventory-hud/ui/img/items/sandwich.png",      price_recommended = 600     },
    -- { name = "macka",               label = "Sandwitch",        img = "nui://sun-inventory-hud/ui/img/items/macka.png",         price_recommended = 600     },
    -- { name = "vodka",               label = "Vodka",            img = "nui://sun-inventory-hud/ui/img/items/vodka.png",         price_recommended = 5000    },
    -- { name = "tequila",             label = "Tequila",          img = "nui://sun-inventory-hud/ui/img/items/tequila.png",       price_recommended = 500     },
    -- { name = "cheesebows",          label = "Snack",            img = "nui://sun-inventory-hud/ui/img/items/cheesebows.png",    price_recommended = 500     },
    -- { name = "titopgold",           label = "Ti Top Talaee",    img = "nui://sun-inventory-hud/ui/img/items/titopgold.png",     price_recommended = 50000   },

    { name = "iron",                label = "Ahan",             img = "nui://sun-inventory-hud/ui/img/items/iron.png",          price_recommended = 12500   },
    { name = "gold",                label = "Tala",             img = "nui://sun-inventory-hud/ui/img/items/gold.png",          price_recommended = 20000   },
    { name = "diamond",             label = "Almas",            img = "nui://sun-inventory-hud/ui/img/items/diamond.png",       price_recommended = 5000    },
    { name = "iron_piece",          label = "Khorde ahan",      img = "nui://sun-inventory-hud/ui/img/items/iron_piece.png",    price_recommended = 625     },
    { name = "gold_piece",          label = "Khorde tala",      img = "nui://sun-inventory-hud/ui/img/items/gold_piece.png",    price_recommended = 1000    },
    { name = "jewels",              label = "Javaher",          img = "nui://sun-inventory-hud/ui/img/items/jewels.png",        price_recommended = 1750    },

    { name = "alive_chicken",       label = "Morgh zende",      img = "nui://sun-inventory-hud/ui/img/items/alive_chicken.png", price_recommended = 800     },
    { name = "slaughtered_chicken", label = "Morgh",            img = "nui://sun-inventory-hud/ui/img/items/slaughtered_chicken.png", price_recommended = 1000 },
    { name = "packaged_chicken",    label = "Morgh baste bandi shode", img = "nui://sun-inventory-hud/ui/img/items/packaged_chicken.png", price_recommended = 250 },

    { name = "wool",                label = "Pashm",            img = "nui://sun-inventory-hud/ui/img/items/wool.png",          price_recommended = 100     },
    { name = "fabric",              label = "Parche",           img = "nui://sun-inventory-hud/ui/img/items/fabric.png",        price_recommended = 625     },
    { name = "clothe",              label = "Lebas",            img = "nui://sun-inventory-hud/ui/img/items/clothe.png",        price_recommended = 2100    },

    { name = "petrol",              label = "Benzin",           img = "nui://sun-inventory-hud/ui/img/items/petrol.png",        price_recommended = 500     },
    { name = "petrol_raffin",       label = "Rafin",            img = "nui://sun-inventory-hud/ui/img/items/petrol_raffin.png", price_recommended = 400     },
    { name = "essence",             label = "Asans",            img = "nui://sun-inventory-hud/ui/img/items/essence.png",       price_recommended = 300     },

    { name = "wood",                label = "Choob",            img = "nui://sun-inventory-hud/ui/img/items/wood.png",          price_recommended = 150     },
    { name = "cutted_wood",         label = "Choobe boresh khorde", img = "nui://sun-inventory-hud/ui/img/items/cutted_wood.png", price_recommended = 200 },
    { name = "packaged_plank",      label = "Choobe baste bandi shode", img = "nui://sun-inventory-hud/ui/img/items/packaged_plank.png", price_recommended = 1400 },

    { name = "cannabis",            label = "Shahdane",         img = "nui://sun-inventory-hud/ui/img/items/cannabis.png",      price_recommended = 500     },
    { name = "marijuana",           label = "Marijuana",        img = "nui://sun-inventory-hud/ui/img/items/marijuana.png",     price_recommended = 265     },
	{ name = "extra_marijuana",     label = "extra marijuana",  img = "nui://sun-inventory-hud/ui/img/items/extra_marijuana.png", price_recommended = 2250  },

    { name = "coca",                label = "Tokhm Kokayin",    img = "nui://sun-inventory-hud/ui/img/items/coca.png",          price_recommended = 400     },
    { name = "cocaine",             label = "Kokayin",          img = "nui://sun-inventory-hud/ui/img/items/cocaine.png",       price_recommended = 2000    },
    { name = "crack",               label = "Crack",            img = "nui://sun-inventory-hud/ui/img/items/crack.png",         price_recommended = 1250    },
    { name = "extra_crack",         label = "extra crack",      img = "nui://sun-inventory-hud/ui/img/items/extra_crack.png",   price_recommended = 2500    },

    { name = "poppy",               label = "KhashKhaash",      img = "nui://sun-inventory-hud/ui/img/items/poppy.png",         price_recommended = 300     },
    { name = "opium",               label = "Teryak",           img = "nui://sun-inventory-hud/ui/img/items/opium.png",         price_recommended = 550     },
    { name = "heroine",             label = "Heroine",          img = "nui://sun-inventory-hud/ui/img/items/heroine.png",       price_recommended = 4000    },
	{ name = "extra_heroine",       label = "extra heroine",    img = "nui://sun-inventory-hud/ui/img/items/extra_heroine.png", price_recommended = 3500    },

    { name = "ephedra",             label = "Ephedra",          img = "nui://sun-inventory-hud/ui/img/items/ephedra.png",       price_recommended = 500     },
    { name = "ephedrine",           label = "Ephedrine",        img = "nui://sun-inventory-hud/ui/img/items/ephedrine.png",     price_recommended = 550     },
    { name = "meth",                label = "Shishe",           img = "nui://sun-inventory-hud/ui/img/items/meth.png",          price_recommended = 5000    },
    { name = "extra_meth",          label = "extra meth",       img = "nui://sun-inventory-hud/ui/img/items/extra_meth.png",    price_recommended = 5000    },
	
	{ name = "mushroom",            label = "Gharch",           img = "nui://sun-inventory-hud/ui/img/items/mushroom.png",      price_recommended = 100     },
    
    -- mahi ha 
    { name = "mahi_sardine",        label = "Mahi Sardine",     img = "nui://sun-inventory-hud/ui/img/items/mahi_sardine.png",  price_recommended = 435     },
    { name = "mahi_sangsar",        label = "Mahi Sangsar",     img = "nui://sun-inventory-hud/ui/img/items/mahi_sangsar.png",  price_recommended = 560     },
    { name = "mahi_ordak",          label = "Ordak Mahi",       img = "nui://sun-inventory-hud/ui/img/items/mahi_ordak.png",    price_recommended = 570     },
    { name = "mahi_ghezel",         label = "Mahi Ghezel",      img = "nui://sun-inventory-hud/ui/img/items/mahi_ghezel.png",   price_recommended = 585     },
    { name = "mahi_hamoor",         label = "Mahi Hamoor",      img = "nui://sun-inventory-hud/ui/img/items/mahi_hamoor.png",   price_recommended = 600     },
    { name = "mahi_sorkhoo",        label = "Mahi Sorkhoo",     img = "nui://sun-inventory-hud/ui/img/items/mahi_sorkhoo.png",  price_recommended = 610     },
    { name = "mahi_salmon",         label = "Mahi Salmon",      img = "nui://sun-inventory-hud/ui/img/items/mahi_salmon.png",   price_recommended = 625     },
    { name = "mahi_shooride",       label = "Mahi Shooride",    img = "nui://sun-inventory-hud/ui/img/items/mahi_shooride.png", price_recommended = 640     },
    { name = "mahi_tilapia",        label = "Mahi Tilapia",     img = "nui://sun-inventory-hud/ui/img/items/mahi_tilapia.png",  price_recommended = 660     },
    { name = "mahi_sefid",          label = "Mahi Sefid",       img = "nui://sun-inventory-hud/ui/img/items/mahi_sefid.png",    price_recommended = 680     },
    { name = "mahi_shir",           label = "Shir Mahi",        img = "nui://sun-inventory-hud/ui/img/items/mahi_shir.png",     price_recommended = 700     },
    { name = "mahi_meygoo",         label = "Meygoo",           img = "nui://sun-inventory-hud/ui/img/items/mahi_meygoo.png",   price_recommended = 720     },
    { name = "jolbak",              label = "Jolbak",           img = "nui://sun-inventory-hud/ui/img/items/jolbak.png",        price_recommended = 100     },
    { name = "mahi_fugu",           label = "Mahi Fugu",        img = "nui://sun-inventory-hud/ui/img/items/mahi_fugu.png",     price_recommended = 20000   },
    { name = "mahi_alidaeii",       label = "Mahi AliDaeii",    img = "nui://sun-inventory-hud/ui/img/items/mahi_alidaeii.png", price_recommended = 30000   },

    { name = "husky_body",          label = "Lasheh husky",     img = "nui://sun-inventory-hud/ui/img/items/husky_body.png",    price_recommended = 20000   },
    { name = "retriever_body",      label = "Lasheh retriever", img = "nui://sun-inventory-hud/ui/img/items/retriever_body.png",   price_recommended = 20000 },
    { name = "rottweiler_body",     label = "Lasheh rottweiler", img = "nui://sun-inventory-hud/ui/img/items/rottweiler_body.png", price_recommended = 20000 },
    { name = "shepherd_body",       label = "Lasheh shepherd",  img = "nui://sun-inventory-hud/ui/img/items/shepherd_body.png", price_recommended = 20000   },
    { name = "panther_body",        label = "Lasheh palang",    img = "nui://sun-inventory-hud/ui/img/items/panther_body.png",  price_recommended = 50000   },
    { name = "boar_body",           label = "Lasheh goraz",     img = "nui://sun-inventory-hud/ui/img/items/boar_body.png",     price_recommended = 15000   },
    { name = "deer_body",           label = "Lasheh Ahu",       img = "nui://sun-inventory-hud/ui/img/items/deer_body.png",     price_recommended = 10000   },
    { name = "pig_body",            label = "Lasheh khuk",      img = "nui://sun-inventory-hud/ui/img/items/pig_body.png",      price_recommended = 20000   },
    { name = "rabbit_body",         label = "Lasheh khargush",  img = "nui://sun-inventory-hud/ui/img/items/rabbit_body.png",   price_recommended = 15000   },
    { name = "pigeon_body",         label = "Lasheh kabutar",   img = "nui://sun-inventory-hud/ui/img/items/pigeon_body.png",   price_recommended = 15000   },

    { name = "husky_skin",          label = "Pust husky",       img = "nui://sun-inventory-hud/ui/img/items/husky_skin.png",    price_recommended = 20000   },
    { name = "retriever_skin",      label = "Pust retriever",   img = "nui://sun-inventory-hud/ui/img/items/retriever_skin.png",  price_recommended = 20000 },
    { name = "rottweiler_skin",     label = "Pust rottweiler",  img = "nui://sun-inventory-hud/ui/img/items/rottweiler_skin.png", price_recommended = 20000 },
    { name = "shepherd_skin",       label = "Pust shepherd",    img = "nui://sun-inventory-hud/ui/img/items/shepherd_skin.png", price_recommended = 20000   },
    { name = "panther_skin",        label = "Pust palang",      img = "nui://sun-inventory-hud/ui/img/items/panther_skin.png",  price_recommended = 50000   },
    { name = "pig_skin",            label = "Pust khuk",        img = "nui://sun-inventory-hud/ui/img/items/pig_skin.png",      price_recommended = 10000   },
    { name = "deer_skin",           label = "Pust Ahu",         img = "nui://sun-inventory-hud/ui/img/items/deer_skin.png",     price_recommended = 5000    },
    { name = "boar_skin",           label = "Pust goraz",       img = "nui://sun-inventory-hud/ui/img/items/boar_skin.png",     price_recommended = 7500    },

    { name = "boar_meat",           label = "Gusht goraz",      img = "nui://sun-inventory-hud/ui/img/items/boar_meat.png",     price_recommended = 5000    },
    { name = "deer_meat",           label = "Gusht Ahu",        img = "nui://sun-inventory-hud/ui/img/items/deer_meat.png",     price_recommended = 3000    },
    { name = "pig_meat",            label = "Gusht khuk",       img = "nui://sun-inventory-hud/ui/img/items/pig_meat.png",      price_recommended = 3000    },
    { name = "rabbit_meat",         label = "Gusht khargush",   img = "nui://sun-inventory-hud/ui/img/items/rabbit_meat.png",   price_recommended = 15000   },
    { name = "pigeon_meat",         label = "Gusht kabutar",    img = "nui://sun-inventory-hud/ui/img/items/pigeon_meat.png",   price_recommended = 15000   },

    { name = "seed_coca",           label = "Dane Coca",        img = "nui://sun-inventory-hud/ui/img/items/seed_coca.png",     price_recommended = 100    },
    { name = "seed_ephedra",        label = "Dane Ephedra",     img = "nui://sun-inventory-hud/ui/img/items/seed_ephedra.png",  price_recommended = 100    },
    { name = "seed_cannabis",       label = "Dane Cannabis",    img = "nui://sun-inventory-hud/ui/img/items/seed_cannabis.png", price_recommended = 100    },
    { name = "seed_poppy",          label = "Dane KhashKhaash", img = "nui://sun-inventory-hud/ui/img/items/seed_poppy.png",    price_recommended = 100    },
    { name = "seed_apple",          label = "Dane Sib",         img = "nui://sun-inventory-hud/ui/img/items/seed_apple.png",    price_recommended = 100    },
    { name = "seed_orange",         label = "Dane Portaghal",   img = "nui://sun-inventory-hud/ui/img/items/seed_orange.png",   price_recommended = 100    },
    { name = "seed_corn",           label = "Dane Zorrat",      img = "nui://sun-inventory-hud/ui/img/items/seed_corn.png",     price_recommended = 100    },
    { name = "seed_wheat",          label = "Dane Gandom",      img = "nui://sun-inventory-hud/ui/img/items/seed_wheat.png",    price_recommended = 100    },
    { name = "seed_grape",          label = "Dane Angoor",      img = "nui://sun-inventory-hud/ui/img/items/seed_grape.png",    price_recommended = 100    },
    { name = "seed_rice",           label = "Dane Berenj",      img = "nui://sun-inventory-hud/ui/img/items/seed_rice.png",     price_recommended = 100    },
    { name = "wheat_pack",          label = "Gandom",           img = "nui://sun-inventory-hud/ui/img/items/wheat_pack.png",    price_recommended = 250    },
    { name = "grape_pack",          label = "Angoor",           img = "nui://sun-inventory-hud/ui/img/items/grape_pack.png",    price_recommended = 250    },
    { name = "corn_pack",           label = "Zorrat",           img = "nui://sun-inventory-hud/ui/img/items/corn_pack.png",     price_recommended = 250    },
    { name = "apple_pack",          label = "Sib",              img = "nui://sun-inventory-hud/ui/img/items/apple_pack.png",    price_recommended = 250    },
    { name = "orange_pack",         label = "Portaghal",        img = "nui://sun-inventory-hud/ui/img/items/orange_pack.png",   price_recommended = 250    },
    { name = "rice_pack",           label = "Berenj",           img = "nui://sun-inventory-hud/ui/img/items/rice_pack.png",     price_recommended = 250    },

}

Config = {
    positionX   = "50%",
    positionY   = "50%",
    size        = "1.0",
}

coords = {
    { coords = vec(-264.03,-906.11,31.33),      radius = 2.0 }, -- jobcneter
    { coords = vec(661.97,592.18,128.25),       radius = 2.0 }, -- ChangeWorld
    { coords = vec(883.59,-1579.8,30.02),       radius = 2.0 }, -- Miner
    { coords = vec(590.97,2747.23,41.02),       radius = 2.0 },      
    { coords = vec(1726.73,3697.39,33.54),      radius = 2.0 }, 
    { coords = vec(163.71,6638.45,30.71),       radius = 2.0 },    
    { coords = vec(-1599.48,208.02,58.29),      radius = 2.0 }, 
    { coords = vec(-1027.61, -2130.33, 12.59),  radius = 2.0 },
    { coords = vec(71.26, -1571.89, 28.61),     radius = 2.0 }, -- hide = true بلیپ نمی زنه
}
-- Configure the public and log WEBHOOK here

translate = {
    -- Graphical interface translations
    TR_TITLE            = "Auction House",
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
    TR_MODAL_ANONYMOUS  = "Discord Announce($20,000)",

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