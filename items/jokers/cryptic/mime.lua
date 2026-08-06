SMODS.Joker {
    key = "cryptic_mime",
    attributes = { "cryptic", "retrigger" },
    blueprint_compat = true,
    demicoloncompat = false,
    immutable = true,
    atlas = "jokers",
    pos = { x = 7, y = 0 },
    rarity = 3,
    cost = 15,
    calculate = function(self, card, context)
        if context.dzhrj_bonus_retriggers then
            return { dzhrj_do_bonus_retrigger = true }
        end
    end
}

-- eval_card hook in main/hooks.lua
