SMODS.Joker {
    key = "cryptic_ceremonial_dagger",
    attributes = { "cryptic", "joker" },
    blueprint_compat = true,
    perishable_compat = false,
    atlas = "cryptic_jokers",
    pos = { x = 5, y = 5 },
    rarity = 2,
    cost = 6,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local my_pos = nil
            local area = card.area
            for i = 1, #area.cards do
                if area.cards[i] == card then
                    my_pos = i
                    break
                end
            end

            if my_pos and area.cards[my_pos + 1] and not area.cards[my_pos + 1].getting_sliced then
                local sliced_card = G.jokers.cards[my_pos + 1]

                sliced_card.getting_sliced = true -- Make sure to do this on destruction effects
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        sliced_card:sell_card()
                        G.GAME.joker_buffer = 0
                        card:juice_up(0.8, 0.8)
                        return true
                    end
                }))
            end
        end
    end
}
