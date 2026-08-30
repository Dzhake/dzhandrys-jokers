SMODS.Joker {
    key = "cryptic_vagabond",
    attributes = { "cryptic", "generation", "spectral", "hands" },
    atlas = "jokers",
    pos = { x = 6, y = 1 },
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    config = { extra = { dollars = -4 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars } }
    end,
    calculate = function(self, card, context)
        if context.joker_main and
            #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            if G.GAME.dollars <= card.ability.extra.dollars then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        SMODS.add_card {
                            set = 'Spectral',
                            key_append = 'dzhrj_cryptic_vagabond'
                        }
                        G.GAME.consumeable_buffer = 0
                        return true
                    end)
                }))
                return {
                    message = localize('k_plus_spectral'),
                }
            end
        end
    end,
}
