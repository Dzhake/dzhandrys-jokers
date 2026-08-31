SMODS.Joker {
    key = "cryptic_shortcut",
    attributes = { "cryptic", "hand_type", "passive", "discard" },
    atlas = "jokers",
    pos = { x = 9, y = 1 },
    blueprint_compat = false,
    rarity = 3,
    cost = 10,
    config = { extra = { discards = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.discards } }
    end,
    calculate = function(self, card, context)
        if context.drawing_cards and not context.blueprint and not next(evaluate_poker_hand(G.hand.cards)['Straight']) then
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_discard(card.ability.extra.discards, nil, true)
                    SMODS.calculate_effect({
                        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.hands } },
                        colour = G.C.RED,
                    }, card)

                    return true
                end
            }))
        end
    end,
}
