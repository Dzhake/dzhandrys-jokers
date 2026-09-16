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
            if context.from_roll then
                return {
                    numerator = context.denominator
                    -- hmm sure this won't lead to trouble with mods which divide the chance by 2 or similar        yeahh
                }
            else
                return {
                    numerator = 0 / 0,
                    denominator = 0 / 0,
                }
            end
        end
    end
}
