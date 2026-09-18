local function random_tarot_name()
    return SMODS.poll_object({ set = "Tarot" })
end

SMODS.Joker {
    key = "cryptic_cartomancer",
    attributes = { "cryptic", "generation", "booster", "consumable", "tarot" },
    atlas = "jokers",
    pos = { x = 6, y = 3 },
    blueprint_compat = false,
    demicoloncompat = false,
    immutable = false,
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            tarot = "<Tarot>"
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.tarot]
        return {
            vars = { localize { type = 'name_text', key = card.ability.extra.tarot, set = "Tarot" } }
        }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.tarot = random_tarot_name()
    end,
    calculate = function(self, card, context)
        if context.skipping_booster then
            card.ability.extra.tarot = random_tarot_name()
            return {
                message = localize('k_reroll'),
                colour = G.C.SECONDARY_SET.Tarot,
            }
        end

        if context.create_booster_card and context.booster.config.center.kind and context.booster.config.center.kind == "Arcana" and context.index == 1 then
            return {
                booster_create_flags = {
                    set = "Tarot",
                    area = G.pack_cards,
                    skip_materialize = true,
                    soulable = true,
                    key = card.ability.extra.tarot,
                }
            }
        end
    end,
}
