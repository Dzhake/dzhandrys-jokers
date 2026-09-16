SMODS.Joker {
    key = "cryptic_smeared_joker",
    attributes = { "cryptic", "suit", "hearts", "diamonds", "spades", "clubs" },
    atlas = "jokers",
    pos = { x = 3, y = 2 },
    blueprint_compat = false,
    demicoloncompat = false,
    immutable = true,
    rarity = 3,
    cost = 9,
}

local smods_smeared_check_ref = SMODS.smeared_check
function SMODS.smeared_check(card, suit, ...)
    if next(SMODS.find_card("j_dzhrj_cryptic_smeared_joker")) then
        return true
    end
    return smods_smeared_check_ref(card, suit, ...)
end
