SMODS.Joker {
    key = "cryptic_rocket",
    attributes = { "cryptic", "scaling", "space", "boss_blind" },
    atlas = "jokers",
    pos = { x = 7, y = 1 },
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    config = { extra = { levels = 1, increase = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.levels, card.ability.extra.increase } }
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if context.beat_boss then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "levels",
                    scalar_value = "increase",
                    scaling_message = {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.FILTER,
                        card = self
                    },
                })
            end

            G.E_MANAGER:add_event(Event({
                func = (function()
                    SMODS.upgrade_poker_hands({ level_up = card.ability.extra.levels, instant = true })
                    return true
                end)
            }))


            return {
                message = localize('k_level_up_ex'),
                colour = G.C.SECONDARY_SET.Planet,
            }
        end
    end,
}
