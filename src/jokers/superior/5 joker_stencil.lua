SMODS.Joker {
    key = "superior_joker_stencil",
    attributes = { "superior", "xmult" },
    blueprint_compat = true,
    atlas = "jokers",
    pos = { x = 2, y = 5 },
    config = {
        extra = {
            xmult_per_card = 1,
            xmult_min = 1,
        }
    },
    rarity = 3,
    cost = 10,
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
                Xmult = math.max(G.GAME.starting_params.play_limit -
                    #context.full_hand * card.ability.extra.xmult_per_card, card.ability.extra.xmult_min)
            }
        end
    end,
}
