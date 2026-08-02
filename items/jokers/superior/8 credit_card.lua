SMODS.Joker {
    key = "superior_credit_card",
    attributes = { "superior", "economy" },
    unlocked = false,
    blueprint_compat = true,
    atlas = "jokers",
    pos = { x = 5, y = 1 },
    rarity = 1,
    cost = 2,
    loc_vars = function(self, info_queue, card)

    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.0,
                func = function()
                    local tarot = create_card(nil, G.consumeables, nil, nil, nil, nil, "c_hanged_man", "dzhandrys_jokers")
                    tarot:set_edition({ negative = true }, true)
                    tarot:add_to_deck()
                    G.consumeables:emplace(tarot)
                    return true
                end,
            }))
        end
        return nil
    end,
}
