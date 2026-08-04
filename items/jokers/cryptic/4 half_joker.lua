SMODS.Joker {
    key = "cryptic_half_joker",
    attributes = { "cryptic", "generation", "tarot" },
    unlocked = false,
    blueprint_compat = true,
    atlas = "cryptic_jokers",
    pos = { x = 7, y = 0 },
    --pixel_size = { h = 95 / 1.7 },
    rarity = 3,
    cost = 10,
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'e_negative_consumable', set = 'Edition', config = { extra = 1 } }
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = "before",
                delay = 0.0,
                func = function()
                    local tarot = create_card(nil, G.consumeables, nil, nil, nil, nil, "c_hanged_man", "dzhrj")
                    tarot:set_edition({ negative = true }, true)
                    tarot:add_to_deck()
                    G.consumeables:emplace(tarot)
                    return true
                end,
            }))
        end
        return nil
    end,

    locked_loc_vars = function(self, info_queue, card)
        return { vars = { 1, G.deck and G.deck.config.card_limit or G.GAME.starting_deck_size } }
    end,
    check_for_unlock = function(self, args)
        if args.type == 'modify_deck' then
            return G.deck and G.deck.config.card_limit <= 1
        end
        return false
    end
}
