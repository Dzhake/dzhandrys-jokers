SMODS.Joker {
    key = "icon",
    attributes = { "xmult", "rank", "king" },
    atlas = "jokers",
    pos = { x = 0, y = 2 },
    pixel_size = { h = 95 / 1.2 },
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    config = {
        extra = {
            xmult = 2.5,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round and context.other_card:get_id() == 13 then
            local is_first_king = false
            local cards = context.cardarea.cards
            for i = 1, #cards do
                if cards[i]:get_id() == 13 then
                    is_first_king = cards[i] == context.other_card
                    break
                end
            end

            if is_first_king then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED
                    }
                else
                    return {
                        x_mult = card.ability.extra.xmult
                    }
                end
            end
        end
    end,
}
