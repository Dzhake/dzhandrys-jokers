local function create_basic_booster_pack_pack(key, weight, cost, x, y, extra, choose)
    SMODS.Booster {
        key = key,
        group_key = "p_dzhrj_booster_pack_pack",
        attributes = {},
        atlas = "boosters",
        weight = weight,
        kind = 'dzhrj_Booster',
        cost = cost,
        pos = { x = x, y = y },
        config = { extra = extra, choose = choose },
        draw_hand = false,
        select_button_text = "Select",
        ease_background_colour = function(self)
            ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY[3])
            ease_background_colour({ new_colour = G.C.RARITY[1], special_colour = G.C.BLACK, contrast = 2 })
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
                colours = { G.C.WHITE, lighten(G.C.BOOSTER, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
        create_card = function(self, card, i)
            G.GAME._dzhrj_booster_pack = true
            local i = 0
            local pack = get_pack("dzhrj_booster_pack")
            while pack.kind == "dzhrj_Booster" and i < 10000 do
                pack = get_pack("dzhrj_booster_pack")
                i = i + 1
            end
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
end

create_basic_booster_pack_pack("booster_pack_pack_1", 1, 5, 0, 0, 3, 1)
create_basic_booster_pack_pack("booster_pack_pack_2", 1, 5, 1, 0, 3, 1)
create_basic_booster_pack_pack("booster_pack_pack_jumbo", 1, 8, 2, 0, 5, 1)
