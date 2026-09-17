SMODS.Joker {
    key = "cryptic_credit_card",
    attributes = { "cryptic", "economy", "passive" },
    atlas = "jokers",
    pos = { x = 9, y = 2 },
    blueprint_compat = false,
    demicoloncompat = false,
    rarity = 2,
    cost = 6,
    config = {
        extra = {
            bankrupt_at = 0,
            bankrupt_at_mod = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.bankrupt_at, card.ability.extra.bankrupt_at_mod } }
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
    end,
}
