SMODS.Joker {
    key = "cryptic_madness",
    attributes = { "cryptic", "xmult", "joker" },
    blueprint_compat = true,
    perishable_compat = false,
    atlas = "cryptic_jokers",
    pos = { x = 8, y = 11 },
    config = {
        extra = {
            xmult = 2,
        }
    },
    rarity = 2,
    cost = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.other_joker and SMODS.is_eternal(context.other_joker) then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
}
