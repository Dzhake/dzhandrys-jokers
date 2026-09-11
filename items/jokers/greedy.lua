SMODS.Joker {
    key = "cryptic_greedy",
    attributes = { "cryptic", "xmult", "economy", "diamonds" },
    blueprint_compat = true,
    demicoloncompat = true,
    atlas = "jokers",
    pos = { x = 4, y = 2, },
    config = {
        extra = {
            xmult = 0.8,
            dollars = 2,
            suit = "Diamonds",
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(card.ability.extra.suit, 'suits_singular'), card.ability.extra.xmult, card.ability.extra
                .dollars
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.individual and context.cardarea == G.play and
                context.other_card:is_suit(card.ability.extra.suit)) or context.forcetrigger then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                xmult = card.ability.extra.xmult,
                dollars = card.ability.extra.dollars,
                func = function() -- This is for timing purposes, it runs after the dollar manipulation
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end,
}
