SMODS.Joker {
    key = "cryptic_drunkard",
    attributes = { "cryptic", "passive" },
    atlas = "jokers",
    pos = { x = 8, y = 3 },
    blueprint_compat = false,
    demicoloncompat = false,
    immutable = true,
    rarity = 3,
    cost = 8,
    add_to_deck = function(self, card, from_debuff)
        ease_ante(-1)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.ante
    end,
    remove_from_deck = function(self, card, from_debuff)
        ease_ante(1)
        G.GAME.round_resets.blind_ante = G.GAME.round_resets.ante
    end,
}

-- ease_dollars hook in main/hooks.lua
