SMODS.Joker {
    key = "cryptic_wrathful",
    attributes = { "cryptic", "xmult", "xchips", "spades" },
    blueprint_compat = true,
    demicoloncompat = true,
    atlas = "jokers",
    pos = { x = 6, y = 2, },
    config = {
        extra = {
            xmult = 0.8,
            xchips = 1.4,
            suit = "Spades",
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(card.ability.extra.suit, 'suits_singular'), card.ability.extra.xmult, card.ability.extra.xchips
            }
        }
    end,
    calculate = function(self, card, context)
        if (context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit)) or context.forcetrigger then
            return {
                xmult = card.ability.extra.xmult,
                xchips = card.ability.extra.xchips,
            }
        end
    end,
}
