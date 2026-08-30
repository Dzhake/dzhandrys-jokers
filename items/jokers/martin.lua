SMODS.Joker {
    key = "martin",
    attributes = { "passive" },
    blueprint_compat = false,
    atlas = "jokers",
    pos = { x = 5, y = 1 },
    soul_atlas = "jokers",
    soul_pos = { x = 6, y = 1 },
    rarity = 3,
    cost = 8,
    calculate = function(self, card, context)
        if context.blueprint then return end
        if context.individual and context.cardarea == G.play and not context.other_card.debuff then
            context.other_card.ability.dzhrj_played_this_round = true
        end

        if context.hand_drawn and context.first_hand_drawn then
            for _, deck_card in pairs(G.deck.cards) do
                deck_card.ability.dzhrj_played_this_round = false
            end
            for _, deck_card in pairs(G.hand.cards) do
                deck_card.ability.dzhrj_played_this_round = false
            end
        end
    end,
}

-- see lovely/martin.toml
