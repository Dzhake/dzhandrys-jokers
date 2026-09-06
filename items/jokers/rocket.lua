SMODS.Joker {
    key = "cryptic_rocket",
    attributes = { "cryptic", "scaling", "space", "boss_blind" },
    atlas = "jokers",
    pos = { x = 7, y = 1 },
    blueprint_compat = true,
    rarity = 3,
    cost = 10,
    config = { extra = { levels = 1, increase = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.levels, card.ability.extra.increase } }
    end,
    calculate = function(self, card, context)
        if context.playing_card_end_of_round and context.cardarea == G.hand and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = function()
                    if G.GAME.last_hand_played then
                        local _planet = nil
                        for _, planet_center in pairs(G.P_CENTER_POOLS.Planet) do
                            if planet_center.config.hand_type == G.GAME.last_hand_played then
                                _planet = planet_center.key
                            end
                        end
                        if _planet then
                            SMODS.add_card({ key = _planet })
                        end
                        G.GAME.consumeable_buffer = 0
                    end
                    return true
                end
            }))
            return { message = localize('k_plus_planet'), colour = G.C.SECONDARY_SET.Planet }
        end

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
                    SMODS.upgrade_poker_hands({ hands = { G.GAME.last_hand_played }, level_up = card.ability.extra
                    .levels, instant = true })
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
