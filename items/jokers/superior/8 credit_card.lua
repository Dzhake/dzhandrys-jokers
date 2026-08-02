SMODS.Joker {
    key = "superior_credit_card",
    attributes = { "superior", "economy" },
    blueprint_compat = false,
    atlas = "jokers",
    pos = { x = 5, y = 1 },
    rarity = 1,
    cost = 2,
    loc_vars = function(self, info_queue, card)

    end,
    calculate = function(self, card, context)
        if context.round_eval then
        end
        return nil
    end,
}
