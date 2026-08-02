local function basic_suit_joker(key, pos, suit)
    SMODS.Joker {
        key = key,
        attributes = { "superior", "xchips", suit:lower() },
        blueprint_compat = true,
        atlas = "jokers",
        pos = pos,
        config = {
            extra = {
                xchips = 1.5,
                suit = suit,
            }
        },
        rarity = 2,
        cost = 8,
        loc_vars = function(self, info_queue, card)
            return {
                vars = {
                    card.ability.extra.xchips, localize(card.ability.extra.suit, 'suits_singular')
                }
            }
        end,
        calculate = function(self, card, context)
            if context.individual and context.cardarea == G.play and
                context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end,
    }
end

basic_suit_joker("superior_greedy_joker", { x = 6, y = 1 }, "Diamonds")
basic_suit_joker("superior_lusty_joker", { x = 7, y = 1 }, "Hearts")
basic_suit_joker("superior_wrathful_joker", { x = 8, y = 1 }, "Spades")
basic_suit_joker("superior_gluttonous_joker", { x = 9, y = 1 }, "Clubs")
