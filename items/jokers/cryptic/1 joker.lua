SMODS.Joker {
    key = "cryptic_joker",
    attributes = { "cryptic", "xmult" },
    blueprint_compat = true,
    atlas = "cryptic_jokers",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            xmult = 2,
        }
    },
    rarity = 1,
    cost = 5,
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
                xmult = card.ability.extra.xmult
            }
        end
    end,
}
