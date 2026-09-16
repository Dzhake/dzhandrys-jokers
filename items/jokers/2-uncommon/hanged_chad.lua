SMODS.Joker {
    key = "hanged_chad",
    attributes = { "retrigger", "passive" },
    atlas = "jokers",
    pos = { x = 1, y = 2 },
    blueprint_compat = true,
    immutable = true,
    rarity = 2,
    cost = 6,
    calculate = function(self, card, context)
        if context.dzhrj_calculate_bonus_calculations and context.other_context.remove_playing_cards then
            return {
                dzhrj_bonus_calculations_add = context.dzhrj_bonus_calculations_add + 2
            }
        end
    end
}
