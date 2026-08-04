SMODS.Joker {
    key = "cryptic_mime",
    attributes = { "cryptic", "retrigger" },
    blueprint_compat = true,
    demicoloncompat = false,
    atlas = "cryptic_jokers",
    pos = { x = 4, y = 1 },
    rarity = 3,
    cost = 15,
    calculate = function(self, card, context)
        if context.dzhrj_bonus_retriggers then
            return { dzhrj_do_bonus_retrigger = true }
        end
    end
}

-- eval_card hook in main/hooks.lua
