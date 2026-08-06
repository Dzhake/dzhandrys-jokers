SMODS.Joker {
    key = "cryptic_madness",
    attributes = { "cryptic", "xmult", "joker" },
    blueprint_compat = true,
    atlas = "jokers",
    pos = { x = 8, y = 0 },
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
        if context.other_joker and SMODS.is_eternal(context.other_joker) or context.forcetrigger then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    in_pool = function(self, args)
        local area = G.jokers
        for i = 1, #area.cards do
            local card = area.cards[i]
            if card.ability and SMODS.is_eternal(card, {}) then
                return true
            end
        end
        return false
    end,
}
