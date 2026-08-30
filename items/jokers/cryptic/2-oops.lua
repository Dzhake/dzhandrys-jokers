SMODS.Joker {
    key = "cryptic_oops",
    attributes = { "cryptic", "mod_chance", "passive" },
    atlas = "jokers",
    pos = { x = 0, y = 1 },
    blueprint_compat = false,
    demicoloncompat = false,
    immutable = true,
    rarity = 2,
    cost = 7,
    calculate = function(self, card, context)
        if context.fix_probability then
            return {
                numerator = context.denominator
            }
        end
    end
}
