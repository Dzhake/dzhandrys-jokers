SMODS.Joker {
    key = "cryptic_oops",
    attributes = { "cryptic", "mod_chance", "passive" },
    blueprint_compat = false,
    demicoloncompat = false,
    immutable = true,
    atlas = "jokers",
    pos = { x = 0, y = 1 },
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
