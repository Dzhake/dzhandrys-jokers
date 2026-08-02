SMODS.Joker {
    key = "superior_four_fingers",
    attributes = { "superior", "passive" },
    blueprint_compat = false,
    atlas = "jokers",
    pos = { x = 6, y = 6 },
    config = {
        extra = {
        }
    },
    rarity = 3,
    cost = 10,
    calculate = function(self, card, context)
        if context.evaluate_poker_hand then
            local poker_hands_names = { "Straight Flush", "Straight", "Flush", "High Card" }
            local poker_hands = {}

            for hand, _ in pairs(context.poker_hands) do
                poker_hands[hand] = {}
            end

            for _, hand in pairs(poker_hands_names) do
                if not poker_hands[hand] then poker_hands[hand] = {} end
                table.insert(poker_hands[hand], context.scoring_hand)
            end
            return {
                replace_scoring_name = "Straight Flush",
                replace_poker_hands = poker_hands,
            }
        end
    end,
}
