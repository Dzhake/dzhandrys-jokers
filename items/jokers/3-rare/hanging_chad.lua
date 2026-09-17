local function find(table, element)
    for i in ipairs(table) do if table[i] == element then return i end end
end

local function swap_cards(i, j, context)
    G.play.cards[i], G.play.cards[j] = G.play.cards[j], G.play.cards[i]
    local c1 = find(context.scoring_hand, G.play.cards[i])
    local c2 = find(context.scoring_hand, G.play.cards[j])
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

        -- use the order
        if context.joker_main then
            table.sort(G.play.cards,
                function(c1, c2) return c1._dzhrj_hanging_chad_sort < c2._dzhrj_hanging_chad_sort end)
            table.sort(context.scoring_hand,
                function(c1, c2) return c1._dzhrj_hanging_chad_sort < c2._dzhrj_hanging_chad_sort end)

            for i = 1, #G.play.cards do
                G.play.cards[i]._dzhrj_hanging_chad_sort = nil
            end
        end

        -- move card
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
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            blocking = true,
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
