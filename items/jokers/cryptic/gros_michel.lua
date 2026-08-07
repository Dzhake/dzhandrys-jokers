SMODS.Joker {
    key = "cryptic_gros_michel",
    attributes = { "cryptic", "chance", "xmult", "food" },
    atlas = "jokers",
    pos = { x = 1, y = 1 },
    blueprint_compat = true,
    eternal_compat = false,
    demicoloncompat = true,
    rarity = 1,
    cost = 5,
    unlocked = false,
    config = { extra = { numerator = 1, denominator = 1, xmult = 15, self_destruct = false } },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator,
            card.ability.extra.denominator, 'dzhrj_cryptic_gros_michel')
        return { vars = { card.ability.extra.xmult, numerator, denominator } }
    end,
    calculate = function(self, card, context)
        if context.joker_type_destroyed and context.card and context.card.config and context.card.config.center_key == "j_dzhrj_cryptic_gros_michel" and context.card.ability and context.card.ability.extra.self_destruct ~= true then
            G.GAME.pool_flags.dzhrj_cryptic_gros_michel_destroyed = true
            check_for_unlock({ type = "dzhrj_cryptic_gros_michel_destroyed" })
        end

        if context.end_of_round and context.game_over == false and context.main_eval then
            local b_card = context.blueprint_card or card
            if SMODS.pseudorandom_probability(b_card, 'dzhrj_cryptic_gros_michel', card.ability.extra.numerator, card.ability.extra.denominator) then
                b_card.ability.extra.self_destruct = true
                SMODS.destroy_cards(b_card, nil, nil, true)
                return {
                    message = localize('k_extinct_ex')
                }
            else
                return {
                    message = localize('k_safe_ex')
                }
            end
        end

        if context.joker_main or context.forcetrigger then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end,
    in_pool = function(self, args)
        return G.GAME.pool_flags.dzhrj_cavendish_extinct
    end,
    locked_loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.j_cavendish
        return {}
    end,
    check_for_unlock = function(self, args)
        if args.type == 'dzhrj_cavendish_extinct' then
            return G.GAME.pool_flags.dzhrj_cavendish_extinct
        end
        return false
    end
}

-- see lovely/patches.toml
