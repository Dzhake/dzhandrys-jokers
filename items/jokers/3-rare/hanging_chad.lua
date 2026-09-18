--ngl i'm so proud of this joker i think it's the best joker in the entire mod
local function swap_cards(i, j, context)
    G.play.cards[i], G.play.cards[j] = G.play.cards[j], G.play.cards[i]
    local c1 = get_index(context.scoring_hand, G.play.cards[i])
    local c2 = get_index(context.scoring_hand, G.play.cards[j])
    if not c1 or not c2 then return end
    context.scoring_hand[c1], context.scoring_hand[c2] = context.scoring_hand[c2], context.scoring_hand[c1]
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
        -- keep the order of cards
        if context.before then
            for i = 1, #G.play.cards do
                G.play.cards[i]._dzhrj_hanging_chad_sort = i
            end
        end

        -- apply the order
        if context.joker_main then
            table.sort(G.play.cards,
                function(c1, c2) return c1._dzhrj_hanging_chad_sort < c2._dzhrj_hanging_chad_sort end)
            table.sort(context.scoring_hand,
                function(c1, c2) return c1._dzhrj_hanging_chad_sort < c2._dzhrj_hanging_chad_sort end)

            for i = 1, #G.play.cards do
                G.play.cards[i]._dzhrj_hanging_chad_sort = nil
            end
        end

        -- move card during scoring
        if context.individual and context.cardarea == G.play then
            local index = get_index(G.play.cards, context.other_card)
            if index and G.play.cards[index + 1] then
                swap_cards(index, index + 1, context)
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                swap_cards(index, index + 1, context)
                                card:juice_up(0.4)
                                return true
                            end
                        }))
                        delay(0.2)
                    end
                }
            end
        end
    end
}
