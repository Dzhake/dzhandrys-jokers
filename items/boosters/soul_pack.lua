SMODS.Booster {
    key = "soul_pack",
    attributes = {},
    atlas = "boosters",
    weight = 0.1,
    kind = 'dzhrj_Soul',
    cost = 15,
    pos = { x = 3, y = 0 },
    config = { extra = 1, choose = 1 },
    group_key = "k_spectral_pack",
    draw_hand = false,
    select_button_text = "Select",
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY[4])
        ease_background_colour({ new_colour = HEX("4e5779"), special_colour = G.C.BLACK, contrast = 5 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.3,
            initialize = true,
            lifespan = 2,
            speed = 20,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, HEX("c7b24a") },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(3, 0)
    end,
    in_pool = function(self, args)
        return not G.GAME._dzhrj_used_soul_pack
    end,
    create_card = function(self, card, i)
        G.GAME._dzhrj_used_soul_pack = true
        return { key = "c_soul", skip_materialize = true }
    end,
}
