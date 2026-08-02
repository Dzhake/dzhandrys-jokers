SMODS.Joker {
    key = "superior_credit_card",
    attributes = { "superior", "economy" },
    unlocked = false,
    blueprint_compat = false,
    atlas = "jokers",
    pos = { x = 5, y = 1 },
    rarity = 1,
    cost = 2,
    config = {
        extra = {
            deduction = 5,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.deduction } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.deduction
        G.GAME.current_round.reroll_cost = G.GAME.current_round.reroll_cost - card.ability.extra.deduction
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.deduction
        G.GAME.current_round.reroll_cost = G.GAME.current_round.reroll_cost + card.ability.extra.deduction
    end,
    locked_loc_vars = function(self, info_queue, card)
        return { vars = { -25 } }
    end,
    check_for_unlock = function(self, args)
        if args.type == "money" then
            return G.GAME.dollars <= -25
        end
        return false
    end
}
