SMODS.Joker {
    key = "cryptic_gluttonous",
    attributes = { "cryptic", "mult", "xmult", "clubs" },
    blueprint_compat = true,
    demicoloncompat = true,
    atlas = "jokers",
    pos = { x = 7, y = 2, },
    config = {
        extra = {
            xmult = 0.8,
            mult = 30,
            suit = "Clubs",
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(card.ability.extra.suit, 'suits_singular'), card.ability.extra.mult, card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.individual and context.cardarea == G.play and
                context.other_card:is_suit(card.ability.extra.suit)) or context.forcetrigger then
            return {
                mult = card.ability.extra.mult,
                xmult = card.ability.extra.xmult,
            }
        end
    end,
}
