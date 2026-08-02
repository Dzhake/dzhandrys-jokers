SMODS.Joker {
    key = "superior_joker",
    attributes = { "superior", "xmult" },
    blueprint_compat = true,
    atlas = "jokers",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xmult = 2,
        }
    },
    rarity = 2,
    cost = 8,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                Xmult = card.ability.extra.xmult
            }
        end
    end,
}
