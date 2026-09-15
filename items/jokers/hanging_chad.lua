local function swap_cards(i, j, context)
    G.play.cards[i], G.play.cards[j] = G.play.cards[j], G.play.cards[i]
    context.scoring_hand[i], context.scoring_hand[j] = context.scoring_hand[j], context.scoring_hand[i]
end

SMODS.Joker {
    key = "cryptic_hanging_chad",
    attributes = { "cryptic", "passive" },
    atlas = "jokers",
    pos = { x = 8, y = 2 },
    blueprint_compat = true,
    immutable = true,
    demicoloncompat = false,
    rarity = 3,
    cost = 8,
    calculate = function(self, card, context)
        if context.joker_main then
            for i = #G.play.cards, 2, -1 do
                swap_cards(i, i - 1, context)
            end
        end

        if context.individual and context.cardarea == G.play then
            local index = -1
            for i = 1, #G.play.cards do
                if G.play.cards[i] == context.other_card then
                    index = i
                    break
                end
            end

            if index ~= -1 and G.play.cards[index + 1] then
                swap_cards(index, index + 1, context)
                G.E_MANAGER:add_event(Event({
                    blocking = true,
                    func = function()
                        swap_cards(index, index + 1, context)
                        return true
                    end
                }))
            end
        end
    end
}
