SMODS.Booster {
    key = "rare_booster_pack_pack",
    group_key = "p_dzhrj_booster_pack_pack",
    attributes = {},
    atlas = "boosters",
    weight = 3,
    kind = 'dzhrj_Booster',
    cost = 8,
    pos = { x = 0, y = 1 },
    config = { extra = 5, choose = 1 },
    draw_hand = false,
    select_button_text = "Select",
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY[3])
        ease_background_colour({ new_colour = G.C.RARITY[3], special_colour = G.C.BLACK, contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, G.C.RARITY[3], lighten(G.C.RARITY[3], 0.2), darken(G.C.RARITY[3], 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
    create_card = function(self, card, i)
        G.GAME._dzhrj_booster_pack = true
        local i = 0
        G.GAME._dzhrj_booster_invert_weights = true
        local pack = get_pack("dzhrj_booster_pack")
        while pack.kind == "dzhrj_Booster" and i < 10000 do
            pack = get_pack("dzhrj_booster_pack")
            i = i + 1
        end
        G.GAME._dzhrj_booster_invert_weights = nil
        if i >= 10000 then pack = nil end

        local booster = SMODS.create_card({
            key = pack and pack.key or "p_arcana_normal_1",
            area = G.pack_cards,
        })
        booster.cost = 0
        booster.sell_cost = 0
        return booster
    end,
}
