SMODS.Joker {
    key = "cryptic_cavendish",
    attributes = { "cryptic", "food" },
    atlas = "jokers",
    pos = { x = 3, y = 1 },
    soul_atlas = "jokers",
    soul_pos = { x = 2, y = 1 },
    blueprint_compat = true,
    eternal_compat = false,
    demicoloncompat = true,
    rarity = 1,
    cost = 5,
    unlocked = false,
    config = { extra = { emult = 3 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.emult } }
    end,
    locked_loc_vars = function(self, info_queue, card)
        if G.P_CENTERS.j_dzhrj_cryptic_gros_michel.unlocked then
            info_queue[#info_queue + 1] = G.P_CENTERS.j_dzhrj_cryptic_gros_michel
            return {}
        else
            return { key = "j_dzhrj_cryptic_cavendish_secret" }
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main or context.forcetrigger then
            return {
                emult = card.ability.extra.emult
            }
        end
    end,
    in_pool = function(self, args)
        return G.GAME.pool_flags.dzhrj_cryptic_gros_michel_destroyed
    end,
    check_for_unlock = function(self, args)
        if args.type == 'dzhrj_cryptic_gros_michel_destroyed' then
            return G.GAME.pool_flags.dzhrj_cryptic_gros_michel_destroyed
        end
        return false
    end
}
