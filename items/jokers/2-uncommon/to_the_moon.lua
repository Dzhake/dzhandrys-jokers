SMODS.Joker {
    key = "cryptic_to_the_moon",
    attributes = { "retrigger", "economy" },
    atlas = "jokers",
    pos = { x = 9, y = 3 },
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            every = 5,
            scale = 0.15,
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.every, card.ability.extra.scale, 1 + card.ability.extra.scale * math.floor(G.GAME.dollars / card.ability.extra.every) } }
    end,
    calculate = function(self, card, context)
        if context.scaling_card then
            return {
                override_scalar = context.scalar *
                    (1 + card.ability.extra.scale * math.floor(G.GAME.dollars / card.ability.extra.every))
            }
        end
    end
}
