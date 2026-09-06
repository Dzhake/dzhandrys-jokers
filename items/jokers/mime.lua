SMODS.Joker {
    key = "cryptic_mime",
    attributes = { "cryptic", "retrigger", "passive" },
    atlas = "jokers",
    pos = { x = 7, y = 0 },
    blueprint_compat = true,
    demicoloncompat = false,
    immutable = true,
    rarity = 3,
    cost = 15,
    calculate = function(self, card, context)
        if context.dzhrj_mod_retriggers then
            return {
                dzhrj_retriggers_mult = context.dzhrj_retriggers_mult + 1
            }
        end
    end
}

-- eval_card hook in main/hooks.lua
