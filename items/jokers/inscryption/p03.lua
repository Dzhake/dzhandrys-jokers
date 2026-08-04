SMODS.Joker {
    key = "p03",
    attributes = { "scaling", "reset", "hands", "discards", "hand_size" },
    blueprint_compat = false,
    atlas = "inscryption",
    pos = { x = 0, y = 0 },
    soul_atlas = "inscryption",
    soul_pos = { x = 1, y = 0 },
    config = {
        extra = {
            hand_size = 1,
            hand_size_mod = 1,
            hand_size_default = 1,
        }
    },
    rarity = 4,
    cost = 20,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hand_size, card.ability.extra.hand_size_mod, card.ability.extra
                .hand_size_default,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.blueprint then return end

        if context.setting_blind then
            local size_diff = card.ability.extra.hand_size - card.ability.extra.hand_size_default
            return {
                message = localize("k_reset"),
                colour = G.C.FILTER,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:change_size(-size_diff)
                            card.ability.extra.hand_size = card.ability.extra.hand_size_default
                            return true
                        end
                    }))
                end
            }
        end

        if context.after or context.pre_discard then
            local size_diff = card.ability.extra.hand_size_mod
            return {
                message = localize { type = "variable", key = "a_chips", vars = { size_diff } },
                colour = G.C.FILTER,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:change_size(size_diff)
                            card.ability.extra.hand_size = card.ability.extra.hand_size + size_diff
                            return true
                        end
                    }))
                end
            }
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.hand_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_size)
    end,
}
