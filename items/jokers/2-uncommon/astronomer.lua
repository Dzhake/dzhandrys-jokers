local function random_planet_name()
    return SMODS.poll_object({ set = "Planet" })
end

SMODS.Joker {
    key = "cryptic_astronomer",
    attributes = { "cryptic", "generation", "booster", "consumable", "planet" },
    atlas = "jokers",
    pos = { x = 7, y = 3 },
    blueprint_compat = false,
    demicoloncompat = false,
    immutable = false,
    rarity = 2,
    cost = 7,
    config = {
        extra = {
            planet = "<Planet>"
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS[card.ability.extra.planet]
        return {
            vars = { localize { type = 'name_text', key = card.ability.extra.planet, set = "Planet" } }
        }
    end,
    set_ability = function(self, card, initial, delay_sprites)
        card.ability.extra.planet = random_planet_name()
    end,
    calculate = function(self, card, context)
        if context.skipping_booster then
            card.ability.extra.planet = random_planet_name()
            return {
                message = localize('k_reroll'),
                colour = G.C.SECONDARY_SET.Planet,
            }
        end
    end,
}

-- create_card hook in main/hooks.lua
