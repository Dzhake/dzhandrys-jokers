SMODS.Joker {
    key = "cryptic_lusty",
    attributes = { "cryptic", "xmult", "chance", "hearts" },
    blueprint_compat = true,
    demicoloncompat = true,
    atlas = "jokers",
    pos = { x = 5, y = 2, },
    config = {
        extra = {
            xmultfail = 0.8,
            xmultsuccess = 2,
            numerator = 1,
            denominator = 2,
            suit = "Hearts",
        }
    },
    rarity = 2,
    cost = 5,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                localize(card.ability.extra.suit, 'suits_singular'), card.ability.extra.numerator, card.ability.extra
                .denominator, card.ability.extra.xmultsuccess, card.ability.extra.xmultfail
            }
        }
    end,
    calculate = function(self, card, context)
        if context.forcetrigger then
            return {
                xmult = card.ability.extra.xmultsuccess
            }
        end

        if (context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit)) then
            if SMODS.pseudorandom_probability(card, 'dzhrj_cryptic_lusty', card.ability.extra.numerator, card.ability.extra.denominator) then
                return {
                    xmult = card.ability.extra.xmultsuccess
                }
            else
                return {
                    xmult = card.ability.extra.xmultfail
                }
            end
        end
    end,
}
