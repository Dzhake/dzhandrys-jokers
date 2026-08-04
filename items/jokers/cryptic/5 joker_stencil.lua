SMODS.Joker {
    key = "cryptic_joker_stencil",
    attributes = { "cryptic", "xmult" },
    blueprint_compat = true,
    atlas = "cryptic_jokers",
    pos = { x = 2, y = 5 },
    config = {
        extra = {
            xmult_per_card = 1,
            xmult_min = 1,
        }
    },
    rarity = 3,
    cost = 9,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.starting_params.play_limit, card.ability.extra.xmult_per_card, card.ability.extra.xmult_min
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = math.max(G.GAME.starting_params.play_limit -
                    #context.full_hand * card.ability.extra.xmult_per_card, card.ability.extra.xmult_min)
            }
        end
    end,
}
