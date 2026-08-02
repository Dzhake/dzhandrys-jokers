local function basic_xchips_poker_hand_joker(key, pos, xchips, hand)
    SMODS.Joker {
        key = key,
        attributes = { "superior", "xchips", "hand_type" },
        atlas = "jokers",
        pos = pos,
        rarity = 2,
        blueprint_compat = true,
        cost = 8,
        config = { extra = { xchips = xchips, hand = hand }, },
        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.xchips, localize(card.ability.extra.hand, 'poker_hands') } }
        end,
        calculate = function(self, card, context)
            if context.joker_main and not next(context.poker_hands[card.ability.extra.hand]) then
                return {
                    xchips = card.ability.extra.xchips
                }
            end
        end
    }
end

local function basic_xmult_poker_hand_joker(key, pos, xmult, hand)
    SMODS.Joker {
        key = key,
        attributes = { "superior", "xmult", "hand_type" },
        atlas = "jokers",
        pos = pos,
        rarity = 2,
        blueprint_compat = true,
        cost = 8,
        config = { extra = { xmult = xmult, hand = hand }, },
        loc_vars = function(self, info_queue, card)
            return { vars = { card.ability.extra.xmult, localize(card.ability.extra.hand, 'poker_hands') } }
        end,
        calculate = function(self, card, context)
            if context.joker_main and not next(context.poker_hands[card.ability.extra.hand]) then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    }
end

basic_xmult_poker_hand_joker("superior_jolly_joker", { x = 2, y = 0 }, 3.5, "Pair")
basic_xmult_poker_hand_joker("superior_zany_joker", { x = 3, y = 0 }, 2.5, "Three of a Kind")
basic_xmult_poker_hand_joker("superior_mad_joker", { x = 4, y = 0 }, 2.5, "Two Pair")
basic_xmult_poker_hand_joker("superior_crazy_joker", { x = 5, y = 0 }, 2, "Straight")
basic_xmult_poker_hand_joker("superior_droll_joker", { x = 6, y = 0 }, 1.5, "Flush")

basic_xchips_poker_hand_joker("superior_sly_joker", { x = 0, y = 14 }, 3.5, "Pair")
basic_xchips_poker_hand_joker("superior_wily_joker", { x = 1, y = 14 }, 2.5, "Three of a Kind")
basic_xchips_poker_hand_joker("superior_clever_joker", { x = 2, y = 14 }, 2.5, "Two Pair")
basic_xchips_poker_hand_joker("superior_devious_joker", { x = 3, y = 14 }, 2, "Straight")
basic_xchips_poker_hand_joker("superior_crafty_joker", { x = 4, y = 14 }, 1.5, "Flush")
