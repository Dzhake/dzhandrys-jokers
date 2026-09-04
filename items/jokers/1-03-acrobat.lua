SMODS.Joker {
    key = "cryptic_acrobat",
    attributes = { "cryptic", "retrigger" },
    atlas = "jokers",
    pos = { x = 2, y = 2 },
    pixel_size = { h = 95 / 1.2 },
    blueprint_compat = true,
    demicoloncompat = false,
    immutable = true,
    rarity = 1,
    cost = 5,
    config = { extra = { repetitions = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.repetitions } }
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand and (next(context.card_effects[1]) or #context.card_effects > 1) then
            local area = context.other_card.area
            if area.cards[#area.cards] == context.other_card then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
    end
}
